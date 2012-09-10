<?php
/**
* @property int $id
* @property int $store_id
* @property string $name
* @property string $descr
* @property string $status
* @property int $quantity
* @property float $price
* @property float $sale
*/
class Model_Product extends Model_Abstract implements Model_Interface {
	
	const PRODUCT_STATUS_ACTIVE = 'active';
	const PRODUCT_STATUS_SOLD = 'sold_out';
	const PRODUCT_STATUS_HIDDEN = 'hidden';
	const PRODUCT_STATUS_SOON = 'coming_soon';
	const PRODUCT_NO_IMAGE_NAME = 'noimage.png';
	const PRODUCT_NO_IMAGE_PATH = 'images';
	
	protected $_modelName = 'product';
	
	protected $_mapperType = 'db';
	
	protected $_images = null;
	
	static $thumbnailPack = array('small'=>array(
									'width'=>88,
									'height'=>88,
									'indication_type'=>'suffix',
									'indication'=>'s'
								),
								'middle'=>array(
									'width'=>135,
									'height'=>135,
									'indication_type'=>'suffix',
									'indication'=>'m'
								),
								'big'=>array(
									'width'=>300,
									'height'=>300,
									'indication_type'=>'suffix',
									'indication'=>'b'
								)
							);
	
	protected $_categories = null;
	protected $_options = null;
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getOptions($force = true) {
		if (empty($this->_options) || $force) {
			$optionsBlob = $this->_getOptionsMapper()->getProductOptions($this->id);
			$this->_options = new Model_Collection_Options($optionsBlob);
		}
		return $this->_options;
	}
	
	/**
	* Adds option to the product
	* 
	* @param Model_Option $option
	* @return Model_Product
	*/
	public function addOption(Model_Option $option) {
		$option->product_id = $this->id;
		$option->save();
		return $this;
	}
	
	/**
	* Returns product option by its id
	* 
	* @param int $option_id
	* @return Model_Option
	*/
	public function getOptionById($option_id) {
		$optionBlob = $this->_getOptionsMapper()->getProductOptionById($this->id, $option_id);
		if (empty($optionBlob)) {
			return null;
		}
		return new Model_Option($optionBlob);
	}
	
	/**
	* Returns product option by its name
	* 
	* @param string $option_name
	* @return Model_Option
	*/
	public function getOptionByName($option_name) {
		$optionBlob = $this->_getOptionsMapper()->getProductOptionByName($this->id, $option_name);
		if (empty($optionBlob)) {
			return null;
		}
		return new Model_Option($optionBlob);
	}
	
	/**
	* Deletes given option
	* 
	* @param Model_Option $option
	* @return Model_Product
	*/
	public function deleteOption(Model_Option $option) {
		if ($option->product_id == $this->id) {
			if (isset($this->_options[$option->id])) {
				unset($this->_options[$option->id]);
			}
			$option->delete();
		}
		return $this;
	}
	
	/**
	* Deletes all options of the current product
	* 
	* @return Model_Product
	*/
	public function clearOptions() {
		$this->_getOptionsMapper()->deleteProductOptions($this->id);
		unset($this->_options);
		$this->_options = new Model_Collection_Options();
		return $this;
	}
	
	/**
	* Return true if option is belong to the current product
	* 
	* @param Model_Option $option
	* @return boolean
	*/
	public function hasOption(Model_Option $option) {
		$optionBlob = $this->_getOptionsMapper()->getProductOptionById($this->id, $option->id);
		return (!empty($optionBlob) && count($optionBlob) > 0);
	}
	
	/**
	* Return all images of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Images
	*/
	public function getProductImages($force = true) {
		if (empty($this->images) || $force) {
			$imagessBlob = $this->_getProductImagesMapper()->getProductImages($this->id);
			$this->_images = new Model_Collection_ProductImages($imagessBlob);
		}
		return $this->_images;
	}
	
	/**
	* Adds image to the product
	* 
	* @param Model_ProductImage $image
	* @return Model_Product
	*/
	public function addProductImage(Model_ProductImage $image) {
		$image->product_id = $this->id;
		
		return $image->save();;
	}
	
