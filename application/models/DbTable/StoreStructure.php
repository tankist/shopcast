<?php

class Model_DbTable_StoreStructure extends Model_DbTable_Abstract {

	protected $_name = 'store_structure';
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
	
}
