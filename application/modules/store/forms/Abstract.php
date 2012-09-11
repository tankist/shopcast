<?php
class Store_Form_Abstract extends Zend_Form {
	
	//protected $_isSubform = false;
	
	public function prepareDecorators() {
		/*if (!$this->isSubForm()) {
			$this->addDecorator('FormErrors', 'Form');
		}*/
		return $this;
	}
	
	/*public function setIsSubForm($isSubForm) {
		$this->_isSubform = (boolean)$isSubForm;
		return $this;
	}
	
	public function isSubForm() {
		return $this->_isSubform;
	}
	
	public function addSubForm(Zend_Form $form, $name, $order = null) {
		if ($form instanceOf Store_Form_Abstract) {
			$form->setIsSubForm(true);
		}
		parent::addSubForm($form, $name, $order);
	}
	*/
}

