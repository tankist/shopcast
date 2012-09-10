<?php

class Model_DbTable_ProductDesigners extends Model_DbTable_Abstract
{

    protected $_name = 'product_designer';
	
	protected $_referenceMap = array(
		'Designer' => array(
			'columns' => 'designer_id',
			'refTableClass' => 'Model_DbTable_Designers',
			'refColumns' => 'id'
		),
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Products',
			'refColumns' => 'id'
		)
	);
}

