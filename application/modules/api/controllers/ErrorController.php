<?php

require_once("AbstractController.php");

class Api_ErrorController extends Api_AbstractController {

	public function errorAction() {
		$errors = $this->_getParam('error_handler');
		$this->notAllowedAction();
		$this->view->error = $errors->exception->getMessage();
	}
	

}

