<?php
/**
* @property int id
* @property string domain
* @property string passwd
* @property string company_name
* @property string owner_name
* @property string email
* @property int timezone
* @property int is_daylight_time
* @property float timezone_offset
* @property string descr
* @property string logo_ext
* @property int community_id
* @property string type
* @property string reg_date
* @property int is_order_inform
* @property string order_email
* @property string iframe_url
* @property float purchase_percentage
* @property float purchase_fee
* @property string payout_type
* @property string payout_info
* @property string policy
* @property string state
* @property int vote_count
* @property int vote_sum
* @property int login_count
* @property string last_login_date
* @property int partner_id
*/
class Model_Store extends Model_Abstract implements Model_Interface, Zend_Auth_Adapter_Interface {
	
	const STORE_STATE_ACTIVE = 'active';
	const STORE_STATE_DEACTIVE = 'deactive';
	
	const STORE_ROLE_GUEST = 'guest';
	const STORE_ROLE_STORE = 'store';
	const STORE_ROLE_ADMIN = 'admin';
	
	const STORE_DESIGN_SECTION_ELEMENTS = 'elements';
	const STORE_DESIGN_SECTION_LAYOUT = 'layout';
	
	protected $_modelName = 'store';
	
	protected $_mapperType = 'db';
	static $thumbnailPack = array('small'=>array(
									'width'=>100,
									'height'=>100,
									'indication_type'=>'suffix',
									'indication'=>'s'
								),
								'middle'=>array(
									'width'=>300,
									'height'=>200,
									'indication_type'=>'suffix',
									'indication'=>'m'
								)
							);
	
	protected $_isDesignChanged = false;
	
	
	public function getRole() {
		if (empty($this->_data['role'])) {
			$this->_data['role'] = self::STORE_ROLE_GUEST;
		}
		return $this->_data['role'];
	}
	
	/**
	* Adds product to the store
	* 
	* @param Model_Product $product
	* @return Model_Store
	*/
	public function addProduct(Model_Product $product) {
		$product->store_id = (int)$this->id;
		return $product->save();
	}
	
	/**
	* Saves current store state to the storage using mapper
	* 
	* @return Model_Store
	* @throws Model_Exception
	*/
	public function save() {
		if ( $this->_isDesignChanged ) {
			$mapper = $this->getMapper($this->_mapperType, 'StoreDesign');
			$mapper->save($this->toArray());
		}
		return parent::save();
	}
	
	/**
	* Returns product from current store by its ID.
	* 
	* @param mixed $product_id
	* @return Model_Product
	* @throws Model_Exception
	*/
	public function getProductById($product_id) {
		$productBlob = $this->_getProductMapper()->getProductById($product_id);
		if (empty($productBlob) || $productBlob['store_id'] != $this->id) {
			throw new Model_Exception('Product with id #'.$product_id.' was not found in this store');
		}
		$product = new Model_Product($productBlob);
		return $product;
	}
	
	/**
	* Return collection of all store products
	* 
	* @return Model_Collection_Products
	* @throws Model_Exception
	*/
	public function getProducts() {
		$productsBlob = $this->_getProductMapper()->getProductsByStoreId($this->id);
		$products = new Model_Collection_Products($productsBlob);
		return $products;
	}
	
	/**
	* Return all count of products from the store
	* 
	* @return int
	* @throws Model_Exception
	*/
	public function getProductsCount() {
		return $this->_getProductMapper()->getProductsCountByStoreId($this->id);
	}
	
	/**
	* Return paginator for store products
	* 
	* @return Skaya_Paginator
	*/
	public function getProductsPaginator() {
		$paginator = $this->_getProductMapper()->getProductsPaginatorByStoreId($this->id);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Products'));
		return $paginator;
	}
	
	/**
	* Returns all products with options for the current store
	* 
	* @return Model_Collection_Inventory
	* @throws Model_Exception
	*/
	public function getInventory() {
		$inventoryBlob = $this->_getInventoryMapper()->getStoreInventory($this->id);
		$inventory = new Model_Collection_Inventory($inventoryBlob);
		return $inventory;
	}
	
	/**
	* Return paginator for store products inventory
	* 
	* @return Skaya_Paginator
	* @throws Model_Exception
	*/
	public function getInventoryPaginator() {
		$paginator = $this->_getInventoryMapper()->getStoreInventoryPaginator($this->id);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Inventory'));
		return $paginator;
	}
	
	/**
	* Return all products from the store with given status
	* 
	* @param string $status
	* @return Model_Collection_Products
	* @throws Model_Exception
	*/
	public function getProductsByStatus($status) {
		if (empty($status)) {
			throw new Model_Exception('Status must be set to non-empty string');
		}
		$productsBlob = $this->_getProductMapper()->getProductsByStoreIdAndStatus($this->id, $status);
		$products = new Model_Collection_Products($productsBlob);
		return $products;
	}
	
