<?php

namespace Proxies\Entities\__CG__\Entities;

/**
 * THIS CLASS WAS GENERATED BY THE DOCTRINE ORM. DO NOT EDIT THIS FILE.
 */
class Product extends \Entities\Product implements \Doctrine\ORM\Proxy\Proxy
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

    public function addCategory(\Entities\Category $category)
    {
        $this->__load();
        return parent::addCategory($category);
    }

    public function getCategories()
    {
        $this->__load();
        return parent::getCategories();
    }

    public function getCreated()
    {
        $this->__load();
        return parent::getCreated();
    }

    public function setBuyCount($buyCount)
    {
        $this->__load();
        return parent::setBuyCount($buyCount);
    }

    public function getBuyCount()
    {
        $this->__load();
        return parent::getBuyCount();
    }

    public function setDescription($description)
    {
        $this->__load();
        return parent::setDescription($description);
    }

    public function getDescription()
    {
        $this->__load();
        return parent::getDescription();
    }

    public function setDisplayOrder($displayOrder)
    {
        $this->__load();
        return parent::setDisplayOrder($displayOrder);
    }

    public function getDisplayOrder()
    {
        $this->__load();
        return parent::getDisplayOrder();
    }

    public function setName($name)
    {
        $this->__load();
        return parent::setName($name);
    }

    public function getName()
    {
        $this->__load();
        return parent::getName();
    }

    public function setPrice($price)
    {
        $this->__load();
        return parent::setPrice($price);
    }

    public function getPrice()
    {
        $this->__load();
        return parent::getPrice();
    }

    public function setQuantity($quantity)
    {
        $this->__load();
        return parent::setQuantity($quantity);
    }

    public function getQuantity()
    {
        $this->__load();
        return parent::getQuantity();
    }

    public function setSale($sale)
    {
        $this->__load();
        return parent::setSale($sale);
    }

    public function getSale()
    {
        $this->__load();
        return parent::getSale();
    }

    public function setShippingType($shippingType)
    {
        $this->__load();
        return parent::setShippingType($shippingType);
    }

    public function getShippingType()
    {
        $this->__load();
        return parent::getShippingType();
    }

    public function setShippingValues($shippingValues)
    {
        $this->__load();
        return parent::setShippingValues($shippingValues);
    }

    public function getShippingValues()
    {
        $this->__load();
        return parent::getShippingValues();
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

    public function setThumbnail($thumbnail)
    {
        $this->__load();
        return parent::setThumbnail($thumbnail);
    }

    public function getThumbnail()
    {
        $this->__load();
        return parent::getThumbnail();
    }

    public function setType($type)
    {
        $this->__load();
        return parent::setType($type);
    }

    public function getType()
    {
        $this->__load();
        return parent::getType();
    }

    public function setUseTag($useTag)
    {
        $this->__load();
        return parent::setUseTag($useTag);
    }

    public function getUseTag()
    {
        $this->__load();
        return parent::getUseTag();
    }


    public function __sleep()
    {
        return array('__isInitialized__', 'id', 'name', 'description', 'displayOrder', 'status', 'quantity', 'price', 'sale', 'useTag', 'shippingType', 'shippingValues', 'type', 'created', 'buyCount', 'categories', 'thumbnail', 'store');
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