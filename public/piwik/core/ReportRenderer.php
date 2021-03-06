<?php
/**
 * Piwik - Open source web analytics
 * 
 * @link http://piwik.org
 * @license http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @version $Id: ReportRenderer.php 6727 2012-08-13 20:26:46Z JulienM $
 * 
 * @category Piwik
 * @package Piwik
 */

/**
 * A Report Renderer produces user friendly renderings of any given Piwik report.
 * All new Renderers must be copied in ReportRenderer and added to the $availableReportRenderers.
 *
 * @package Piwik
 * @subpackage Piwik_ReportRenderer
 */
abstract class Piwik_ReportRenderer
{
	const DEFAULT_REPORT_FONT = 'dejavusans';
	const REPORT_TEXT_COLOR = "68,68,68";
	const REPORT_TITLE_TEXT_COLOR = "126,115,99";
	const TABLE_HEADER_BG_COLOR = "228,226,215";
	const TABLE_HEADER_TEXT_COLOR = "37,87,146";
	const TABLE_CELL_BORDER_COLOR =  "231,231,231";
	const TABLE_BG_COLOR = "249,250,250";

	const HTML_FORMAT = 'html';
	const PDF_FORMAT = 'pdf';

	static private $availableReportRenderers = array(
		self::PDF_FORMAT,
		self::HTML_FORMAT,
	);

	protected $renderImageInline = false;

	/**
	 * Return the ReportRenderer associated to the renderer type $rendererType
	 *
	 * @throws exception If the renderer is unknown
	 * @param string $rendererType
	 * @return Piwik_ReportRenderer
	 */
	static public function factory($rendererType)
	{
		$name = ucfirst(strtolower($rendererType));
		$className = 'Piwik_ReportRenderer_' . $name;

		try {
			Piwik_Loader::loadClass($className);
			return new $className;
		} catch(Exception $e) {

			@header('Content-Type: text/html; charset=utf-8');

			throw new Exception(
				Piwik_TranslateException(
					'General_ExceptionInvalidReportRendererFormat',
					array($name, implode(', ', self::$availableReportRenderers))
				)
			);
		}
	}

	/**
	 * Currently only used for HTML reports.
	 * When sent by mail, images are attached to the mail: renderImageInline = false
	 * When downloaded, images are included base64 encoded in the report body: renderImageInline = true
	 *
	 * @param boolean $renderImageInline
	 */
	public function setRenderImageInline($renderImageInline)
	{
		$this->renderImageInline = $renderImageInline;
	}

	/**
	 * Initialize locale settings.
	 * If not called, locale settings defaults to 'en'
	 *
	 * @param string $locale
	 */
	abstract public function setLocale($locale);

	/**
	 * Save rendering to disk
	 *
	 * @param string $filename without path & without format extension
	 * @return string path of file
	 */
	abstract public function sendToDisk($filename);

	/**
	 * Send rendering to browser with a 'download file' prompt
	 *
	 * @param string $filename without path & without format extension
	 */
	abstract public function sendToBrowserDownload($filename);

	/**
	 * Output rendering to browser
	 *
	 * @param string $filename without path & without format extension
	 */
	abstract public function sendToBrowserInline($filename);

	/**
	 * Generate the first page.
	 *
	 * @param string $websiteName
	 * @param string $prettyDate formatted date
	 * @param string $description
	 * @param array  $reportMetadata metadata for all reports
	 */
	abstract public function renderFrontPage($websiteName, $prettyDate, $description, $reportMetadata);

	/**
	 * Render the provided report.
	 * Multiple calls to this method before calling outputRendering appends each report content.
	 *
	 * @param array $processedReport @see Piwik_API_API::getProcessedReport()
	 */
	abstract public function renderReport($processedReport);

	/**
	 * Append $extension to $filename
	 *
	 * @static
	 * @param  $filename
	 * @param  $extension
	 * @return filename with extension
	 */
	protected static function appendExtension($filename, $extension)
	{
		return $filename.".".$extension;
	}

	/**
	 * Return $filename with temp directory and delete file
	 *
	 * @static
	 * @param  $filename
	 * @return string path of file in temp directory
	 */
	protected static function getOutputPath($filename)
	{
		$outputFilename = PIWIK_USER_PATH . '/tmp/assets/' . $filename;
		@chmod($outputFilename, 0600);
		@unlink($outputFilename);
		return $outputFilename;
	}

	protected static function writeFile($filename, $extension, $content)
	{
		$filename = self::appendExtension($filename, $extension);
		$outputFilename = self::getOutputPath($filename);

		$emailReport = @fopen($outputFilename, "w");

		if (!$emailReport) {
			throw new Exception ("The file : " . $outputFilename . " can not be opened in write mode.");
		}

		fwrite($emailReport, $content);
		fclose($emailReport);

		return $outputFilename;
	}

	protected static function sendToBrowser($filename, $extension, $contentType, $content)
	{
		$filename = Piwik_ReportRenderer::appendExtension($filename, $extension);

		Piwik::overrideCacheControlHeaders();
		header('Content-Description: File Transfer');
		header('Content-Type: ' . $contentType);
		header('Content-Disposition: attachment; filename="'.str_replace('"', '\'', basename($filename)).'";');
		header('Content-Length: '.strlen($content));

		echo $content;
	}

	protected static function inlineToBrowser($contentType, $content)
	{
		header('Content-Type: ' . $contentType);
		echo $content;
	}

	/**
	 * Convert a dimension-less report to a multi-row two-column data table
	 *
	 * @static
	 * @param  $reportMetadata array
	 * @param  $report Piwik_DataTable
	 * @param  $reportColumns array
	 * @return array Piwik_DataTable $report & array $columns
	 */
	protected static function processTableFormat($reportMetadata, $report, $reportColumns)
	{
		$finalReport = $report;
		if(empty($reportMetadata['dimension']))
		{
//			var_dump($report);
			$simpleReportMetrics = $report->getFirstRow();
			if($simpleReportMetrics)
			{
				$finalReport = new Piwik_DataTable_Simple();
				foreach($simpleReportMetrics->getColumns() as $metricId => $metric)
				{
					$newRow = new Piwik_DataTable_Row();
					$newRow->addColumn("label", $reportColumns[$metricId]);
					$newRow->addColumn("value", $metric);
					$finalReport->addRow($newRow);
				}
			}

			$reportColumns = array(
				'label' => Piwik_Translate('General_Name'),
				'value' => Piwik_Translate('General_Value'),
			);
		}

		return array(
			$finalReport,
			$reportColumns,
		);
	}

	public static function getStaticGraph($imageGraphUrl, $width, $height) {

		$request = new Piwik_API_Request(
			$imageGraphUrl .
			'&outputType='.Piwik_ImageGraph_API::GRAPH_OUTPUT_PHP.
			'&format=original&serialize=0'.
			'&filter_truncate='.
			'&width='.$width.
			'&height='.$height
		);

		try {
			$imageGraph = $request->process();

			// Get image data as string
			ob_start();
			imagepng($imageGraph);
			$imageGraphData = ob_get_contents();
			ob_end_clean();
			imagedestroy($imageGraph);

			return $imageGraphData;

		} catch(Exception $e) {
			throw new Exception("ImageGraph API returned an error: ".$e->getMessage()."\n");
		}
	}
}
