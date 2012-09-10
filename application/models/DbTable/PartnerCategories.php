<?php

class Model_DbTable_PartnerCategories extends Model_DbTable_Abstract
{

    protected $_name = 'common_category';

	protected $_dependentTables = array('Model_DbTable_ProductsPartnerCategories', 'Model_DbTable_PartnerCategories');
	
	protected $_referenceMap = array(
		'ParentCategory' => array(
			'columns' => 'parent_id',
			'refTableClass' => 'Model_DbTable_PartnerCategories',
			'refColumns' => 'id'
		),
		'Partner' => array(
			'columns' => 'partner_id',
			'refTableClass' => 'Model_DbTable_Partners',
			'refColumns' => 'id'
		)
	);
}

