<?php

class Helper_Gedmo extends Zend_Controller_Action_Helper_Abstract
{

    /** @var \Gedmo\Translatable\TranslationListener */
    protected $_translatable;

    /** @var \Gedmo\Tree\TreeListener */
    protected $_tree;

    /** @var Zend_Application_Bootstrap_Bootstrap */
    protected $_bootstrap;

    protected function _initGedmo() {
        $gedmo = $this->_getBootstrap()->getResource('Gedmo');
        if (is_array($gedmo) && array_key_exists('tree', $gedmo)) {
            $this->_tree = $gedmo['tree'];
        }
        if (is_array($gedmo) && array_key_exists('translatable', $gedmo)) {
            $this->_translatable = $gedmo['translatable'];
        }
    }

    /**
     * @return \Zend_Application_Bootstrap_Bootstrap
     */
    protected function _getBootstrap()
    {
        if (!$this->_bootstrap) {
            $this->_bootstrap = $this->getFrontController()->getParam('bootstrap');
        }
        return $this->_bootstrap;
    }

    /**
     * @return \Gedmo\Translatable\TranslationListener
     */
    public function getTranslatable()
    {
        if (!$this->_translatable) {
            $this->_initGedmo();
        }
        return $this->_translatable;
    }

    /**
     * @return \Gedmo\Tree\TreeListener
     */
    public function getTree()
    {
        if (!$this->_tree) {
            $this->_initGedmo();
        }
        return $this->_tree;
    }

}