	/**
	* Return all count of products from the store with given status
	* 
	* @param string $status
	* @return int
	* @throws Model_Exception
	*/
	public function getProductsCountByStatus($status) {
		if (empty($status)) {
			throw new Model_Exception('Status must be set to non-empty string');
		}
		return $this->_getProductMapper()->getProductsCountByStoreIdAndStatus($this->id, $status);
	}
	
	/**
	* Adds order to the store
	* 
	* @param Model_Order $order
	* @return Model_Store
	*/
	public function addOrder(Model_Order $order) {
		$order->store_id = $this->id;
		$order->save();
		return $this;
	}
	
	public function authenticate() {
		$store = $this->getMapper()->getStoreByDomain($this->domain);
		if (is_array($store) && !empty($store) && $store['domain'] == $this->domain && $store['password'] == $this->password && $store['state'] == self::STORE_STATE_ACTIVE) {
			$store['role'] = 'store';
			$this->populate($store);
			unset($this->password);
			$result = new Zend_Auth_Result(Zend_Auth_Result::SUCCESS, $this);
		}
		else {
			$code = Zend_Auth_Result::FAILURE;
			if (!is_array($store) || empty($store) || $store['domain'] != $this->domain) $code = Zend_Auth_Result::FAILURE_IDENTITY_NOT_FOUND;
			if ($store['password'] != $this->password) $code = Zend_Auth_Result::FAILURE_CREDENTIAL_INVALID;
			$result = new Zend_Auth_Result($code, null, array('loginFailed' => 'Incorrect Store & Password'));
		}
		return $result;
	}
	
	public function getOrderById($order_id) {
		$orderBlob = $this->_getOrderMapper()->getOrderById($order_id);
		if (empty($orderBlob) || $orderBlob['store_id'] != $this->id) {
			throw new Model_Exception('Order with id #'.$order_id.' was not found in this store');
		}
		$order = new Model_Order($orderBlob);
		return $order;
	}
	
	public function getOrders() {
		$ordersBlob = $this->_getOrderMapper()->getStoreOrders($this->id);
		$orders = new Model_Collection_Orders($ordersBlob);
		return $orders;
	}
	
	public function getOrdersPaginator() {
		$paginator = $this->_getOrderMapper()->getStoreOrdersPaginator($this->id);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Orders'));
		return $paginator;
	}
	
	public function getOrdersStatusPaginator($status = null) {
		$paginator = $this->_getOrderMapper()->getStoreOrdersStatusPaginator($this->id, $status);
		$paginator->addFilter(new Skaya_Filter_Array_Collection('Model_Collection_Orders'));
		return $paginator;
	}
	
	public function getOrdersCount() {
		return $this->_getOrderMapper()->getStoreOrdersCount($this->id);
	}
	
	public function getCategories() {
		$categoriesBlob = $this->_getCategoryMapper()->getStoreCategories($this->id);
		$categories = new Model_Collection_Categories($categoriesBlob);
		return $categories;
	}
	
	public function getCategoryById($category_id) {
		$categoriesBlob = $this->_getCategoryMapper()->getStoreCategoryById($this->id, $category_id);
		$category = new Model_Category($categoriesBlob);
		return $category;
	}
	
	public function addCategory(Model_Category $category) {
		$category->store_id = $this->id;
		$category->save();
		return $this;
	}
	
	public function hasCategory(Model_Category $category) {
		$categoryMapper = $this->_getCategoryMapper();
		$categoryBlob = null;
		if (isset($category->id) && !empty($category->id)) {
			$categoryBlob = $categoryMapper->getStoreCategoryById($this->id, $category->id);
		}
		elseif (isset($category->name) && !empty($category->name)) {
			$categoryBlob = $categoryMapper->getStoreCategoryByName($this->id, $category->name);
		}
		return !empty($categoryBlob) && $categoryBlob['store_id'] == $this->id;
	}
	
	/**
	* Search products within the store
	* 
	* @param mixed $condition
	* @param mixed $order
	* @param mixed $limit
	* @param mixed $offset
	* @return Model_Collection_Stores
	*/
	public function searchProducts($condition, $order = null, $limit = null, $offset = null) {
		if (strpos($condition, 'products.store_id=') === false) {
			$condition.=('&products.store_id='.$this->id);
		}
		return Model_Sellcast::searchProducts($condition, $order, $limit, $offset);
	}
	
	/**
	* Search products within the store and return paginator object
	* 
	* @param mixed $condition
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public function searchProductsPaginator($condition, $order = null) {
		if (strpos($condition, 'products.store_id=') === false) {
			$condition.=('&products.store_id='.$this->id);
		}
		return Model_Sellcast::searchProductsPaginator($condition, $order);
	}
	
	/**
	* Search orders within the store
	* 
	* @param mixed $condition
	* @param mixed $order
	* @param mixed $limit
	* @param mixed $offset
	* @return Model_Collection_Orders
	*/
	public function searchOrders($condition, $order = null, $limit = null, $offset = null) {
		if (strpos($condition, 'orders.store_id=') === false) {
			$condition.=('&orders.store_id='.$this->id);
		}
		return Model_Sellcast::searchOrders($condition, $order, $limit, $offset);
	}
	
