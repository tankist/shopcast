<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Category
 *
 * @ORM\Table(name="categories")
 * @ORM\Entity
 */
class Category
{
    /**
     * @var integer $id
     *
     * @ORM\Column(name="id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;

    /**
     * @var string $name
     *
     * @ORM\Column(name="name", type="string", length=255, nullable=false)
     */
    protected $name;

    /**
     * @var integer $displayOrder
     *
     * @ORM\Column(name="display_order", type="integer", nullable=false)
     */
    protected $displayOrder;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Store", inversedBy="categories", cascade={"persist"})
     * @ORM\JoinTable(name="store_categories",
     *   joinColumns={
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     * @ORM\JoinColumn(name="store_id", referencedColumnName="id")
     *   }
     * )
     */
    protected $stores;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Product", inversedBy="categories", cascade={"persist"})
     * @ORM\JoinTable(name="product_categories",
     *   joinColumns={
     * @ORM\JoinColumn(name="category_id", referencedColumnName="id")
     *   },
     *   inverseJoinColumns={
     * @ORM\JoinColumn(name="product_id", referencedColumnName="id")
     *   }
     * )
     */
    protected $products;

    public function __construct()
    {
        $this->products = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $displayOrder
     * @return Category
     */
    public function setDisplayOrder($displayOrder)
    {
        $this->displayOrder = $displayOrder;
        return $this;
    }

    /**
     * @return int
     */
    public function getDisplayOrder()
    {
        return $this->displayOrder;
    }

    /**
     * @param string $name
     * @return Category
     */
    public function setName($name)
    {
        $this->name = $name;
        return $this;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param Product $product
     * @return Category
     */
    public function addProduct(Product $product)
    {
        $this->products[] = $product;
        return $this;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getProducts()
    {
        return $this->products;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getStores()
    {
        return $this->stores;
    }

    /**
     * @param Store $store
     * @return Category
     */
    public function addStore(Store $store)
    {
        $this->stores[] = $store;
        return $this;
    }

}