<?php

namespace Proxies\Entities\__CG__\Entities;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class Order extends \Entities\Order implements \Doctrine\ORM\Proxy\Proxy
{
    private $_entityPersister;
    private $_identifier;
    public $__isInitialized__ = false;
    public function __construct($entityPersister, $identifier)
    {
        $this->_entityPersister = $entityPersister;
        $this->_identifier = $identifier;
    }
    /** @private */
    public function __load()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;

            if (method_exists($this, "__wakeup")) {
                // call this after __isInitialized__to avoid infinite recursion
                // but before loading to emulate what ClassMetadata::newInstance()
                // provides.
                $this->__wakeup();
            }

            if ($this->_entityPersister->load($this->_identifier, $this) === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            unset($this->_entityPersister, $this->_identifier);
        }
    }

    /** @private */
    public function __isInitialized()
    {
        return $this->__isInitialized__;
    }

    
    public function getId()
    {
        if ($this->__isInitialized__ === false) {
            return (int) $this->_identifier["id"];
        }
        $this->__load();
        return parent::getId();
    }

    public function getCreated()
    {
        $this->__load();
        return parent::getCreated();
    }

    public function setFactorIncome($factorIncome)
    {
        $this->__load();
        return parent::setFactorIncome($factorIncome);
    }

    public function getFactorIncome()
    {
        $this->__load();
        return parent::getFactorIncome();
    }

    public function setIncomePrice($incomePrice)
    {
        $this->__load();
        return parent::setIncomePrice($incomePrice);
    }

    public function getIncomePrice()
    {
        $this->__load();
        return parent::getIncomePrice();
    }

    public function setLastModified($lastModified)
    {
        $this->__load();
        return parent::setLastModified($lastModified);
    }

    public function getLastModified()
    {
        $this->__load();
        return parent::getLastModified();
    }

    public function setProducts($products)
    {
        $this->__load();
        return parent::setProducts($products);
    }

    public function getProducts()
    {
        $this->__load();
        return parent::getProducts();
    }

    public function setProductsPrice($productsPrice)
    {
        $this->__load();
        return parent::setProductsPrice($productsPrice);
    }

    public function getProductsPrice()
    {
        $this->__load();
        return parent::getProductsPrice();
    }

    public function setShippingInfo($shippingInfo)
    {
        $this->__load();
        return parent::setShippingInfo($shippingInfo);
    }

    public function getShippingInfo()
    {
        $this->__load();
        return parent::getShippingInfo();
    }

    public function setShippingPrice($shippingPrice)
    {
        $this->__load();
        return parent::setShippingPrice($shippingPrice);
    }

    public function getShippingPrice()
    {
        $this->__load();
        return parent::getShippingPrice();
    }

    public function setStatus($status)
    {
        $this->__load();
        return parent::setStatus($status);
    }

    public function getStatus()
    {
        $this->__load();
        return parent::getStatus();
    }

    public function setStore($store)
    {
        $this->__load();
        return parent::setStore($store);
    }

    public function getStore()
    {
        $this->__load();
        return parent::getStore();
    }

    public function setTransactionId($transactionId)
    {
        $this->__load();
        return parent::setTransactionId($transactionId);
    }

    public function getTransactionId()
    {
        $this->__load();
        return parent::getTransactionId();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'id', 'status', 'productsPrice', 'shippingPrice', 'incomePrice', 'factorIncome', 'shippingInfo', 'transactionId', 'lastModified', 'created', 'store', 'products');
    }

    public function __clone()
    {
        if (!$this->__isInitialized__ && $this->_entityPersister) {
            $this->__isInitialized__ = true;
            $class = $this->_entityPersister->getClassMetadata();
            $original = $this->_entityPersister->load($this->_identifier);
            if ($original === null) {
                throw new \Doctrine\ORM\EntityNotFoundException();
            }
            foreach ($class->reflFields AS $field => $reflProperty) {
                $reflProperty->setValue($this, $reflProperty->getValue($original));
            }
            unset($this->_entityPersister, $this->_identifier);
        }
        
    }
}