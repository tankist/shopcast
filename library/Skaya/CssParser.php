<?php
/*
Originally from:
http://websvn.atrc.utoronto.ca/websvn/wsvn/Atutor/trunk/docs/include/classes/cssparser.php
*/
class Skaya_CssParser {
	
	protected $_css = '';
	
	protected $_html = '';
	
	protected $_explodeSelectors = false;
	
	public function __construct($options = array()) {
		if (is_array($options)) {
			$this->setOptions($options);
		}
		$this->clear();
	}
	
	public function __destruct() {
		unset($this->_css);
	}
	
	public function setOptions(array $options) {
		foreach ($options as $key => $value) {
			$normalized = ucfirst($key);

			$method = 'set' . $normalized;
			if (method_exists($this, $method)) {
				$this->$method($value);
			}
		}
	}
	
	public function setExplodeSelectors($flag) {
		$this->_explodeSelectors = (boolean)$flag;
		return $this;
	}
	
	public function getExplodeSelectors() {
		return $this->_explodeSelectors;
	}
	
	public function clear() {
		unset($this->_css);
		$this->_css = array();
	}
	
	public function setHtml($html) {
		$this->_html = ($html != false);
	}
	
	public function setCss($css) {
		$this->_css = $css;
		return $this;
	}
	
	public function getCss() {
		return $this->_css;
	}
	
	public function add($key, $codestr) {
		$key = strtolower($key);
		$codestr = strtolower($codestr);
		if(!isset($this->_css[$key])) {
			$this->_css[$key] = array();
		}
		$codes = explode(";",$codestr);
		if(count($codes) > 0) {
			foreach($codes as $code) {
			$code = trim($code);
			list($codekey, $codevalue) = explode(":",$code,2);
			if(strlen($codekey) > 0) {
				$this->_css[$key][trim($codekey)] = trim($codevalue);
			}
			}
		}
	}
	
	public function get($key, $property) {
		$key = strtolower($key);
		$property = strtolower($property);
		
		list($tag, $subtag) = explode(":",$key);
		list($tag, $class) = explode(".",$tag);
		list($tag, $id) = explode("#",$tag);
		$result = "";
		foreach($this->_css as $_tag => $value) {
			list($_tag, $_subtag) = explode(":",$_tag);
			list($_tag, $_class) = explode(".",$_tag);
			list($_tag, $_id) = explode("#",$_tag);
			
			$tagmatch = (strcmp($tag, $_tag) == 0) | (strlen($_tag) == 0);
			$subtagmatch = (strcmp($subtag, $_subtag) == 0) | (strlen($_subtag) == 0);
			$classmatch = (strcmp($class, $_class) == 0) | (strlen($_class) == 0);
			$idmatch = (strcmp($id, $_id) == 0);
			
			if($tagmatch & $subtagmatch & $classmatch & $idmatch) {
			$temp = $_tag;
			if((strlen($temp) > 0) & (strlen($_class) > 0)) {
				$temp .= ".".$_class;
			} elseif(strlen($temp) == 0) {
				$temp = ".".$_class;
			}
			if((strlen($temp) > 0) & (strlen($_subtag) > 0)) {
				$temp .= ":".$_subtag;
			} elseif(strlen($temp) == 0) {
				$temp = ":".$_subtag;
			}
			if(isset($this->_css[$temp][$property])) {
				$result = $this->_css[$temp][$property];
			}
			}
		}
		return $result;
	}
	
	public function getSection($key) {
		$key = strtolower($key);
		
		list($tag, $subtag) = explode(":",$key);
		list($tag, $class) = explode(".",$tag);
		list($tag, $id) = explode("#",$tag);
		$result = array();
		foreach($this->_css as $_tag => $value) {
			list($_tag, $_subtag) = explode(":",$_tag);
			list($_tag, $_class) = explode(".",$_tag);
			list($_tag, $_id) = explode("#",$_tag);
			
			$tagmatch = (strcmp($tag, $_tag) == 0) | (strlen($_tag) == 0);
			$subtagmatch = (strcmp($subtag, $_subtag) == 0) | (strlen($_subtag) == 0);
			$classmatch = (strcmp($class, $_class) == 0) | (strlen($_class) == 0);
			$idmatch = (strcmp($id, $_id) == 0);
			
			if($tagmatch & $subtagmatch & $classmatch & $idmatch) {
			$temp = $_tag;
			if((strlen($temp) > 0) & (strlen($_class) > 0)) {
				$temp .= ".".$_class;
			} elseif(strlen($temp) == 0) {
				$temp = ".".$_class;
			}
			if((strlen($temp) > 0) & (strlen($_subtag) > 0)) {
				$temp .= ":".$_subtag;
			} elseif(strlen($temp) == 0) {
				$temp = ":".$_subtag;
			}
			foreach($this->_css[$temp] as $property => $value) {
				$result[$property] = $value;
			}
			}
		}
		return $result;
	}
	
	public function parseStr($str) {
		$this->clear();
		// Remove comments
		$str = $this->_removeComments($str);
		// Parse this damn csscode
		$parts = explode("}",$str);
		if(count($parts) > 0) {
			foreach($parts as $part) {
				list($keystr,$codestr) = explode("{",$part);
				$keys = ($this->getExplodeSelectors())?explode(",",trim($keystr)):array(trim($keystr));
				if(count($keys) > 0) {
					foreach($keys as $key) {
						if(strlen($key) > 0) {
							$key = str_replace(array(PHP_EOL, "\\"), "", trim($key));
							$this->add($key, trim($codestr));
						}
					}
				}
			}
		}
		return $this->_css;
	}
	
	public function parse($css) {
		$this->clear();
		if(file_exists($css)) {
			$data = file_get_contents($css);
		}
		return $this->parseStr($css);
	}
	
	public function render() {
		$result = "";
		foreach($this->_css as $key => $values) {
			$result .= $key." {" . PHP_EOL;
			foreach($values as $key => $value) {
			$result .= "    $key: $value;" . PHP_EOL;
			}
			$result .= "}" . PHP_EOL . PHP_EOL;
		}
		return $result;
	}
	
	protected function _removeComments($str) {
		return preg_replace("/\/\*(.*)?\*\//Usi", "", $str);
	}
}
?>