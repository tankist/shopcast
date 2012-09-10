<?php

require_once("AbstractController.php");

class Admin_ProductsController extends Admin_AbstractController {
	
	public $ajaxable = array(
		'index' => array('json'),
		'list' => array('json'),
		'categories' => array('json'),
		'options' => array('json'),
		'set-option-quantity' => array('json'),
		'delete' => array('json'),
	);
	
	public $contexts = array(
		'categories' => array('json'),
		'add-product-image' => array('json'),
		'delete-product-image' => array('json'),
	);

	public function indexAction() {
		$this->view->submenu = '<a href="/admin/products/add">Add Product</a>';
		$this->view->getHelper('HeadScript')
			->appendFile('/js/sellcast/admin/products.js');
	}

	public function viewAction() {
		// action body
	}
	
	public function addAction() {
		$request = $this->getRequest();
		
		$storeCategories = $options = array();
		foreach ($this->_store->getCategories() as /** @var Model_Category **/ $category) {
			$storeCategories[$category->id] = $category->name;
		}
		
		$form = new Admin_Form_Product(array(
			'name' => 'product',
			'action' => '/admin/products/save',
			'categories' => $storeCategories,
			'images' => $this->_getImages(),
			'imageOptions' => $this->_getImageOptions()
		));
		$form->prepareDecorators();
		
		$productImageForm = new Admin_Form_ProductImage(array(
			'name' => 'productImage',
			'action' => '/admin/products/add-product-image',
			'imagesPath' =>''
		));
		
		$sessionData = $this->_getDataFromSession('productData');
		if ( $sessionData ) {
			$form->populate($sessionData);
			$this->_setDataToSession('productData');
		}
		
		$this->view->form = $form;
		$this->view->formImage = $productImageForm;
		$this->view->getHelper('HeadScript')
			->appendFile('/js/jquery/resize.js')
			->appendFile('/js/sellcast/admin/add-product.js');
	}
	
	public function editAction() {
		$request = $this->getRequest();
		if ($product_id = (int)$request->getParam('id')) {
			$product = $this->_store->getProductById($product_id);
			
			$productImages = $product->getProductImages();
			$productCategories = $product->getCategories();
			$productOptions = $product->getOptions();
			
			$storeCategories = $options = array();
			foreach ($this->_store->getCategories() as /** @var Model_Category **/ $category) {
				$storeCategories[$category->id] = $category->name;
			}
			foreach ($product->getOptions() as /** @var Model_Option **/ $option) {
				$options[$option->id] = $option->name;
			}
			
			$form = new Admin_Form_Product(array(
				'name' => 'product',
				'action' => '/admin/products/save',
				'categories' => $storeCategories,
				'productOptions' => $options,
				'images' => $this->_getImages($product),
				'imageOptions' => $this->_getImageOptions($product)
			));
			
			$productImageForm = new Admin_Form_ProductImage(array(
				'name' => 'productImage',
				'action' => '/admin/products/add-product-image',
				'imagesPath' => ''
			));
			
			$sessionData = $this->_getDataFromSession('productData');
			if ( $sessionData ) {
				$form->populate($sessionData);
				$this->_setDataToSession('productData', null);
			} else {
				$form->populate($product->toArray());
			}
			
			$this->view->form = $form->prepareDecorators();
			$this->view->formImage = $productImageForm;
			$this->view->getHelper('HeadScript')
				->appendFile('/js/jquery/resize.js')
				->appendFile('/js/sellcast/admin/add-product.js');
		}
	}

