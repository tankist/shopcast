<?php

class Admin_Form_StoreCss extends Zend_Form {

	public function init() {
		$this
			->addElement('textarea', 'css', array('label' => 'CSS Code Editor'))
			->addElement('image', 'submit');
	}
}