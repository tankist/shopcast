<?php
class Model_ShoppingCartProduct extends Model_Product {
	
	protected $_modelName = 'shoppingCartProduct';
	
	protected $_mapperType = 'session';
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getOptions($force = true) {
		return $this->options;
	}
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getCategories($force = true) {
		return $this->categories;
	}
	
	public static function getSelectedProduct(Model_Product $product, Model_Option $option) {
		if (!($product instanceOf self)) {
			$product = new self($product->toArray());
			$product->product_info = $option->toArray();
		}
		return $product;
	}
	
	/**
	* Returns corresponding Model_Product object by its Order copy
	* 
	* @return Model_Product
	*/
	public function getProduct() {
		return Model_Sellcast::getProductById($this->id);
	}
	
	public function save() {
		$data = $this->getMapper()->save($this->toArray());
		return $this;
	}
}

