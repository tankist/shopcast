<?php

class Plugin_Acl extends Zend_Controller_Plugin_Abstract
{

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

    /**
     * @var string
     */
    protected $_aclRoute = '%s.%s';

    /**
     * @var \Entities\User
     */
    protected $_user;

    /**
     * Location to go to if the user isn't authenticated
     * @var array
     */
    protected $_noAuth = array(
        '*' => array(
            'module' => 'backend',
            'controller' => 'auth',
            'action' => 'login'
        ),
        'backend' => array(
            'module' => 'backend',
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
     * @return Entities\User
     */
    public function getUser()
    {
        if (!$this->_user) {
            $this->_user = Zend_Controller_Action_HelperBroker::getStaticHelper('User')->getUser();
            Zend_Controller_Front::getInstance()->setParam('user', $this->_user);
        }
        return $this->_user;
    }

    /**
     * @return bool
     */
    public function isRegistered()
    {
        return (null != $this->getUser());
    }

    /**
     * @return int
     */
    public function getRole()
    {
        if ($user = $this->getUser()) {
            return $user->getRole();
        }
        return $this->_defaultRole;
    }

    /**
     * @param null $resource
     * @param null $privelege
     * @return bool
     */
    public function isAllowed($resource = null, $privelege = null)
    {
        return $this->_acl->isAllowed($this->getRole(), $resource, $privelege);
    }

    /**
     * @param Zend_Controller_Request_Abstract $request
     * @throws RuntimeException
     */
    public function preDispatch(Zend_Controller_Request_Abstract $request)
    {
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

    /**
     * @return mixed|null|Zend_Acl
     * @throws RuntimeException
     */
    protected function _getAcl()
    {
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