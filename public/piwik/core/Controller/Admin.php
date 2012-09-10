<?php
/**
 * Piwik - Open source web analytics
 * 
 * @link http://piwik.org
 * @license http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @version $Id: Admin.php 6325 2012-05-26 21:08:06Z SteveG $
 * 
 * @category Piwik
 * @package Piwik
 */

/**
 * Parent class of all plugins Controllers with admin functions
 * 
 * @package Piwik
 */
abstract class Piwik_Controller_Admin extends Piwik_Controller
{
	/**
	 * Set the minimal variables in the view object
	 * Extended by some admin view specific variables
	 * 
	 * @param Piwik_View  $view
	 */
	protected function setBasicVariablesView($view)
	{
		parent::setBasicVariablesView($view);

		$view->currentAdminMenuName = Piwik_GetCurrentAdminMenuName();

		$view->enableFrames = Piwik_Config::getInstance()->General['enable_framed_settings'];
		if(!$view->enableFrames)
		{
			$view->setXFrameOptions('sameorigin');
		}
	}
}
