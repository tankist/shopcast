<?php

class Service_User extends Skaya_Service_Abstract
{

    protected $_entityName = '\Entities\User';

    /**
     * @param string $email
     * @return \Entities\Store
     */
    public function getByEmail($email)
    {
        $store = $this->getRepository()->findOneByEmail($email);
        return $store;
    }

}
