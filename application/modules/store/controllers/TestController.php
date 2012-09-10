<?php
class Store_TestController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {

    }

    public function storeAction()
    {
        $store_domain = $this->getRequest()->getParam('domain');
        $store_id = $this->getRequest()->getParam('id');
        if (!empty($store_domain)) {
            $store = Model_Sellcast::getStoreByDomain($store_domain);
        }
        if (!empty($store_id)) {
            $store = Model_Sellcast::getStoreById($store_id);
        }
        $this->view->store = $store;
        $this->view->store->products = $store->getProducts();


        //Vova
        $this->view->store->orders = $store->getOrders();
        if ($store->getOrdersCount() > 0) {
            $this->view->store->order = $store->getOrderById($this->view->store->orders[sizeof($this->view->store->orders) - 1]->id);
            $this->view->store->orderProducts = $this->view->store->order->getProducts();
        }

    }

    public function addProductAction()
    {
        $store_domain = $this->getRequest()->getParam('domain');
        if (!$store_domain) {
            throw new Model_Exception('Wrong store domain');
        }
        $store = Model_Sellcast::getStoreByDomain($store_domain);

        $form = new Admin_Form_Product(array(
            'name' => 'product',
            'action' => '/test/save-product'
        ));
        $form->getElement('store_id')->setValue($store->id);
        $this->view->form = $form;
    }

    public function saveProductAction()
    {
        $request = $this->getRequest();
        $form = new Admin_Form_Product(array(
            'name' => 'product',
            'action' => '/test/save-product'
        ));
        if ($request->isPost() && $form->isValid($request->getPost())) {
            $data = $form->getValues();
            if (!empty($data['id'])) {
                $product = Model_Sellcast::getProductById((int)$data['id']);
                $product->populate($data);
            }
            if (empty($data['id']) || !($product instanceOf Model_Product)) {
                unset($data['id']);
                $product = Model_Sellcast::createProduct($data);
            }
            $product->save();
        } else {
            return $this->_forward('add-product');
        }
        return $this->_forward('add-product');
    }

    public function editProductAction()
    {
        $request = $this->getRequest();
        if ($product_id = (int)$request->getParam('id')) {
            $form = new Admin_Form_Product(array(
                'name' => 'product',
                'action' => '/test/save-product'
            ));
            $product = Model_Sellcast::getProductById($product_id);
            if (!($product instanceOf Model_Product)) {
                return _forward('add-product');
            }
            $form->removeSubForm('price');
            $form->removeSubForm('shipping');
            $form->removeSubForm('options');
            $form->populate($product->toArray());
            $this->view->form = $form;
        } else {
            return _forward('add-product');
        }
    }

    public function productAction()
    {
        $request = $this->getRequest();
        if ($product_id = (int)$request->getParam('id')) {
            if ($store_domain = $request->getParam('domain')) {
                $store = Model_Sellcast::getStoreByDomain($store_domain);
                $this->view->product = $store->getProductById($product_id);
            } else {
                $this->view->product = Model_Sellcast::getProductById($product_id);
            }
        }
    }
}

