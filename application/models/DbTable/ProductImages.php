<?php

class Model_DbTable_ProductImages extends Model_DbTable_Abstract
{

	protected $_name = 'product_images';

	protected $_referenceMap = array(
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Product',
			'refColumns' => 'id'
		)
	);
}

