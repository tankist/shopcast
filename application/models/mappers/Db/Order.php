<?php
class Model_Mapper_Db_Order extends Model_Mapper_Db_Abstract {
	
	const TABLE_NAME = 'orders';
	
	protected $_mapperTableName = self::TABLE_NAME;
	
	public function map($data = array()) {
		foreach (array('last_modified', 'date_purchased') as $key) {
			if (array_key_exists($key, $data) && is_string($data[$key])) {
				$data[$key] = strtotime($data[$key]);
			}
		}
		return parent::map($data);
	}
	
	public function unmap($data = array()) {
		$data = parent::unmap($data);
		foreach (array('last_modified', 'date_purchased') as $key) {
			if (array_key_exists($key, $data) && is_integer($data[$key])) {
				$data[$key] = new Zend_Db_Expr('FROM_UNIXTIME(' . $data[$key] . ')');
			}
		}
		return $data;
	}
	
	public function getOrderById($order_id) {
		$orderTable = self::_getTableByName(self::TABLE_NAME);
		$orderBlob = $orderTable->fetchRowById($order_id);
		return $this->getMappedArrayFromData($orderBlob);
	}
	
	public function getStoreOrdersPaginator($store_id) {
		$select = self::_getTableByName(self::TABLE_NAME)->select()->where('store_id = ?', (int)$store_id);
		$paginator = Skaya_Paginator::factory($select, 'DbSelect');
		$paginator->addFilter(new Zend_Filter_Callback(array(
			'callback' => array($this, 'getMappedArrayFromData')
		)));
		return $paginator;
	}
	
	public function getStoreOrdersStatusPaginator($store_id, $status = null) {
		$select = self::_getTableByName(self::TABLE_NAME)->select()->where('store_id = ?', (int)$store_id);
		if ($status !== null) {
			$select->where('status = ?', $status);
		}
		$paginator = Skaya_Paginator::factory($select, 'DbSelect');
		$paginator->addFilter(new Zend_Filter_Callback(array(
			'callback' => array($this, 'getMappedArrayFromData')
		)));
		return $paginator;
	}
	
	public function getStoreOrders($store_id) {
		$ordersBlob = self::_getTableByName(self::TABLE_NAME)->fetchAllByStoreId((int)$store_id);
		return $this->getMappedArrayFromData($ordersBlob);
	}
	
	public function getStoreOrdersCount($store_id) {
		return self::_getTableByName(self::TABLE_NAME)->countByStoreId((int)$store_id);
	}
}

