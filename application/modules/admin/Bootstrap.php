<?php
class Admin_Bootstrap extends Zend_Application_Module_Bootstrap {
	
	protected function _initSessionNamespace() {
		$this->getApplication()->bootstrap('db')->bootstrap('session');
		
		$session = new Zend_Session_Namespace($this->_moduleName);
		
		return $session;
	}
	
}