<?php

require_once("AbstractController.php");

class Admin_OrdersController extends Admin_AbstractController {
	
	public $ajaxable = array(
		'list' => array('json'),
		'details' => array('json'),
		'confirm-shipment' => array('json'),
		'delete' => array('json'),
		'paginated-list' => array('json'),
	);

	public function indexAction() {
		$this->view->getHelper('HeadScript')
			->appendFile('/js/sellcast/admin/orders.js');
			
		$orderShippingForm = new Admin_Form_OrderShipping(array(
			'name' => 'orderShipping',
			'action' => '/admin/orders/confirm-shipment',
			'shippingCompanies' => array(
				'none' => 'Manual shipping',
				'ups' => 'UPS',
				'fedex' => 'FedEx'
			)
		));
		
		$orderShippingForm->prepareDecorators();
		$this->view->orderShipping = $orderShippingForm;
	}
	
	public function confirmShipmentAction() {
		$request = $this->getRequest();
		$orderShippingForm = new Admin_Form_OrderShipping(array(
			'name' => 'orderShipping',
			'action' => '/admin/orders/confirm-shipment',
			'shippingCompanies' => array(
				'none' => 'Manual shipping',
				'ups' => 'UPS',
				'fedex' => 'FedEx'
			)
		));
		try {
			if ($request->isPost() && $orderShippingForm->isValid($request->getPost())) {
				$store = Model_Sellcast::getStoreById($this->_store->id);
				$order = $store->getOrderById($orderShippingForm->order_id->getValue());
				$order->setShippingInfo($orderShippingForm->getValues());
				$order->deliver()->save();
				
				$order->products = $order->getProducts();
				$order->orderPrice = $order->getOrderTotalPrice();
				$shippingInfo = $order->getShippingInfo(true);
				$orderData = $order->toArray();
				
				/**
				* Sending confirmation email
				*/
				$mailerView = new Zend_View();
				$mailerView->setEncoding('UTF-8');
				$currentViewScript = $this->view->getScriptPaths();
				if (count($currentViewScript) == 0) {
					throw new Zend_Controller_Action_Exception('View script directory is undefined');
				}
				$currentViewScript = current($currentViewScript);
				$mailerView->setScriptPath($currentViewScript);
				$mailerView->assign('order', $orderData)->assign('store', $store->toArray())->assign(array(
					'mailFrom' => 'orders@sellcast.com',
					'mailFromName' => $store->company_name
				));
				$mailer = new Zend_Mail('utf-8');
				$mailer->setFrom('orders@sellcast.com', $store->company_name);
				$mailer->addTo($shippingInfo['email'], join(' ', array($shippingInfo['firstName'], $shippingInfo['lastName'])));
				$mailer->setBodyHtml($mailerView->render('orders/email_confirm_shipping.phtml'));
				$mailer->setSubject('Shipment Confirmation Email');
				
				$mailer->send();
				$this->view->order = $orderData;
			}
			else {
				$this->view->error = join('<br />', $orderShippingForm->getMessages(null, true));
			}
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}
	
	public function deleteAction() {
		$request = $this->getRequest();
		$order_id = $request->getParam('order_id');
		
		try {
			$store = Model_Sellcast::getStoreById($this->_store->id);
			$order = $store->getOrderById($order_id);
			$order->cancel()->save();
			$this->view->order = $order->toArray();
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}
	
	public function convertAction() {
		$bootstrap = $this->getInvokeArg('bootstrap');
		/**
		* put your comment there...
		* 
		* @var Zend_Log
		*/
		$logger = $bootstrap->log;
		
		$mapping = array(
			'address_line1' => 'address1',
			'address_line2' => 'address2',
			'postal' => 'zip'
		);
		
		$storesTable = new Model_DbTable_Stores();
		$storesIds = $storesTable->fetchAll();
		foreach ($storesIds as $_row) {
			try {
				$store = Model_Sellcast::getStoreById($_row->id);
				$orders = $store->getOrders();
				foreach ($orders as /** @var Model_Order **/ $order) {
					$shipping_info = $order->shipping_info;
					foreach (array('custom', 'no', 'fedex', 'ups', 'none') as $company) {
						if (array_key_exists($company, $shipping_info)) {
							$shipping_info = $shipping_info[$company];
							break;
						}
					}
					foreach ($mapping as $key => $value) {
						if (array_key_exists($key, $shipping_info)) {
							$shipping_info[$value] = $shipping_info[$key];
							unset($shipping_info[$key]);
						}
					}
					if (!in_array($company, array('fedex', 'ups'))) {
						$company = 'none';
					}
					$shipping_info['shipping_company'] = $company;
					if (array_key_exists('full_name', $shipping_info)) {
						list($shipping_info['first_name'], $shipping_info['last_name']) = explode(' ', $shipping_info['full_name']);
						unset($shipping_info['full_name']);
					}
					$order->setShippingInfo($shipping_info);
				}
			}
			catch (Exception $e) {
				$logger->error($e->getMessage());
			}
		}
	}
	
	public function listAction() {
		$request = $this->getRequest();
		$store = Model_Sellcast::getStoreById($this->_store->id);
		$orders = $store->getOrders();
		$orderData = array();
		foreach ($orders as /** @var Model_Order **/$order) {
			$orderData = array(
				'date' => $order->date_purchased,
				'status' => $order->status,
				'order_id' => $order->id,
				'orderPrice' => $order->getOrderTotalPrice()
			);
			
			$shippingInfo = $order->shippingInfo;
			$customerName = 'Unknown';
			if (!empty($shippingInfo['firstName']) || !empty($shippingInfo['lastName'])) {
				$customerName = join(' ', array($shippingInfo['firstName'], $shippingInfo['lastName']));
			}
			$orderData['customer_name'] = $customerName;
			
			$ordersData[] = $orderData;
		}
		$this->view->orders = $ordersData;
	}
	
	public function paginatedListAction() {
		$request = $this->getRequest();
		$page = $request->getParam('page', 0);
		$limit = $request->getParam('ipp', 10);
		$criteria = $request->getParam('criteria');
		$status = null;
		
		if (!empty($criteria['status'])) {
			$status = $criteria['status'];
		}
		
		$store = Model_Sellcast::getStoreById($this->_store->id);
		$paginator = $store->getOrdersStatusPaginator($status);
		
		$paginator
			->setCurrentPageNumber($page)
			->setItemCountPerPage($limit);
		
		$orderData = array();
		foreach ($paginator->getCurrentItems() as /** @var Model_Order **/$order) {
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
	
	public function detailsAction() {
		$request = $this->getRequest();
		$order_id = $request->getParam('order_id');
		
		try {
			$store = Model_Sellcast::getStoreById($this->_store->id);
			$order = $store->getOrderById($order_id);
			$order->products = $order->getProducts();
			$order->orderPrice = $order->getOrderTotalPrice();
			$shippingInfo = $order->getShippingInfo();
			
			$this->view->order = $order->toArray();
		}
		catch (Exception $e) {
			$this->view->error = $e->getMessage();
		}
	}
}
