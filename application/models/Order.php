<?php
/**
* @property int $id
* @property int $store_id
* @property string $status
* @property float $products_price
* @property float $shipping_price
* @property float $income_price
* @property float $factor_income
* @property string $shipping_info
* @property string $transaction_id
* @property string $last_modified
* @property string $date_purchased
*/
class Model_Order extends Model_Abstract implements Model_Interface {
	
	const ORDER_STATUS_PENDING = 'pending';
	const ORDER_STATUS_PROCESSING = 'processing';
	const ORDER_STATUS_DELIVERED = 'delivered';
	const ORDER_STATUS_CANCELED = 'canceled';
	
	protected $_modelName = 'order';
	
	protected $_mapperType = 'db';
	
	protected $_shippingInfo = array();
	
	/**
	* Adds product to the order
	* 
	* @param Model_OrderProduct|Model_Product $product
	* @param Model_Option $option
	* @param int $quantity
	* @return Model_Order
	* @throws Model_Exception
	*/
	public function addProduct(Model_Product $product, Model_Option $option, $quantity) {
		$quantity = intval($quantity);
		if ($quantity < 1) {
			throw new Model_Exception('Wrong quantity provided');
		}
		if (!$product->hasOption($option)) {
			throw new Model_Exception('Provided option is not the product\'s option');
		}
		$product = Model_OrderProduct::getSelectedProduct($product);
		$product->order_id = $this->id;
		$product->product_info = $option->toArray();
		$product->quantity = $quantity;
		$product->save();
		return $this;
	}
	
	/**
	* Return list of the products for the current order
	* 
	* @return Model_Collection_OrderProducts
	*/
	public function getProducts() {
		$productsBlob = $this->_getOrderProductMapper()->getOrderProducts($this->id);
		$products = new Model_Collection_OrderProducts($productsBlob);
		return $products;
	}
	
	/**
	* Return order status
	* 
	* @return string
	*/
	public function getOrderStatus() {
		return $this->status;
	}
	
	/**
	* Set pending status
	* 
	* @return Model_Order
	*/
	public function pending() {
		$this->status = self::ORDER_STATUS_PENDING;
		return $this;
	}
	
	/**
	* Set processing status
	* 
	* @return Model_Order
	*/
	public function process() {
		$this->status = self::ORDER_STATUS_PROCESSING;
		return $this;
	}
	
	/**
	* Set delivered status
	* 
	* @return Model_Order
	*/
	public function deliver() {
		$this->status = self::ORDER_STATUS_DELIVERED;
		return $this;
	}
	
	/**
	* Set canceled status
	* 
	* @return Model_Order
	*/
	public function cancel() {
		$this->status = self::ORDER_STATUS_CANCELED;
		return $this;
	}
	
	/**
	* Returns total price for the current order
	* 
	* @return float
	*/
	public function getOrderTotalPrice() {
		$productsPrice = (float)$this->_getOrderProductMapper()->calculateOrderTotalPrice($this->id);
		$shippingPrice = (float)$this->shipping_price;
		return $productsPrice + $shippingPrice;
	}
	
	/**
	* Returns shipping information for the current order
	* 
	* @param boolean $force set it to TRUE to force retrieving shipping info from storage
	* @return array
	*/
	public function getShippingInfo($force = false) {
		if (empty($this->_shippingInfo) || $force) {
			$shippingMapper = $this->_getOrderShippingMapper();
			$this->_shippingInfo = $shippingMapper->getOrderShippingInfo($this->id);
		}
		return $this->_shippingInfo;
	}
	
	/**
	* Save shipping information for the current order
	* 
	* @param array $shippingInfo shipping data
	* @return Model_Order
	* @throws Model_Exception
	*/
	public function setShippingInfo($shippingInfo = array()) {
		$shippingInfo['order_id'] = $this->id;
		$pk = $this->_getOrderShippingMapper()->save($shippingInfo);
		if ($pk) {
			$this->_shippingInfo = $shippingInfo;
		}
		return $this;
	}
	
	public function toArray() {
		$data = parent::toArray();
		if (!empty($this->_shippingInfo)) {
			$data['shippingInfo'] = (array)$this->_shippingInfo;
		}
		return $data;
	}
	
	/**
	* Returns mapper for Products
	* 
	* @return Model_Mapper_Db_OrderProduct
	*/
	protected function _getOrderProductMapper() {
		return $this->getMapper($this->getMapperType(), 'OrderProduct');
	}
	
	/**
	* Returns mapper for Shipping
	* 
	* @return Model_Mapper_Db_OrderShipping
	*/
	protected function _getOrderShippingMapper() {
		return $this->getMapper($this->getMapperType(), 'OrderShipping');
	}
}