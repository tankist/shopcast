<?php

class Store_Form_StoreProfile extends Zend_Form
{
	
	protected $_countries = array();

	public function init()
	{
		/* Form Elements & Other Definitions Here ... */
		$this
			->addElement('text', 'company_name', array(
												'label' => 'Store Name', 
												'required' => true,
												'class'=>'width-350',
												'validators' => array('alnum')
											))
			->addElement('text', 'paypal_email', array(
												'label' => 'PayPal Email', 
												'required' => true,
												'class'=>'width-350',
												'validators' => array(new Zend_Validate_EmailAddress())
											))
			->addElement('text', 'email', array(
												'label' => 'Contact Email', 
												'required' => true,
												'class'=>'width-350',
												'validators' => array(new Zend_Validate_EmailAddress())
											))
			->addElement('select', 'country_id', array('label' => 'Country', 'multiOptions' => $this->getCountries(), 'required' => true,'class'=>'width-280'))
			->addElement('hidden','logo')
			/*->addElement('file', 'store_image', array(
												'label' => 'Store Image',
												'filters' => array(
													new Skaya_Filter_File_Rename($this->getImagesPath()),
													new Skaya_Filter_File_Thumbnail(
														Model_ProductImage::$thumbnailPack
													)
												),
												'validators' => array(
													array('Size', false, 1024000),
													array('IsImage',false,array('image/gif','image/jpeg','image/png','image/pjpeg'))
												)
											))*/
			->addElement('text', 'domain', array(
												'label' => 'Store Sub-Domain', 
												'required' => true,
												'class'=>'width-280',
												'validators' => array('alnum')
											))
			->addElement('text', 'url', array(
												'label' => 'Website', 
												'class'=>'width-350'
											))
			->addElement('password', 'passwd', array(
												'label' => 'Password',
												'class'=>'width-350',
												'validators' => array(array('stringLength', false, array(6, 20)))
											))
			->addElement('password', 'password2', array(
												'label' => 'Confirm Password',
												'class'=>'width-350',
												'validators' => array(
													array('stringLength', false, array(6, 20)),
													new Skaya_Validate_IdenticalField(false, array('passwd', 'Password'))
												)
											))
			->addElement('hidden', 'id')
			->addElement('button', 'button_save',array('class'=>'button-save fl','type'=>'submit'));
	}
	
	public function setCountries($countries = array()) {
		foreach ( $countries as $country ) {
			$this->_countries[$country['id']] = $country['name'];
		}
		return $this;
	}
	
	public function getCountries() {
		return $this->_countries;
	}
	
	public function prepareDecorators() {
		$this
			->clearDecorators()
			->addDecorator(new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/account-settings-form.phtml')))
			->addDecorator('Form');
		
		$this->setElementDecorators(array('ViewHelper'));
		
	}
	
	public function populate(array $values) {
		if (array_key_exists('payout_info', $values) && is_array($values['payout_info'])) {
			$values['paypal_email'] = $values['payout_info']['paypal']['email'];
			unset($values['payout_info']);
		}
		parent::populate($values);
	}
}