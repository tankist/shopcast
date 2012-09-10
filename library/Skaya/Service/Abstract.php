<?php

abstract class Skaya_Service_Abstract
{

    /**
     * EntityManager
     * @var \Doctrine\ORM\EntityManager
     */
    protected $_em;

    protected $_entityName;

    /**
     * @var \Doctrine\ORM\EntityRepository
     */
    protected $_repository;

    public function __construct(\Doctrine\ORM\EntityManager $em)
    {
        $this->_em = $em;
    }

    /**
     * @param \Doctrine\ORM\EntityManager $em
     * @return Skaya_Service_Abstract
     */
    public function setEntityManager($em)
    {
        $this->_em = $em;
        return $this;
    }

    /**
     * @return \Doctrine\ORM\EntityManager
     */
    public function getEntityManager()
    {
        return $this->_em;
    }

    /**
     * @throws InvalidArgumentException|ReflectionException
     * @return self
     */
    public function create()
    {
        $args = func_get_args();
        if (!class_exists($this->_entityName, true)) {
            throw new ReflectionException('Class ' . $this->_entityName . ' not found');
        }
        $class = new ReflectionClass($this->_entityName);
        if (($constructor = $class->getConstructor()) && $constructor->getNumberOfRequiredParameters() > count($args)) {
            throw new InvalidArgumentException('Not enough parameters');
        }
        return $class->newInstanceArgs($args);
    }

    /**
     * @param object $entity
     * @param array $data
     * @return Skaya_Service_Abstract
     */
    public function update($entity, $data = array())
    {
        foreach ($data as $key => $value) {
            $setter = 'set' . ucfirst($key);
            if (method_exists($entity, $setter)) {
                call_user_func(array($entity, $setter), $value);
            }
        }
        return $this;
    }

    /**
     * @param object $entity
     * @return Skaya_Service_Abstract
     */
    public function save($entity)
    {
        $entityManager = $this->getEntityManager();
        $entityManager->persist($entity);
        $entityManager->flush();
        return $this;
    }

    /**
     * @param object $entity
     * @return Skaya_Service_Abstract
     */
    public function delete($entity)
    {
        $entityManager = $this->getEntityManager();
        $entityManager->remove($entity);
        $entityManager->flush();
        return $this;
    }

    /**
     * @return \Doctrine\ORM\EntityRepository
     */
    public function getRepository()
    {
        if (!$this->_repository && $this->_entityName) {
            $this->_repository = $this->getEntityManager()
                ->getRepository($this->_entityName);
        }
        return $this->_repository;
    }

    /**
     * @param int $id
     * @return object
     */
    public function getById($id)
    {
        /*$cache = $this->getEntityManager()->getConfiguration()->getResultCacheImpl();
        if ($cache) {
            $cache_id = $this->_entityName . '-id-' . (int)$id;
            if (!($entity = $cache->fetch($cache_id))) {
                $entity = $this->getRepository()->findOneBy(array('id' => (int)$id));
                $cache->save($cache_id, $entity);
            }
            return $entity;
        }*/
        $entity = $this->getRepository()->findOneBy(array('id' => (int)$id));
        return $entity;
    }

    /**
     * @return array
     */
    public function getAll()
    {
        return $this->getRepository()->findAll();
    }

    /**
     * @param array $params
     * @return Zend_Paginator
     */
    public function getPaginator($params = array())
    {
        $query = $this->_preparePaginatorParams($params);
        $paginator = new Zend_Paginator(
            new \DoctrineExtensions\Paginate\PaginationAdapter($query->getQuery())
        );
        return $paginator;
    }

    /**
     * @param array|Doctrine\ORM\QueryBuilder $params
     * @return array|Doctrine\ORM\QueryBuilder
     * @throws InvalidArgumentException
     */
    protected function _preparePaginatorParams($params = array())
    {
        if (!($params instanceof \Doctrine\ORM\QueryBuilder)) {
            if (!is_array($params)) {
                throw new InvalidArgumentException('Wrong params passed');
            }
            $query = $this->getRepository()->createQueryBuilder((isset($params['__alias'])) ? $params['__alias'] : 't');
            if (array_key_exists('order', $params)) {
                $type = (array_key_exists('orderType', $params)) ? $params['orderType'] : 'ASC';
                $query->orderBy($params['order'], $type);
                unset($params['order'], $params['orderType']);
            }
        }
        else {
            $query = $params;
        }
        return $query;
    }

}
