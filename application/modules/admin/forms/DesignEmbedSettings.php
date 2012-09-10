<?php

class Admin_Form_DesignEmbedSettings extends Zend_Form
{

	public function init() {
		$this
			->addElement('text', 'embedHeight', array('label' => 'Height'))
			->addElement('text', 'embedWidth', array('label' => 'Width'));
	}
	
	public function prepareDecorators() {
		$this->setDecorators(array(
			'embed' => new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design_embed.phtml'))
		));
		
		$this->setElementDecorators(array('ViewHelper'));
		return $this;
	}
}

