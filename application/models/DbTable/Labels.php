<?php

class Model_DbTable_Labels extends Model_DbTable_Abstract
{

    protected $_name = 'label';
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

