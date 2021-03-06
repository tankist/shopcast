<?php
abstract class Model_Mapper_Db_Abstract extends Model_Mapper_Abstract implements Model_Mapper_Db_Interface {
	
	protected static $_tables = array();
	
	protected $_mapperTableName = '';
	
	/**
	* Creates (if necessary) and returns table class instance
	* 
	* @param string $name
	* @return Model_DbTable_Abstract
	* @throws Model_Mapper_Db_Exception
	*/
	protected static function _getTableByName($name) {
		$name = ucfirst($name);
		if (!array_key_exists($name, self::$_tables)) {
			self::$_tables[$name] = Model_DbTable_Abstract::factory($name);
		}
		return self::$_tables[$name];
	}
	
	/**
	* Save data to the DB store
	* 
	* @param array $data
	* @return int
	*/
	public function save($data) {
		$unmappedData = $this->unmap($data);
		$row = $this->_findOrCreateRowByData($unmappedData);
		$row->save();
		return $this->getMappedArrayFromData($row);
	}
	
	/**
	* Delete row linked to data
	* 
	* @param array $data
	* @return int
	*/
	public function delete($data) {
		$row = $this->_findOrCreateRowByData($data);
		return $row->delete();
	}
	
	/**
	* Search information by specially formed search condition
	* 
	* @example 'products.name%test&products.price>10&stores.state=active&partners.id=1'
	* 
	* @param string $conditions
	* @param mixed $order
	* @param int $count
	* @param int $offset
	* @return array
	*/
	public function search($conditions, $order = null, $count = null, $offset = null) {
		$searchResult = array();
		$select = $this->_prepareSearchQuery($conditions, $order, $count, $offset);
		$searchResult = self::_getTableByName($this->_mapperTableName)->fetchAll($select);
		return $this->getMappedArrayFromData($searchResult);;
	}
	
	/**
	* Search information by specially formed search condition and return results as paginator object
	* 
	* @param string $conditions
	* @param mixed $order
	* @return Skaya_Paginator
	*/
	public function getSearchPaginator($conditions, $order = null) {
		$select = $this->_prepareSearchQuery($conditions, $order, $count, $offset);
		$paginator = Skaya_Paginator::factory($select, 'DbSelect');
		$paginator->addFilter(new Zend_Filter_Callback(array(
			'callback' => array($this, 'getMappedArrayFromData')
		)));
		return $paginator;
	}
	
	public function getRawArrayFromData($data) {
		if ($data instanceOf Zend_Db_Table_Row_Abstract) {
			return $data->toArray();
		}
		
		if ($data instanceOf Zend_Db_Table_Rowset_Abstract) {
			return $data->toArray();
		}
		
		return parent::getRawArrayFromData($data);
	}
	
	/**
	* Convert search condition string to array with search terms and tables defined
	* 
	* @param string $conditions
	* @return array
	*/
	protected function _parseSearchConditions($conditions) {
		$subConditionsTerms = array();
		if (strpos($conditions, '(') !== false) {
			//Parse brackets
			$bracketsPartsCount = preg_match_all('$\((.+?)\)$i', $conditions, $subConditions);
			if ($bracketsPartsCount > 0) {
				$subConditions = $subConditions[0];
				$subConditionIndex = 0;
				foreach ($subConditions as $subCondition) {
					$subCondition = trim($subCondition, '()');
					$subConditionsTerms['subcondition_' . ++$subConditionIndex] = $this->_parseSearchConditions($subCondition);
					$conditions = preg_replace('$\((.+?)\)$i', 'subcondition=subcondition_' . $subConditionIndex, $conditions);
				}
			}
		}
		$partsCount = preg_match_all('$(?<connector>[\?&\|]*)(?<field>[^&=><%\|]+)(?<operation>[=><%]{1,2})(?<value>[^&=><%\|]+)$i', $conditions, $parts);
		if ($partsCount == 0) {
			throw new Model_Mapper_Db_Exception('Wrong search string provided');
		}
		$searchTerms = $tables = array();
		for ($i=0;$i<$partsCount;$i++) {
			$table = '';
			$field = $parts['field'][$i];
			if ($field == 'subcondition' && array_key_exists($parts['value'][$i], $subConditionsTerms)) {
				$subCondition = $subConditionsTerms[$parts['value'][$i]];
				$tables = array_merge($tables, $subCondition['tables']);
				$searchTerms[] = array(
					'subcondition' => $subCondition['terms'],
					'connector' => $parts['connector'][$i]
				);
				continue;
			}
			if (strpos($parts['field'][$i], '.') !== false) {
				list($table, $field) = explode('.', $parts['field'][$i]);
				$tables[] = $table;
			}

			$searchTerms[] = array(
				'table' => $table,
				'field' => $field,
				'operation' => $parts['operation'][$i],
				'value' => $parts['value'][$i],
				'connector' => $parts['connector'][$i]
			);
		}
		return array('terms' => $searchTerms, 'tables' => array_unique($tables));
	}
	
