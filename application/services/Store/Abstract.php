<?php

use Entities\Store;

abstract class Service_Store_Abstract extends Skaya_Service_Abstract
{
    /**
     * @var Store
     */
    protected $_store;

    /**
     * @param Store $store
     * @return Service_Store_Product
     */
    public function setStore($store)
    {
        $this->_store = $store;
        return $this;
    }

    /**
     * @return Store
     */
    public function getStore()
    {
        return $this->_store;
    }

    /**
     * @param int $id
     * @return object
     * @throws InvalidArgumentException
     */
    public function getById($id)
    {
        if (!($this->_store instanceof Store)) {
            throw new InvalidArgumentException('Store is not found');
        }
        return $this->getRepository()->findOneBy(array('id' => $id, 'store' => $this->_store->getId()));
    }

    /**
     * @return array
     * @throws InvalidArgumentException
     */
    public function getAll()
    {
        if (!($this->_store instanceof Store)) {
            throw new InvalidArgumentException('Store is not found');
        }
        return $this->getRepository()->findBy(array('store' => $this->_store->getId()));
    }

    /**
     * @param array $params
     * @return array|Doctrine\ORM\QueryBuilder|void
     * @throws InvalidArgumentException
     */
    protected function _preparePaginatorParams($params = array())
    {
        if (!($this->_store instanceof Store)) {
            throw new InvalidArgumentException('Store is not found');
        }
        $query = parent::_preparePaginatorParams($params);
        $query->andWhere('t.store = :store');
        $query->setParameter('store', $this->_store->getId());
    }

}
