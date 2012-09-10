<?php
$time = microtime(true);
// Define path to application directory
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define application environment
defined('APPLICATION_ENV')
    || define('APPLICATION_ENV', (getenv('APPLICATION_ENV') ? getenv('APPLICATION_ENV') : 'development'));

// Ensure library/ is on include_path
set_include_path(implode(PATH_SEPARATOR, array(
    realpath(APPLICATION_PATH . '/../library'),
    get_include_path(),
)));

// Activate PSR-0 Autoloading; pseudo-namespaces defined in application.yaml
include "Zend/Loader/Autoloader.php";
Zend_Loader_Autoloader::getInstance();

// Making XDebug more chatty in Development Environment
if (APPLICATION_ENV == 'development')
{
    ini_set('xdebug.collect_vars', 'on');
    ini_set('xdebug.collect_params', '4');
    ini_set('xdebug.dump_globals', 'on');
    ini_set('xdebug.dump.SERVER', 'REQUEST_URI');
    ini_set('xdebug.show_local_vars', 'on');
}

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
    $backend = 'Memcached';
}

$applicationConfigCache = Zend_Cache::factory(
    $frontend,
    $backend,
    $cacheFrontendOptions,
    $cacheBackendOptions
);

require 'Skaya/Application.php';

// Create application, bootstrap, and run
$application = new Skaya_Application(
    APPLICATION_ENV,
    array(
        'config' => array(
            APPLICATION_PATH . '/configs/application.ini',
            APPLICATION_PATH . '/configs/doctrine.yml'
        )
    ),
    $applicationConfigCache
);

$application->bootstrap()
    ->run();

error_log(sprintf('Query string: %s%sResponse time: %s sec.%sQuery time: %s%s',
    $_SERVER['REQUEST_URI'], PHP_EOL,
    round(microtime(true) - $time, 3), PHP_EOL,
    date('H:i:s'), PHP_EOL), 3, APPLICATION_PATH . '/../logs/total-' . date('Y-m-d') . '.log');