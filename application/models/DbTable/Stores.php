<?php

class Model_DbTable_Stores extends Model_DbTable_Abstract
{

	protected $_name = 'stores';

	protected $_dependentTables = array('Model_DbTable_StoreDesign', 'Model_DbTable_Payments', 'Model_DbTable_Orders', 'Model_DbTable_Categories', 'Model_DbTable_Products');
	
	protected $_referenceMap = array(
		'Partner' => array(
			'columns' => 'partner_id',
			'refTableClass' => 'Model_DbTable_Partners',
			'refColumns' => 'id'
		)
	);
}

