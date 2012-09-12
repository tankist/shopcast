<?php

namespace Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * User
 *
 * @ORM\Table(name="users")
 * @ORM\Entity
 */
class User
{

    /**
     * @var integer $id
     *
     * @ORM\Column(type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    protected $id;

    /**
     * @var string $firstName
     *
     * @ORM\Column(name="first_name", type="string", length=30, nullable=false)
     */
    protected $firstName;

    /**
     * @var string $lastName
     *
     * @ORM\Column(name="last_name", type="string", length=50, nullable=false)
     */
    protected $lastName;

    /**
     * @var string $middleName
     *
     * @ORM\Column(name="middle_name", type="string", length=20, nullable=true)
     */
    protected $middleName;

    /**
     * @var string $email
     *
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    protected $email;

    /**
     * @var string $password
     *
     * @ORM\Column(type="string", length=32)
     */
    protected $password;

    /**
     * @var string $phone
     *
     * @ORM\Column(type="string", length=15, nullable=true)
     */
    protected $phone;

    /**
     * @var string $role
     *
     * @ORM\Column(type="integer", length=3)
     */
    protected $role = \Acl::GUEST;

    /**
     * @var Plan
     *
     * @ORM\ManyToOne(targetEntity="Plan", inversedBy="users")
     */
    protected $plan;

    /**
     * @var integer
     *
     * @ORM\Column(type="integer", length=1)
     */
    protected $status;

    /**
     * @var \Doctrine\Common\Collections\ArrayCollection
     *
     * @ORM\OneToMany(targetEntity="Store", mappedBy="user", cascade={"all"})
     */
    protected $stores;

    public function __construct()
    {
        $this->stores = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $email
     * @return User
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
     * @param string $firstName
     * @return User
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;
        return $this;
    }

    /**
     * @return string
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * @param string $lastName
     * @return User
     */
    public function setLastName($lastName)
    {
        $this->lastName = $lastName;
        return $this;
    }

    /**
     * @return string
     */
    public function getLastName()
    {
        return $this->lastName;
    }

    /**
     * @param string $middleName
     * @return User
     */
    public function setMiddleName($middleName)
    {
        $this->middleName = $middleName;
        return $this;
    }

    /**
     * @return string
     */
    public function getMiddleName()
    {
        return $this->middleName;
    }

    /**
     * @return string
     */
    public function getFullName()
    {
        return join(' ', array_filter(array(
            $this->getFirstName(),
            $this->getMiddleName(),
            $this->getLastName()
        )));
    }

    /**
     * @param string $password
     * @return User
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
     * @param string $phone
     * @return User
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;
        return $this;
    }

    /**
     * @return string
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * @param \Entities\Plan $plan
     * @return User
     */
    public function setPlan($plan)
    {
        $this->plan = $plan;
        return $this;
    }

    /**
     * @return \Entities\Plan
     */
    public function getPlan()
    {
        return $this->plan;
    }

    /**
     * @param string $role
     * @return User
     */
    public function setRole($role)
    {
        $this->role = $role;
        return $this;
    }

    /**
     * @return string
     */
    public function getRole()
    {
        return $this->role;
    }

    /**
     * @param int $status
     * @return User
     */
    public function setStatus($status)
    {
        $this->status = $status;
        return $this;
    }

    /**
     * @return int
     */
    public function getStatus()
    {
        return $this->status;
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
     * @return User
     */
    public function addStore(Store $store)
    {
        $this->stores[] = $store;
        $store->setUser($this);
        return $this;
    }
}
