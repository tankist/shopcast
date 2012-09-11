<?php

class Store_Form_DesignStoreElements extends Zend_Form
{
	
	protected $_storeLayoutElements = array();
	protected $_productsPerPage = array();
	protected $_productsOrder = array();

	public function init() {
		$pagesSubform = new Zend_Form();
		$pagesSubform->setIsArray(true);
		
		foreach ($this->getStoreLayoutElements() as $storeElement) {
			$pagesSubform->addElement('checkbox', $storeElement['field'], array('label' => $storeElement['title']));
			$storeValue = (isset($storeElement['value']))?(boolean)$storeElement['value']:true;
			$pagesSubform->getElement($storeElement['field'])->setChecked($storeValue);
		}
		
		$this
			->addSubForm($pagesSubform, 'page')
			->addElement('select', 'products_per_page', array(
				'label' => 'Products Per Page', 
				'multiOptions' => $this->getProductsPerPage())
			)->addElement('select', 'products_order', array(
				'label' => 'Products Order', 
				'multiOptions' => $this->getProductsOrder())
			);
	}
	
	public function prepareDecorators() {
		$this
			->getSubForm('page')
			->setElementDecorators(array('ViewHelper'))
			->setDecorators(array(
				new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_pages.phtml'))
			));
		
		$this
			->setElementDecorators(array('ViewHelper'))
			->setDecorators(array(
				new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_elements.phtml'))
			));
		return $this;
	}

	public function setProductsPerPage($productsPerPage = array()) {
		$this->_productsPerPage = $productsPerPage;
		return $this;
	}

	public function getProductsPerPage() {
		return $this->_productsPerPage;
	}

	public function setProductsOrder($productsOrder = array()) {
		$this->_productsOrder = $productsOrder;
		return $this;
	}

	public function getProductsOrder() {
		return $this->_productsOrder;
	}

	public function setStoreLayoutElements($elements=array()) {
		$this->_storeLayoutElements = $elements;
		return $this;
	}

	public function getStoreLayoutElements() {
		return $this->_storeLayoutElements;
	}
}

