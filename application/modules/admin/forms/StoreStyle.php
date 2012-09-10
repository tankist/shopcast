<?php

class Admin_Form_StoreStyle extends Zend_Form
{
	
	protected $_storeLayoutElements = array();
	
	protected $_fonts = array();
	
	protected $_colorSubform = null;

	public function init() {
		$this
			//->addElement('file', 'header_image', array('label' => 'Header Image'))
			->addElement('select', 'font', array('label' => 'Font', 'multiOptions' => $this->getFonts()))
			->addElement('submit', 'submit', array('label' => 'Save'));
	}
	
	public function prepareDecorators() {
		$this->setDecorators(array(
			new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_style.phtml')), 
			'Form'
		));
		$this->setElementDecorators(array('ViewHelper'));
	}

	public function setStoreLayoutElements($elements=array()) {
		$this->_storeLayoutElements = $elements;
		$this->clearSubForms()->addSubForm($this->_renderColorSubForm(), 'color');
		return $this;
	}

	public function getStoreLayoutElements() {
		return $this->_storeLayoutElements;
	}

	public function setFonts($fonts=array()) {
		$this->_fonts = $fonts;
		return $this;
	}

	public function getFonts() {
		return $this->_fonts;
	}
	
	protected function _renderColorSubForm() {
		if (empty($this->_colorSubform)) {
			$this->_colorSubform = new Zend_Form();
			$this->_colorSubform
				->setIsArray(true)
				->setDecorators(array(
					new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_style_colors.phtml'))
				))
				->setElementDecorators(array('ViewHelper'));
		}
		else {
			$this->_colorSubform->clearElements();
		}
		foreach ($this->getStoreLayoutElements() as $storeElement) {
			$this->_colorSubform->addElement('text', $storeElement['field'], array('label' => $storeElement['title']));
		}
		return $this->_colorSubform;
	}
}