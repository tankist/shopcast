<?php

class Backend_DashController extends Zend_Controller_Action
{

    public $ajaxable = array(
        'index' => array('json'),
        'orders' => array('json'),
        'inventory' => array('json'),
    );

    /**
     * @var \Entities\User;
     */
    protected $_user;

    /**
     * @var Service_User
     */
    protected $_service;

    public function init()
    {
        $this->_service = new Service_User($this->_helper->Em());
        $this->_user = $this->_helper->User();
    }

    public function preDispatch()
    {
        $this->_helper->Navigator();
        $this->view->me = $this->_user;
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

        $paginator = $this->_user->getOrdersStatusPaginator($status);
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
        $inventory = $this->_user->getInventoryPaginator();
        $inventory->setCurrentPageNumber($page)->setItemCountPerPage($limit);
        $this->view->products = $inventory->getCurrentItems()->toArray();
        $this->view->totalRecords = $inventory->getTotalItemCount();
    }
}