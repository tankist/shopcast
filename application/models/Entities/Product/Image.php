<?php

namespace Entities\Product;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProductImages
 *
 * @ORM\Table(name="product_images")
 * @ORM\Entity
 */
class Image
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
     * @ORM\Column(name="name", type="string", length=10, nullable=false)
     */
    protected $name;

    /**
     * @var string $ext
     *
     * @ORM\Column(name="ext", type="string", length=5, nullable=false)
     */
    protected $ext;

    /**
     * @var \Entities\Product
     *
     * @ORM\ManyToOne(targetEntity="Entities\Product", inversedBy="images")
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
     * @return Image
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
     * @return Image
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
     * @return Image
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
}