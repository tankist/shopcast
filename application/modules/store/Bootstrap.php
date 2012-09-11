<?php
class Store_Bootstrap extends Zend_Application_Module_Bootstrap
{

    protected function _initSessionNamespace()
    {
        $this->getApplication()->bootstrap('db')->bootstrap('session');
        $session = new Zend_Session_Namespace($this->_moduleName);
        return $session;
    }

    protected function _initResourceLoader()
    {
        $this->getResourceLoader()->addResourceType('helper', 'helpers', 'Helper');
    }

    protected function _initActionHelpers()
    {
        Zend_Controller_Action_HelperBroker::addHelper(new Store_Helper_Navigator());
    }

}