<?php
class Skaya_Application_Resource_Piwik extends Zend_Application_Resource_ResourceAbstract {
	public function init () {
		$options = $this->getOptions();
		if (array_key_exists('auth_token', $options)) {
			Model_Mapper_Rest_Piwik::setAuthToken($options['auth_token']);
		}
	}
}
?>
