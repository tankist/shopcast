<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Payment
 *
 * @ORM\Table(name="payments")
 * @ORM\Entity
 */
class Payment
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
     * @var \Datetime $addDate
     *
     * @ORM\Column(name="created", type="datetime", nullable=false)
     */
    protected $created;

    /**
     * @var float $amount
     *
     * @ORM\Column(name="amount", type="float", nullable=false)
     */
    protected $amount;

    /**
     * @var string $state
     *
     * @ORM\Column(name="state", type="string", nullable=false)
     */
    protected $state;

    /**
     * @var string $type
     *
     * @ORM\Column(name="type", type="string", nullable=true)
     */
    protected $type;

    /**
     * @var string $info
     *
     * @ORM\Column(name="info", type="text", nullable=true)
     */
    protected $info;

    /**
     * @var \Entities\Store
     *
     * @ORM\ManyToOne(targetEntity="Store", inversedBy="payments")
     */
    protected $store;

    public function __construct()
    {
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
     * @return \datetime
     */
    public function getCreated()
    {
        return $this->created;
    }

    /**
     * @param float $amount
     * @return Payment
     */
    public function setAmount($amount)
    {
        $this->amount = $amount;
        return $this;
    }

    /**
     * @return float
     */
    public function getAmount()
    {
        return $this->amount;
    }

    /**
     * @param string $info
     * @return Payment
     */
    public function setInfo($info)
    {
        $this->info = $info;
        return $this;
    }

    /**
     * @return string
     */
    public function getInfo()
    {
        return $this->info;
    }

    /**
     * @param string $state
     * @return Payment
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
     * @param \Entities\Store $store
     * @return Payment
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
     * @param string $type
     * @return Payment
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
}