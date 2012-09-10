<?php

class Model_DbTable_ProductsCategories extends Model_DbTable_Abstract
{

    protected $_name = 'product_categories';
	
	protected $_referenceMap = array(
		'Category' => array(
			'columns' => 'category_id',
			'refTableClass' => 'Model_DbTable_Categories',
			'refColumns' => 'id'
		),
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Products',
			'refColumns' => 'id'
		)
	);
}

