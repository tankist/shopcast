<?php

class Model_DbTable_ProductsPartnerCategories extends Model_DbTable_Abstract
{

    protected $_name = 'common_category_product';
	
	protected $_referenceMap = array(
		'Category' => array(
			'columns' => 'common_category_id',
			'refTableClass' => 'Model_DbTable_PartnerCategories',
			'refColumns' => 'id'
		),
		'Product' => array(
			'columns' => 'product_id',
			'refTableClass' => 'Model_DbTable_Products',
			'refColumns' => 'id'
		)
	);
}

