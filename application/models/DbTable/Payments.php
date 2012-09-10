<?php

class Model_DbTable_Payments extends Model_DbTable_Abstract
{

    protected $_name = 'payments';
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

