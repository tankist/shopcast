<?php
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap {

    protected function _initModule()
    {
        $loader = $this->getResourceLoader();

        $loader
            ->addResourceType('filter', 'filters', 'Filter')
            ->addResourceType('helper', 'helpers', 'Helper');

        return $loader;
    }

    protected function _initAcl()
    {
        return include APPLICATION_PATH . '/configs/acl.php';
    }

    public function _initAutoloaderNamespaces()
    {
        require_once 'Doctrine/Common/ClassLoader.php';

        $autoloader = \Zend_Loader_Autoloader::getInstance();

        $doctrineAutoloader = new \Doctrine\Common\ClassLoader('Doctrine');
        $autoloader->pushAutoloader(array($doctrineAutoloader, 'loadClass'), 'Doctrine');

        $symfonyAutoloader = new \Doctrine\Common\ClassLoader('Symfony');
        $autoloader->pushAutoloader(array($symfonyAutoloader, 'loadClass'), 'Symfony');

        $doctrineExtensionsAutoloader = new \Doctrine\Common\ClassLoader('DoctrineExtensions');
        $autoloader->pushAutoloader(array($doctrineExtensionsAutoloader, 'loadClass'), 'DoctrineExtensions');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Bisna');
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Bisna');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Wildkat');
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Wildkat');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Boilerplate');
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Boilerplate');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Gedmo');
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Gedmo');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Doctrine\DBAL\Migrations');
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Doctrine\DBAL\Migrations');

        $modelsPath = realpath(APPLICATION_PATH . '/models');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Documents', $modelsPath);
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Documents');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Entities', $modelsPath);
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Entities');

        $fmmAutoloader = new \Doctrine\Common\ClassLoader('Repository', $modelsPath);
        $autoloader->pushAutoloader(array($fmmAutoloader, 'loadClass'), 'Repository');
    }

    public function _initDoctrineTypes()
    {
        $this->bootstrap('doctrine');
        /** @var $doctrine \Bisna\Doctrine\Container */
        $doctrine = $this->getResource('doctrine');
        /** @var $platform \Doctrine\DBAL\Platforms\AbstractPlatform */
        $platform = $doctrine->getEntityManager()->getConnection()->getDatabasePlatform();
        $platform->registerDoctrineTypeMapping('enum', 'string');
        $platform->registerDoctrineTypeMapping('set', 'string');
        \Doctrine\DBAL\Types\Type::addType('enumtitle', 'Skaya\Doctrine\Type\EnumTitleType');
    }

    public function _initModuleLayout()
    {
        $this->bootstrap('frontController');
        /** @var $front Zend_Controller_Front */
        $front = $this->getResource('frontController');

        $front->registerPlugin(
            new Boilerplate_Controller_Plugin_ModuleLayout()
        );

        $front->setParam('prefixDefaultModule', true);
        $eh = new Zend_Controller_Plugin_ErrorHandler(array('module' => 'default'));
        $front->registerPlugin($eh);
    }

}