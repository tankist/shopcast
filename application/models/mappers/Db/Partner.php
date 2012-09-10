<?php
class Model_Mapper_Db_Partner extends Model_Mapper_Db_Abstract {
	
	const TABLE_NAME = 'partners';
	
	protected $_mapperTableName = self::TABLE_NAME;
	
	
	public function getDomainsByPartnerId($parnner_id) {
		$parnnerTable = self::_getTableByName('stores');
		$stores = $parnnerTable->fetchAllByPartnerId((int)$parnner_id);
		$domains = array();
		foreach ($stores as $store) {
			$domains[] = $store['domain'];
		}
		
		return $domains;
	}

/*	public function getProductsCountByPartnerId($partnerId, $stores='', $categories='', $designers='', $sale=false, $search='', $isActiveStore=true) {	
		$db = Zend_Registry::get('database');
		
		$categorySearch = false;
		$designerSearch = false;

		$where = 'p.`id`="'.$partnerId.'" AND pr.id=s.`partner_id` AND s.`id`=p.`store_id`'.($isActiveStore?' AND s.`state`="active"':'').' AND p.`status` in ("active", "sold_out", "coming_soon")'.strval(strlen($search)>0?(trim($search)!=''?' AND (p.`name` LIKE "%'.trim($search).'%" OR p.`descr` LIKE "%'.trim($search).'%")':' AND FALSE'):'');
		
		if (strlen($stores) > 0 || strlen($categories) > 0 || strlen($designers) > 0 || $sale) {
			$whereArr = array();
			if (strlen($stores) > 0) {
				$storesArr = explode(',',$stores);
				if (sizeof($storesArr) == 1) {
					$whereArr[] = is_numeric(trim($stores))?'s.`id` = "'.trim($stores).'"':'s.`domain` = "'.trim($stores).'"';
				} else {
					$isNumeric = true;
					foreach ($storesArr as $store) {
						if (!is_numeric(trim($store))) {
							$isNumeric = false;
							break;		
						}
					}
					$whereArr[] = $isNumeric?'s.`id` IN ('.implode(',', array_map(create_function('$elem', 'return trim($elem);'),$storesArr)).')':'s.`domain` IN ('.implode(',', array_map(create_function('$elem', 'return \'"\'.trim($elem).\'"\';'),$storesArr)).')';
				}
			}
			if (strlen($designers) > 0) {
				$designerSearch = true;
				$designersArr = explode(',',$designers);
				if (sizeof($designersArr) == 1) {
					$whereArr[] = 'pd.`designer_id` = "'.$designers.'" AND pd.`product_id`=p.`id`';
				} else {
					$whereArr[] = 'pd.`designer_id` IN ('.$designers.') AND pd.`product_id`=p.`id`';
				}
			}
			if (strlen($categories) > 0) {
				$categorySearch = true;
				$categoriesArr = explode(',',$categories);
				if (sizeof($categoriesArr) == 1) {
					$whereArr[] = 'cp.`common_category_id` = "'.$categories.'" AND  cp.`product_id`=p.`id`';
				} else  {
					$whereArr[] = 'cp.`common_category_id` IN ('.$categories.') AND cp.`product_id`=p.`id`';
				}
			}
			if ($sale) {
				$whereArr[] = 'p.`sale` > 0';
			}
			$where .= ' AND ' . implode(' AND ', $whereArr);
		}

		$from = array('pr' => 'parnter', 'p' => 'product', 's' => 'store');
		if ($categorySearch) {
			$from['cp'] = 'common_category_product';
		}
		if ($designerSearch) {
			$from['pd'] = 'product_designer';
		}
		
		//$prodTable = self::_getTableByName(self::TABLE_NAME);
		//$prodTable = new Zend_Db();
		
		
		$select = $prodTable->select()
		           ->from($from,
                    array('cnt', 'count(DISTINCT p.id)'))
                    ->where($where);
		$result = $prodTable->fetchRow($select);		
		
		return $result->cnt;
	}
*/	
	

