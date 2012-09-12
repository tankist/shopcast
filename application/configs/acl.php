<?php

class Acl {
    const GUEST = 0;

    const STORE = 5;

    const PREMIUM_STORE = 10;

    const ADMIN = 100;
}

$acl = new Zend_Acl();

// Roles

$acl->addRole(new Zend_Acl_Role(Acl::GUEST));
$acl->addRole(new Zend_Acl_Role(Acl::STORE), Acl::GUEST);
$acl->addRole(new Zend_Acl_Role(Acl::PREMIUM_STORE), Acl::STORE);
$acl->addRole(new Zend_Acl_Role(Acl::ADMIN), Acl::PREMIUM_STORE);

/**
 * Базовые ресурсы
 */
$acl->addResource(new Zend_Acl_Resource('index'));
$acl->addResource(new Zend_Acl_Resource('error'), 'index');
$acl->addResource(new Zend_Acl_Resource('default'), 'index');
$acl->addResource(new Zend_Acl_Resource('frontend'), 'index');
$acl->addResource(new Zend_Acl_Resource('backend'));
$acl->addResource(new Zend_Acl_Resource('backend.auth'), 'index');
$acl->addResource(new Zend_Acl_Resource('admin'));
$acl->addResource(new Zend_Acl_Resource('admin.auth'), 'index');

// Access rights

$acl->deny(Acl::GUEST, null);
$acl->allow(Acl::GUEST, 'index');

$acl->deny(null, 'backend');
$acl->allow(Acl::STORE, 'backend');

$acl->deny(null, 'admin');
$acl->allow(Acl::ADMIN);

return $acl;