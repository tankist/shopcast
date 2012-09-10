<?php
/**
* @property int $id
* @property int $product_id
* @property string $name
* @property string $value
* @property int $quantity
*/
class Model_Option extends Model_Abstract implements Model_Interface {
	
	protected $_modelName = 'option';
	
	protected $_mapperType = 'db';
	
}

