<?php

class Store_AuthController extends Zend_Controller_Action
{

    /**
     * @var \Entities\Store;
     */
    protected $_store;

    /**
     * @var Service_Store
     */
    protected $_service;

    public function init()
    {
        $this->_service = new Service_Store($this->_helper->Em());
        $this->_store = $this->_helper->Store();
    }

    public function indexAction()
    {
        $this->_redirect($this->_helper->url->url(array('module' => 'store', 'controller' => '')));
    }

    public function loginAction()
    {
        /** @var $request Zend_Controller_Request_Http */
        $request = $this->getRequest();

        $loginForm = new Store_Form_Login(array(
            'name' => 'loginForm',
            'action' => $this->_helper->url('login')
        ));

        if ($request->isPost() && $loginForm->isValid($request->getPost())) {
            $authAdapter = new Skaya_Auth_Adapter_Doctrine2(
                $this->_service->getEntityManager(),
                'Entities\Store',
                'domain',
                'password'
            );
            $authAdapter->setIdentity($loginForm->domain->getValue());
            $authAdapter->setCredential($loginForm->password->getValue());
            $auth = Zend_Auth::getInstance();
            $authResult = $auth->authenticate($authAdapter);
            if ($authResult->isValid()) {
                $this->_store = $this->_helper->Store();
                $this->_store->setLastLoginDate(new DateTime());
                $this->_service->save($this->_store);
                if (!$request->isXmlHttpRequest()) {
                    $referer = $loginForm->referer->getValue();
                    $this->_redirect(($referer) ? $referer : $this->_helper->url(''));
                }
            } else {
                $this->view->error = array(
                    'form' => $authResult->getMessages()
                );
            }
        } else {
            $this->_helper->layout()->setLayout('login');
            $loginForm->referer->setValue($request->getRequestUri());
            $this->view->login = $loginForm->prepareDecorators();
        }
    }

    public function logoutAction()
    {
        $auth = Zend_Auth::getInstance();
        $auth->clearIdentity();
        $this->_redirect($this->_helper->url(''));
    }

    public function forgotAction()
    {
        // action body
    }

    public function rememberAction()
    {
        // action body
    }

    public function activateAction()
    {
        // action body
    }


}