	public function deleteAction() {
		$request = $this->getRequest();
		$product_id = $request->getParam('product_id');
		try {
			$product = $this->_store->getProductById($product_id);
			$product->delete();
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}
	
	public function saveAction() {
		$request = $this->getRequest();
		$product_id = (int)$request->getParam('id');
		
		if ($product_id) {
			$product = $this->_store->getProductById($product_id);
			$categories = $product->getCategories();
			$images = $product->getProductImages();
			$options = $product->getOptions();
		}
		
		$storeCategories = array();
		foreach ($this->_store->getCategories() as /** @var Model_Category **/ $category) {
			$storeCategories[$category->id] = $category->name;
		}
		
		$productOptions = $optionsList = array();
		if (isset ($options) && !empty ($options)) {
			foreach ($options as $option) {
				$productOptions[$option->id] = $option;
			}
		}
		$optionsIds = $request->getParam('new_options_ids');
		if (!empty ($optionsIds)) {
			foreach (explode(',', $optionsIds) as $option_id) {
				$optionsList[$option_id] = (array_key_exists($option_id, $productOptions))
						?$productOptions[$option_id]->toArray()
						:array();
			}
		}
		
		$form = new Admin_Form_Product(array(
			'name' => 'product',
			'action' => '/admin/products/save',
			'categories' => $storeCategories,
			'images' => $this->_getImages($product),
			'imageOptions' => $this->_getImageOptions($product),
			'productOptions' => $optionsList
		));
		
		$productImageForm = new Admin_Form_ProductImage(array(
			'name' => 'productImage',
			'action' => '/admin/products/add-product-image',
			'imagesPath' =>''
		));
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			$data = $form->getValues();
			if ( $product instanceof Model_Product ) {
				$product->populate($data)->save();
			} else {
				$data['add_dt'] = new Zend_Db_Expr('NOW()');
				$product = Model_Sellcast::createProduct($data);
				$this->_store->addProduct($product);
				$isNewProduct = true;
			}
			
			$optionsFormData = $data['options'];

			//Pre-filtering options without names
			$displayOrder = 1;
			foreach ( $optionsFormData as $key => $optionData ) {
				if (empty ($optionData['name'])) {
					unset($optionsFormData[$key]);
					continue;
				}
				$optionsFormData[$key]['display_order'] = $displayOrder++;
			}
			
			//First of all process all existing options to determine which of them need to be deleted
			if (!empty ($productOptions)) {
				foreach ($productOptions as $option_id => $option) {
					$subformLocalName = 'option_' . $option_id;
					if (array_key_exists($subformLocalName, $optionsFormData)) {
						//Option is passed from the form
						$isOptionChanged = false;
						//Checking whether passed data was changed
						foreach ($optionsFormData[$subformLocalName] as $field => $value) {
							if (isset ($option->{$field}) && $option->{$field} != $value) {
								$option->{$field} = $value;
								$isOptionChanged = true;
							}
						}
						if ($isOptionChanged) {
							//Data was changed - Save It!!!
							$option->save();
						}
					}
					else {
						//Options was deleted from the form - delete it from the product
						$product->deleteOption($option);
					}
					//Delete raw data of this option to prevent it from addition (because it's already in the product)
					unset($optionsFormData[$subformLocalName]);
				}
			}

			foreach ( $optionsFormData as $optionData ) {
				$product->addOption(Model_Sellcast::createOption($optionData));
			}
			
			if ( is_array($data['categories']) ) {
				foreach ( $data['categories'] as $category_id ) {
					$category = $this->_store->getCategoryById($category_id);
					if (isset($category->id) && !$product->hasCategory($category)) {
						$product->addCategory($category);
					}
				}
			}
			
			if ($isNewProduct) {
				$parseFileNameFilter = new Skaya_Filter_File_ParseFileName(array());
				$path = $this->_getImagesDefaultPath($product->id);
				$renameFilter = new Skaya_Filter_File_Rename($path['path']);
				
				$images = $this->_getDataFromSession('productImagesPath');
				$image_id = null;
				foreach ( $images as $key=>$image ) {
					while ( file_exists($path.$image['name']) ) {
						$image['name'] = $renameFilter->filter($image['name']);
					}
					
					$id = $product->addProductImage(Model_Sellcast::createProductImage($image));
					if ( $key == $data['image'] ) {
						$image_id = $id;
					}
					$full_name = $parseFileNameFilter->filter($image['name']);
					rename($image['path'] .DIRECTORY_SEPARATOR. $image['name'], $path . DIRECTORY_SEPARATOR . $image['name'] );
						
					$thumbnailPack = Model_Product::$thumbnailPack;
					foreach ($thumbnailPack as $thumb) {
						if ( $thumb['indication_type'] == 'suffix' ) {
							$new_name = $full_name['name'] . '_' . $thumb['indication'];
						} else {
							$new_name = $thumb['indication'] . '_' . $full_name['name'];
						}
						rename($image['path'] .DIRECTORY_SEPARATOR. $new_name . $full_name['ext'], $path . DIRECTORY_SEPARATOR . $new_name . $full_name['ext'] );
					}
					rmdir($image['path']);
				}
				$product->image = $image_id;
				$product->save();
				$this->_setDataToSession('productImagesPath');
			}
			
			$this->_flashMessenger->addMessage(array('message' => 'Product has been saved successfully', 'status' => 'success'));

			$this->_redirect('/admin/products/');
		}
		else {
			$data = $form->getMessages();
			foreach ( $data as $field=>$error ) {
				$this->_setFlashMessengerValue($field, $error, $form);
			}
			$data = $form->getValues();
			
			$this->_setDataToSession('productData',$data);
			
			if ( $product instanceof Model_Product ) {
				$this->_redirect('/admin/products/edit/id/'.$product->id.'/');
			} else {
				$this->_redirect('/admin/products/add/');
			}
		}
	}
	
