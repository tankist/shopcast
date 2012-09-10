<?php
/**
* @property int $id
* @property int $store_id
* @property straing $name
* @property int $display_order
*/
class Model_Category extends Model_Abstract implements Model_Interface {
	
	protected $_modelName = 'category';
	
	protected $_mapperType = 'db';
	
}

