<?php
class Admin_Form_DesignLayout extends Zend_Form {
	
	protected $_optionsNames = array(
		'DesignStoreElements' => array('storeLayoutElements', 'productsPerPage', 'productsOrder'),
	);
	
	public function init() {
		$storeElementsForm = new Admin_Form_DesignStoreElements($this->_getFormOptions('DesignStoreElements'));
		$structureForm = new Admin_Form_DesignStructure($this->_getFormOptions('DesignStructure'));
		$embedForm = new Admin_Form_DesignEmbedSettings($this->_getFormOptions('DesignEmbedSettings'));
		
		$this->addSubForms(array(
			'storeElements' => $storeElementsForm->setIsArray(true), 
			'structure' => $structureForm->setIsArray(true), 
			'embedForm' => $embedForm->setIsArray(true)
		));
		
		$this->addElement('button', 'submit', array('label' => 'Submit', 'class' => 'button-submit fl', 'type'=>'submit'));
	}
	
	public function prepareDecorators() {
		$this->storeElements->prepareDecorators();
		$this->structure->prepareDecorators();
		$this->embedForm->prepareDecorators();
		
		$this->submit->setDecorators(array('ViewHelper'));
		
		$this->setDecorators(array(
			'view' => new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/design.phtml'))
		));
		
		return $this;
	}
	
	protected function _getFormOptions($formClassName) {
		$options = array();
		if (array_key_exists($formClassName, $this->_optionsNames)) {
			foreach ($this->_optionsNames[$formClassName] as $optionName) {
				if ($option = $this->getAttrib($optionName)) {
					$options[$optionName] = $option;
					$this->removeAttrib($optionName);
				}
			}
		}
		return $options;
	}
	
	public function getValues($suppressArrayNotation = false){
		$values = parent::getValues($suppressArrayNotation);
		
		$elements = array_map(create_function('$b','return (boolean)$b;') ,$values['storeElements']['page']);
		unset($values['storeElements']['page']);
		$layout = $this->_getSimpleArray($values);
		
		return array('elements'=>$elements, 'layout'=>$layout);
	}
	
	protected function _getSimpleArray( $values ) {
		$tmp_arr = array();
		foreach ( $values as $key=>$value ) {
			if ( is_array($value) ) {
				$tmp_arr = array_merge($tmp_arr, $this->_getSimpleArray($value));
			} else {
				$tmp_arr[$key] = $value;
			}
		}
		
		return $tmp_arr;
	}
}

