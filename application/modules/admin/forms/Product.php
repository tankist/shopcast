<?php

class Admin_Form_Product extends Zend_Form {

	protected $_categories = array();
	protected $_images = array();
	protected $_imageOptions = array();
	protected $_productOptions = array();

	public function init() {
		/* Form Elements & Other Definitions Here ... */
		$priceSubform = new Zend_Form();
		$priceSubform
				->setIsArray(true)
				->addElement('checkbox', 'is_on_sale', array('label' => 'On Sale'))
				->addElement('text', 'normal', array('label' => 'Price', 'required' => true))
				->addElement('text', 'sale', array('label' => 'Sale Price($)'));

		$shippingSubform = new Zend_Form();
		$shippingSubform
				->setIsArray(true)
				->addElement('select', 'shipping_type', array('label' => '', 'multiOptions' => array(
						'no' => 'Free Shipping Options',
						'custom' => 'Manual Shipping Options'
						)))
				->addElement('text', 'add_amount', array('label' => 'Shipped w/Amount'))
				->addElement('text', 'alone', array('label' => 'Shipped Alone'));

		$optionsSubform = new Zend_Form();
		$optionsSubform->setIsArray(true);
		if (count($this->_productOptions) > 0) {
			foreach ($this->_productOptions as $option_id => $option) {
				$optionSubform = new Zend_Form();
				$optionSubform
						->setIsArray(true)
						->setElementsBelongTo('option_' . $option_id)
						->addElement('text', 'name', array('label' => 'Option Name', 'class' => 'product-option-name'))
						->addElement('text', 'quantity', array('label' => 'Quantity', 'class' => 'product-option-quantity'))
						->addElement('checkbox', 'is_unlimited', array('label' => 'Unlimited'));
				$optionsSubform->addSubForm($optionSubform, 'option_' . $option_id);
			}
		} else {
			$optionSubform = new Zend_Form();
			$optionSubformName = 'option_' . floor(rand(1, 100));
			$optionSubform
					->setIsArray(true)
					->setElementsBelongTo($optionSubformName)
					->addElement('text', 'name', array('label' => 'Option Name', 'class' => 'product-option-name'))
					->addElement('text', 'quantity', array('label' => 'Quantity', 'class' => 'product-option-quantity'))
					->addElement('checkbox', 'is_unlimited', array('label' => 'Unlimited'));
			$optionsSubform->addSubForm($optionSubform, $optionSubformName);
		}

		$status_el = new Zend_Form_Element_Radio('status', array('label' => 'Status', 'required' => true, 'multiOptions' => array(
						'active' => 'Active',
						'hidden' => 'Hidden',
						'sold_out' => 'Sold Out'
						)));

		$categories_el = new Zend_Form_Element_MultiCheckbox('categories', array('label' => 'Categories', 'multiOptions' => $this->getCategories(), 'attribs' => array('rel' => 'saved')));

		$images_el = new Skaya_Form_Element_ProductImage('image', array('label' => 'Main Image', 'required' => true, 'multiOptions' => $this->_imageOptions, 'images' => $this->getImages()));

		$this
				->addElement('text', 'name', array('label' => 'Name', 'required' => true))
				->addElement('hidden', 'id')
				->addElement('hidden', 'new_options_ids')
				->addElement($status_el)
				->addElement($categories_el)
				->addElement($images_el)
				->addElement('textarea', 'description', array('label' => 'Description'))
				->addSubForm($priceSubform, 'prices')
				->addSubForm($shippingSubform, 'shipping')
				->addSubForm($optionsSubform, 'options')
				->addElement('button', 'add_new_option', array('type' => 'button', 'class' => 'button-add-new-option'));
	}

	public function setProductOptions($productOptions = array()) {
		$this->_productOptions = $productOptions;
		return $this;
	}

	public function getProductOptions() {
		return $this->_productOptions;
	}

	public function setCategories($categories = array()) {
		$this->_categories = $categories;
		return $this;
	}

	public function getCategories() {
		return $this->_categories;
	}

	public function setImages($images = array()) {
		$this->_images = $images;
		return $this;
	}

	public function getImages() {
		return $this->_images;
	}

	public function setImageOptions($imageOptions = array()) {
		$this->_imageOptions = $imageOptions;
		return $this;
	}

	public function getImageOptions() {
		return $this->_imageOptions;
	}

	public function prepareDecorators() {
		$this->getView()->addHelperPath('Skaya/View/Helper', 'Skaya_View_Helper');

		$this
				->clearDecorators()
				->addDecorator(new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/product-form.phtml')))
				->addDecorator('Form');

		$this->status->helper = 'FormRadio';
		$this->categories->helper = 'MultiCheckbox';

		$this->setElementDecorators(array('ViewHelper'));
		$this->prices->setElementDecorators(array('ViewHelper'));
		$this->shipping->setElementDecorators(array('ViewHelper'));
		foreach ($this->options->getSubForms() as $key => $optionSubform) {
			$optionSubform->setElementDecorators(array('ViewHelper'));
			$optionSubform->quantity->addDecorator('Label');
			$optionSubform->is_unlimited->addDecorator('Label');
		}
		return $this;
	}

	public function populate(array $values) {
		if (array_key_exists('shipping_values', $values)) {
			$values['alone'] = $shipping_values['value'];
			$values['add_amount'] = $shipping_values['add_value'];
			unset($values['shipping_values']);
		}

		if (array_key_exists('categories', $values)) {
			foreach ($values['categories'] as &$category) {
				$category = $category['id'];
			}
		}

		if (array_key_exists('options', $values)) {
			foreach ($values['options'] as $key => $option) {
				$values['options']['option_' . $option['id']] = $option;
				unset($values['options'][$key]);
			}
		}

		return parent::populate($values);
	}

}

