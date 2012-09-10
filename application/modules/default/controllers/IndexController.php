<?php

class Default_IndexController extends Zend_Controller_Action
{
    public $contexts = array(
        'product' => true
    );

    public $ajaxable = array(
        'add-to-shopping-cart' => true
    );

    public function indexAction()
    {
        $this->_redirect($this->_helper->url->url(array('module' => 'admin')));
    }

    public function productAction()
    {
        $request = $this->getRequest();
        $id = $request->getParam('id');
        /** @var $product Model_Product */
        $product = $this->_store->getProductById($id);
        $images = $product->getProductImages();

        $filter = new Skaya_Filter_File_ParseFileName(array());
        $image = $product->getImageById($product->image);
        $full_name = $filter->filter($image->name);
        $product->mainImage = $full_name['name'] . '_b' . $full_name['ext'];
        $path = $this->_getImagesDefaultPath($product->id);

        $imagesList = array();
        foreach ($images as $image) {
            $full_name = $filter->filter($image->name);
            $image->thumb = $full_name['name'] . '_s' . $full_name['ext'];
            $imagesList[] = $image;
        }

        $options = $product->getOptions();

        $this->view->assign(array(
            'contentTitle' => $product->name,
            'product' => $product,
            'imagesList' => $imagesList,
            'options' => $options,
            'path' => $path,

        ));

        $this->view->getHelper('HeadScript')
            ->appendFile('/js/jquery/jquery.form.js')
            ->appendFile('/js/view-product.js')
            ->appendScript('var sellcastCustomData = ' . Zend_Json::encode(array(
            'trackerType' => 'product',
            'store_id' => $product->store_id,
            'product_id' => $product->id,
        )));
    }

    public function contactAction()
    {
        // action body
    }

    public function listAction()
    {
        $request = $this->getRequest();
        $type = $request->getParam('type');
        $value = $request->getParam('value');

        switch ($type) {
            case 'category':
                $products = $this->_store->searchProducts("productsCategories.category_id=$value&products.status=active");
                break;
            case 'search':
                $products = $this->_store->searchProducts("(products.name%$value|products.descr%$value)&products.status=active");
                $this->view->title = $this->_store->company_name . ' Search by ' . $value;
                break;
            default:
                $products = $this->_store->getProductsByStatus('active');
                break;
        }

        $productsList = array();
        $filter = new Skaya_Filter_File_ParseFileName(array());
        foreach ($products as $product) {
            $image = $product->getImageById($product->image);
            if ($image) {
                $full_name = $filter->filter($image->name);
                $product->path = $this->_getImagesDefaultPath($product->id);
            } else {
                $full_name = $filter->filter(Model_Product::PRODUCT_NO_IMAGE_NAME);
                $product->path = Model_Product::PRODUCT_NO_IMAGE_PATH;
            }
            $product->mainImage = $full_name['name'] . '_m' . $full_name['ext'];

            $productsList[] = $product;
        }

        $this->view->productsList = $productsList;
    }

    public function addToShoppingCartAction()
    {
        $request = $this->getRequest();
        $product_id = $request->getParam('product_id');
        $option_id = $request->getParam('option_id');

        $product = $this->_store->getProductById($product_id);
        $option = $product->getOptionById($option_id);
        if (!$option) {
            $this->view->responce = array('status' => 'error', 'message' => 'Product with id #' . $option_id . ' was not found in this product');
            return false;
        }

        $shoppingCart = new Model_ShoppingCart();
        $shoppingCart->addProduct($product, $option);

        $count = $shoppingCart->getProductsCount();
        $totalPrice = $shoppingCart->getTotalPrice();
        $this->view->responce = array('status' => 'success', 'count' => $count, 'totalPrice' => $totalPrice);
    }


}







