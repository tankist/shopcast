<?php

class Admin_CategoriesController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function saveAction()
    {
        $request = $this->getRequest();
        $categoryBlob = $request->getPost('category');
        try {
            if (empty($categoryBlob['name'])) {
                throw new Exception('Provided name is null or empty');
            }
            if (!empty($categoryBlob['id'])) {
                $category = $this->_store->getCategoryById($categoryBlob['id']);
                $category->populate($categoryBlob);
                $category->save();
            } else {
                $category = Model_Sellcast::createCategory(array(
                    'store_id' => $this->_store->getId(),
                    'name' => $categoryBlob['name']
                ));
                if ($this->_store->hasCategory($category)) {
                    throw new Exception('The following category is already exists');
                }
                $this->_store->addCategory($category);
            }
            $this->view->category = $category->toArray();
        } catch (Exception $e) {
            $this->view->error = $e->getMessage();
        }
    }

    public function deleteAction()
    {
        $request = $this->getRequest();
        $category_id = $request->getPost('category_id');
        try {
            $category = $this->_store->getCategoryById($category_id);
            $category->delete();
            $this->view->result = true;
        } catch (Exception $e) {
            $this->view->error = $e->getMessage();
        }
    }

    public function reorderAction()
    {
        $request = $this->getRequest();
        $categoryBlob = $request->getPost('categories');
        if (is_array($categoryBlob)) {
            $categoryBlob = array_map('intval', $categoryBlob);
        }
        try {
            $order = 1;
            $storeCategories = $this->_store->getCategories();
            foreach ($storeCategories as /** @var Model_Category **/
                     $category) {
                $category->displayOrder = array_search($category->id, $categoryBlob) + 1;
                $category->save();
            }
            $this->view->categories = $categoryBlob;
        } catch (Exception $e) {
            $this->view->error = $e->getMessage();
        }
    }


}







