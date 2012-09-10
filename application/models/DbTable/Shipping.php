<?php
class Model_DbTable_Shipping extends Model_DbTable_Abstract {
	
	protected $_name = 'shipping';
	
	//protected $_dependentTables = array('Model_DbTable_OrderProducts');
	
	protected $_referenceMap = array(
		'Order' => array(
			'columns' => 'order_id',
			'refTableClass' => 'Model_DbTable_Orders',
			'refColumns' => 'id'
		)
	);
	
}

