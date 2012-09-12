<?php

class Service_Store extends Skaya_Service_Abstract
{

    protected $_entityName = '\Entities\Store';

    /**
     * @param $domain
     * @return \Entities\Store|null
     */
    public function getByDomain($domain)
    {
        $store = $this->getRepository()->findOneByDomain($domain);
        return $store;
    }

}
