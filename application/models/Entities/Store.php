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
     * @var string $password
     *
     * @ORM\Column(name="password", type="string", length=64, nullable=false)
     */
    protected $password;

    /**
     * @var string $companyName
     *
     * @ORM\Column(name="company_name", type="string", length=255, nullable=false)
     */
    protected $companyName;

    /**
     * @var string $ownerName
     *
     * @ORM\Column(name="owner_name", type="string", length=255, nullable=false)
     */
    protected $ownerName;

    /**
     * @var string $email
     *
     * @ORM\Column(name="email", type="string", length=255, nullable=false)
     */
    protected $email;

    /**
     * @var string $url
     *
     * @ORM\Column(name="url", type="string", length=255, nullable=true)
     */
    protected $url;

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
     * @var string $descr
     *
     * @ORM\Column(name="description", type="text", nullable=true)
     */
    protected $description;

    /**
     * @var string $logoExt
     *
     * @ORM\Column(name="logo_ext", type="string", length=4, nullable=true)
     */
    protected $logoExt;

    /**
     * @var string $type
     *
     * @ORM\Column(name="type", type="string", nullable=false)
     */
    protected $type;

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
     * @var string $payoutType
     *
     * @ORM\Column(name="payout_type", type="string", nullable=true)
     */
    protected $payoutType;

    /**
     * @var string $payoutInfo
     *
     * @ORM\Column(name="payout_info", type="text", nullable=true)
     */
    protected $payoutInfo;

    /**
     * @var string $policy
     *
     * @ORM\Column(name="policy", type="text", nullable=true)
     */
    protected $policy;

    /**
     * @var string $state
     *
     * @ORM\Column(name="state", type="string", nullable=false)
     */
    protected $state;

    /**
     * @var integer $voteCount
     *
     * @ORM\Column(name="vote_count", type="integer", nullable=false)
     */
    protected $voteCount;

    /**
     * @var integer $voteSum
     *
     * @ORM\Column(name="vote_sum", type="integer", nullable=false)
     */
    protected $voteSum;

    /**
     * @var integer $loginCount
     *
     * @ORM\Column(name="login_count", type="integer", nullable=false)
     */
    protected $loginCount;

    /**
     * @var \Datetime $lastLoginDate
     *
     * @ORM\Column(name="last_login_date", type="datetime", nullable=true)
     */
    protected $lastLoginDate;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Category", mappedBy="store")
     */
    protected $categories;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Product", mappedBy="store")
     */
    protected $products;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Payment", mappedBy="store")
     */
    protected $payments;

    /**
     * @var \Entities\Store\Design
     *
     * @ORM\OneToOne(targetEntity="Entities\Store\Design")
     */
    protected $design;

    /**
     * @var int
     *
     * @ORM\Column(type="integer", length=3)
     */
    protected $role = \Acl::STORE;

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
    public function setCompanyName($companyName)
    {
        $this->companyName = $companyName;
        return $this;
    }

    /**
     * @return string
     */
    public function getCompanyName()
    {
        return $this->companyName;
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
     * @param string $email
     * @return Store
     */
    public function setEmail($email)
    {
        $this->email = $email;
        return $this;
    }

    /**
     * @return string
     */
    public function getEmail()
    {
        return $this->email;
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
     * @param \Datetime $lastLoginDate
     * @return Store
     */
    public function setLastLoginDate($lastLoginDate)
    {
        $this->lastLoginDate = $lastLoginDate;
        return $this;
    }

    /**
     * @return \Datetime
     */
    public function getLastLoginDate()
    {
        return $this->lastLoginDate;
    }

    /**
     * @param int $loginCount
     * @return Store
     */
    public function setLoginCount($loginCount)
    {
        $this->loginCount = $loginCount;
        return $this;
    }

    /**
     * @return int
     */
    public function getLoginCount()
    {
        return $this->loginCount;
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
     * @param string $ownerName
     * @return Store
     */
    public function setOwnerName($ownerName)
    {
        $this->ownerName = $ownerName;
        return $this;
    }

    /**
     * @return string
     */
    public function getOwnerName()
    {
        return $this->ownerName;
    }

    /**
     * @param string $password
     * @return Store
     */
    public function setPassword($password)
    {
        $this->password = $password;
        return $this;
    }

    /**
     * @return string
     */
    public function getPassword()
    {
        return $this->password;
    }

    /**
     * @param string $payoutInfo
     * @return Store
     */
    public function setPayoutInfo($payoutInfo)
    {
        $this->payoutInfo = $payoutInfo;
        return $this;
    }

    /**
     * @return string
     */
    public function getPayoutInfo()
    {
        return $this->payoutInfo;
    }

    /**
     * @param string $payoutType
     * @return Store
     */
    public function setPayoutType($payoutType)
    {
        $this->payoutType = $payoutType;
        return $this;
    }

    /**
     * @return string
     */
    public function getPayoutType()
    {
        return $this->payoutType;
    }

    /**
     * @param string $policy
     * @return Store
     */
    public function setPolicy($policy)
    {
        $this->policy = $policy;
        return $this;
    }

    /**
     * @return string
     */
    public function getPolicy()
    {
        return $this->policy;
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
     * @param string $type
     * @return Store
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
     * @param string $url
     * @return Store
     */
    public function setUrl($url)
    {
        $this->url = $url;
        return $this;
    }

    /**
     * @return string
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * @param int $voteCount
     * @return Store
     */
    public function setVoteCount($voteCount)
    {
        $this->voteCount = $voteCount;
        return $this;
    }

    /**
     * @return int
     */
    public function getVoteCount()
    {
        return $this->voteCount;
    }

    /**
     * @param int $voteSum
     * @return Store
     */
    public function setVoteSum($voteSum)
    {
        $this->voteSum = $voteSum;
        return $this;
    }

    /**
     * @return int
     */
    public function getVoteSum()
    {
        return $this->voteSum;
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
        $category->setStore($this);
        return $this;
    }

    /**
     * @param int $role
     * @return Store
     */
    public function setRole($role)
    {
        $this->role = $role;
        return $this;
    }

    /**
     * @return int
     */
    public function getRole()
    {
        return $this->role;
    }

}