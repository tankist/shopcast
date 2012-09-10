<?php

class Store_OrderController extends Zend_Controller_Action
{

    public function init()
    {
        parent::init();
    }

    public function indexAction()
    {
        $this->_forward('shipping');
    }

    public function payAction()
    {
        // action body
    }

    public function totalAction()
    {
        // action body
    }

    public function shippingAction()
    {
        // action body
    }

    public function billingAction()
    {
        // action body
    }


}