	/**
	* Returns product image by its id
	* 
	* @param int $option_id
	* @return Model_Option
	*/
	public function getImageById($image_id) {
		$imageBlob = $this->_getProductImagesDbMapper()->getProductImageById($this->id, $image_id);
		/*if (empty($imageBlob) || $imageBlob['product_id'] != $this->id) {
			throw new Model_Exception('Product Image with id #'.$image_id.' was not found in this product');
		}*/
		if ( $imageBlob ) {
			return new Model_ProductImage($imageBlob);
		} else {
			return false;
		}
	}
	
	/**
	* Deletes given image
	* 
	* @param Model_ProductImage $image
	* @return Model_Product
	*/
	public function deleteImage(Model_ProductImage $image) {
		if ($image->product_id == $this->id) {
			if (isset($this->images[$image->id])) {
				unset($this->images[$image->id]);
			}
			$image->delete();
		}
		return $this;
	}
	
	/**
	* Return true if option is belong to the current product
	* 
	* @param Model_Option $option
	* @return boolean
	*/
	public function hasImage(Model_Image $image) {
		$imageBlob = $this->_getProductImagesMapper()->getProductImageById($this->id, $image->id);
		return (!empty($imageBlob) && count($imageBlob) > 0);
	}
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getCategories($force = true) {
		if (empty($this->_categories) || $force) {
			$categoriesBlob = $this->_getCategoriesMapper()->getProductCategories($this->id);
			$this->_categories = new Model_Collection_Categories($categoriesBlob);
		}
		return $this->_categories;
	}
	
	/**
	* Adds category to the product
	* 
	* @param Model_Category $category
	* @return Model_Product
	*/
	public function addCategory(Model_Category $category) {
		$category->product_id = $this->id;
		$category->save();
		return $this;
	}
	
	/**
	* Return product category by ID
	* 
	* @param int $category_id
	* @return Model_Category
	*/
	public function getCategoryById($category_id) {
		$categoryBlob = $this->_getCategoriesMapper()->getProductCategoryById($this->id, $category_id);
		return new Model_Category($categoryBlob);
	}
	
	/**
	* Return product category by name
	* 
	* @param string $category_name
	* @return Model_Category
	*/
	public function getCategoryByName($category_name) {
		$categoryBlob = $this->_getCategoriesMapper()->getProductCategoryByName($this->id, $category_name);
		return new Model_Category($categoryBlob);
	}
	
	/**
	* Removes category from the product
	* 
	* @param Model_Category $category
	* @return Model_Product
	*/
	public function deleteCategory(Model_Category $category) {
		if ($category->product_id == $this->id) {
			if (isset($this->categories[$category->id])) {
				unset($this->categories[$category->id]);
			}
			$category->delete();
		}
		return $this;
	}
	
	/**
	* Removes all categories from the product
	* 
	* @return Model_Product
	*/
	public function clearCategories() {
		$this->_getCategoriesMapper()->deleteProductCategories($this->id);
		unset($this->categories);
		$this->categories = new Model_Collection_Categories();
		return $this;
	}
	
	/**
	* Return true if option is belong to the current product
	* 
	* @param Model_Option $option
	* @return boolean
	*/
	public function hasCategory(Model_Category $category) {
		$categoryBlob = $this->_getCategoriesMapper()->getProductCategoryById($this->id, $category->id);
		return (!empty($categoryBlob) && count($categoryBlob) > 0);
	}
	
	protected function _getOptionsMapper() {
		return $this->getMapper($this->getMapperType(), 'Option');
	}
	
	protected function _getCategoriesMapper() {
		return $this->getMapper($this->getMapperType(), 'Category');
	}
	
	protected function _getProductImagesMapper() {
		return $this->getMapper($this->getMapperType(), 'ProductImage');
	}
	
	protected function _getProductImagesDbMapper() {
		return $this->getMapper('db', 'ProductImage');
	}
	
	/**
	* Return array from product object
	*/
	public function toArray() {
		$arr = (array)$this->_data;
		if ( $this->_categories instanceof Model_Collection_Categories ) {
			$arr['categories'] = $this->_categories->toArray();
		}
		if ( $this->_options instanceof Model_Collection_Options ) {
			$arr['options'] = $this->_options->toArray();
		}
		if ( $this->_images instanceof Model_Collection_ProductImages ) {
			$arr['images'] = $this->_images->toArray();
		}
		
		return $arr;
	}
}