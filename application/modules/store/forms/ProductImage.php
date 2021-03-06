<?php

class Store_Form_ProductImage extends Zend_Form
{
	protected $_imagesPath;
	
	public function init()
	{
		/* Form Elements & Other Definitions Here ... */
		
		$this->setEnctype(self::ENCTYPE_MULTIPART);

		$image = new Zend_Form_Element_File('name',array('size'=>4));
		$image
			->setTransferAdapter(new Zend_File_Transfer_Adapter_Http(array('magicFile'  => 'z:/usr/share/mime/magic')))
			->addValidator('Size', false, 1024000)
			->addValidator('IsImage',false,array('image/gif','image/jpeg','image/png','image/pjpeg'));
		$image->addFilter(new Skaya_Filter_File_Rename($this->getImagesPath()));
		$image->addFilter(new Skaya_Filter_File_Thumbnail(
								Model_Product::$thumbnailPack
							)
						);

		
		$elements = array($image);
		$this->addElements($elements);
		
		$this->setDecorators(array('FormElements','Form'));
		$this->name->setDecorators(array('File'));
	}
	
	public function getImagesPath() {
		return $this->_imagesPath;
	}
	
	public function setImagesPath($images_path) {
		$this->_imagesPath = $images_path;
		
		return $this;
	}
}