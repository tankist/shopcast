<?php

/**
 * @class Backend_Helper_Navigator
 */
class Backend_Helper_Navigator extends Helper_AbstractNavigation
{

    /**
     * @var Zend_Navigation_Container
     */
    protected $_profile;

    /**
     * @return Zend_Navigation_Container
     */
    public function getNavigation()
    {
        if (!$this->_navigation) {
            $this->_navigation = new Zend_Navigation(array(

                    array(
                        'type'       => 'mvc',
                        'controller' => 'dash',
                        'label'      => 'Dash',
                    ),

                    array(
                        'type'       => 'mvc',
                        'controller' => 'products',
                        'label'      => 'Products',
                    ),

                    array(
                        'type'       => 'mvc',
                        'controller' => 'orders',
                        'label'      => 'Orders',
                    ),

                    array(
                        'type'       => 'mvc',
                        'controller' => 'design',
                        'label'      => 'Design',
                    ),

                )
            );
        }
        return $this->_navigation;
    }

    /**
     * @return Zend_Navigation_Container
     */
    public function direct()
    {
        $navigation = parent::direct();
        Zend_Layout::getMvcInstance()->assign(array(
            'navigation' => $navigation,
            'nav-dropdown' => $this->getProfile()
        ));
        return $navigation;
    }

    /**
     * @return \Zend_Navigation_Container
     */
    public function getProfile()
    {
        if (!$this->_profile) {
            $this->_profile = new Zend_Navigation(array(
                array(
                    'type'       => 'mvc',
                    'module'     => 'store',
                    'controller' => 'profile',
                    'action'     => 'edit',
                    'label'      => 'Edit Profile'
                ),

                array(
                    'type'       => 'mvc',
                    'module'     => 'store',
                    'controller' => 'auth',
                    'action'     => 'logout',
                    'label'      => 'Logout'
                )
            ));
        }
        return $this->_profile;
    }

}
