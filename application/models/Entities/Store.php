<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Store
 *
 * @ORM\Table(name="stores")
 * @ORM\Entity
 */
class Store
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
     * @var string $domain
     *
     * @ORM\Column(name="domain", type="string", length=64, nullable=false)
     */
    protected $domain;

    /**
     * @var string $title
     *
     * @ORM\Column(type="string", length=255, nullable=false)
     */
    protected $title;

    /**
     * @var string $descr
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     */
    protected $description;

    /**
     * @var boolean $timezone
     *
     * @ORM\Column(name="timezone", type="boolean", nullable=true)
     */
    protected $timezone;

    /**
     * @var boolean $isDaylightTime
     *
     * @ORM\Column(name="is_daylight_time", type="boolean", nullable=false)
     */
    protected $isDaylightTime;

    /**
     * @var float $timezoneOffset
     *
     * @ORM\Column(name="timezone_offset", type="float", nullable=true)
     */
    protected $timezoneOffset;

    /**
     * @var string $logoExt
     *
     * @ORM\Column(name="logo_ext", type="string", length=4, nullable=true)
     */
    protected $logoExt;

    /**
     * @var \Datetime $regDate
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    protected $created;

    /**
     * @var boolean $isOrderInform
     *
     * @ORM\Column(name="is_order_inform", type="boolean", nullable=false)
     */
    protected $isOrderInform;

    /**
     * @var string $orderEmail
     *
     * @ORM\Column(name="order_email", type="string", length=255, nullable=true)
     */
    protected $orderEmail;

    /**
     * @var float $purchasePercentage
     *
     * @ORM\Column(name="purchase_percentage", type="float", nullable=false)
     */
    protected $purchasePercentage;

    /**
     * @var float $purchaseFee
     *
     * @ORM\Column(name="purchase_fee", type="float", nullable=false)
     */
    protected $purchaseFee;

    /**
     * @var string $state
     *
     * @ORM\Column(name="state", type="string", nullable=false)
     */
    protected $state;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\ManyToMany(targetEntity="Category", mappedBy="products", cascade={"persist"})
     */
    protected $categories;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Product", mappedBy="store", cascade={"all"})
     */
    protected $products;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Payment", mappedBy="store", cascade={"persist"})
     */
    protected $payments;

    /**
     * @var \Entities\Store\Design
     *
     * @ORM\OneToOne(targetEntity="Entities\Store\Design")
     */
    protected $design;

    /**
     * @var User
     *
     * @ORM\ManyToOne(targetEntity="User", inversedBy="stores")
     */
    protected $user;

    public function __construct()
    {
        $this->products = new \Doctrine\Common\Collections\ArrayCollection();
        $this->payments = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getPayments()
    {
        return $this->payments;
    }

    /**
     * @param Payment $payment
     * @return Store
     */
    public function addPayment(Payment $payment)
    {
        $this->payments[] = $payment;
        $payment->setStore($this);
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
     * @param Product $product
     * @return Store
     */
    public function addProduct(Product $product)
    {
        $this->products[] = $product;
        $product->setStore($this);
        return $this;
    }

    /**
     * @param string $companyName
     * @return Store
     */
    public function setTitle($companyName)
    {
        $this->title = $companyName;
        return $this;
    }

    /**
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param string $description
     * @return Store
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
     * @param \Entities\Store\Design $design
     * @return Store
     */
    public function setDesign($design)
    {
        $this->design = $design;
        return $this;
    }

    /**
     * @return \Entities\Store\Design
     */
    public function getDesign()
    {
        return $this->design;
    }

    /**
     * @param string $domain
     * @return Store
     */
    public function setDomain($domain)
    {
        $this->domain = $domain;
        return $this;
    }

    /**
     * @return string
     */
    public function getDomain()
    {
        return $this->domain;
    }

    /**
     * @param boolean $isDaylightTime
     * @return Store
     */
    public function setIsDaylightTime($isDaylightTime)
    {
        $this->isDaylightTime = $isDaylightTime;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getIsDaylightTime()
    {
        return $this->isDaylightTime;
    }

    /**
     * @param boolean $isOrderInform
     * @return Store
     */
    public function setIsOrderInform($isOrderInform)
    {
        $this->isOrderInform = $isOrderInform;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getIsOrderInform()
    {
        return $this->isOrderInform;
    }

    /**
     * @param string $logoExt
     * @return Store
     */
    public function setLogoExt($logoExt)
    {
        $this->logoExt = $logoExt;
        return $this;
    }

    /**
     * @return string
     */
    public function getLogoExt()
    {
        return $this->logoExt;
    }

    /**
     * @param string $orderEmail
     * @return Store
     */
    public function setOrderEmail($orderEmail)
    {
        $this->orderEmail = $orderEmail;
        return $this;
    }

    /**
     * @return string
     */
    public function getOrderEmail()
    {
        return $this->orderEmail;
    }

    /**
     * @param float $purchaseFee
     * @return Store
     */
    public function setPurchaseFee($purchaseFee)
    {
        $this->purchaseFee = $purchaseFee;
        return $this;
    }

    /**
     * @return float
     */
    public function getPurchaseFee()
    {
        return $this->purchaseFee;
    }

    /**
     * @param float $purchasePercentage
     * @return Store
     */
    public function setPurchasePercentage($purchasePercentage)
    {
        $this->purchasePercentage = $purchasePercentage;
        return $this;
    }

    /**
     * @return float
     */
    public function getPurchasePercentage()
    {
        return $this->purchasePercentage;
    }

    /**
     * @param string $state
     * @return Store
     */
    public function setState($state)
    {
        $this->state = $state;
        return $this;
    }

    /**
     * @return string
     */
    public function getState()
    {
        return $this->state;
    }

    /**
     * @param boolean $timezone
     * @return Store
     */
    public function setTimezone($timezone)
    {
        $this->timezone = $timezone;
        return $this;
    }

    /**
     * @return boolean
     */
    public function getTimezone()
    {
        return $this->timezone;
    }

    /**
     * @param float $timezoneOffset
     * @return Store
     */
    public function setTimezoneOffset($timezoneOffset)
    {
        $this->timezoneOffset = $timezoneOffset;
        return $this;
    }

    /**
     * @return float
     */
    public function getTimezoneOffset()
    {
        return $this->timezoneOffset;
    }

    /**
     * @return \Doctrine\Common\Collections\ArrayCollection
     */
    public function getCategories()
    {
        return $this->categories;
    }

    /**
     * @param Category $category
     * @return Store
     */
    public function addCategory(Category $category)
    {
        $this->categories[] = $category;
        $category->addStore($this);
        return $this;
    }

    /**
     * @param \Entities\User $user
     * @return Store
     */
    public function setUser($user)
    {
        $this->user = $user;
        return $this;
    }

    /**
     * @return \Entities\User
     */
    public function getUser()
    {
        return $this->user;
    }

}