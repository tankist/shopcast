<?php

require_once("AbstractController.php");

class Admin_IndexController extends Admin_AbstractController {

	public function init() {
		/* Initialize action controller here */
	}

	public function indexAction() {
		// action body
		$this->_forward('index', 'dash');
	}
}