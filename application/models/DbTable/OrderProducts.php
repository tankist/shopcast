<?php

class Model_DbTable_OrderProducts extends Model_DbTable_Abstract
{

    protected $_name = 'order_products';
	
	protected $_referenceMap = array(
		'Order' => array(
			'columns' => 'order_id',
			'refTableClass' => 'Model_DbTable_Orders',
			'refColumns' => 'id'
		)
	);
}

