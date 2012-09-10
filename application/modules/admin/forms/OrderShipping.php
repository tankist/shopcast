<?php

class Admin_Form_OrderShipping extends Zend_Form
{
	
	protected $_shippingCompanies = array();

	public function init()
	{
		/* Form Elements & Other Definitions Here ... */
		$this
			->addElement('select', 'shipping_company', array('label' => 'Shipping Company:', 'multiOptions' => $this->_shippingCompanies))
			->addElement('text', 'tracking_number', array('label' => 'Tracking number:'))
			->addElement('text', 'tracking_url', array('label' => 'Tracking URL:'))
			->addElement('textarea', 'note', array('label' => 'Note:'))
			->addElement('hidden', 'order_id')
			->addElement('button', 'submit', array('class' => 'button-confirm-shipping fl', 'label' => 'confirm shipping', 'type' => 'submit'));
	}
	
	public function prepareDecorators() {
		$this->setElementDecorators(array(
			'ViewHelper', 
			new Zend_Form_Decorator_HtmlTag(array('tag' => 'dd')),
			array('Label', (array('tag' => 'dt')))
		));
		$this->submit->setDecorators(array('ViewHelper'));
		$this->order_id->setDecorators(array('ViewHelper'));
		$this->setDecorators(array(
			new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/order-shipping.phtml')),
			'Form'
		));
	}

	public function setShippingCompanies($shippingCompanies = array()) {
		$this->_shippingCompanies = $shippingCompanies;
		return $this;
	}

	public function getShippingCompanies() {
		return $this->_shippingCompanies;
	}
}

