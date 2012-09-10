<?php

namespace Entities\Product;

use Doctrine\ORM\Mapping as ORM;

/**
 * File
 *
 * @ORM\Table(name="product_attachments")
 * @ORM\Entity
 */
class Attachment
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
     * @ORM\Column(name="name", type="string", length=126, nullable=false)
     */
    protected $name;

    /**
     * @var string $ext
     *
     * @ORM\Column(name="ext", type="string", length=4, nullable=false)
     */
    protected $ext;

    /**
     * @var string $type
     *
     * @ORM\Column(name="type", type="string", nullable=false)
     */
    protected $type;

    /**
     * @var \Entities\Product
     *
     * @ORM\ManyToOne(targetEntity="Entities\Product", inversedBy="attachments")
     */
    protected $product;


    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param string $ext
     * @return Attachment
     */
    public function setExt($ext)
    {
        $this->ext = $ext;
        return $this;
    }

    /**
     * @return string
     */
    public function getExt()
    {
        return $this->ext;
    }

    /**
     * @param string $name
     * @return Attachment
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
     * @param \Entities\Product $product
     * @return Attachment
     */
    public function setProduct($product)
    {
        $this->product = $product;
        return $this;
    }

    /**
     * @return \Entities\Product
     */
    public function getProduct()
    {
        return $this->product;
    }

    /**
     * @param string $type
     * @return Attachment
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