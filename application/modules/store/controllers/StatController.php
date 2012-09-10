<?php

class Store_StatController extends Zend_Controller_Action
{

    public $contexts = array(
        'product' => true
    );

    public function __construct(Zend_Controller_Request_Abstract $request, Zend_Controller_Response_Abstract $response, array $invokeArgs = array())
    {
        if (!Zend_Controller_Action_HelperBroker::hasHelper('ViewRenderer')) {
            $view = new Zend_View();
            $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer($view);
            Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        }
        parent::__construct($request, $response, $invokeArgs);
    }

    public function init()
    {
        $this->_contextSwitch = $this->_helper->getHelper('contextSwitch');
        $this->_contextSwitch->initContext();
    }

    public function preDispatch()
    {
        $request = $this->getRequest();
        $domain = $request->getParam('domain');
        $this->_store = Model_Sellcast::getStoreByDomain($domain);
    }

    public function indexAction()
    {
        // action body
    }

    public function productAction()
    {
        $request = $this->getRequest();
        $product_id = $request->getParam('id');
        $this->view->product = $this->_store->getProductById($product_id)->toArray();
    }


}



