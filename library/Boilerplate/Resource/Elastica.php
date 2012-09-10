<?php

class Boilerplate_Resource_Elastica extends Zend_Application_Resource_ResourceAbstract
{

    /**
     * Strategy pattern: initialize resource
     *
     * @return mixed
     */
    public function init()
    {
        $options = $this->getOptions();
        $params = (array_key_exists('params', $options)) ? $options['params'] : array();
        $client = new Elastica_Client($params);
        Zend_Registry::set('es', $client);

        if (array_key_exists('index', $options)) {
            foreach ($options['index'] as $index => $params) {
                $client->getIndex($index)->create($params, true);
            }
        }

        if (array_key_exists('mapping', $options)) {
            $params = $options['mapping'];
            $mapping = new Elastica_Type_Mapping();
            if (isset($params['index'])) {
                $index = $client->getIndex($params['index']);
                if (!$index->exists()) {
                    $index->create();
                }
                if (isset($params['type'])) {
                    $mapping->setType($index->getType($params['type']));
                }
            }
            if (array_key_exists('params', $params)) {
                foreach ($params['params'] as $param => $value) {
                    $mapping->setParam($param, $value);
                }
            }
            if (array_key_exists('properties', $params)) {
                $mapping->setProperties($params['properties']);
            }
            $mapping->send();
        }

        return $client;
    }

}