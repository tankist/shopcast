<?php

namespace Entities\Store;

use Doctrine\ORM\Mapping as ORM;

/**
 * StoreDesign
 *
 * @ORM\Table(name="store_designs")
 * @ORM\Entity @ORM\HasLifecycleCallbacks
 */
class Design
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
     * @var integer $productsPerPage
     *
     * @ORM\Column(name="products_per_page", type="integer", nullable=false)
     */
    protected $productsPerPage;

    /**
     * @var string $productsOrder
     *
     * @ORM\Column(name="products_order", type="string", nullable=false)
     */
    protected $productsOrder;

    /**
     * @var integer $embedWidth
     *
     * @ORM\Column(name="embed_width", type="integer", nullable=false)
     */
    protected $embedWidth;

    /**
     * @var integer $embedHeight
     *
     * @ORM\Column(name="embed_height", type="integer", nullable=false)
     */
    protected $embedHeight;

    /**
     * @var string $layoutType
     *
     * @ORM\Column(name="layout_type", type="string", nullable=false)
     */
    protected $layoutType;

    /**
     * @var \Datetime $updateDt
     *
     * @ORM\Column(name="update_dt", type="datetime", nullable=false)
     */
    protected $updateDate;

    /**
     * @var string $state
     *
     * @ORM\Column(name="state", type="string", nullable=false)
     */
    protected $state;


    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param int $embedHeight
     * @return Design
     */
    public function setEmbedHeight($embedHeight)
    {
        $this->embedHeight = $embedHeight;
        return $this;
    }

    /**
     * @return int
     */
    public function getEmbedHeight()
    {
        return $this->embedHeight;
    }

    /**
     * @param int $embedWidth
     * @return Design
     */
    public function setEmbedWidth($embedWidth)
    {
        $this->embedWidth = $embedWidth;
        return $this;
    }

    /**
     * @return int
     */
    public function getEmbedWidth()
    {
        return $this->embedWidth;
    }

    /**
     * @param string $layoutType
     * @return Design
     */
    public function setLayoutType($layoutType)
    {
        $this->layoutType = $layoutType;
        return $this;
    }

    /**
     * @return string
     */
    public function getLayoutType()
    {
        return $this->layoutType;
    }

    /**
     * @param string $name
     * @return Design
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
     * @param string $productsOrder
     * @return Design
     */
    public function setProductsOrder($productsOrder)
    {
        $this->productsOrder = $productsOrder;
        return $this;
    }

    /**
     * @return string
     */
    public function getProductsOrder()
    {
        return $this->productsOrder;
    }

    /**
     * @param int $productsPerPage
     * @return Design
     */
    public function setProductsPerPage($productsPerPage)
    {
        $this->productsPerPage = $productsPerPage;
        return $this;
    }

    /**
     * @return int
     */
    public function getProductsPerPage()
    {
        return $this->productsPerPage;
    }

    /**
     * @param string $state
     * @return Design
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
     * @ORM\PreUpdate
     * @return Design
     */
    public function setUpdateDate()
    {
        $this->updateDate = new \DateTime();
        return $this;
    }

    /**
     * @return \Datetime
     */
    public function getUpdateDate()
    {
        return $this->updateDate;
    }
}