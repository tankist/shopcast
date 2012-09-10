<?php

abstract class Api_AbstractController extends Zend_Rest_Controller {
	
	const API_PAGINATOR_ITEMS_PER_PAGE_COUNT = 10;
	const API_PAGINATOR_MAX_ITEMS_PER_PAGE_COUNT = 50;

	public $contexts = array(
		'get' => true,
		'index' => true,
		'post' => true,
		'put' => true,
		'delete' => true,
		'head' => true,
		'options' => true,
		'error' => true,
	);
	
	protected $_logger = null;
	
	public function init() {
		Zend_Controller_Action_HelperBroker::addPrefix('Skaya_Controller_Action_Helper_');
		
		// Disable auto-rendering
		$this->_helper->viewRenderer->setNoRender();
		$this->_helper->layout->disableLayout();
		
		$format = (!$this->_hasParam('format'))?'xml':null;
		$this->_helper->xmlContextSwitch->initContext($format);
	}
	
	public function preDispatch() {
		$this->_helper->xmlContextSwitch->setXmlRootName($this->getRequest()->getControllerName() . 's');
	}

	public function notAllowedAction() {
		// Set Allow header and 405 Code
		$this->getResponse()->setHeader('Allow', $this->_allow);
		$this->getResponse()->setHttpResponseCode(405);
	}
	
	public function indexAction() {
		$this->notAllowedAction();
	}
	
	public function getAction() {
		$this->notAllowedAction();
	}

	public function putAction() {
		$this->notAllowedAction();
	}

	public function postAction() {
		$this->notAllowedAction();
	}

	public function deleteAction() {
		$this->notAllowedAction();
	}

	public function headAction() {
		$this->notAllowedAction();
	}

	public function optionsAction() {
		$this->notAllowedAction();
	}
	
	protected function _prepareOrder() {
		$order = array();
		$orderField = $this->_getParam('orderField');
		$defaultOrderType = $this->_getParam('orderType', 'ASC');
		if ($orderField) {
			if (is_string($orderField)) {
				$order = explode(',', $orderField);
			}
			else {
				$order = (array)$orderField;
			}
			foreach ($order as &$field) {
				$field = trim($field);
				if (strpos($field, ' ') !== false) {
					list($field, $type) = explode(' ', $field);
					$field = trim($field);
					$type = trim($type);
					if (!in_array(strtolower($type), array('ASC', 'DESC'))) {
						$type = $defaultOrderType;
					}
					$field = "$field $type";
				}
			}
		}
		return array_filter($order);
	}
	
	protected function _prepareItemsPerPageValue() {
		$ipp = $this->_getParam('limit', self::API_PAGINATOR_ITEMS_PER_PAGE_COUNT);
		if ($ipp > self::API_PAGINATOR_MAX_ITEMS_PER_PAGE_COUNT) {
			$ipp = self::API_PAGINATOR_MAX_ITEMS_PER_PAGE_COUNT;
		}
		return $ipp;
	}

}
