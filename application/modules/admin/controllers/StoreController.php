<?php

use Entities\Store;

class Admin_StoreController extends Zend_Controller_Action
{

    public $ajaxable = array(
        'login' => array('json'),
        'forget' => array('json'),
        'delete-category' => array('json'),
        'save-category' => array('json'),
        'categories-position-update' => array('json'),
    );

    public $contexts = array(
        'delete-profile-image' => array('json'),
        'add-profile-image' => array('json'),
        'save-profile' => array('json'),
    );

    /**
     * @var Store
     */
    protected $_store;

    /**
     * @var Service_Store
     */
    protected $_service;

    public function init()
    {
        $this->_store = $this->_helper->Store();
        $this->_service = new Service_Store($this->_helper->Em());
    }

    public function indexAction()
    {
        // action body
    }

    public function editAction()
    {
        // action body
    }

    public function saveAction()
    {
        // action body
    }

    protected function _getImagesDefaultPath($store_id)
    {
        if ($store_id) {
            $path = 'uploads/stores/' . $store_id;
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            return $path;
        } else {
            $path = 'uploads/temp/stores/';
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }

            return $path;
        }
    }
}