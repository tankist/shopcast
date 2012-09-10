<?php

class Model_DbTable_Categories extends Model_DbTable_Abstract
{

    protected $_name = 'categories';

	protected $_dependentTables = array('Model_DbTable_ProductsCategories');
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