	public function getProductsCountByPartnerId($partnerId, $stores='', $categories='', $designers='', $sale=false, $search='', $isActiveStore=true) {	
		$db = Zend_Registry::get('database');
		
		$categorySearch = false;
		$designerSearch = false;

		$search = strlen($search)>0?(trim($search)!=''?' AND (p.`name` LIKE "%'.trim($search).'%" OR p.`descr` LIKE "%'.trim($search).'%")':' AND FALSE'):'';
		$where = ' WHERE s.`partner_id`="'.$partnerId.'" AND s.`id`=p.`store_id`'.($isActiveStore?' AND s.`state`="active"':'').' AND p.`status` in ("active", "sold_out", "coming_soon")'.$search;
		if (strlen($stores) > 0 || strlen($categories) > 0 || strlen($designers) > 0 || $sale) {
			$whereArr = array();
			if (strlen($stores) > 0) {
				$storesArr = explode(',',$stores);
				if (sizeof($storesArr) == 1) {
					$whereArr[] = is_numeric(trim($stores))?'s.`id` = "'.trim($stores).'"':'s.`domain` = "'.trim($stores).'"';
				} else {
					$isNumeric = true;
					foreach ($storesArr as $store) {
						if (!is_numeric(trim($store))) {
							$isNumeric = false;
							break;		
						}
					}
					$whereArr[] = $isNumeric?'s.`id` IN ('.implode(',', array_map(create_function('$elem', 'return trim($elem);'),$storesArr)).')':'s.`domain` IN ('.implode(',', array_map(create_function('$elem', 'return \'"\'.trim($elem).\'"\';'),$storesArr)).')';
				}
			}
			if (strlen($designers) > 0) {
				$designerSearch = true;
				$designersArr = explode(',',$designers);
				if (sizeof($designersArr) == 1) {
					$whereArr[] = 'pd.`designer_id` = "'.$designers.'" AND pd.`product_id`=p.`id`';
				} else {
					$whereArr[] = 'pd.`designer_id` IN ('.$designers.') AND pd.`product_id`=p.`id`';
				}
			}
			if (strlen($categories) > 0) {
				$categorySearch = true;
				$categoriesArr = explode(',',$categories);
				if (sizeof($categoriesArr) == 1) {
					$whereArr[] = 'cp.`common_category_id` = "'.$categories.'" AND  cp.`product_id`=p.`id`';
				} else  {
					$whereArr[] = 'cp.`common_category_id` IN ('.$categories.') AND cp.`product_id`=p.`id`';
				}
			}
			if ($sale) {
				$whereArr[] = 'p.`sale` > 0';
			}
			$where .= ' AND ' . implode(' AND ', $whereArr);
		}

		
		$sql = 'SELECT count(DISTINCT p.id) as cnt FROM `product` as p, `store` as s'.strval($categorySearch?', `common_category_product` as cp':'').strval($designerSearch?', `product_designer` as pd':'').$where;
		
        $query = $db->query($sql);
        $result = $query->fetchAll();
//		var_dump($result);
//		die();
		return $result[0]['cnt'];
	}

