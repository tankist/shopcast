<?php

class Frontend_ShoppingCartController extends Zend_Controller_Action
{
    public function indexAction()
    {
        // action body
        $this->_forward('view');
    }

    public function viewAction()
    {
        $request = $this->getRequest();

        $shoppingCartProducts = $this->_shoppingCart->getProducts();
        $shoppingCartProductsList = array();
        $filter = new Skaya_Filter_File_ParseFileName(array());
        foreach ($shoppingCartProducts as $product) {
            $image = $product->getImageById($product->image);
            if ($image) {
                $full_name = $filter->filter($image->name);
                $product->path = $this->_getImagesDefaultPath($product->id);
            } else {
                $full_name = $filter->filter(Model_Product::PRODUCT_NO_IMAGE_NAME);
                $product->path = Model_Product::PRODUCT_NO_IMAGE_PATH;
            }
            $product->mainImage = $full_name['name'] . '_s' . $full_name['ext'];

            $shoppingCartProductsList[] = $product;
        }
        $this->view->shoppingCartProducts = $shoppingCartProductsList;
    }

    public function updateAction()
    {
        try {
            $request = $this->getRequest();
            $quantity = $request->getParam('quantity');

            if ($quantity && is_array($quantity)) {
                $shoppingCart = new Model_ShoppingCart();
                $shoppingCart->updateProduct($quantity, $this->_store);
            }
        } catch (Exception $e) {
            $this->_flashMessenger->addMessage(array('message' => $e->getMessage(), 'status' => 'fail'));
        }


        $this->_redirect('shopping-cart/view/');
    }

    public function addAction()
    {
        // action body
    }

    public function deleteProductAction()
    {
        $request = $this->getRequest();
        $id = $request->getParam('id');
        $option_id = $request->getParam('option');

        $product = $this->_store->getProductById($id);
        $option = $product->getOptionById($option_id);

        $shoppingCart = new Model_ShoppingCart();
        $shoppingCart->deleteProduct($product, $option);

        $this->_redirect('shopping-cart/view');
    }


}









