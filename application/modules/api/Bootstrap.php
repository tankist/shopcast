<?php

class Api_Bootstrap extends Zend_Application_Module_Bootstrap {

	public function _initResauceFramework() {
		$front = Zend_Controller_Front::getInstance();
		$front->registerPlugin(new Zend_Controller_Plugin_PutHandler());
		$restRoute = new Skaya_Rest_Route($front, array(), array(
			'api',
		));
		$front->getRouter()->addRoute('rest', $restRoute);
	}

}
