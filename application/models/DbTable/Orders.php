<?php

class Model_DbTable_Orders extends Model_DbTable_Abstract
{

    protected $_name = 'orders';
    
    protected $_dependentTables = array('Model_DbTable_OrderProducts');
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

