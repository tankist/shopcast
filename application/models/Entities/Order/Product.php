<?php

namespace Entities\Order;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrderProduct
 *
 * @ORM\Table(name="order_products")
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
     * @var integer $productId
     *
     * @ORM\Column(name="product_id", type="integer", nullable=false)
     */
    protected $productId;

    /**
     * @var string $productName
     *
     * @ORM\Column(name="product_name", type="string", length=255, nullable=false)
     */
    protected $productName;

    /**
     * @var string $productDesc
     *
     * @ORM\Column(name="product_desc", type="text", nullable=false)
     */
    protected $productDesc;

    /**
     * @var float $productPrice
     *
     * @ORM\Column(name="product_price", type="float", nullable=false)
     */
    protected $productPrice;

    /**
     * @var integer $quantity
     *
     * @ORM\Column(name="quantity", type="smallint", nullable=false)
     */
    protected $quantity;

    /**
     * @var string $productInfo
     *
     * @ORM\Column(name="product_info", type="text", nullable=false)
     */
    protected $productInfo;

    /**
     * @var float $shippingPrice
     *
     * @ORM\Column(name="shipping_price", type="float", nullable=false)
     */
    protected $shippingPrice;

    /**
     * @var string $shippingInfo
     *
     * @ORM\Column(name="shipping_info", type="text", nullable=false)
     */
    protected $shippingInfo;

    /**
     * @var \Entities\Order
     *
     * @ORM\ManyToOne(targetEntity="Entities\Order", inversedBy="products")
     */
    protected $order;


    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param \Entities\Order $order
     * @return Product
     */
    public function setOrder($order)
    {
        $this->order = $order;
        return $this;
    }

    /**
     * @return \Entities\Order
     */
    public function getOrder()
    {
        return $this->order;
    }

    /**
     * @param string $productDesc
     * @return Product
     */
    public function setProductDesc($productDesc)
    {
        $this->productDesc = $productDesc;
        return $this;
    }

    /**
     * @return string
     */
    public function getProductDesc()
    {
        return $this->productDesc;
    }

    /**
     * @param int $productId
     * @return Product
     */
    public function setProductId($productId)
    {
        $this->productId = $productId;
        return $this;
    }

    /**
     * @return int
     */
    public function getProductId()
    {
        return $this->productId;
    }

    /**
     * @param string $productInfo
     * @return Product
     */
    public function setProductInfo($productInfo)
    {
        $this->productInfo = $productInfo;
        return $this;
    }

    /**
     * @return string
     */
    public function getProductInfo()
    {
        return $this->productInfo;
    }

    /**
     * @param string $productName
     * @return Product
     */
    public function setProductName($productName)
    {
        $this->productName = $productName;
        return $this;
    }

    /**
     * @return string
     */
    public function getProductName()
    {
        return $this->productName;
    }

    /**
     * @param float $productPrice
     * @return Product
     */
    public function setProductPrice($productPrice)
    {
        $this->productPrice = $productPrice;
        return $this;
    }

    /**
     * @return float
     */
    public function getProductPrice()
    {
        return $this->productPrice;
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
     * @param string $shippingInfo
     * @return Product
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
     * @return Product
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
}