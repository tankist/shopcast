<?php
/**
 * @property Zend_Form_Element_Text $domain
 * @property Zend_Form_Element_Password $password
 * @property Zend_Form_Element_Checkbox $is_remember
 * @property Zend_Form_Element_Hidden $referer
 * @property Zend_Form_Element_Button $login
 */
class Store_Form_Login extends Zend_Form
{

    public function init()
    {
        $domain = new Zend_Form_Element_Text('domain');
        $domain->setRequired(true);
        $domain->setLabel('Store:');

        $password = new Zend_Form_Element_Password('password');
        $password->setLabel('Password:');
        $password->setRequired(true);

        $remember = new Zend_Form_Element_Checkbox('is_remember');
        $remember->setLabel('Remember me');

        $referer = new Zend_Form_Element_Hidden('referer');

        $this->addElements(array($domain, $password, $remember, $referer));
    }

    public function prepareDecorators()
    {
        $this->setElementDecorators(array('ViewHelper'));
        $this->setDecorators(array(
            new Zend_Form_Decorator_ViewScript(array('viewScript' => 'forms/login.phtml')), 'FormErrors', 'Form'
        ));
        return $this;
    }

}