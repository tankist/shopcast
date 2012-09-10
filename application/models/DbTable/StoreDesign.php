<?php

class Model_DbTable_StoreDesign extends Model_DbTable_Abstract
{

	protected $_name = 'store_designs';
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

