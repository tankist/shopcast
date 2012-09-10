<?php
class Model_Sellcast extends Model_Abstract {
	
	protected $_modelName = 'sellcast';
	
	protected $_mapperType = self::MAPPER_DATABASE;
	
	/**
	* Return Store object by its ID
	* 
	* @param int $store_id
	* @return Model_Store
	*/
	public static function getStoreById($store_id) {
		$storeMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'store');
		$storeBlob = $storeMapper->getStoreById($store_id);
		if ( !empty($storeBlob) ) {
			$store = new Model_Store($storeBlob);
			return $store;
		}
		return false;
	}
	
	/**
	* Return Store object by associated domain name
	* 
	* @param mixed $store_domain
	* @return Model_Store
	*/
	public static function getStoreByDomain($store_domain) {
		$storeMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'store');
		$storeBlob = $storeMapper->getStoreByDomain($store_domain);
		if ( !empty($storeBlob) ) {
			$store = new Model_Store($storeBlob);
			return $store;
		}
		return false;
	}
	
	/**
	* Return Product object by its ID
	* 
	* @param int $product_id
	* @return Model_Product
	*/
	public static function getProductById($product_id) {
		$productMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'product');
		$productBlob = $productMapper->getProductById($product_id);
		if ( !empty($productBlob) ) {
			$product = new Model_Product($productBlob);
			return $product;
		}
		return false;
	}
	
	/**
	* Create Store object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_Store
	*/
	public static function createStore($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$store = new Model_Store($data);
		return $store;
	}
	
	/**
	* Create Product object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_Product
	*/
	public static function createProduct($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$product = new Model_Product($data);
		return $product;
	}
	
	/**
	* Create Option object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_Option
	*/
	public static function createOption($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$option = new Model_Option($data);
		return $option;
	}
	
	/**
	* Create ProductImage object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_ProductImage
	*/
	public static function createProductImage($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$image = new Model_ProductImage($data);
		return $image;
	}
	
	/**
	* Create Category object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_Category
	*/
	public static function createCategory($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$category = new Model_Category($data);
		return $category;
	}
	
	/**
	* Create Order object  and fill it with data provided
	* 
	* @param array $data
	* @return Model_Order
	*/
	public static function createOrder($data) {
		if (array_key_exists('id', $data)) unset($data['id']);
		$order = new Model_Order($data);
		return $order;
	}
	
	/**
	* Search stores
	* 
	* @param mixed $condition
	* @param mixed $order
	* @param mixed $limit
	* @param mixed $offset
	* @return Model_Collection_Stores
	*/
	public static function searchStores($condition, $order = null, $limit = null, $offset = null) {
		$storeMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'store');
		$storesArray = $storeMapper->search($condition, $order, $limit, $offset);
		$stores = new Model_Collection_Stores($storesArray);
		return $stores;
	}
	
	/**
	* Search stores and return results as paginator object
	* 
	* @param string $condition
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public static function searchStoresPaginator($condition, $order = null) {
		$storeMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'store');
		$paginator = $storeMapper->getSearchPaginator($condition, $order);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Stores'));
		return $paginator;
	}
	
	/**
	* Search products
	* 
	* @param mixed $condition
	* @param mixed $order
	* @param mixed $limit
	* @param mixed $offset
	* @return Model_Collection_Stores
	*/
	public static function searchProducts($condition, $order = null, $limit = null, $offset = null) {
		$productsMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'product');
		$storesArray = $productsMapper->search($condition, $order, $limit, $offset);
		$stores = new Model_Collection_Products($storesArray);
		return $stores;
	}
	
	/**
	* Search products and return results as paginator object
	* 
	* @param string $condition
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public static function searchProductsPaginator($condition, $order = null) {
		$productsMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'product');
		$paginator = $productsMapper->getSearchPaginator($condition, $order);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Products'));
		return $paginator;
	}
	
	/**
	* Search orders
	* 
	* @param mixed $condition
	* @param mixed $order
	* @param mixed $limit
	* @param mixed $offset
	* @return Model_Collection_Orders
	*/
	public static function searchOrders($condition, $order = null, $limit = null, $offset = null) {
		$orderMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'order');
		$ordersArray = $orderMapper->search($condition, $order, $limit, $offset);
		$orders = new Model_Collection_Orders($ordersArray);
		return $orders;
	}
	
	/**
	* Search orders and return results as paginator object
	* 
	* @param string $condition
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public static function searchOrdersPaginator($condition, $order = null) {
		$ordersMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'order');
		$paginator = $ordersMapper->getSearchPaginator($condition, $order);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Orders'));
		return $paginator;
	}
	
	/**
	* get All Countries
	* 
	* 
	* @return Model_Collection_Countries
	*/
	public static function getCountriesArray() {
		$countryMapper = Model_Mapper_Abstract::factory(self::getDefaultMapperType(), 'country');
		$countriesArray = $countryMapper->getCountries();
		
		return $countriesArray;
	}
}

