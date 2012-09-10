<?php

class Model_DbTable_Options extends Model_DbTable_Abstract
{

    protected $_name = 'option';
	
	protected $_referenceMap = array(
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Products',
			'refColumns' => 'id'
		)
	);
}

