<?php

class Admin_ProfileController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }

    public function addAction()
    {
        $request = $this->getRequest();

        $profileForm = new Admin_Form_StoreProfile(array(
            'name' => 'profile',
            'action' => '/admin/store/save-profile',
            'countries' => Model_Sellcast::getCountriesArray()
        ));
        $image = $this->_getDataFromSession('profileImagesPath');
        if ($image) {
            $data = array('logo' => $image['name']);
            $profileForm->populate($data);
        }

        $profileForm->prepareDecorators();

        $profileImageForm = new Admin_Form_ProfileImage(array(
            'name' => 'profileImage',
            'action' => '/admin/store/add-image',
            'imagesPath' => ''
        ));

        $this->view->form = $profileForm;
        $this->view->formImage = $profileImageForm;
        $this->view->getHelper('HeadScript')
            ->appendFile('/js/add-image.js');
    }

    public function saveAction()
    {
        $request = $this->getRequest();

        $profileForm = new Admin_Form_StoreProfile(array(
            'name' => 'profile',
            'action' => '/admin/store/save',
            'countries' => Model_Sellcast::getCountriesArray()
        ));
        $profileForm->prepareDecorators();

        if ($store_id = $this->_store->getId()) {
            $store = Model_Sellcast::getStoreById($store_id);
        } else {
            $profileForm->passwd->setRequired(true);
        }

        if ($request->isPost() && $profileForm->isValid($request->getPost())) {
            $data = $profileForm->getValues();

            if ($store) {
                if ($store->payout_info['paypal']['email'] != $data['paypal_email']) {
                    $data['payout_info'] = array('paypal' =>
                    array(
                        'email' => $data['paypal_email'],
                        'act-code' => "",
                        'confirmed' => false
                    )
                    );
                }
                unset($data['paypal_email']);
                unset($data['logo']);
                if (empty($data['passwd'])) {
                    unset($data['passwd']);
                }
                $store->populate($data);
            }
            if (empty($store_id) || !($store instanceOf Model_Store)) {
                unset($data['id']);
                $data['payout_info'] = array('paypal' =>
                array(
                    'email' => $data['paypal_email'],
                    'act-code' => "",
                    'confirmed' => flase
                )
                );
                unset($data['paypal_email']);
                $store = Model_Sellcast::createStore($data);

                $isNewStore = true;
                $path = $this->_getDataFromSession('profileImagesPath');
                if (!empty($path)) {
                    $store->logo = $path['name'];
                }
            }

            $store->id = $store->save();

            if ($isNewStore) {
                $filter = new Skaya_Filter_File_ParseFileName(array());
                $full_name = $filter->filter($store->logo);
                rename($path['path'] . $store->logo, $this->_getImagesDefaultPath($store->id) . DIRECTORY_SEPARATOR . $store->logo);

                $thumbnailPack = Model_Store::$thumbnailPack;
                foreach ($thumbnailPack as $thumb) {
                    if ($thumb['indication_type'] == 'suffix') {
                        $new_name = $full_name['name'] . '_' . $thumb['indication'];
                    } else {
                        $new_name = $thumb['indication'] . '_' . $full_name['name'];
                    }
                    rename($path['path'] . $new_name . $full_name['ext'], $this->_getImagesDefaultPath($store->id) . DIRECTORY_SEPARATOR . $new_name . $full_name['ext']);
                }
            }

            //clear filename in session
            $this->_setDataToSession('profileImagesPath');

            $this->_flashMessenger->addMessage(array('message' => 'Settings updated successfully!', 'status' => 'success'));

            $this->_redirect('/admin/store/edit');

        } else {
            $data = $profileForm->getMessages();
            foreach ($data as $field => $error) {
                $label = $profileForm->$field->getLabel();
                foreach ($error as $key => $value) {
                    $this->_flashMessenger->addMessage(array('message' => $label . ': ' . $value, 'status' => 'fail'));
                }
            }
            if (!$store_id) {
                $this->_redirect('/admin/store/add');
            } else {
                $this->_redirect('/admin/store/edit');
            }
        }
    }

    public function editAction()
    {
        $request = $this->getRequest();
        if ($store_id = $this->_store->getId()) {
            $store = Model_Sellcast::getStoreById($store_id);
            $profileForm = new Admin_Form_StoreProfile(array(
                'name' => 'profile',
                'action' => '/admin/store/save-profile',
                'countries' => Model_Sellcast::getCountriesArray()
            ));
            $profileForm->prepareDecorators();
            if (!($store instanceOf Model_Store)) {
                return $this->_forward('add');
            }
            $profileForm->populate($store->toArray());

            $profileImageForm = new Admin_Form_ProfileImage(array(
                'name' => 'profileImage',
                'action' => '/admin/store/add-image',
                'imagesPath' => ''
            ));

            $this->view->form = $profileForm;
            $this->view->formImage = $profileImageForm;
            $this->view->getHelper('HeadScript')
                ->appendFile('/js/add-image.js');
        } else {
            $this->_redirect('/admin/store/add');
        }
    }

    public function imageAction()
    {
        $request = $this->getRequest();


        if ($store_id = $this->_store->getId()) {
            $store = Model_Sellcast::getStoreById($store_id);
        } else {
            $store_id = false;
        }

        $imagesPath = $this->_getImagesDefaultPath($store_id);
        $profileForm = new Admin_Form_ProfileImage(array(
            'name' => 'profileImage',
            'action' => '/admin/store/add-image',
            'imagesPath' => $imagesPath
        ));

        if ($request->isPost() && $profileForm->isValid($request->getPost())) {
            $data = $profileForm->getValues();

            if ($store_id) {
                $store->logo = $data['image'];
                $store->save();
            } else {
                $this->_setDataToSession('profileImagesPath', array('path' => $imagesPath, 'name' => $data['image']));
            }
            $this->view->image = array('path' => $imagesPath, 'name' => $data['image']);

        } else {
            $data = $profileForm->getMessages();
        }

    }

    public function unimageAction()
    {
        $request = $this->getRequest();

        if ($store_id = $this->_store->getId()) {
            $store = Model_Sellcast::getStoreById($store_id);
            $file_name = $store->logo;
            $path = $this->_getImagesDefaultPath($store->id);
            $store->logo = null;
            $store->save();
        } else {
            $store_id = false;
            $fileArr = $this->_getDataFromSession('profileImagesPath');
            $file_name = $fileArr['name'];
            $path = $fileArr['path'];
            $this->_setDataToSession('profileImagesPath');
        }
        if (!$file_name) {
            throw new Zend_CodeGenerator_Exception('file not found');
        }
        $filter = new Skaya_Filter_File_ParseFileName(array());
        $full_name = $filter->filter($file_name);

        unlink($path . DIRECTORY_SEPARATOR . $file_name);

        $thumbnailPack = Model_Store::$thumbnailPack;
        foreach ($thumbnailPack as $thumb) {
            if ($thumb['indication_type'] == 'suffix') {
                $new_name = $full_name['name'] . '_' . $thumb['indication'];
            } else {
                $new_name = $thumb['indication'] . '_' . $full_name['name'];
            }
            unlink($path . DIRECTORY_SEPARATOR . $new_name . $full_name['ext']);
        }

    }

}