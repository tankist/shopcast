<?php

require_once("AbstractController.php");

class Admin_DesignController extends Admin_AbstractController {
	
	protected $_cssThemeGeneratorTokenStart = '/**===Automatically genarated rules. Do not ===**/';
	protected $_cssThemeGeneratorTokenEnd = '/**===User defined rules. Do not edit these comments===**/';

	public function init() {
		$contextSwitch = $this->_helper->getHelper('contextSwitch');
		$contextSwitch
			->addActionContext('save-style', 'json')
			->addActionContext('set-layout', 'json')
			->clearHeaders('json')
			->initContext();
	}

	public function indexAction()
	{
//		$this->_forward('layout');
	}

	public function editPageAction()
	{
		// action body
	}

	public function savePageAction()
	{
		// action body
	}

	public function resetPageAction()
	{
		// action body
	}

	public function layoutAction() {
		$request = $this->getRequest();
		$layoutForm = $this->_getLayoutForm();
		
		$storeDesign = $this->_store->getDesign();
		$layoutSettings = (isset($storeDesign[Model_Store::STORE_DESIGN_SECTION_LAYOUT]))
			?$storeDesign[Model_Store::STORE_DESIGN_SECTION_LAYOUT]
			:array();
		$elementsSettings = (isset($storeDesign[Model_Store::STORE_DESIGN_SECTION_ELEMENTS]))
			?$storeDesign[Model_Store::STORE_DESIGN_SECTION_ELEMENTS]
			:array();
			
		$elementsVisibility = array();
		foreach ($elementsSettings as $_element) {
			$elementsVisibility[] = array(
				'field' => $_element['section_id'],
				'value' => (boolean)$_element['is_visible']
			);
		}
		
		$layoutForm->populate(array(
			'storeElements' => $elementsVisibility,
			'embedForm' => array(
				'width' => $this->_store->getEmbedWidth(),
				'height' => $this->_store->getEmbedHeight()
			),
			'structure' => array(
				'layoutType' => $this->_store->getLayoutType()
			)
		));
		
		$layoutForm
			->prepareDecorators()
			->addDecorators(array('FormErrors', 'Form'));
		$this->view->layoutForm = $layoutForm;
	}

	public function setLayoutAction()
	{
		$request = $this->getRequest();
		
		$layoutForm = $this->_getLayoutForm();
		if ($request->isPost() && $layoutForm->isValid($request->getPost())) {
			$values = $layoutForm->getValues(true);
		}
		
		$this->_store->setDesign(null,$values);
		$this->_store->save();
	}

	public function setEmbedAction() {
		// action body
	}

	public function resetEmbedAction() {
		// action body
	}

	public function cssAction() {
		
	}

	public function saveCssAction() {
		// action body
	}

	public function styleAction() {
		$options = $this->_getStoreOptions();
		
		$cssForm = new Admin_Form_StoreStyle(array(
			'name' => 'designStyle',
			'action' => '/admin/design/save-style'
		));
		if (isset($options['style']['storeLayoutElements'])) {
			$cssForm->setStoreLayoutElements($options['style']['storeLayoutElements']);
		}
		
		$css = $this->_getStoreCss();
		$cssRules = $this->_parseCss($css);
		if (!empty($cssRules['auto'])) {
			$cssValues = array();
			foreach ($cssRules['auto'] as $key => $value) {
				$_v = array_values($value);
				if (array_key_exists('color', $_v[0])) {
					$cssValues[$key] = $_v[0]['color'];
				}
				elseif (array_key_exists('background-color', $_v[0])) {
					$cssValues[$key] = $_v[0]['background-color'];
				}
				if ($cssValues[$key][0] == '#') $cssValues[$key] = substr($cssValues[$key], 1);
			}
			$cssForm->populate(array(
				'color' => $cssValues
			));
		}
		
		$cssForm->prepareDecorators();
		$this->view->styleForm = $cssForm;
	}

	public function saveStyleAction() {
		$request = $this->getRequest();
		$options = $this->_getStoreOptions();
		$cssForm = new Admin_Form_StoreStyle(array(
			'name' => 'designStyle'
		));
		if (isset($options['style']['storeLayoutElements'])) {
			$cssForm->setStoreLayoutElements($options['style']['storeLayoutElements']);
		}
		if ($request->isPost() && $cssForm->isValid($request->getPost())) {
			$cssValues = $cssForm->getValues();
			$css = $this->_getStoreCss();
			$cssRules = $this->_parseCss($css);
			foreach ($cssRules['auto'] as $id => &$cssRule) {
				foreach ($cssRule as $selector => &$rules) {
					if (array_key_exists('color', $rules)) {
						$rules['color'] = '#' . strtoupper($cssValues['color'][$id]);
					}
					elseif (array_key_exists('background-color', $rules)) {
						$rules['background-color'] = '#' . strtoupper($cssValues['color'][$id]);
					}
				}
			}
			$this->_setStoreCss($this->_renderCss($cssRules));
		}
	}

	public function saveHeaderImageAction() {
		// action body
	}

	public function deleteHeaderImageAction() {
		// action body
	}
	
