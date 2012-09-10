<?php
class Admin_Form_DesignStructure extends Zend_Form {
	
	public function init() {
		parent::init();
		$this->addElement('select', 'layoutType', array(
			'class' => 'ui-helper-hidden',
			'multiOptions' => array(
				'leftColumn' => 'left',
				'noColumns' => 'none',
				'rightColumn' => 'right'
			)
		));
	}
	
	public function prepareDecorators() {
		$this->setDecorators(array(
			'structure' => new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_structure.phtml'))
		));
		
		$this->layoutType->setDecorators(array('ViewHelper'));
		return $this;
	}
	
}

