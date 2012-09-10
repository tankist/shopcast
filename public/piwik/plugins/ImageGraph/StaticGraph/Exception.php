<?php
/**
 * Piwik - Open source web analytics
 *
 * @link http://piwik.org
 * @license http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @version $Id: Exception.php 6112 2012-03-25 10:04:17Z JulienM $
 *
 * @category Piwik_Plugins
 * @package Piwik_ImageGraph_StaticGraph
 */


/**
 *
 * @package Piwik_ImageGraph_StaticGraph
 */
class Piwik_ImageGraph_StaticGraph_Exception extends Piwik_ImageGraph_StaticGraph
{
	const MESSAGE_RIGHT_MARGIN = 5;

	private $exception;

	public function setException($exception)
	{
		$this->exception = $exception;
	}

	protected function getDefaultColors()
	{
		return array();
	}

	public function renderGraph()
	{
		$this->pData = new pData();

		$message = $this->exception->getMessage();
		$messageWidthHeight = $this->getTextWidthHeight($message, false);
		$messageHeight = $messageWidthHeight[self::HEIGHT_KEY];

		if($this->width == null)
		{
			$this->width = $messageWidthHeight[self::WIDTH_KEY] + self::MESSAGE_RIGHT_MARGIN;
		}

		if($this->height == null)
		{
			$this->height = $messageHeight;
		}

		$this->initpImage();

		$this->pImage->drawText(
			0,
			$messageHeight,
			$message
		);
	}
}
