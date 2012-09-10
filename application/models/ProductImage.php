<?php
/**
* @property int $id
* @property int $store_id
* @property straing $name
* @property int $display_order
*/
class Model_ProductImage extends Model_Abstract implements Model_Interface {
	
	protected $_modelName = 'productImage';
	
	protected $_mapperType = 'db';
	
	static $thumbnailPack = array(
		'small'=>array(
			'width'=>100,
			'height'=>100,
			'indication_type'=>'suffix',
			'indication'=>'s'
		),
		'big'=>array(
			'width'=>600,
			'height'=>400,
			'indication_type'=>'suffix',
			'indication'=>'b'
		),
		'middle'=>array(
			'width'=>300,
			'height'=>200,
			'indication_type'=>'suffix',
			'indication'=>'m'
		)
	);
	
	public static function deleteImageFile($path, $name, $isDirDelete = false) {
		$filter = new Skaya_Filter_File_ParseFileName(array());
		$full_name = $filter->filter($name);
		
		@unlink($path . DIRECTORY_SEPARATOR . $name );
		
		$thumbnailPack = Model_Product::$thumbnailPack;
		foreach ($thumbnailPack as $thumb) {
			if ( $thumb['indication_type'] == 'suffix' ) {
				$new_name = $full_name['name'] . '_' . $thumb['indication'];
			} else {
				$new_name = $thumb['indication'] . '_' . $full_name['name'];
			}
			@unlink($path . DIRECTORY_SEPARATOR . $new_name . $full_name['ext'] );
		}
		if ( $isDirDelete ) {
			rmdir($path);
		}
	}
}

