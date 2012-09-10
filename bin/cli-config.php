<?php

// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/library'),
    get_include_path(),
)));

$frontend = 'Core';
$backend = 'File';
$cacheFrontendOptions = array(
   'lifetime' => 7200,
   'automatic_serialization' => true
);
$cacheBackendOptions = array(
    'cache_dir' => APPLICATION_PATH . '/../cache'
);
if (in_array(APPLICATION_ENV, array('production', 'staging'))) {
    $cacheBackendOptions = array();
    $backend = 'Memcache';
}

$applicationConfigCache = Zend_Cache::factory(
    $frontend,
    $backend,
    $cacheFrontendOptions,
    $cacheBackendOptions
);

require 'Sch/Application.php';

// Create application, bootstrap, and run
$application = new Sch_Application(
    APPLICATION_ENV,
    array(
        'config' => array(
            APPLICATION_PATH . '/configs/application.yaml',
            APPLICATION_PATH . '/configs/doctrine.yaml'
        )
    ),
    $applicationConfigCache
);

// Bootstrapping resources
$application->bootstrap();

/**
 * Retrieve Doctrine Container resource
 * @var \Bisna\Doctrine\Container $container
 */
$container = $application->getBootstrap()->getResource('doctrine');

try {
    // Bootstrapping Console HelperSet
    $helperSet = array();

    if (($dbal = $container->getConnection(getenv('CONN') ? : $container->defaultConnection)) !== null) {
        $helperSet['db'] = new \Doctrine\DBAL\Tools\Console\Helper\ConnectionHelper($dbal);
    }

    if (($em = $container->getEntityManager(getenv('EM') ? : $container->defaultEntityManager)) !== null) {
        $helperSet['em'] = new \Doctrine\ORM\Tools\Console\Helper\EntityManagerHelper($em);
    }

    $helperSet['dialog'] = new \Symfony\Component\Console\Helper\DialogHelper();

} catch (\Exception $e) {
    
}

$realHelperSet = new \Symfony\Component\Console\Helper\HelperSet($helperSet);