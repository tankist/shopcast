<?php
/**
* @property Zend_Form_Element_Text $domain
* @property Zend_Form_Element_Button $getPassword
*/

class Admin_Form_ForgotPassword extends Zend_Form {
	
	public function init() {
		parent::init();
		
		$this->addElement('text', 'domain', array('label' => 'Store:', 'required' => true))
			->addElement('submit', 'forgot', array('label' => 'Get Password'));
	}
	
	public function prepareDecorators() {
		$this->setElementDecorators(array('ViewHelper'));
		$this->setDecorators(array(
			new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/forgot.phtml')), 'FormErrors', 'Form'
		));
		return $this;
	}
}