	public function searchProductsByPartnerId($partnerId, $from = 0, $count = 0, $order='', $stores='', $categories='', $designers='', $sale=false, $search='', $isActiveStore=true) {	
		$db = Zend_Registry::get('database');
		
		$categorySearch = false;
		$designerSearch = false;
		$search = strlen($search)>0?(trim($search)!=''?' AND (p.`name` LIKE "%'.trim($search).'%" OR p.`descr` LIKE "%'.trim($search).'%")':' AND FALSE'):'';
		$where = ' WHERE s.`partner_id`="'.$partnerId.'" AND p.`status` in ("active", "sold_out", "coming_soon") AND p.`store_id` = s.`id` '.($isActiveStore?' AND s.`state`="active"':'').$search;
		if (strlen($stores) > 0 || strlen($categories) > 0 || strlen($designers) > 0 || $sale) {
			$whereArr = array();
			if (strlen($stores) > 0) {
				$storesArr = explode(',',$stores);
				if (sizeof($storesArr) == 1) {
					$whereArr[] = is_numeric(trim($stores))?'s.`id` = "'.trim($stores).'"':'s.`domain` = "'.trim($stores).'"';
				} else {
					$isNumeric = true;
					foreach ($storesArr as $store) {
						if (!is_numeric(trim($store))) {
							$isNumeric = false;
							break;		
						}
					}
					$whereArr[] = $isNumeric?'s.`id` IN ('.implode(',', array_map(create_function('$elem', 'return trim($elem);'),$storesArr)).')':'s.`domain` IN ('.implode(',', array_map(create_function('$elem', 'return \'"\'.trim($elem).\'"\';'),$storesArr)).')';
				}
			}
			if (strlen($designers) > 0) {
				$designerSearch = true;
				$designersArr = explode(',',$designers);
				if (sizeof($designersArr) == 1) {
					$whereArr[] = 'pd.`designer_id` = "'.$designers.'" AND pd.`product_id`=p.`id`';
				} else {
					$whereArr[] = 'pd.`designer_id` IN ('.$designers.') AND pd.`product_id`=p.`id`';
				}
			}
			if (strlen($categories) > 0) {
				$categorySearch = true;
				$categoriesArr = explode(',',$categories);
				if (sizeof($categoriesArr) == 1) {
					$whereArr[] = 'cp.`common_category_id` = "'.$categories.'" AND  cp.`product_id`=p.`id`';
				} else  {
					$whereArr[] = 'cp.`common_category_id` IN ('.$categories.') AND cp.`product_id`=p.`id`';
				}
			}
			if ($sale) {
				$whereArr[] = 'p.`sale` > 0';
			}
			$where .= ' AND ' . implode(' AND ', $whereArr);
		}
		if (strlen($order) > 0) {
			$order = ' ORDER BY '.$order;	
		} else {
			$order = ' ORDER BY `add_dt` DESC';	
		} 
		$limit = '';
		if ($count > 0) {
			$limit = ' LIMIT '.strval($from > 0 ? $from.', ' : '').$count;
		}
		//throw new SoapFault('Server', 'SELECT DISTINCT p.*, s.`domain` FROM `'.TAB_PRODUCT.'` as p, `'.TAB_STORE.'` as s'.strval($categorySearch?', `'.TAB_COMMON_CATEGORY_PRODUCT.'` as cp':'').strval($designerSearch?', `'.TAB_PRODUCT_DESIGNER.'` as pd':'').$where.$order.$limit);
		$sql = 'SELECT DISTINCT p.*, s.`domain` FROM `product` as p, `store` as s'.strval($categorySearch?', `common_category_product` as cp':'').strval($designerSearch?', `product_designer` as pd':'').$where.$order.$limit;
        $query = $db->query($sql);
        $products = $query->fetchAll();

		$result = array();
		foreach($products as $product) {
			//$categories = array_map(create_function('$elem', 'return $elem["name"];'), self::getProductCategories($product['id']));
			$resProduct = array('id' => $product['id'], 'store' => $product['domain'], 'name' => htmlspecialchars(str_replace('<br>', ' - ', $product['name'])), /*'categories' => implode(',', $categories),*/ 'description' => htmlspecialchars($product['descr']), 'price' => $product['price'], 'status' => $product['status'], 'image' => 'http://'.$product['domain'].'.'.ROOT_HOST_NAME.STORE_URL.'/'.floor($product['store_id'] / 1000).'/'.$product['store_id'].'/products/'.$product['id'].'/'.ZOOM_PREVIEW_PREFIX.$product['thumb_id'].'.'.$product['thumb_ext'], 'thumb' => 'http://'.$product['domain'].'.'.ROOT_HOST_NAME.STORE_URL.'/'.floor($product['store_id'] / 1000).'/'.$product['store_id'].'/products/'.$product['id'].'/'.THUMBNAIL_PREFIX.$product['thumb_id'].'.'.$product['thumb_ext'],/* 'mthumb' => 'http://'.$product['domain'].'.'.ROOT_HOST_NAME.STORE_URL.'/'.floor($product['store_id'] / 1000).'/'.$product['store_id'].'/products/'.$product['id'].'/'.MINI_THUMBNAIL_PREFIX.$product['thumb_id'].'.'.$product['thumb_ext'], *//*'designer' => $product['designer'],*/ 'add_date' => $product['add_dt']);
			$resProduct['sale'] = $product['sale'] > 0 && $product['sale'] < 100?1:0;
			if ($resProduct['sale']) {
				$resProduct['original_price'] = sprintf("%01.2f", $product['price'] * 100 / (100 - $product['sale']));
				$resProduct['sale_price'] =  $resProduct['price'];
				$resProduct['save_price'] = sprintf("%01.2f", $resProduct['original_price'] - $resProduct['sale_price']);
				$resProduct['save_percent'] = $product['sale'];
			}
			
			$result[] = $resProduct;
		}
		return $result;
	}
	
	public function getDesignersByPartnerId	($partnerId, $withProducts=false, $storeDomain='') {
		$data = array('global'=>array(), 'local' => array());
		if ($partnerId > 0) {
			$db = Zend_Registry::get('database');
			$query = $db->query('SELECT d.`id`, d.`name`, d.`type`, count(pd.`product_id`) as prodcnt '.
	    		'FROM `designer` as d '.
	    		($withProducts?'':'LEFT ').'JOIN `product_designer` as pd ON pd.`designer_id` = d.`id` '.
	    		($withProducts?'JOIN `product` as p ON p.`id`=pd.`product_id` JOIN `store` as s ON s.`id`=p.`store_id`':'').
	    		'WHERE d.`partner_id`='.$partnerId.($withProducts?' AND s.`state`="active" AND p.`status` in ("active", "sold_out", "coming_soon")':'').($withProducts && strlen($storeDomain)>0?' AND s.`domain`="'.$storeDomain.'"':'').
	    		' GROUP BY d.`id` ORDER BY d.`name` ASC'
    		);
    		$rows = $query->fetchAll();
    		foreach ($rows as $row) {
    			$data[$row['type']][$row['id']] = array('id' => $row['id'], 'name' => $row['name'], 'prodcnt' => $row['prodcnt']);
    		}
		}
		
		return $data;
	}

	public function addLocalDesigner($partnerId, $name) {
		if ($partnerId > 0) {
			$db = Zend_Registry::get('database');
			$newName = trim($name);
			
			$query = $db->query('SELECT id '.
	    		'FROM `designer` '.
	    		'WHERE `name`="'.$newName.'" AND `type`="local" AND `partner_id`="'.$partnerId.'"');
	    	$rows = $query->fetchAll();
			
			if (!$rows[0]['id']) {
				return $db->query('INSERT INTO `designer` (`partner_id`, `name`, `type`) VALUES ('.$partnerId.', "'.$newName.'", "local")');
			}
		}
		return false;
	}	
		
}

