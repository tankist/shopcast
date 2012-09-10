<?php

class Model_DbTable_Products extends Model_DbTable_Abstract
{

	protected $_name = 'products';

	protected $_dependentTables = array('Model_DbTable_ProductsPartnerCategories', 'Model_DbTable_ProductsCategories', 'Model_DbTable_ProductDesigners', 'Model_DbTable_Files');
	
	protected $_referenceMap = array(
		'Store' => array(
			'columns' => 'store_id',
			'refTableClass' => 'Model_DbTable_Stores',
			'refColumns' => 'id'
		)
	);
}

