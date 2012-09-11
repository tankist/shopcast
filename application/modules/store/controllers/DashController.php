<?php

class Store_DashController extends Zend_Controller_Action
{

    public $ajaxable = array(
        'index' => array('json'),
        'orders' => array('json'),
        'inventory' => array('json'),
    );

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

    public function preDispatch()
    {
        $this->_helper->Navigator();
        $this->view->store = $this->_store;
    }

    public function indexAction()
    {
        $this->view->getHelper('HeadScript')
            ->appendFile('/js/sellcast/store/Paginated.js')
            ->appendFile('/js/sellcast/admin/dash.js');
    }

    public function ordersAction()
    {
        $request = $this->getRequest();
        $page = $request->getParam('page', 0);
        $limit = $request->getParam('ipp', 10);
        $criteria = $request->getParam('criteria');
        $status = null;

        if (!empty($criteria['status'])) {
            $status = $criteria['status'];
        }

        $paginator = $this->_store->getOrdersStatusPaginator($status);
        $paginator->setCurrentPageNumber($page)->setItemCountPerPage($limit);

        $orderData = array();
        foreach ($paginator->getCurrentItems() as /** @var Model_Order **/
                 $order) {
            $orderData = array(
                'who' => $order->shippingInfo['firstName'] . ' ' . $order->shippingInfo['lastName'],
                'date' => $order->date_purchased,
                'status' => $order->status,
                'order_id' => $order->id
            );
            $ordersData[] = $orderData;
        }

        $this->view->orders = $ordersData;
        $this->view->totalRecords = $paginator->getTotalItemCount();
    }

    public function inventoryAction()
    {
        $request = $this->getRequest();
        $page = $request->getParam('page', 0);
        $limit = $request->getParam('ipp', 10);
        $criteria = $request->getParam('criteria');
        $inventory = $this->_store->getInventoryPaginator();
        $inventory->setCurrentPageNumber($page)->setItemCountPerPage($limit);
        $this->view->products = $inventory->getCurrentItems()->toArray();
        $this->view->totalRecords = $inventory->getTotalItemCount();
    }
}