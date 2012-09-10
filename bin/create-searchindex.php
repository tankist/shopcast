<?php
require_once('bootstrap.php');

define('INDEX_LABEL', 'runashop');
define('PRODUCTS_TYPE_LABEL', 'products');
define('REVIEWS_TYPE_LABEL', 'reviews');

/** @var $client Elastica_Client */
$client = Zend_Registry::get('es');

$config = array(
    'index' => array(
        'analysis' => array(
            'filter' => array(
                'germanSnowball' => array(
                    'language' => 'german',
                    'type' => 'snowball'
                ),
                'englishSnowball' => array(
                    'language' => 'english',
                    'type' => 'snowball'
                ),
                'frenchSnowball' => array(
                    'language' => 'french',
                    'type' => 'snowball'
                ),
                'italianSnowball' => array(
                    'language' => 'italian',
                    'type' => 'snowball'
                ),
                /*'brazilianSnowball' => array(
                    'language' => 'brazilian',
                    'type' => 'snowball'
                ),*/
                'spanishSnowball' => array(
                    'language' => 'spanish',
                    'type' => 'snowball'
                ),
            ),
            'analyzer' => array(
                'german' => array(
                    'filter' => array('germanSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),
                'english' => array(
                    'filter' => array('englishSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),
                'french' => array(
                    'filter' => array('frenchSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),
                'italian' => array(
                    'filter' => array('italianSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),
                /*'brazilian' => array(
                    'filter' => array('brazilianSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),*/
                'spanish' => array(
                    'filter' => array('spanishSnowball', 'icu_folding'),
                    'type' => 'custom',
                    'tokenizer' => 'icu_tokenizer'
                ),
                'default' => array(
                    'sub_analyzers' => array('standard', 'german', 'english', /*'french', 'italian', 'brazilian', 'spanish'*/),
                    'type' => 'combo'
                )
            )
        )
    )
);

try {
    $index = $client->getIndex(INDEX_LABEL);
    $index->create($config, true);
    echo "Index " , INDEX_LABEL , " successfully created." , PHP_EOL;

    try {
        $type = $index->getType(PRODUCTS_TYPE_LABEL);
        try {
            $type->delete();
        } catch (Exception $e) {
            //Skip
        }

        $typeMapping = new Elastica_Type_Mapping($type, array(
            'id' => array(
                'type' => 'string',
                'include_in_all' => 0
            ),
            'title' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'description' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'price' => array(
                'type' => 'float',
                'include_in_all' => 1
            ),
            'clicks' => array(
                'type' => 'integer',
                'include_in_all' => 1
            ),
            'shippingPrice' => array(
                'type' => 'float',
                'include_in_all' => 1
            ),
            'colors' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'attribs.brandName' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'attribs.originalPrice' => array(
                'type' => 'float',
                'include_in_all' => 0
            ),
            'soundex' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'country' => array(
                'type' => 'string',
                'include_in_all' => 1
            )
        ));
        $type->setMapping($typeMapping);
        $typeMapping->send();

        $type = $index->getType(REVIEWS_TYPE_LABEL);
        try {
            $type->delete();
        } catch (Exception $e) {
            //Skip
        }

        $typeMapping = new Elastica_Type_Mapping($type, array(
            'id' => array(
                'type' => 'string',
                'include_in_all' => 0
            ),
            'title' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
            'hash' => array(
                'type' => 'string',
                'include_in_all' => 1
            ),
        ));
        $type->setMapping($typeMapping);
        $typeMapping->send();
    }
    catch (Exception $e) {
        echo "Mapping for " , INDEX_LABEL , " could not be created. (", $e->getMessage(), ")" , PHP_EOL;
    }
} catch (Exception $e) {
    echo "Index " , INDEX_LABEL , " could not be created. (", $e->getMessage(), ")" , PHP_EOL;
}