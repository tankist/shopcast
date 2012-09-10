<?php

use Entities\Store, Entities\Product, Entities\Category;

class Service_Store_Product extends Service_Store_Abstract
{

    protected $_entityName = 'Entities\Product';

    /**
     * @param Entities\Category $category
     * @param array $params
     * @return Zend_Paginator
     */
    public function getCategoryPaginator(Category $category, $params = array())
    {
        $query = $this->_preparePaginatorParams($params);
        $query->innerJoin('p.categories', 'c');
        $query->andWhere('c.id = :category');
        $query->setParameter('category', $category->getId());
        return new Zend_Paginator(new \DoctrineExtensions\Paginate\PaginationAdapter($query->getQuery()));
    }

    /**
     * @param Entities\Product $product
     * @param $name
     * @return mixed
     */
    public function getProductCategoryByName(Product $product, $name)
    {
        $categories = $product->getCategories()->filter(function (Category $category) use ($name) {
            return $category->getName() == $name;
        });
        return $categories->first();
    }

}
