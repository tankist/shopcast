<?php

class Helper_Store extends Zend_Controller_Action_Helper_Abstract
{

    /**
     * @var \Entities\Store
     */
    protected $_store;

    /**
     * @var stdClass
     */
    protected $_identity;

    public function getStore()
    {
        if (!$this->_store) {
            if (($this->_store = $this->getFrontController()->getParam('user'))) {
                return $this->_store;
            }
            $identity = Zend_Auth::getInstance()->getIdentity();
            if (!$this->_store or $identity != $this->_identity) {
                $this->_identity = $identity;
                /** @var $emHelper Helper_Em */
                if (!($emHelper = Zend_Controller_Action_HelperBroker::getStaticHelper('Em'))) {
                    throw new Zend_Controller_Action_Exception('Entity manager cannot be found');
                }
                $manager = new Service_Store($emHelper->getEntityManager());
                $store = is_string($identity) ? $manager->getByEmail($identity) : null;
                $this->_store = $store;
                if ($store) {
                    $store->setLastLoginDate(new DateTime());
                    $manager->save($store);
                }
                $this->getFrontController()->setParam('user', $this->_store);
            }
        }
        return $this->_store;
    }

    public function direct()
    {
        return $this->getStore();
    }

}
