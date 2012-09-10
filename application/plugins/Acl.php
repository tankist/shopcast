<?php

class Plugin_Acl extends Zend_Controller_Plugin_Abstract {

    const REDIRECT_COUNTER_THRESHOLD = 10;

    /**
     * @var int
     */
    protected static $_redirectCounter = 0;

    /**
     * @var int
     */
    protected $_defaultRole = 0;

    /**
     *
     * @var Zend_Acl
     */
    protected $_acl;

    protected $_aclRoute = '%s.%s';

    /**
     * @var \Entities\Store
     */
    protected $_store;

    /**
     * Location to go to if the user isn't authenticated
     * @var array
     */
    protected $_noAuth = array(
        '*' => array(
            'module' => 'store',
            'controller' => 'auth',
            'action' => 'login'
        ),
        'admin' => array(
            'module' => 'admin',
            'controller' => 'auth',
            'action' => 'login'
        )
    );

    /**
     * Location to go to if the user isn't authorized
     * @var array
     */
    protected $_noAcl = array();

    /**
     * @return Entities\Store
     */
    public function getStore()
    {
        if (!$this->_store) {
            if (($key = $this->getRequest()->getParam('api_key'))) {
                /** @var $em \Doctrine\ORM\EntityManager */
                $em = Zend_Controller_Action_HelperBroker::getStaticHelper('Em')->getEntityManager();
                $this->_store = $em->getRepository('\Entities\Consumer')->findOneBy(array('key' => $key));
                $this->getRequest()->setParam('consumer', $this->_store);
            }
        }
        return $this->_store;
    }

    /**
     * @return bool
     */
    public function isRegistered() {
        return (null != $this->getStore());
    }

    /**
     * @return int
     */
    public function getRole() {
        if ($key = $this->getStore()) {
            return $key->getRole();
        }
        return $this->_defaultRole;
    }

    /**
     * @param null $resource
     * @param null $privelege
     * @return bool
     */
    public function isAllowed($resource = null, $privelege = null) {
        return $this->_acl->isAllowed($this->getRole(), $resource, $privelege);
    }

    public function preDispatch(Zend_Controller_Request_Abstract $request) {
        $this->_acl = $this->_getAcl();
        $controller = $request->getControllerName();
        $action = $request->getActionName();
        $module = $request->getModuleName();

        $resource = sprintf($this->_aclRoute, $module, $controller);
        if (!$this->_acl->has($resource)) {
            $resource = $module;
        }
        if (!$this->_acl->has($resource)) {
            $resource = null;
        }
        if ($this->isAllowed($resource, $action)) {
            return;
        }

        // Auth fail

        $returnUrl = urlencode($request->getRequestUri());
        $request->setParam('return', $returnUrl);

        if ($this->isRegistered()) {
            $noAcl = $this->getNoAcl($module);
            $module = $noAcl['module'];
            $controller = $noAcl['controller'];
            $action = $noAcl['action'];
        } else {
            $noAuth = $this->getNoAuth($module);
            $module = $noAuth['module'];
            $controller = $noAuth['controller'];
            $action = $noAuth['action'];
        }

        if (self::$_redirectCounter++ >= self::REDIRECT_COUNTER_THRESHOLD) {
            throw new RuntimeException('Infinite authentication loop');
        }

        $request
            ->setModuleName($module)
            ->setControllerName($controller)
            ->setActionName($action)
            ->setDispatched(false);
    }

    protected function _getAcl() {
        if ($this->_acl instanceof Zend_Acl) {
            return $this->_acl;
        }
        $front = Zend_Controller_Front::getInstance();
        /** @var $bootstrap Zend_Application_Bootstrap_Bootstrap */
        if (($bootstrap = $front->getParam('bootstrap')) && $bootstrap->hasResource('acl')) {
            return $bootstrap->getResource('acl');
        }
        if (Zend_Registry::isRegistered('acl')) {
            return Zend_Registry::get('acl');
        }
        include APPLICATION_PATH . '/configs/acl.php';
        if (!isset($acl) || !($acl instanceof Zend_Acl)) {
            throw new RuntimeException('Can not load ACL object.');
        }
        Zend_Registry::set('acl', $acl);
        return $acl;
    }

    /**
     * @param $noAuth
     * @param null $module
     * @return Plugin_Acl
     */
    public function setNoAuth($noAuth, $module = null)
    {
        if ($module !== null) {
            $this->_noAuth[$module] = $noAuth;
        } else {
            $this->_noAuth['*'] = $noAuth;
        }
        return $this;
    }

    /**
     * @param null $module
     * @return array
     */
    public function getNoAuth($module = null)
    {
        return ($module !== null && array_key_exists($module, $this->_noAuth)) ?
            $this->_noAuth[$module] :
            $this->_noAuth['*'];
    }

    /**
     * @param $noAcl
     * @param null $module
     * @return Plugin_Acl
     */
    public function setNoAcl($noAcl, $module = null)
    {
        if ($module !== null) {
            $this->_noAcl[$module] = $noAcl;
        } else {
            $this->_noAcl['*'] = $noAcl;
        }
        return $this;
    }

    /**
     * @param null $module
     * @return array
     */
    public function getNoAcl($module = null)
    {
        return ($module !== null && array_key_exists($module, $this->_noAcl)) ?
            $this->_noAcl[$module] :
            $this->_noAcl['*'];
    }

}