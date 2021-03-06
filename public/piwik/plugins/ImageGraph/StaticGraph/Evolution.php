<?php
/**
 * Piwik - Open source web analytics
 *
 * @link http://piwik.org
 * @license http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @version $Id: Evolution.php 6112 2012-03-25 10:04:17Z JulienM $
 *
 * @category Piwik_Plugins
 * @package Piwik_ImageGraph_StaticGraph
 */


/**
 *
 * @package Piwik_ImageGraph_StaticGraph
 */
class Piwik_ImageGraph_StaticGraph_Evolution extends Piwik_ImageGraph_StaticGraph_GridGraph
{

	public function renderGraph()
	{
		$this->initGridChart(
			$displayVerticalGridLines = true,
			$drawCircles = true,
			$horizontalGraph = false,
			$showTicks = true
		);

		$this->pImage->drawLineChart();
	}
}
