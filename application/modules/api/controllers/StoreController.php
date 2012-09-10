<?php

require_once("AbstractController.php");

class Api_StoreController extends Api_AbstractController {

	public function init() {
		parent::init();
		$this->_helper->XmlContextSwitch->setReplaceNumericKeys(array(
			'stores' => 'store'
		));
	}

	public function indexAction() {
		$searchQuery = (string)$this->_getParam('search');
		if (empty($searchQuery)) {
			if ($this->_hasParam('description')) {
				$searchQuery .= ('stores.descr%' . $this->_getParam('description') . '&');
			}
			if ($this->_hasParam('country')) {
				$searchQuery .= ('stores.country_id=' . $this->_getParam('country') . '&');
			}
		}
		else {
			$searchQuery .= '&';
		}
		$searchQuery .= 'stores.state=active';
		
		$storesPaginator = Model_Sellcast::searchStoresPaginator($searchQuery, $this->_prepareOrder());
		$storesPaginator->setCurrentPageNumber($this->_getParam('page', 1));
		$storesPaginator->setItemCountPerPage($this->_prepareItemsPerPageValue());
		$this->view->stores = $storesPaginator->getCurrentItems()->toArray();
	}

	public function getAction() {
		if ($this->_hasParam('id')) {
			$store_id = $this->_getParam('id');
			if ($store_id) {
				$store = Model_Sellcast::getStoreById($store_id);
				if ($store instanceOf Model_Store) {
					$this->view->store = $store->toArray();
					return;
				}
			}
		}
		if ($this->_hasParam('domain')) {
			$domain = $this->_getParam('domain');
			if ($domain) {
				$store = Model_Sellcast::getStoreByDomain($domain);
				if ($store instanceOf Model_Store) {
					$this->view->store = $store->toArray();
					return;
				}
			}
			throw new Zend_Rest_Exception('Given store "' . $domain . '" cannot be found');
		}
		throw new Zend_Rest_Exception('Given store cannot be found');
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

