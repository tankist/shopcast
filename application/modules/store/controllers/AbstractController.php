<?php
class Store_AbstractController extends Zend_Controller_Action {
	
	/**
	* @var Model_Store
	*/
	protected $_store = null;
	
	public function init() {
		$contextSwitch = $this->_helper->getHelper('AjaxContext')->initContext();
		$contextSwitch = $this->_helper->getHelper('contextSwitch')->clearHeaders('json')->initContext();
		$this->_flashMessenger = $this->_helper->getHelper('FlashMessenger');
		
		$this->view->submenu = '';
		
	}
	
	public function preDispatch() {
		if ($this->getRequest()->isXmlHttpRequest()) {
			Zend_Layout::getMvcInstance()->disableLayout();
		}
		$auth = Zend_Auth::getInstance();
		if ($auth->hasIdentity()) {
			$this->_store = Model_Sellcast::getStoreById($auth->getIdentity()->id);
			if (!$this->_store instanceOf Model_Store) {
				unset ($this->_store);
			}
		}
		
		$host = $this->getRequest()->getServer('HTTP_HOST');
		if (isset ($this->_store)) {
			$this->view->store = $this->_store;
			if (strpos($host, $this->_store->domain) === false) {
				$host = $this->_store->domain . '.' . $host;
			}
		}
		$this->view->fullDomain = $host;
	}
	
	protected function _setDataToSession($key, $data = null) {
		$modulesResource = $this->getInvokeArg('bootstrap')->modules;
		$session = $modulesResource[$this->getRequest()->getModuleName()]->sessionnamespace;
		$sessionData = $session->$key;
		$sessionData = $data;
		$session->$key = $sessionData;
		return true;
	}
	
	protected function _getDataFromSession($key) {
		$modulesResource = $this->getInvokeArg('bootstrap')->modules;
		$session = $modulesResource[$this->getRequest()->getModuleName()]->sessionnamespace;
		$data = $session->$key;
		return $data;
	}
	
	protected function _getImagesDefaultPath($product_id = null) {
		if ( $product_id ) {
			$path = 'uploads/stores/'.$this->_store->id . '/products/'. $product_id;
			if ( !is_dir($path) ) {
				mkdir($path,0777,true);
			}
			return $path;
		} else {
			$filter = new Skaya_Filter_File_Rename(array());
			do {
				$tmp_path = $filter->getId();
				$path = 'uploads/temp/stores/'.$this->_store->id . '/'. $tmp_path;
			} while (is_dir($path));
			
			mkdir($path,0777,true);
			
			return $path;
		}
	}
	
	protected function _getImages($product = null) {
		if ( $product ) {
			$path = $this->_getImagesDefaultPath($product->id);
			$images = $product->getProductImages()->toArray();
			$new_images = array();
			foreach ( $images as $image ) {
				$new_images[$image['id']] = array('path'=>$path, 'name'=>$image['name']);
			}
			$images = $new_images;
		} else {
			$images = $this->_getDataFromSession('productImagesPath');
		}
		if ( !$images ) {
			$images = array();
		}
		
		return $images;
	}
	
	protected function _getImageOptions($product = null) {
		$images = $this->_getImages($product);
		
		$keys = array_keys($images);
		return array_fill_keys($keys,'Main Image');
	}
	
	protected function _setFlashMessangerValue($key, $arr, $form) {
		if ( $form->$key instanceof Zend_Form ) {
			foreach ( $arr as $field=>$error ) {
				$this->_setFlashMessangerValue($field, $error, $form->$key);
			}
		} else {
			
			$label = $form->$key->getLabel();
			foreach ( $arr as $key=>$value ) {
				$this->_flashMessenger->addMessage(array('message' => $label.': '.$value, 'status' => 'fail'));
			}
		}
	}
}