	/**
	* Search orders within the store and return paginator object
	* 
	* @param mixed $condition
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public function searchOrdersPaginator($condition, $order = null) {
		if (strpos($condition, 'orders.store_id=') === false) {
			$condition.=('&orders.store_id='.$this->id);
		}
		return Model_Sellcast::searchOrdersPaginator($condition, $order);
	}
	
	/**
	* @desc return Shopping cart object
	*/
	public function getShoppingCart() {
		$shoppingCart = Model_ShoppingCart::getInstance();
		$shoppingCart->store_id = $this->id;
		
		return $shoppingCart;
	}
	
	public function setElementVisibility($storeElementId, $visible) {
		$elements = $this->getDesign(self::STORE_DESIGN_SECTION_ELEMENTS);
		$elements[$storeElementId] = (boolean)$visible;
		return $this->setStoreDesign(self::STORE_DESIGN_SECTION_ELEMENTS, $elements);
	}
	
	public function getElementVisibility($storeElementId) {
		$elements = $this->getDesign(self::STORE_DESIGN_SECTION_ELEMENTS);
		return $elements[$storeElementId];
	}
	
	public function setProductsPerPage($productsPerPage) {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		$layout['productsPerPage'] = $productsPerPage;
		return $this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $layout);
	}
	
	public function getProductsPerPage() {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		return $layout['productsPerPage'];
	}
	
	public function setProductsOrder($productsOrder) {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		$layout['productsOrder'] = $productsOrder;
		return $this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $layout);
	}
	
	public function getProductsOrder() {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		return $layout['productsOrder'];
	}
	
	public function setEmbedWidth($embedWidth) {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		$layout['embedWidth'] = $embedWidth;
		return $this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $layout);
	}
	
	public function getEmbedWidth() {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		return $layout['embedWidth'];
	}
	
	public function setEmbedHeight($embedHeight) {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		$layout['embedHeight'] = $embedHeight;
		return $this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $layout);
	}
	
	public function getEmbedHeight() {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		return $layout['embedHeight'];
	}
	
	public function setLayoutType($layoutType) {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		$layout['layoutType'] = $layoutType;
		return $this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $layout);
	}
	
	public function getLayoutType() {
		$layout = $this->getDesign(self::STORE_DESIGN_SECTION_LAYOUT);
		return $layout['layoutType'];
	}
	
	public function getDesign($section = null, $force = true) {
		$sections = ($section !== null)
			?(array)$section
			:array(self::STORE_DESIGN_SECTION_ELEMENTS, self::STORE_DESIGN_SECTION_LAYOUT);
		
		$mapper = $this->getMapper($this->_mapperType, 'StoreDesign');
		if (in_array(self::STORE_DESIGN_SECTION_ELEMENTS, $sections)) {
			if ($force || !array_key_exists(self::STORE_DESIGN_SECTION_ELEMENTS, $this->_data['design'])) {
				$this->setDesign(self::STORE_DESIGN_SECTION_ELEMENTS, $mapper->getStoreElementsVisibility($this->id));
			}
		}
		if (in_array(self::STORE_DESIGN_SECTION_LAYOUT, $sections)) {
			if ($force || !array_key_exists(self::STORE_DESIGN_SECTION_LAYOUT, $this->_data['design'])) {
				$this->setDesign(self::STORE_DESIGN_SECTION_LAYOUT, $mapper->getStoreDesign($this->id));
			}
		}
		if ($section === null) {
			return $this->_data['design'];
		}
		if (array_key_exists($section, $this->_data['design'])) {
			return $this->_data['design'][$section];
		}
		return false;
	}
	
	public function setDesign($section = null, $data) {
		if ($section === null) {
			$this->_data['design'] = $data;
			$this->_isDesignChanged = true;
			return $this;
		}
		if (!in_array($section, array(self::STORE_DESIGN_SECTION_ELEMENTS, self::STORE_DESIGN_SECTION_LAYOUT))) {
			throw new Model_Exception('This design section is not available for writing or unknown');
		}
		if (!isset($this->_data['design'])) {
			$this->_data['design'] = array();
		}
		$this->_data['design'][$section] = $data;
		$this->_isDesignChanged = true;
		return $this;
	}
	
	/**
	* Returns mapper for Products
	* 
	* @return Model_Mapper_Db_Product
	*/
	protected function _getProductMapper() {
		return $this->getMapper($this->getMapperType(), 'Product');
	}
	
	/**
	* Returns mapper for Inventory
	* 
	* @return Model_Mapper_Db_Inventory
	*/
	protected function _getInventoryMapper() {
		return $this->getMapper($this->getMapperType(), 'Inventory');
	}
	
	/**
	* Returns mapper for Orders
	* 
	* @return Model_Mapper_Db_Order
	*/
	protected function _getOrderMapper() {
		return $this->getMapper($this->getMapperType(), 'Order');
	}
	
	/**
	* Returns mapper for Category
	* 
	* @return Model_Mapper_Db_Category
	*/
	protected function _getCategoryMapper() {
		return $this->getMapper($this->getMapperType(), 'Category');
	}
}