	/**
	* Converts formed search terms array to Zend_Db_Table_Select object
	* 
	* @param string $conditions
	* @param mixed $order
	* @param int $count
	* @param int $offset
	* @return Zend_Db_Table_Select
	*/
	protected function _prepareSearchQuery($conditions, $order = null, $count = null, $offset = null) {
		$mainTable = self::_getTableByName($this->_mapperTableName);
		$select = $mainTable->select(false)
			->from(array($this->_mapperTableName => $mainTable->info(Model_DbTable_Abstract::NAME)));
		$terms = $this->_parseSearchConditions($conditions);
		
		$tables = array($this->_mapperTableName => $mainTable);
		if (!empty($terms['tables'])) {
			foreach ($terms['tables'] as $tableName) {
				if (!array_key_exists($tableName, $tables)) {
					try {
						$tableInstance = $tables[$tableName] = self::_getTableByName($tableName);
						$fullTableName = $tableInstance->info(Model_DbTable_Abstract::NAME);
						$tableClass = get_class($tableInstance);
						$_tables = array_values($tables);
						$_tablesAliases = array_keys($tables);
						$tablesCount = count($tables);
						$reference = array();
						for ($i=0;$i<$tablesCount;$i++) {
							$referenceTable = $_tables[$i];
							$referenceTableClass = get_class($referenceTable);
							
							try {
								$reference = $tableInstance->getReference($referenceTableClass);
								$reference['table'] = $tableInstance;
								$reference['tableAlias'] = $tableName;
								$reference['referenceTable'] = $referenceTable;
								$reference['referenceTableAlias'] = $_tablesAliases[$i];
							}
							catch (Exception $e) {}
							try {
								$reference = $referenceTable->getReference($tableClass);
								$reference['table'] = $referenceTable;
								$reference['tableAlias'] = $_tablesAliases[$i];
								$reference['referenceTable'] = $tableInstance;
								$reference['referenceTableAlias'] = $tableName;
							}
							catch (Exception $e) {}
							if (!empty($reference)) {
								break;
							}
						}
						if (count($reference)>0) {
							$definitions = array();
							for ($i=0;$i<count($reference[Model_DbTable_Abstract::COLUMNS]);$i++) {
								$tableColumn = $reference['table']->getAdapter()
									->quoteIdentifier($reference[Model_DbTable_Abstract::COLUMNS][$i]);
								$referenceTableColumn = $reference['referenceTable']->getAdapter()
									->quoteIdentifier($reference[Model_DbTable_Abstract::REF_COLUMNS][$i]);
								$definitions[] = $reference['tableAlias'].".$tableColumn = {$reference['referenceTableAlias']}.$referenceTableColumn";
							}
							$select
								->setIntegrityCheck(false)
								->joinInner(array($tableName => $fullTableName), join(' AND ', $definitions), array());
						}
					}
					catch (Exception $e) {
						continue;
					}
				}
			}
		}
		//Set where
		if (!empty($terms['terms'])) {
			foreach ($terms['terms'] as $term) {
				$whereCondition = '';
				$adapter = $select->getAdapter();
				$whereFunction = ($term['connector'] == '|')?'orWhere':'where';
				if (array_key_exists('subcondition', $term) && is_array($term['subcondition'])) {
					$conditions = array();
					foreach ($term['subcondition'] as $subCondition) {
						$fieldName = $adapter->quoteIdentifier(array($subCondition['table'], $subCondition['field']));
						$orAnd = ($subCondition['connector'] == '|')?' OR ':' AND ';
						if (empty($conditions)) {
							$orAnd = '';
						}
						$operation = $subCondition['operation'];
						$value = $subCondition['value'];
						if ($operation == '%') {
							$operation = 'LIKE';
							$value = "%$value%";
						}
						$conditions[] = $orAnd . $adapter->quoteInto(sprintf("%s %s ?", $fieldName, $operation), $value);
					}
					$condition = join('', $conditions);
				}
				else {
					$fieldName = $adapter->quoteIdentifier(array($term['table'], $term['field']));
					$condition = $fieldName.$term['operation'].'?';
					if ($term['operation'] == '%') {
						$condition = $fieldName." LIKE ?";
						$term['value'] = '%'.$term['value'].'%';
					}
					$condition = $adapter->quoteInto($condition, $term['value']);
				}
				
				$select->$whereFunction($condition);
			}
		}
		$select->order($order)->limit($count, $offset);
		return $select;
	}
	
	/**
	* Try to find data identified by PK. If nothing was found tries to create new filtered data
	* 
	* @param array $data
	* @return Zend_Db_Table_Row_Abstract
	*/
	protected function _findOrCreateRowByData($data) {
		$table = self::_getTableByName($this->_mapperTableName);
		$data = $table->filterDataByRowsNames($data);
		
		$primary = $table->info(Model_DbTable_Abstract::PRIMARY);
		$primaryValues = array_filter(array_intersect_key($data, array_flip($primary)));
		if (count($primaryValues) != count($primary)) {
			$row = $table->createRow($data);
		}
		else {
			$rowSet = call_user_func_array(array($table, 'find'), $primaryValues);
			if ($rowSet instanceOf Zend_Db_Table_Rowset_Abstract && count($rowSet->toArray())>0 ) {
				$row = $rowSet->current();
				$row->setFromArray($data);
			}
			else {
				$row = $table->createRow($data);
			}
		}
		return $row;
	}
}