	protected function _getLayoutForm() {
		return new Admin_Form_DesignLayout(array(
			'name' => 'designLayout',
			'storeLayoutElements' => array(
				array(
					'field' => 'header',
					'title' => 'Header'
				),
				array(
					'field' => 'search_box',
					'title' => 'Search Box'
				),
				array(
					'field' => 'recent_products',
					'title' => 'Recently Viewed Products'
				),
				array(
					'field' => 'top_selling',
					'title' => 'Top Selling Products'
				),
				array(
					'field' => 'categories',
					'title' => 'Categories'
				),
			),
			'productsPerPage' => array(
				10 => 10,
				15 => 15,
				20 => 20
			),
			'productsOrder' => array(
				'price'=>'price'
			),
			'action' => '/admin/design/set-layout'
		));
	}
	
	protected function _getStoreOptions() {
		$bootstrap = $this->getInvokeArg('bootstrap');
		return $bootstrap->getOption('store');
	}
	
	protected function _getStoreDefaultsPath() {
		$storeSettings = $this->_getStoreOptions();
		$path = (isset($storeSettings) && isset($storeSettings['defaultsPath']))?$storeSettings['defaultsPath']:'';
		return realpath($path);
	}
	
	protected function _getStoreUploadsPath() {
		if (!$this->_store instanceOf Model_Store) {
			return false;
		}
		$storeSettings = $this->_getStoreOptions();
		$path = $storeSettings['uploadsPath'] . DIRECTORY_SEPARATOR . $this->_store->id;
		return $path;
	}
	
	protected function _getStoreCss() {
		$storeSettings = $this->_getStoreOptions();
		$cssThemeFileName = $storeSettings['themeCssFilename'];
		$storeCss = realpath($this->_getStoreUploadsPath()) . DIRECTORY_SEPARATOR . $cssThemeFileName;
		if (is_file($storeCss) && is_readable($storeCss)) {
			return file_get_contents($storeCss);
		}
		else {
			$storeCss = $this->_getStoreDefaultsPath() . DIRECTORY_SEPARATOR . $cssThemeFileName;
			if (is_readable($storeCss)) {
				return file_get_contents($storeCss);
			}
		}
		return false;
	}
	
	protected function _setStoreCss($css) {
		$storeSettings = $this->_getStoreOptions();
		$cssThemeFileName = $storeSettings['themeCssFilename'];
		$storeCssDirectory = $this->_getStoreUploadsPath();
		if (!is_dir($storeCssDirectory)) {
			@mkdir($storeCssDirectory, 0777, true);
		}
		$storeCss = realpath($storeCssDirectory) . DIRECTORY_SEPARATOR . $cssThemeFileName;
		if (is_file($storeCss) && is_writable($storeCss)) {
			@unlink($storeCss);
		}
		file_put_contents($storeCss, $css);
		@chmod($storeCss, 0777);
	}
	
	protected function _parseCss($css) {
		$generatorTokenStartPos = strpos($css, $this->_cssThemeGeneratorTokenStart);
		$generatorTokenEndPos = strpos($css, $this->_cssThemeGeneratorTokenEnd);
		
		$cssData = array();
		if ($generatorTokenStartPos !== false) {
			$cssStartPos = $generatorTokenStartPos + strlen($this->_cssThemeGeneratorTokenStart);
			$cssAuto = trim(substr($css, $cssStartPos, $generatorTokenEndPos - $cssStartPos));
			$cssData['auto'] = array();
		}
		
		if ($generatorTokenEndPos !== false) {
			$cssData['user'] = trim(substr($css, $generatorTokenEndPos + strlen($this->_cssThemeGeneratorTokenEnd)));
		}
		
		$parser = new Skaya_CssParser(array(
			'html' => false
		));
		$cssAutoDataSections = preg_split('$/\*.*?@gui\s+(.*?)\*/$i', $cssAuto);
		if (preg_match_all('$/\*.*?@gui\s+(.*?)\*/$i', $cssAuto, $m)) {
			array_shift($cssAutoDataSections);
			$cssAutoDataSections = array_values($cssAutoDataSections);
			$cssAutoDataSectionNames = $m[1];
			
			$keyFilter = new Zend_Filter();
			$keyFilter
				->addFilter(new Zend_Filter_StringTrim())
				->addFilter(new Zend_Filter_Word_SeparatorToSeparator(' ', '_'))
				->addFilter(new Zend_Filter_StringToLower());
			
			for ($i = 0;$i<count($cssAutoDataSectionNames);$i++) {
				$sectionName = $keyFilter->filter($cssAutoDataSectionNames[$i]);
				$cssData['auto'][$sectionName] = $parser->parseStr($cssAutoDataSections[$i]);
			}
		}
		
		return $cssData;
	}
	
	protected function _renderCss($cssData) {
		$parser = new Skaya_CssParser(array(
			'html' => false
		));
		$css = $this->_cssThemeGeneratorTokenStart . PHP_EOL . PHP_EOL;
		if (!empty($cssData['auto'])) {
			$keyFilter = new Zend_Filter();
			$keyFilter
				->addFilter(new Zend_Filter_StringTrim())
				->addFilter(new Zend_Filter_Word_SeparatorToSeparator('_', ' '));
			
			foreach ($cssData['auto'] as $section_id => $rules) {
				$section_id = ucwords($keyFilter->filter($section_id));
				$css .= "/* @gui $section_id */" . PHP_EOL . PHP_EOL;
				$css .= $parser->setCss($rules)->render() . PHP_EOL . PHP_EOL;
			}
		}
		$css .= $this->_cssThemeGeneratorTokenEnd . PHP_EOL . PHP_EOL;
		if (!empty($cssData['user'])) {
			$css .= $cssData['user'];
		}
		return $css;
	}
}