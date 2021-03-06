<?php
class Model_Mapper_Db_Product extends Model_Mapper_Db_Abstract {
	
	const TABLE_NAME = 'products';
	
	protected $_mapperTableName = self::TABLE_NAME;
	
	protected $_fieldMapping = array(
		'description' => 'descr',
		'image' => 'thumb_id',
		'addDate' => 'add_dt'
	);
	
	public function unmap($data = array()) {
		$data = parent::unmap($data);
		if (array_key_exists('prices', $data)) {
			if (is_array($data['prices'])) {
				$data['sale'] = (isset($data['prices']['sale']))?$data['prices']['sale']:0;
				$data['price'] = (isset($data['prices']['normal']))?$data['prices']['normal']:0;
				unset($data['prices']);
			}
		}
		if (array_key_exists('shipping', $data)) {
			$data['shipping_type'] = (isset($data['shipping']['type']))?$data['shipping']['type']:'no';
			$shippingValues = array();
			$shippingValues['value'] = (isset($data['shipping']['alone']))?$data['shipping']['alone']:'';
			$shippingValues['add_value'] = (isset($data['shipping']['add_amount']))?$data['shipping']['add_amount']:'';
			$data['shipping_values'] = serialize($shippingValues);
		}
		if (array_key_exists('add_dt', $data) && is_int($data['add_dt'])) {
			$data['add_dt'] = new Zend_Db_Expr('FROM_UNIXTIME(' . $data['add_dt'] . ')');
		}
		else {
			$data['add_dt'] = new Zend_Db_Expr('NOW()');
		}
		return $data;
	}
	
	public function map($data = array()) {
		if (array_key_exists('shipping_values', $data) && is_string($data['shipping_values'])) {
			$shippingValues = unserialize($data['shipping_values']);
			$data['shipping']['alone'] = (isset($shippingValues['value']))?$shippingValues['value']:'';
			$data['shipping']['add_amount'] = (isset($shippingValues['add_value']))?$shippingValues['add_value']:'';
			unset($data['shipping_values']);
		}
		if (array_key_exists('add_dt', $data) && is_string($data['add_dt'])) {
			$data['add_dt'] = strtotime($data['add_dt']);
		}
		$data['prices'] = array(
			'normal' => $data['price'],
			'sale' => $data['sale']
		);
		return parent::map($data);
	}
	
	/**
	* Return project from the database by its ID
	* 
	* @param int $product_id
	* @return array
	*/
	public function getProductById($product_id) {
		$productTable = self::_getTableByName(self::TABLE_NAME);
		$productBlob = $productTable->fetchRowById($product_id);
		return $this->getMappedArrayFromData($productBlob);
	}
	
	public function getProductsByStoreId($store_id) {
		$productsBlob = self::_getTableByName(self::TABLE_NAME)->fetchAllByStoreId((int)$store_id);
		return $this->getMappedArrayFromData($productsBlob);
	}
	
	public function getProductsCountByStoreId($store_id) {
		return self::_getTableByName(self::TABLE_NAME)->countByStoreId((int)$store_id);
	}
	
	public function getProductsByStoreIdAndStatus($store_id, $status) {
		$productsBlob = self::_getTableByName(self::TABLE_NAME)->fetchAllByStoreIdAndStatus((int)$store_id, $status);
		return $this->getMappedArrayFromData($productsBlob);
	}
	
	public function getProductsCountByStoreIdAndStatus($store_id, $status) {
		return self::_getTableByName(self::TABLE_NAME)->countByStoreIdAndStatus((int)$store_id, $status);
	}
	
	public function getProductsPaginatorByStoreId($store_id) {
		$thisTable = self::_getTableByName(self::TABLE_NAME);
		$select = $thisTable->select()->from(array('p' => $thisTable->info(Model_DbTable_Abstract::NAME)))->where('p.store_id = ?', (int)$store_id);
		$paginator = Skaya_Paginator::factory($select, 'DbSelect');
		$paginator->addFilter(new Zend_Filter_Callback(array(
			'callback' => array($this, 'getMappedArrayFromData')
		)));
		return $paginator;
	}
}