	protected function _setFlashMessengerValue($key, $arr, $form) {
		if ( $form->$key instanceof Zend_Form ) {
			foreach ( $arr as $field=>$error ) {
				$this->_setFlashMessengerValue($field, $error, $form->$key);
			}
		} else {
			
			$label = $form->$key->getLabel();
			foreach ( $arr as $key=>$value ) {
				$this->_flashMessenger->addMessage(array('message' => $label.': '.$value, 'status' => 'fail'));
			}
		}
	}
	
	public function addProductImageAction() {
		$request = $this->getRequest();
		
		$product_id = $this->getRequest()->getParam('product_id');
		
		if ( $product_id ) {
			$product = $this->_store->getProductById($product_id);
			if ( $product ) {
				$product_id = $product->id;
			} else {
				$product_id = false;
			}
		}
		
		$imagesPath = $this->_getImagesDefaultPath($product_id);
		$form = new Admin_Form_ProductImage(array(
			'name' => 'productImage',
			'action' => '/admin/products/add-product-image',
			'imagesPath' =>$imagesPath
		));
		
		if ($request->isPost() && $form->isValid($request->getPost())) {
			$data = $form->getValues();
			if ( $product->id ){
				$image = $product->addProductImage(new Model_ProductImage($data));
				$id = $image->id;
			} else {
				$path = $this->_getDataFromSession('productImagesPath');
				if ( !is_array($path) ) {
					$path = array();
				}
				$id = md5(time());
				$path[$id] = array('path'=>$imagesPath, 'name'=>$data['name']);
				$this->_setDataToSession('productImagesPath',$path);
			}
			
			
			$this->view->image = array('path'=>$imagesPath,'name'=>$data['name'],'id'=>$id);
			
		} else {
			return $this->_forward('add-photo');
		}
	}

	public function deleteProductImageAction() {
		// action body
		$request = $this->getRequest();
		
		$product_id = $this->getRequest()->getParam('product_id');
		$image_id = $this->getRequest()->getParam('id');
		
		if ( $product_id ) {
			$product = $this->_store->getProductById($product_id);
			if ( $product ) {
				$product_id = $product->id;
				$image = $product->getImageById($image_id);
				$path = $this->_getImagesDefaultPath($product->id);
				$name = $image->name;
				$product->deleteImage($image);
				if ( $product->image == $image_id ) {
					$images = $product->getProductImages();
					if ( count($images) > 0 ) {
						$image = $images[0];
						$product->image = $image->id;
					} else {
						$product->image = '';
					}
					$product->save();
				}
			}
		} else {
			$images = $this->_getDataFromSession('productImagesPath');
			$image = $images[$image_id];
			$path = $image['path'];
			$name = $image['name'];
			unset($images[$image_id]);
			$this->_setDataToSession('productImagesPath',$images);
			$isDirDelete = true;
		}
		
		//delete real image file
		Model_ProductImage::deleteImageFile($path, $name, $isDirDelete);
		
		$this->view->result = array('status'=>'success','id'=>$image_id);
	}

	public function setTagsAction() {
		// action body
	}

	public function listAction() {
		$statusFilter = new Zend_Filter();
		$statusFilter
			->addFilter(new Zend_Filter_Word_UnderscoreToSeparator(' '))
			->addFilter(new Skaya_Filter_UcWords());
		
		$productsData = array();
		$products = $this->_store->getProducts();
		foreach ($products as /** @var Model_Product **/$product) {
			$productBlob = array(
				'product_id' => $product->id,
				'product_name' => $product->name,
				'price' => $product->price,
				'status' => $statusFilter->filter($product->status),
				'inventory' => 0
			);
			$options = $product->getOptions();
			foreach ($options as $option) {
				$productBlob['inventory'] += $option->quantity;
			}
			$productsData[] = $productBlob;
		}
		
		$this->view->products = $productsData;
	}
	
	public function optionsAction() {
		$request = $this->getRequest();
		$product_id = $request->getParam('product_id');
		
		try {
			$product = $this->_store->getProductById($product_id);
			$this->view->options = $product->getOptions()->toArray();
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}

	public function setOptionQuantityAction() {
		$request = $this->getRequest();
		$product_id = $request->getParam('product_id');
		$option_id = $request->getParam('option_id');
		$quantity = $request->getParam('quantity');
		
		try {
			$store = Model_Sellcast::getStoreById($this->_store->id);
			$product = $store->getProductById($product_id);
			$option = $product->getOptionById($option_id);
			if ($option->product_id == $product->id) {
				$option->quantity = (int)$quantity;
				$option->save();
				$this->view->option = $option->toArray();
			}
			else {
				throw new Exception('Option with such ID was not found in the product');
			}
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}
}