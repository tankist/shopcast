<?php
class AbstractController extends Zend_Controller_Action
{

    /**
     * @var Model_Store
     */
    protected $_store = null;

    protected $_design = null;

    protected $_domain = '';

    /**
     * @var Zend_Controller_Action_Helper_ContextSwitch
     */
    protected $_contextSwitch = null;

    /**
     * @var Zend_Controller_Action_Helper_AjaxContext
     */
    protected $_ajaxContextSwitch = null;

    public function init()
    {
        $this->_contextSwitch = $this->_helper->getHelper('contextSwitch');
        $this->_ajaxContextSwitch = $this->_helper->getHelper('AjaxContext');
        $this->_contextSwitch->initContext();
        $this->_ajaxContextSwitch->initContext('json');
        $this->_flashMessenger = $this->_helper->getHelper('FlashMessenger');
    }

    public function preDispatch()
    {
        $request = $this->getRequest();
        $this->_domain = $request->getParam('domain');
        $this->_store = Model_Sellcast::getStoreByDomain($this->_domain);
        $this->_design = $this->_store->getDesign();
        if ($this->getRequest()->isXmlHttpRequest()) {
            Zend_Layout::getMvcInstance()->disableLayout();
        } else {
            $this->_shoppingCart = new Model_ShoppingCart();
            $this->_helper->layout()->setLayout($this->_design['layout']['layoutType']);

            $this->view->assign(array(
                'store_name' => $this->_store->company_name,
                'categories' => $this->_store->getCategories(),
                'contentTitle' => 'Welcome',
                'title' => $this->_store->company_name . ' Welcome',
                'count' => $this->_shoppingCart->getProductsCount(),
                'totalPrice' => $this->_shoppingCart->getTotalPrice()
            ));
        }
    }

    protected function _setDataToSession($key, $data = null)
    {
        $modulesResource = $this->getInvokeArg('bootstrap')->modules;
        $session = $modulesResource[$this->getRequest()->getModuleName()]->sessionnamespace;
        $sessionData = $session->$key;
        $sessionData = $data;
        $session->$key = $sessionData;
        return true;
    }

    protected function _getDataFromSession($key)
    {
        $modulesResource = $this->getInvokeArg('bootstrap')->modules;
        $session = $modulesResource[$this->getRequest()->getModuleName()]->sessionnamespace;
        $data = $session->$key;
        return $data;
    }

    protected function _getImagesDefaultPath($product_id = null)
    {
        if ($product_id) {
            $path = 'uploads/stores/' . $this->_store->id . '/products/' . $product_id;
            if (!is_dir($path)) {
                mkdir($path, 0777, true);
            }
            return $path;
        } else {
            $filter = new Skaya_Filter_File_Rename(array());
            do {
                $tmp_path = $filter->getId();
                $path = 'uploads/temp/stores/' . $this->_store->id . '/' . $tmp_path;
            } while (is_dir($path));

            mkdir($path, 0777, true);

            return $path;
        }
    }

    protected function _setFlashMessangerValue($key, $arr, $form)
    {
        if ($form->$key instanceof Zend_Form) {
            foreach ($arr as $field => $error) {
                $this->_setFlashMessangerValue($field, $error, $form->$key);
            }
        } else {

            $label = $form->$key->getLabel();
            foreach ($arr as $key => $value) {
                $this->_flashMessenger->addMessage(array('message' => $label . ': ' . $value, 'status' => 'fail'));
            }
        }
    }
}


