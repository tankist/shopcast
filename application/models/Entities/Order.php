<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Order
 *
 * @ORM\Table(name="orders")
 * @ORM\Entity
 */
class Order
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
     * @var string $status
     *
     * @ORM\Column(name="status", type="string", nullable=false)
     */
    protected $status;

    /**
     * @var float $productsPrice
     *
     * @ORM\Column(name="products_price", type="float", nullable=false)
     */
    protected $productsPrice;

    /**
     * @var float $shippingPrice
     *
     * @ORM\Column(name="shipping_price", type="float", nullable=false)
     */
    protected $shippingPrice;

    /**
     * @var float $incomePrice
     *
     * @ORM\Column(name="income_price", type="float", nullable=false)
     */
    protected $incomePrice;

    /**
     * @var float $factorIncome
     *
     * @ORM\Column(name="factor_income", type="float", nullable=false)
     */
    protected $factorIncome;

    /**
     * @var string $shippingInfo
     *
     * @ORM\Column(name="shipping_info", type="text", nullable=false)
     */
    protected $shippingInfo;

    /**
     * @var string $transactionId
     *
     * @ORM\Column(name="transaction_id", type="string", length=17, nullable=false)
     */
    protected $transactionId;

    /**
     * @var \Datetime $lastModified
     *
     * @ORM\Column(name="last_modified", type="datetime", nullable=false)
     */
    protected $lastModified;

    /**
     * @var \Datetime $datePurchased
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    protected $created;

    /**
     * @var Store
     *
     * @ORM\ManyToOne(targetEntity="Store", inversedBy="orders")
     */
    protected $store;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Entities\Order\Product", mappedBy="store")
     */
    protected $products;

    public function __construct()
    {
        $this->products = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return \Datetime
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * @param float $factorIncome
     * @return Order
     */
    public function setFactorIncome($factorIncome)
    {
        $this->factorIncome = $factorIncome;
        return $this;
    }

    /**
     * @return float
     */
    public function getFactorIncome()
    {
        return $this->factorIncome;
    }

    /**
     * @param float $incomePrice
     * @return Order
     */
    public function setIncomePrice($incomePrice)
    {
        $this->incomePrice = $incomePrice;
        return $this;
    }

    /**
     * @return float
     */
    public function getIncomePrice()
    {
        return $this->incomePrice;
    }

    /**
     * @param \Datetime $lastModified
     * @return Order
     */
    public function setLastModified($lastModified)
    {
        $this->lastModified = $lastModified;
        return $this;
    }

    /**
     * @return \Datetime
     */
    public function getLastModified()
    {
        return $this->lastModified;
    }

    /**
     * @param \Doctrine\Common\Collections\ArrayCollection $products
     * @return Order
     */
    public function setProducts($products)
    {
        $this->products = $products;
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
     * @param float $productsPrice
     * @return Order
     */
    public function setProductsPrice($productsPrice)
    {
        $this->productsPrice = $productsPrice;
        return $this;
    }

    /**
     * @return float
     */
    public function getProductsPrice()
    {
        return $this->productsPrice;
    }

    /**
     * @param string $shippingInfo
     * @return Order
     */
    public function setShippingInfo($shippingInfo)
    {
        $this->shippingInfo = $shippingInfo;
        return $this;
    }

    /**
     * @return string
     */
    public function getShippingInfo()
    {
        return $this->shippingInfo;
    }

    /**
     * @param float $shippingPrice
     * @return Order
     */
    public function setShippingPrice($shippingPrice)
    {
        $this->shippingPrice = $shippingPrice;
        return $this;
    }

    /**
     * @return float
     */
    public function getShippingPrice()
    {
        return $this->shippingPrice;
    }

    /**
     * @param string $status
     * @return Order
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
     * @return Order
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
     * @param string $transactionId
     * @return Order
     */
    public function setTransactionId($transactionId)
    {
        $this->transactionId = $transactionId;
        return $this;
    }

    /**
     * @return string
     */
    public function getTransactionId()
    {
        return $this->transactionId;
    }
}