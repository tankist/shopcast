<?php
/**
* @property int $product_id
* @property string $product_name
* @property string $product_desc
* @property float $product_price
*/
class Model_OrderProduct extends Model_Product {
	
	protected $_mapperType = 'db';
	
	protected $_categories = null;
	protected $_options = null;
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getOptions($force = true) {
		if (empty($this->_options) || $force) {
			$optionsBlob = $this->_getOptionsMapper()->getProductOptions($this->id);
			$this->_options = new Model_Collection_Options($optionsBlob);
		}
		return $this->_options;
	}
	
	/**
	* Return all options of the product
	* 
	* @param boolean $force if true than get options from the storage even if there is already existent options in the product object
	* @return Model_Collection_Options
	*/
	public function getCategories($force = true) {
		if (empty($this->_categories) || $force) {
			$categoriesBlob = $this->_getCategoriesMapper()->getProductCategories($this->id);
			$this->_categories = new Model_Collection_Categories($categoriesBlob);
		}
		return $this->_categories;
	}
	
	public static function getSelectedProduct(Model_Product $product) {
		if (!($product instanceOf self)) {
			$product = new self($product->toArray());
		}
		return $product;
	}
	
	public function delete() {
		throw new Model_Exception('You cannot delete products from the order');
	}
	
	/**
	* Returns corresponding Model_Product object by its Order copy
	* 
	* @return Model_Product
	*/
	public function getProduct() {
		return Model_Sellcast::getProductById($this->product_id);
	}
}

