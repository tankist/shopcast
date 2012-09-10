<?php

class Model_DbTable_Designers extends Model_DbTable_Abstract
{

    protected $_name = 'designer';

	protected $_dependentTables = array('Model_DbTable_ProductDesigners');
	
	protected $_referenceMap = array(
		'Partner' => array(
			'columns' => 'partner_id',
			'refTableClass' => 'Model_DbTable_Partners',
			'refColumns' => 'id'
		)
	);
}

