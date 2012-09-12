<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Product
 *
 * @ORM\Table(name="products")
 * @ORM\Entity
 */
class Product
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
     * @var string $descr
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     */
    protected $description = '';

    /**
     * @var integer $displayOrder
     *
     * @ORM\Column(name="display_order", type="integer", nullable=false)
     */
    protected $displayOrder;

    /**
     * @var string $status
     *
     * @ORM\Column(name="status", type="string", nullable=false)
     */
    protected $status;

    /**
     * @var integer $quantity
     *
     * @ORM\Column(name="quantity", type="integer", nullable=true)
     */
    protected $quantity;

    /**
     * @var float $price
     *
     * @ORM\Column(name="price", type="float", nullable=false)
     */
    protected $price;

    /**
     * @var float $sale
     *
     * @ORM\Column(name="sale", type="float", nullable=false)
     */
    protected $sale;

    /**
     * @var boolean $useTag
     *
     * @ORM\Column(name="use_tag", type="boolean", nullable=false)
     */
    protected $useTag;

    /**
     * @var string $shippingType
     *
     * @ORM\Column(name="shipping_type", type="string", nullable=false)
     */
    protected $shippingType;

    /**
     * @var string $shippingValues
     *
     * @ORM\Column(name="shipping_values", type="text", nullable=true)
     */
    protected $shippingValues;

    /**
     * @var string $type
     *
     * @ORM\Column(name="type", type="string", nullable=false)
     */
    protected $type;

    /**
     * @var \DateTime $addDt
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    protected $created;

    /**
     * @var integer $buyCount
     *
     * @ORM\Column(name="buy_count", type="integer", nullable=false)
     */
    protected $buyCount;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Category", mappedBy="products", cascade={"persist"})
     */
    protected $categories;

    /**
     * @var \Entities\Product\Image
     *
     * @ORM\OneToOne(targetEntity="Entities\Product\Image")
     */
    protected $thumbnail;

    /**
     * @var Store
     *
     * @ORM\ManyToOne(targetEntity="Store", inversedBy="products")
     */
    protected $store;

    public function __construct()
    {
        $this->categories = new \Doctrine\Common\Collections\ArrayCollection();
        $this->created = new \DateTime();
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param Category $category
     * @return Product
     */
    public function addCategory(Category $category)
    {
        $this->categories[] = $category;
        $category->addProduct($this);
        return $this;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * @return \DateTime
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * @param int $buyCount
     * @return Product
     */
    public function setBuyCount($buyCount)
    {
        $this->buyCount = $buyCount;
        return $this;
    }

    /**
     * @return int
     */
    public function getBuyCount()
    {
        return $this->buyCount;
    }

    /**
     * @param string $description
     * @return Product
     */
    public function setDescription($description)
    {
        $this->description = $description;
        return $this;
    }

    /**
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param int $displayOrder
     * @return Product
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
     * @return Product
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
     * @param float $price
     * @return Product
     */
    public function setPrice($price)
    {
        $this->price = $price;
        return $this;
    }

    /**
     * @return float
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * @param int $quantity
     * @return Product
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;
        return $this;
    }

    /**
     * @return int
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * @param float $sale
     * @return Product
     */
    public function setSale($sale)
    {
        $this->sale = $sale;
        return $this;
    }

    /**
     * @return float
     */
    public function getSale()
    {
        return $this->sale;
    }

    /**
     * @param string $shippingType
     * @return Product
     */
    public function setShippingType($shippingType)
    {
        $this->shippingType = $shippingType;
        return $this;
    }

    /**
     * @return string
     */
    public function getShippingType()
    {
        return $this->shippingType;
    }

    /**
     * @param string $shippingValues
     * @return Product
     */
    public function setShippingValues($shippingValues)
    {
        $this->shippingValues = $shippingValues;
        return $this;
    }

    /**
     * @return string
     */
    public function getShippingValues()
    {
        return $this->shippingValues;
    }

    /**
     * @param string $status
     * @return Product
     */
    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    /**
     * @return string
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * @param \Entities\Store $store
     * @return Product
     */
    public function setStore($store)
    {
        $this->store = $store;
        return $this;
    }

    /**
     * @return \Entities\Store
     */
    public function getStore()
    {
        return $this->store;
    }

    /**
     * @param \Entities\Product\Image $thumbnail
     * @return Product
     */
    public function setThumbnail($thumbnail)
    {
        $this->thumbnail = $thumbnail;
        return $this;
    }

    /**
     * @return \Entities\Product\Image
     */
    public function getThumbnail()
    {
        return $this->thumbnail;
    }

    /**
     * @param string $type
     * @return Product
     */
    public function setType($type)
    {
        $this->type = $type;
        return $this;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * @param boolean $useTag
     * @return Product
     */
    public function setUseTag($useTag)
    {
        $this->useTag = $useTag;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getUseTag()
    {
        return $this->useTag;
    }

}