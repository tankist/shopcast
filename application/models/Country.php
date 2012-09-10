<?php
/**
* @property int $id
* @property int $store_id
* @property string $status
* @property float $product_price
* @property float $shipping_price
* @property float $income_price
* @property float $factor_income
* @property string $shipping_info
* @property string $transaction_id
* @property string $last_modified
* @property string $date_purchased
*/
class Model_Country extends Model_Abstract implements Model_Interface {
	
	protected $_modelName = 'country';
	
	protected $_mapperType = 'db';
	
	
}