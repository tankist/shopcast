<?php

class Helper_User extends Zend_Controller_Action_Helper_Abstract
{

    /**
     * @var \Entities\User
     */
    protected $user;

    /**
     * @var stdClass
     */
    protected $_identity;

    public function getUser()
    {
        if (!$this->user) {
            if (($this->user = $this->getFrontController()->getParam('user'))) {
                return $this->user;
            }
            $identity = Zend_Auth::getInstance()->getIdentity();
            if (!$this->user or $identity != $this->_identity) {
                $this->_identity = $identity;
                /** @var $emHelper Helper_Em */
                if (!($emHelper = Zend_Controller_Action_HelperBroker::getStaticHelper('Em'))) {
                    throw new Zend_Controller_Action_Exception('Entity manager cannot be found');
                }
                $manager = new Service_User($emHelper->getEntityManager());
                $this->user = is_string($identity) ? $manager->getByEmail($identity) : null;
                $this->getFrontController()->setParam('user', $this->user);
            }
        }
        return $this->user;
    }

    public function direct()
    {
        return $this->getUser();
    }

}
