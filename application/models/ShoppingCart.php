<?php
class Model_ShoppingCart extends Model_Abstract implements Model_Interface {
	
	protected $_modelName = 'shoppingCart';
	
	protected $_mapperType = 'session';
	protected static $_instance = null;
	
	/**
	 * Returns an instance of Model_ShoppingCart
	 *
	 * Singleton pattern implementation
	 *
	 * @return Model_ShoppingCart Provides a fluent interface
	 */
	public static function getInstance()
	{
		if (null === self::$_instance) {
			self::$_instance = new self();
		}

		return self::$_instance;
	}
	
	
	/**
	* @desc add product to shopping cart
	*/
	public function addProduct(Model_Product $product, Model_Option $option, $quantity = 1 ) {
		$quantity = intval($quantity);
		if ($quantity < 1) {
			throw new Model_Exception('Wrong quantity provided');
		}
		if (!$product->hasOption($option)) {
			throw new Model_Exception('Provided option is not the product\'s option');
		}
		if ( $option->quantity < $quantity ) {
			throw new Model_Exception('Out products in stock');
		}
		$product = Model_ShoppingCartProduct::getSelectedProduct($product, $option);
		$product->quantity = $quantity;
		
		$productsCollection = $this->getProducts();
		
		//check existing product
		$product_id = $product->id;
		foreach ( $productsCollection as $productItem ) {
			if ( $productItem->id == $product->id && $productItem->product_info['id'] == $product->product_info['id'] ) {
				$product->quantity += $productItem->quantity;
			}
		}
		
		$product->save();
		return $this;
	}
	
	/**
	* @desc add product to shopping cart
	*/
	public function updateProduct($array,$store) {
		
		$productsCollection = $this->getProducts();
		foreach ( $array as $product_id=>$arr ) {
			foreach ( $arr as $option_id=>$value ) {
				$product = $store->getProductById($product_id);
				$option = $product->getOptionById($option_id);
				$quantity = intval($value);
				
				if (!$product->hasOption($option)) {
					throw new Model_Exception('Provided option is not the product\'s option');
				}
				if ( $option->quantity < $quantity ) {
					throw new Model_Exception('Out products in stock');
				}
				
				$product = Model_ShoppingCartProduct::getSelectedProduct($product, $option);
				
				if ( $quantity == 0 ) {
					$product->delete();
				} else {
					$product->quantity = abs($quantity);
					
					//check existing product
					foreach ( $productsCollection as $productItem ) {
						if ( $productItem->id == $product->id && $productItem->product_info['id'] == $product->product_info['id'] ) {
							$product->save();
						}
					}
				}
			}
		}
		
		return $this;
	}
	
	/**
	* @desc delete product from shopping cart
	*/
	public function deleteProduct(Model_Product $product, Model_Option $option) {
		if (!$product->hasOption($option)) {
			throw new Model_Exception('Provided option is not the product\'s option');
		}
		
		$product = $this->getShoppingCartProductById($product,$option);
		if ( $product ) {
			$product->delete();
			return $this;
		}
	}
	
	/**
	* @desc delete all products from shopping cart
	*/
	public function clearProducts() {
		$productsCollection = $this->getProducts();
		
		foreach ( $productsCollection as $product ) {
			$product->delete();
		}
	}
	
	/**
	* @desc return all products from shopping cart
	*/
	public function getProducts() {
		
		$productsList = $this->getMapper()->getData();
		$productsCollection = new Model_Collection_ShoppingCartProducts($productsList);
		
		return $productsCollection;
	}
	
	/**
	* @desc return total price from shopping cart
	*/
	public function getTotalPrice() {
		$productsCollection = $this->getProducts();
		
		$totalPrice = 0;
		foreach ( $productsCollection as $product ) {
			$price = $product->sale?$product->sale:$product->price;
			$totalPrice += $price * $product->quantity;
		}
		
		return $totalPrice;
	}
	
	/**
	* @desc return count of products in shopping cart
	*/
	public function getProductsCount() {
		$productsCollection = $this->getProducts();
		
		return count($productsCollection);
	}
	
	public function getShoppingCartProductById($product, $option) {
		$products = $this->getProducts();
		
		foreach ( $products as $productItem ) {
			if ( $productItem->id == $product->id && $productItem->product_info['id'] == $option->id ) {
				return $productItem;
			}
		}
		return false;
	}
	
	
}