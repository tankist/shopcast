<?php

class Model_DbTable_Files extends Model_DbTable_Abstract
{

    protected $_name = 'product_attachments';
	
	protected $_referenceMap = array(
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Products',
			'refColumns' => 'id'
		)
	);
}

