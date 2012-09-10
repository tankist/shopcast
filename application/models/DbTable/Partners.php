<?php

class Model_DbTable_Partners extends Model_DbTable_Abstract
{

    protected $_name = 'partner';

	protected $_dependentTables = array('Model_DbTable_Stores', 'Model_DbTable_PartnerCategories', 'Model_DbTable_Designers');
}

