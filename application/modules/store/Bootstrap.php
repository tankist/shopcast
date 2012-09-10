<?php
class Store_Bootstrap extends Zend_Application_Module_Bootstrap {

	protected function _initSessionNamespace() {
		$this->getApplication()->bootstrap(array('db', 'session'));
		
		$session = new Zend_Session_Namespace($this->_moduleName);
		Model_Mapper_Session_Abstract::setDefaultSessionNamespace($session);
		return $session;
	}
}
