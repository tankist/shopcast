<?php

require_once("AbstractController.php");

class Api_ProductController extends Api_AbstractController {
	
	public function init() {
		parent::init();
		$this->_helper->XmlContextSwitch->setReplaceNumericKeys(array(
			'products' => 'product',
			'options' => 'option',
			'categories' => 'category'
		));
	}

	public function indexAction() {
		$store_id = $this->_getParam('store_id');
		if (empty($store_id)) {
			throw new Zend_Rest_Exception('Store ID must be provided');
		}
		$store = Model_Sellcast::getStoreById($store_id);
		if (empty($store)) {
			throw new Zend_Rest_Exception('Cannot find store with such ID: ' . $store_id);
		}
		$page = $this->_getParam('page', 1);
		$isExpanded = (boolean) (int) $this->_getParam('expanded');

		$productsPaginator = $store->getProductsPaginator();
		$productsPaginator->setCurrentPageNumber($page)->setItemCountPerPage($this->_prepareItemsPerPageValue());

		$productData = array();
		if ($isExpanded) {
			foreach ($productsPaginator as /** @var Model_Product * */$product) {
				$product->getOptions(true);
				$product->getCategories(true);
				//$productElement['images'] = $product->getOptions(true)->toArray();
				$productData[] = $product->toArray();
			}
		}
		else {
			$productData = $productsPaginator->getCurrentItems()->toArray();
		}
			
		$this->view->products = $productData;
	}

	public function getAction() {
		// action body
	}

	public function postAction() {
		// action body
	}

	public function putAction() {
		// action body
	}

	public function deleteAction() {
		// action body
	}

}

