<?php
class Model_Mapper_Db_Country extends Model_Mapper_Db_Abstract {
	
	const TABLE_NAME = 'countries';
	
	protected $_mapperTableName = self::TABLE_NAME;
	
	public function getCountries() {
		$countriesTable = self::_getTableByName(Model_Mapper_Db_Country::TABLE_NAME);
		
		$countriesList = $countriesTable->fetchAll();
		
		return $countriesList->toArray();
	}
	
}

