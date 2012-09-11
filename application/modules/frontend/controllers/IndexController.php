<?php

class Frontend_IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
//		$this->session = new Zend_Session_Namespace('store');
    }

	public function indexAction()
	{
		// action body
	}

	public function addToShoppingCartAction() {
		$id = $this->getRequest()->getParam('id');
		$store_id = $this->getRequest()->getParam('store_id');
		$option_id = $this->getRequest()->getParam('option_id');
		$store = Model_Sellcast::getStoreById($store_id);
		$product = $store->getProductById($id);
		$option = $product->getOptionById($option_id);
		$shoppingCart = $store->getShoppingCart();
		$shoppingCart->addProduct($product,$option);
	}
	
	public function getShoppingCartAction() {
		$store_id = $this->getRequest()->getParam('store_id');
		$store = Model_Sellcast::getStoreById($store_id);
		$shoppingCart = $store->getShoppingCart();
		$this->view->products = $shoppingCart->getProducts();
	}
	
	public function getTotalPriceAction() {
		$store_id = $this->getRequest()->getParam('store_id');
		$store = Model_Sellcast::getStoreById($store_id);
		$shoppingCart = $store->getShoppingCart();
		$this->view->price = $shoppingCart->getTotalPrice();
	}
}



