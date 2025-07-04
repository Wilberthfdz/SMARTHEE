<?php
/**
* 2007-2018 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2018 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

use PrestaShop\PrestaShop\Core\Module\WidgetInterface;

include_once(_PS_MODULE_DIR_.'wbimgleft/WbHomeLeft.php');

class WbImgLeft extends Module implements WidgetInterface
{
    protected $html = '';
    protected $default_width = 779;
    protected $default_speed = 5000;
    protected $default_pause_on_hover = 1;
    protected $default_wrap = 1;
    protected $templateFile;

    public function __construct()
    {
        $this->name = 'wbimgleft';
        $this->tab = 'front_office_features';
        $this->version = '2.0.0';
        $this->author = 'Webibazaar';
        $this->need_instance = 0;
        $this->secure_key = Tools::encrypt($this->name);
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->getTranslator()->trans('WB left banner', array(
            ), 'Modules.Imgleft.Admin');
        $this->description = $this->getTranslator()->trans('Adds an left banner to your site.', array(
            ), 'Modules.Imgleft.Admin');
        $this->ps_versions_compliancy = array('min' => '1.7.1.0', 'max' => _PS_VERSION_);

        $this->templateFile = 'module:wbimgleft/views/templates/hook/slider.tpl';
        $this->module_key = 'bfa8064b724465caa33c75824aadaa16';
    }

    /**
     * @see Module::install()
     */
    public function install()
    {
        /* Adds Module */
        if (parent::install() &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayHome') &&
            $this->registerHook('actionShopDataDuplication')
        ) {
            $shops = Shop::getContextListShopID();
            $shop_groups_list = array();

            /* Setup each shop */
            foreach ($shops as $shop_id) {
                $shop_group_id = (int)Shop::getGroupFromShop($shop_id, true);

                if (!in_array($shop_group_id, $shop_groups_list)) {
                    $shop_groups_list[] = $shop_group_id;
                }

                /* Sets up configuration */
                $res = Configuration::updateValue(
                    'IMGLEFT_SPEED',
                    $this->default_speed,
                    false,
                    $shop_group_id,
                    $shop_id
                );
                $res &= Configuration::updateValue(
                    'IMGLEFT_PAUSE_ON_HOVER',
                    $this->default_pause_on_hover,
                    false,
                    $shop_group_id,
                    $shop_id
                );
                $res &= Configuration::updateValue(
                    'IMGLEFT_WRAP',
                    $this->default_wrap,
                    false,
                    $shop_group_id,
                    $shop_id
                );
            }

            /* Sets up Shop Group configuration */
            if (count($shop_groups_list)) {
                foreach ($shop_groups_list as $shop_group_id) {
                    $res &= Configuration::updateValue(
                        'IMGLEFT_SPEED',
                        $this->default_speed,
                        false,
                        $shop_group_id
                    );
                    $res &= Configuration::updateValue(
                        'IMGLEFT_PAUSE_ON_HOVER',
                        $this->default_pause_on_hover,
                        false,
                        $shop_group_id
                    );
                    $res &= Configuration::updateValue(
                        'IMGLEFT_WRAP',
                        $this->default_wrap,
                        false,
                        $shop_group_id
                    );
                }
            }

            /* Sets up Global configuration */
            $res &= Configuration::updateValue('IMGLEFT_SPEED', $this->default_speed);
            $res &= Configuration::updateValue('IMGLEFT_PAUSE_ON_HOVER', $this->default_pause_on_hover);
            $res &= Configuration::updateValue('IMGLEFT_WRAP', $this->default_wrap);

            /* Creates tables */
            $res &= $this->createTables();

            /* Adds samples */
            if ($res) {
                $this->installSamples();
            }

            return (bool)$res;
        }

        return false;
    }

    /**
     * Adds samples
     */
    protected function installSamples()
    {
        $languages = Language::getLanguages(false);
        for ($i = 1; $i <= 1; ++$i) {
            $slide = new WbHomeLeft();
            $slide->position = $i;
            $slide->active = 1;
            foreach ($languages as $language) {
                $slide->title[$language['id_lang']] = 'Leftbanner '.$i;
                $slide->description[$language['id_lang']] = '<h2>sale of the day</h2>
<h3><span>up to</span><span>50%</span><span>off</span></h3>';
                $slide->legend[$language['id_lang']] = 'leftbanner-'.$i;
                $slide->url[$language['id_lang']] = 'http://www.prestashop.com/?utm_source=back-office&utm_medium=v17_imgleft'
                    .'&utm_campaign=back-office-'.Tools::strtoupper($this->context->language->iso_code)
                    .'&utm_content='.(defined('_PS_HOST_MODE_') ? 'ondemand' : 'download');
                $rtlSuffix = $language['is_rtl'] ? '_rtl' : '';
                $slide->image[$language['id_lang']] = "leftbanner-{$i}{$rtlSuffix}.jpg";
            }
            $slide->add();
        }
    }

    /**
     * @see Module::uninstall()
     */
    public function uninstall()
    {
        /* Deletes Module */
        if (parent::uninstall()) {
            /* Deletes tables */
            $res = $this->deleteTables();

            /* Unsets configuration */
            $res &= Configuration::deleteByName('IMGLEFT_SPEED');
            $res &= Configuration::deleteByName('IMGLEFT_PAUSE_ON_HOVER');
            $res &= Configuration::deleteByName('IMGLEFT_WRAP');

            return (bool)$res;
        }

        return false;
    }

    /**
     * Creates tables
     */
    protected function createTables()
    {
        /* Slides */
        $res = (bool)Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'imgleft` (
                `id_imgleft_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
                `id_shop` int(10) unsigned NOT NULL,
                PRIMARY KEY (`id_imgleft_slides`, `id_shop`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        ');

        /* Slides configuration */
        $res &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'imgleft_slides` (
              `id_imgleft_slides` int(10) unsigned NOT NULL AUTO_INCREMENT,
              `position` int(10) unsigned NOT NULL DEFAULT \'0\',
              `active` tinyint(1) unsigned NOT NULL DEFAULT \'0\',
              PRIMARY KEY (`id_imgleft_slides`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        ');

        /* Slides lang configuration */
        $res &= Db::getInstance()->execute('
            CREATE TABLE IF NOT EXISTS `'._DB_PREFIX_.'imgleft_slides_lang` (
              `id_imgleft_slides` int(10) unsigned NOT NULL,
              `id_lang` int(10) unsigned NOT NULL,
              `title` varchar(255) NOT NULL,
              `description` text NOT NULL,
              `legend` varchar(255) NOT NULL,
              `url` varchar(255) NOT NULL,
              `image` varchar(255) NOT NULL,
              PRIMARY KEY (`id_imgleft_slides`,`id_lang`)
            ) ENGINE='._MYSQL_ENGINE_.' DEFAULT CHARSET=UTF8;
        ');

        return $res;
    }

    /**
     * deletes tables
     */
    protected function deleteTables()
    {
        $slides = $this->getSlides();
        foreach ($slides as $slide) {
            $to_del = new WbHomeLeft($slide['id_slide']);
            $to_del->delete();
        }

        return Db::getInstance()->execute('
            DROP TABLE IF EXISTS `'._DB_PREFIX_.'imgleft`,
            `'._DB_PREFIX_.'imgleft_slides`,
            `'._DB_PREFIX_.'imgleft_slides_lang`;
        ');
    }

    public function getContent()
    {
        $this->html .= $this->headerHTML();

        /* Validate & process */
        if (Tools::isSubmit('submitSlide') || Tools::isSubmit('delete_id_slide') ||
            Tools::isSubmit('submitSlider') ||
            Tools::isSubmit('changeStatus')
        ) {
            if ($this->postValidation()) {
                $this->postProcess();
                $this->html .= $this->renderForm();
                $this->html .= $this->renderList();
            } else {
                $this->html .= $this->renderAddForm();
            }

            $this->clearCache();
        } elseif (Tools::isSubmit('addSlide') || (Tools::isSubmit('id_slide') &&
            $this->slideExists((int)Tools::getValue('id_slide')))) {
            if (Tools::isSubmit('addSlide')) {
                $mode = 'add';
            } else {
                $mode = 'edit';
            }

            if ($mode == 'add') {
                if (Shop::getContext() != Shop::CONTEXT_GROUP && Shop::getContext() != Shop::CONTEXT_ALL) {
                    $this->html .= $this->renderAddForm();
                } else {
                    $this->html .= $this->getShopContextError(null, $mode);
                }
            } else {
                $associated_shop_ids = WbHomeLeft::getAssociatedIdsShop((int)Tools::getValue('id_slide'));
                $context_shop_id = (int)Shop::getContextShopID();

                if ($associated_shop_ids === false) {
                    $this->html .= $this->getShopAssociationError((int)Tools::getValue('id_slide'));
                } elseif (Shop::getContext() != Shop::CONTEXT_GROUP &&
                    Shop::getContext() != Shop::CONTEXT_ALL && in_array($context_shop_id, $associated_shop_ids)) {
                    if (count($associated_shop_ids) > 1) {
                        $this->html = $this->getSharedSlideWarning();
                    }
                    $this->html .= $this->renderAddForm();
                } else {
                    $shops_name_list = array();
                    foreach ($associated_shop_ids as $shop_id) {
                        $associated_shop = new Shop((int)$shop_id);
                        $shops_name_list[] = $associated_shop->name;
                    }
                    $this->html .= $this->getShopContextError($shops_name_list, $mode);
                }
            }
        } else {
            $this->html .= $this->getWarningMultishopHtml().$this->getCurrentShopInfoMsg().$this->renderForm();

            if (Shop::getContext() != Shop::CONTEXT_GROUP && Shop::getContext() != Shop::CONTEXT_ALL) {
                $this->html .= $this->renderList();
            }
        }

        return $this->html;
    }

    protected function postValidation()
    {
        $errors = array();

        /* Validation for Slider configuration */
        if (Tools::isSubmit('submitSlider')) {
            if (!Validate::isInt(Tools::getValue('IMGLEFT_SPEED'))) {
                $errors[] = $this->getTranslator()->trans('Invalid values', array(), 'Modules.Imgleft.Admin');
            }
        } elseif (Tools::isSubmit('changeStatus')) {
            if (!Validate::isInt(Tools::getValue('id_slide'))) {
                $errors[] = $this->getTranslator()->trans('Invalid slide', array(), 'Modules.Imgleft.Admin');
            }
        } elseif (Tools::isSubmit('submitSlide')) {
            /* Checks state (active) */
            if (!Validate::isInt(Tools::getValue('active_slide')) ||
                (Tools::getValue('active_slide') != 0 && Tools::getValue('active_slide') != 1)) {
                $errors[] = $this->getTranslator()->trans('Invalid slide
                 state.', array(), 'Modules.Imgleft.Admin');
            }
            /* Checks position */
            if (!Validate::isInt(Tools::getValue('position')) ||
                (Tools::getValue('position') < 0)) {
                $errors[] = $this->getTranslator()->trans(
                    'Invalid slide position.',
                    array(),
                    'Modules.Imgleft.Admin'
                );
            }
            /* If edit : checks id_slide */
            if (Tools::isSubmit('id_slide')) {
                if (!Validate::isInt(Tools::getValue('id_slide')) &&
                    !$this->slideExists(Tools::getValue('id_slide'))) {
                    $errors[] = $this->getTranslator()->trans('Invalid 
                        slide ID', array(), 'Modules.Imgleft.Admin');
                }
            }
            /* Checks title/url/legend/description/image */
            $languages = Language::getLanguages(false);
            foreach ($languages as $language) {
                if (Tools::strlen(Tools::getValue('title_' . $language['id_lang'])) > 255) {
                    $errors[] = $this->getTranslator()->trans('The title is too 
                        long.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::strlen(Tools::getValue('legend_' . $language['id_lang'])) > 255) {
                    $errors[] = $this->getTranslator()->trans('The caption is too 
                        long.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::strlen(Tools::getValue('url_' . $language['id_lang'])) > 255) {
                    $errors[] = $this->getTranslator()->trans('The URL is 
                        too long.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::strlen(Tools::getValue('description_' . $language['id_lang'])) > 4000) {
                    $errors[] = $this->getTranslator()->trans('The description is 
                        too long.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::strlen(Tools::getValue('url_' . $language['id_lang'])) > 0 &&
                    !Validate::isUrl(Tools::getValue('url_' . $language['id_lang']))) {
                    $errors[] = $this->getTranslator()->trans('The URL format 
                        is not correct.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::getValue('image_' . $language['id_lang']) != null &&
                    !Validate::isFileName(Tools::getValue('image_' . $language['id_lang']))) {
                    $errors[] = $this->getTranslator()->trans('Invalid 
                        filename.', array(), 'Modules.Imgleft.Admin');
                }
                if (Tools::getValue('image_old_' . $language['id_lang']) != null &&
                    !Validate::isFileName(Tools::getValue('image_old_' . $language['id_lang']))) {
                    $errors[] = $this->getTranslator()->trans('Invalid 
                        filename.', array(), 'Modules.Imgleft.Admin');
                }
            }

            /* Checks title/url/legend/description for default lang */
            $id_lang_default = (int)Configuration::get('PS_LANG_DEFAULT');
            if (Tools::strlen(Tools::getValue('url_' . $id_lang_default)) == 0) {
                $errors[] = $this->getTranslator()->trans('The URL is 
                    not set.', array(), 'Modules.Imgleft.Admin');
            }
            if (!Tools::isSubmit('has_picture') && (!isset($_FILES['image_' . $id_lang_default]) ||
                empty($_FILES['image_' . $id_lang_default]['tmp_name']))) {
                $errors[] = $this->getTranslator()->trans('The image 
                    is not set.', array(), 'Modules.Imgleft.Admin');
            }
            if (Tools::getValue('image_old_'.$id_lang_default) &&
                !Validate::isFileName(Tools::getValue('image_old_'.$id_lang_default))) {
                $errors[] = $this->getTranslator()->trans('The image 
                    is not set.', array(), 'Modules.Imgleft.Admin');
            }
        } elseif (Tools::isSubmit('delete_id_slide') &&
            (!Validate::isInt(Tools::getValue('delete_id_slide')) ||
                !$this->slideExists((int)Tools::getValue('delete_id_slide')))) {
            $errors[] = $this->getTranslator()->trans('Invalid 
                slide ID', array(), 'Modules.Imgleft.Admin');
        }

        /* Display errors if needed */
        if (count($errors)) {
            $this->html .= $this->displayError(implode('<br />', $errors));

            return false;
        }

        /* Returns if validation is ok */

        return true;
    }

    protected function postProcess()
    {
        $errors = array();
        $shop_context = Shop::getContext();

        /* Processes Slider */
        if (Tools::isSubmit('submitSlider')) {
            $shop_groups_list = array();
            $shops = Shop::getContextListShopID();

            foreach ($shops as $shop_id) {
                $shop_group_id = (int)Shop::getGroupFromShop($shop_id, true);

                if (!in_array($shop_group_id, $shop_groups_list)) {
                    $shop_groups_list[] = $shop_group_id;
                }

                $res = Configuration::updateValue(
                    'IMGLEFT_SPEED',
                    (int)Tools::getValue(
                        'IMGLEFT_SPEED'
                    ),
                    false,
                    $shop_group_id,
                    $shop_id
                );
                $res &= Configuration::updateValue(
                    'IMGLEFT_PAUSE_ON_HOVER',
                    (int)Tools::getValue(
                        'IMGLEFT_PAUSE_ON_HOVER'
                    ),
                    false,
                    $shop_group_id,
                    $shop_id
                );
                $res &= Configuration::updateValue(
                    'IMGLEFT_WRAP',
                    (int)Tools::getValue(
                        'IMGLEFT_WRAP'
                    ),
                    false,
                    $shop_group_id,
                    $shop_id
                );
            }

            /* Update global shop context if needed*/
            switch ($shop_context) {
                case Shop::CONTEXT_ALL:
                    $res &= Configuration::updateValue('IMGLEFT_SPEED', (int)Tools::getValue('IMGLEFT_SPEED'));
                    $res &= Configuration::updateValue(
                        'IMGLEFT_PAUSE_ON_HOVER',
                        (int)Tools::getValue(
                            'IMGLEFT_PAUSE_ON_HOVER'
                        )
                    );
                    $res &= Configuration::updateValue('IMGLEFT_WRAP', (int)Tools::getValue('IMGLEFT_WRAP'));
                    if (count($shop_groups_list)) {
                        foreach ($shop_groups_list as $shop_group_id) {
                            $res &= Configuration::updateValue(
                                'IMGLEFT_SPEED',
                                (int)Tools::getValue(
                                    'IMGLEFT_SPEED'
                                ),
                                false,
                                $shop_group_id
                            );
                            $res &= Configuration::updateValue(
                                'IMGLEFT_PAUSE_ON_HOVER',
                                (int)Tools::getValue(
                                    'IMGLEFT_PAUSE_ON_HOVER'
                                ),
                                false,
                                $shop_group_id
                            );
                            $res &= Configuration::updateValue(
                                'IMGLEFT_WRAP',
                                (int)Tools::getValue(
                                    'IMGLEFT_WRAP'
                                ),
                                false,
                                $shop_group_id
                            );
                        }
                    }
                    break;
                case Shop::CONTEXT_GROUP:
                    if (count($shop_groups_list)) {
                        foreach ($shop_groups_list as $shop_group_id) {
                            $res &= Configuration::updateValue(
                                'IMGLEFT_SPEED',
                                (int)Tools::getValue('IMGLEFT_SPEED'),
                                false,
                                $shop_group_id
                            );
                            $res &= Configuration::updateValue(
                                'IMGLEFT_PAUSE_ON_HOVER',
                                (int)Tools::getValue('IMGLEFT_PAUSE_ON_HOVER'),
                                false,
                                $shop_group_id
                            );
                            $res &= Configuration::updateValue(
                                'IMGLEFT_WRAP',
                                (int)Tools::getValue('IMGLEFT_WRAP'),
                                false,
                                $shop_group_id
                            );
                        }
                    }
                    break;
            }

            $this->clearCache();

            if (!$res) {
                $errors[] = $this->displayError($this->getTranslator()->trans('The configuration 
                    could not be updated.', array(), 'Modules.Imgleft.Admin'));
            } else {
                Tools::redirectAdmin(
                    $this->context->link->getAdminLink(
                        'AdminModules',
                        true
                    ) . '&conf=6&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name
                );
            }
        } elseif (Tools::isSubmit('changeStatus') && Tools::isSubmit('id_slide')) {
            $slide = new WbHomeLeft((int)Tools::getValue('id_slide'));
            if ($slide->active == 0) {
                $slide->active = 1;
            } else {
                $slide->active = 0;
            }
            $res = $slide->update();
            $this->clearCache();
            $this->html .= (
                $res ? $this->displayConfirmation(
                    $this->getTranslator()->trans(
                        'Configuration updated',
                        array(),
                        'Admin.Notifications.Success'
                    )
                ): $this->displayError(
                    $this->getTranslator()->trans(
                        'The configuration could not be updated.',
                        array(),
                        'Modules.Imgleft.Admin'
                    )
                )
            );
        } elseif (Tools::isSubmit('submitSlide')) {
            /* Sets ID if needed */
            if (Tools::getValue('id_slide')) {
                $slide = new WbHomeLeft((int)Tools::getValue('id_slide'));
                if (!Validate::isLoadedObject($slide)) {
                    $this->html .= $this->displayError(
                        $this->getTranslator()->trans(
                            'Invalid slide ID',
                            array(),
                            'Modules.Imgleft.Admin'
                        )
                    );
                    return false;
                }
            } else {
                $slide = new WbHomeLeft();
            }
            /* Sets position */
            $slide->position = (int)Tools::getValue('position');
            /* Sets active */
            $slide->active = (int)Tools::getValue('active_slide');

            /* Sets each langue fields */
            $languages = Language::getLanguages(false);

            foreach ($languages as $language) {
                $slide->title[$language['id_lang']] = Tools::getValue('title_'.$language['id_lang']);
                $slide->url[$language['id_lang']] = Tools::getValue('url_'.$language['id_lang']);
                $slide->legend[$language['id_lang']] = Tools::getValue('legend_'.$language['id_lang']);
                $slide->description[$language['id_lang']] = Tools::getValue('description_'.$language['id_lang']);

                /* Uploads image and sets slide */
                $type = '';
                $imagesize = 0;
                if (isset($_FILES['image_'.$language['id_lang']]) &&
                    isset($_FILES['image_'.$language['id_lang']]['tmp_name']) &&
                    !empty($_FILES['image_' . $language['id_lang']]['tmp_name'])
                ) {
                    $type = Tools::strtolower(Tools::substr(strrchr($_FILES['image_' . $language['id_lang']]['name'], '.'), 1));
                    $imagesize = @getimagesize($_FILES['image_' . $language['id_lang']]['tmp_name']);
                }
                if (!empty($type) &&
                    !empty($imagesize) &&
                    in_array(
                        Tools::strtolower(
                            Tools::substr(
                                strrchr(
                                    $imagesize['mime'],
                                    '/'
                                ),
                                1
                            )
                        ),
                        array(
                            'jpg',
                            'gif',
                            'jpeg',
                            'png'
                        )
                    ) &&
                    in_array($type, array('jpg', 'gif', 'jpeg', 'png'))
                ) {
                    $temp_name = tempnam(_PS_TMP_IMG_DIR_, 'PS');
                    $salt = sha1(microtime());
                    if ($error = ImageManager::validateUpload($_FILES['image_'.$language['id_lang']])) {
                        $errors[] = $error;
                    } elseif (!$temp_name ||
                        !move_uploaded_file($_FILES['image_'.$language['id_lang']]['tmp_name'], $temp_name)
                    ) {
                        return false;
                    } elseif (!ImageManager::resize(
                        $temp_name,
                        dirname(__FILE__).'/views/'.'/img/'.$salt.'_'.$_FILES['image_'.$language['id_lang']]['name'],
                        null,
                        null,
                        $type
                    )
                    ) {
                        $errors[] = $this->displayError(
                            $this->getTranslator()->trans(
                                'An error occurred during the image upload process.',
                                array(),
                                'Admin.Notifications.Error'
                            )
                        );
                    }
                    if (isset($temp_name)) {
                        @unlink($temp_name);
                    }
                    $slide->image[$language['id_lang']] = $salt.'_'.$_FILES['image_'.$language['id_lang']]['name'];
                } elseif (Tools::getValue('image_old_'.$language['id_lang']) != '') {
                    $slide->image[$language['id_lang']] = Tools::getValue('image_old_' . $language['id_lang']);
                }
            }

            /* Processes if no errors  */
            if (!$errors) {
                /* Adds */
                if (!Tools::getValue('id_slide')) {
                    if (!$slide->add()) {
                        $errors[] = $this->displayError(
                            $this->getTranslator()->trans(
                                'The slide could not be added.',
                                array(),
                                'Modules.Imgleft.Admin'
                            )
                        );
                    }
                } elseif (!$slide->update()) {
                    $errors[] = $this->displayError(
                        $this->getTranslator()->trans(
                            'The slide could not be updated.',
                            array(),
                            'Modules.Imgleft.Admin'
                        )
                    );
                }
                $this->clearCache();
            }
        } elseif (Tools::isSubmit('delete_id_slide')) {
            $slide = new WbHomeLeft((int)Tools::getValue('delete_id_slide'));
            $res = $slide->delete();
            $this->clearCache();
            if (!$res) {
                $this->html .= $this->displayError('Could not delete.');
            } else {
                Tools::redirectAdmin(
                    $this->context->link->getAdminLink(
                        'AdminModules',
                        true
                    ) . '&conf=1&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name
                );
            }
        }

        /* Display errors if needed */
        if (count($errors)) {
            $this->html .= $this->displayError(implode('<br />', $errors));
        } elseif (Tools::isSubmit('submitSlide') && Tools::getValue('id_slide')) {
            Tools::redirectAdmin(
                $this->context->link->getAdminLink(
                    'AdminModules',
                    true
                ) . '&conf=4&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name
            );
        } elseif (Tools::isSubmit('submitSlide')) {
            Tools::redirectAdmin(
                $this->context->link->getAdminLink(
                    'AdminModules',
                    true
                ) . '&conf=3&configure=' . $this->name . '&tab_module=' . $this->tab . '&module_name=' . $this->name
            );
        }
    }

    public function renderWidget($hookName = null, array $configuration = null)
    {
        if (!$this->isCached($this->templateFile, $this->getCacheId())) {
            $this->smarty->assign($this->getWidgetVariables($hookName, $configuration));
        }

        return $this->fetch($this->templateFile, $this->getCacheId());
    }

    public function getWidgetVariables($hookName = null, array $configuration = null)
    {
        $slides = $this->getSlides(true);
        if (is_array($slides)) {
            foreach ($slides as &$slide) {
                $slide['sizes'] = @getimagesize(
                    (dirname(__FILE__) .'/views'. DIRECTORY_SEPARATOR . 'img' . DIRECTORY_SEPARATOR . $slide['image'])
                );
                if (isset($slide['sizes'][3]) && $slide['sizes'][3]) {
                    $slide['size'] = $slide['sizes'][3];
                }
            }
        }

        $config = $this->getConfigFieldsValues();
        unset($hookName,$configuration);
        return array(
            'imgleft' => array(
                'speed' => $config['IMGLEFT_SPEED'],
                'pause' => $config['IMGLEFT_PAUSE_ON_HOVER'] ? 'hover' : '',
                'wrap' => $config['IMGLEFT_WRAP'] ? 'true' : 'false',
                'slides' => $slides,
            ),
        );
    }

    public function clearCache()
    {
        $this->_clearCache($this->templateFile);
    }

    public function hookActionShopDataDuplication($params)
    {
        Db::getInstance()->execute(
            'INSERT IGNORE INTO '._DB_PREFIX_.'imgleft (id_imgleft_slides, id_shop)
            SELECT id_imgleft_slides, '.(int)$params['new_id_shop'].'
            FROM '._DB_PREFIX_.'imgleft
            WHERE id_shop = '.(int)$params['old_id_shop']
        );
        $this->clearCache();
    }

    public function headerHTML()
    {
        if (Tools::getValue('controller') != 'AdminModules' && Tools::getValue('configure') != $this->name) {
            return;
        }

        $this->context->controller->addJqueryUI('ui.sortable');
        /* Style & js for fieldset 'slides configuration' */
    }

    public function getNextPosition()
    {
        $row = Db::getInstance(_PS_USE_SQL_SLAVE_)->getRow(
            'SELECT MAX(hss.`position`) AS `next_position`
            FROM `'._DB_PREFIX_.'imgleft_slides` hss, `'._DB_PREFIX_.'imgleft` hs
            WHERE hss.`id_imgleft_slides` = hs.`id_imgleft_slides` 
            AND hs.`id_shop` = '.(int)$this->context->shop->id
        );

        return (++$row['next_position']);
    }

    public function getSlides($active = null)
    {
        $this->context = Context::getContext();
        $id_shop = $this->context->shop->id;
        $id_lang = $this->context->language->id;

        $slides = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS(
            'SELECT hs.`id_imgleft_slides` as id_slide, hss.`position`, hss.`active`, hssl.`title`,
            hssl.`url`, hssl.`legend`, hssl.`description`, hssl.`image`
            FROM '._DB_PREFIX_.'imgleft hs
            LEFT JOIN '._DB_PREFIX_.'imgleft_slides hss ON (hs.id_imgleft_slides = hss.id_imgleft_slides)
            LEFT JOIN '._DB_PREFIX_.'imgleft_slides_lang hssl
            ON (hss.id_imgleft_slides = hssl.id_imgleft_slides)
            WHERE id_shop = '.(int)$id_shop.'
            AND hssl.id_lang = '.(int)$id_lang.
            ($active ? ' AND hss.`active` = 1' : ' ').'
            ORDER BY hss.position'
        );

        foreach ($slides as &$slide) {
            $slide['image_url'] = $this->context->link->getMediaLink(
                _MODULE_DIR_.'wbimgleft/views/img/'.$slide['image']
            );
        }

        return $slides;
    }

    public function getAllImagesBySlidesId($id_slides, $active = null, $id_shop = null)
    {
        $this->context = Context::getContext();
        $images = array();

        if (!isset($id_shop)) {
            $id_shop = $this->context->shop->id;
        }

        $results = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS(
            'SELECT hssl.`image`, hssl.`id_lang`
            FROM '._DB_PREFIX_.'imgleft hs
            LEFT JOIN '._DB_PREFIX_.'imgleft_slides hss ON (hs.id_imgleft_slides = hss.id_imgleft_slides)
            LEFT JOIN '._DB_PREFIX_.'imgleft_slides_lang hssl ON (hss.id_wblider_slides = hssl.id_imgleft_slides)
            WHERE hs.`id_imgleft_slides` = '.(int)$id_slides.' AND hs.`id_shop` = '.(int)$id_shop.
            ($active ? ' AND hss.`active` = 1' : ' ')
        );

        foreach ($results as $result) {
            $images[$result['id_lang']] = $result['image'];
        }

        return $images;
    }

    public function displayStatus($id_slide, $active)
    {
        $title = (
            (int)$active == 0 ? $this->getTranslator()->trans(
                'Disabled',
                array(),
                'Admin.Global'
            ) : $this->getTranslator()->trans(
                'Enabled',
                array(),
                'Admin.Global'
            )
        );
        $icon = ((int)$active == 0 ? 'icon-remove' : 'icon-check');
        $class = ((int)$active == 0 ? 'btn-danger' : 'btn-success');
        $html = '<a class="btn '.$class.'" href="'.AdminController::$currentIndex.
            '&configure='.$this->name.
            '&token='.Tools::getAdminTokenLite('AdminModules').
            '&changeStatus&id_slide='.(int)$id_slide.'" title="'.$title.'"><i class="'.$icon.'"></i> '.$title.'</a>';

        return $html;
    }

    public function slideExists($id_slide)
    {
        $req = 'SELECT hs.`id_imgleft_slides` as id_slide
                FROM `'._DB_PREFIX_.'imgleft` hs
                WHERE hs.`id_imgleft_slides` = '.(int)$id_slide;
        $row = Db::getInstance(_PS_USE_SQL_SLAVE_)->getRow($req);

        return ($row);
    }

    public function renderList()
    {
        $slides = $this->getSlides();
        foreach ($slides as $key => $slide) {
            $slides[$key]['status'] = $this->displayStatus($slide['id_slide'], $slide['active']);
            $associated_shop_ids = WbHomeLeft::getAssociatedIdsShop((int)$slide['id_slide']);
            if ($associated_shop_ids && count($associated_shop_ids) > 1) {
                $slides[$key]['is_shared'] = true;
            } else {
                $slides[$key]['is_shared'] = false;
            }
        }

        $this->context->smarty->assign(
            array(
                'link' => $this->context->link,
                'slides' => $slides,
                'image_baseurl' => $this->_path.'views/img/'
            )
        );

        return $this->display(__FILE__, 'list.tpl');
    }

    public function renderAddForm()
    {
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->getTranslator()->trans('Slide 
                        information', array(), 'Modules.Imgleft.Admin'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'file_lang',
                        'label' => $this->getTranslator()->trans('Image', array(), 'Admin.Global'),
                        'name' => 'image',
                        'required' => true,
                        'lang' => true,
                        'desc' => $this->getTranslator()->trans('Maximum image size:
                         %s.', array(ini_get('upload_max_filesize')), 'Admin.Global')
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->getTranslator()->trans('Title', array(), 'Admin.Global'),
                        'name' => 'title',
                        'lang' => true,
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->getTranslator()->trans('Target
                         URL', array(), 'Modules.Imgleft.Admin'),
                        'name' => 'url',
                        'required' => true,
                        'lang' => true,
                    ),
                    array(
                        'type' => 'text',
                        'label' => $this->getTranslator()->trans('Caption', array(), 'Modules.Imgleft.Admin'),
                        'name' => 'legend',
                        'lang' => true,
                    ),
                    array(
                        'type' => 'textarea',
                        'label' => $this->getTranslator()->trans('Description', array(), 'Admin.Global'),
                        'name' => 'description',
                        'autoload_rte' => true,
                        'lang' => true,
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->getTranslator()->trans('Enabled', array(), 'Admin.Global'),
                        'name' => 'active_slide',
                        'is_bool' => true,
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->getTranslator()->trans('Yes', array(), 'Admin.Global')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->getTranslator()->trans('No', array(), 'Admin.Global')
                            )
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->getTranslator()->trans('Save', array(), 'Admin.Actions'),
                )
            ),
        );

        if (Tools::isSubmit('id_slide') && $this->slideExists((int)Tools::getValue('id_slide'))) {
            $slide = new WbHomeLeft((int)Tools::getValue('id_slide'));
            $fields_form['form']['input'][] = array('type' => 'hidden', 'name' => 'id_slide');
            $fields_form['form']['images'] = $slide->image;

            $has_picture = true;

            foreach (Language::getLanguages(false) as $lang) {
                if (!isset($slide->image[$lang['id_lang']])) {
                    $has_picture &= false;
                }
            }

            if ($has_picture) {
                $fields_form['form']['input'][] = array('type' => 'hidden', 'name' => 'has_picture');
            }
        }

        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get(
            'PS_BO_ALLOW_EMPLOYEE_FORM_LANG'
        ) ?
        Configuration::get(
            'PS_BO_ALLOW_EMPLOYEE_FORM_LANG'
        ) :
        0;
        $this->fields_form = array();
        $helper->module = $this;
        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitSlide';
        $helper->currentIndex = $this->context->link->getAdminLink(
            'AdminModules',
            false
        ).'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $language = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->tpl_vars = array(
            'base_url' => $this->context->shop->getBaseURL(),
            'language' => array(
                'id_lang' => $language->id,
                'iso_code' => $language->iso_code
            ),
            'fields_value' => $this->getAddFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
            'image_baseurl' => $this->_path.'views/img/'
        );

        $helper->override_folder = '/';

        $languages = Language::getLanguages(false);

        if (count($languages) > 1) {
            return $this->getMultiLanguageInfoMsg() . $helper->generateForm(array($fields_form));
        } else {
            return $helper->generateForm(array($fields_form));
        }
    }

    public function renderForm()
    {
        $fields_form = array(
            'form' => array(
                'legend' => array(
                    'title' => $this->getTranslator()->trans('Settings', array(), 'Admin.Global'),
                    'icon' => 'icon-cogs'
                ),
                'input' => array(
                    array(
                        'type' => 'text',
                        'label' => $this->getTranslator()->trans('Speed', array(), 'Modules.Imgleft.Admin'),
                        'name' => 'IMGLEFT_SPEED',
                        'suffix' => 'milliseconds',
                        'class' => 'fixed-width-sm',
                        'desc' => $this->getTranslator()->trans('The duration of the 
                            transition between two slides.', array(), 'Modules.Imgleft.Admin')
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->getTranslator()->trans('Pause on 
                            hover', array(), 'Modules.Imgleft.Admin'),
                        'name' => 'IMGLEFT_PAUSE_ON_HOVER',
                        'desc' => $this->getTranslator()->trans('Stop sliding when the 
                            mouse cursor is over the slideshow.', array(), 'Modules.Imgleft.Admin'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->getTranslator()->trans('Enabled', array(), 'Admin.Global')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->getTranslator()->trans('Disabled', array(), 'Admin.Global')
                            )
                        ),
                    ),
                    array(
                        'type' => 'switch',
                        'label' => $this->getTranslator()->trans(
                            'Loop forever',
                            array(),
                            'Modules.Imgleft.Admin'
                        ),
                        'name' => 'IMGLEFT_WRAP',
                        'desc' => $this->getTranslator()->trans('Loop or stop after 
                            the last slide.', array(), 'Modules.Imgleft.Admin'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => 1,
                                'label' => $this->getTranslator()->trans('Enabled', array(), 'Admin.Global')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => 0,
                                'label' => $this->getTranslator()->trans('Disabled', array(), 'Admin.Global')
                            )
                        ),
                    ),
                ),
                'submit' => array(
                    'title' => $this->getTranslator()->trans('Save', array(), 'Admin.Actions'),
                )
            ),
        );

        $helper = new HelperForm();
        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $lang = new Language((int)Configuration::get('PS_LANG_DEFAULT'));
        $helper->default_form_language = $lang->id;
        $helper->allow_employee_form_lang = Configuration::get(
            'PS_BO_ALLOW_EMPLOYEE_FORM_LANG'
        ) ?
        Configuration::get(
            'PS_BO_ALLOW_EMPLOYEE_FORM_LANG'
        ) :
        0;
        $this->fields_form = array();

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitSlider';
        $helper->currentIndex = $this->context->link->getAdminLink(
            'AdminModules',
            false
        ).'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');
        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFieldsValues(),
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id
        );

        return $helper->generateForm(array($fields_form));
    }

    public function getConfigFieldsValues()
    {
        $id_shop_group = Shop::getContextShopGroupID();
        $id_shop = Shop::getContextShopID();

        return array(
            'IMGLEFT_SPEED' => Tools::getValue(
                'IMGLEFT_SPEED',
                Configuration::get(
                    'IMGLEFT_SPEED',
                    null,
                    $id_shop_group,
                    $id_shop
                )
            ),
            'IMGLEFT_PAUSE_ON_HOVER' => Tools::getValue(
                'IMGLEFT_PAUSE_ON_HOVER',
                Configuration::get(
                    'IMGLEFT_PAUSE_ON_HOVER',
                    null,
                    $id_shop_group,
                    $id_shop
                )
            ),
            'IMGLEFT_WRAP' => Tools::getValue(
                'IMGLEFT_WRAP',
                Configuration::get(
                    'IMGLEFT_WRAP',
                    null,
                    $id_shop_group,
                    $id_shop
                )
            ),
        );
    }

    public function getAddFieldsValues()
    {
        $fields = array();

        if (Tools::isSubmit('id_slide') && $this->slideExists((int)Tools::getValue('id_slide'))) {
            $slide = new WbHomeLeft((int)Tools::getValue('id_slide'));
            $fields['id_slide'] = (int)Tools::getValue('id_slide', $slide->id);
        } else {
            $slide = new WbHomeLeft();
        }

        $fields['active_slide'] = Tools::getValue('active_slide', $slide->active);
        $fields['has_picture'] = true;

        $languages = Language::getLanguages(false);

        foreach ($languages as $lang) {
            $fields['image'][$lang['id_lang']] = Tools::getValue('image_' . (int) $lang['id_lang']);
            $fields['title'][$lang['id_lang']] = isset($slide->title) ? Tools::getValue('title_' . (int) $lang['id_lang'], $slide->title[$lang['id_lang']]) : '';
            $fields['url'][$lang['id_lang']] = isset($slide->url) ? Tools::getValue('url_' . (int) $lang['id_lang'], $slide->url[$lang['id_lang']]) : '';
            $fields['legend'][$lang['id_lang']] = isset($slide->legend) ? Tools::getValue('legend_' . (int) $lang['id_lang'], $slide->legend[$lang['id_lang']]) : '';
            $fields['description'][$lang['id_lang']] = isset($slide->description) ? Tools::getValue('description_' . (int) $lang['id_lang'], $slide->description[$lang['id_lang']]) : '';
        }

        return $fields;
    }

    protected function getMultiLanguageInfoMsg()
    {
        return '<p class="alert alert-warning">'.
                    $this->getTranslator()->trans('Since multiple languages are activated on your shop, 
                        please mind to upload your image for each one of them', array(), 'Modules.Imgleft.Admin').
                '</p>';
    }

    protected function getWarningMultishopHtml()
    {
        if (Shop::getContext() == Shop::CONTEXT_GROUP || Shop::getContext() == Shop::CONTEXT_ALL) {
            return '<p class="alert alert-warning">' .
            $this->getTranslator()->trans('You cannot manage slides items from a "All Shops" or a "G
                roup Shop" context, select directly the shop you want to edit', array(), 'Modules.Imgleft.Admin') .
            '</p>';
        } else {
            return '';
        }
    }

    protected function getShopContextError($shop_contextualized_name, $mode)
    {
        if (is_array($shop_contextualized_name)) {
            $shop_contextualized_name = implode('<br/>', $shop_contextualized_name);
        }

        if ($mode == 'edit') {
            return '<p class="alert alert-danger">' .
            $this->trans('You can only edit this slide from the shop(s) 
                context: %s', array($shop_contextualized_name), 'Modules.Imgleft.Admin') .
            '</p>';
        } else {
            return '<p class="alert alert-danger">' .
            $this->trans('You cannot add slides from a "All Shops" or a 
                "Group Shop" context', array(), 'Modules.Imgleft.Admin') .
            '</p>';
        }
    }

    protected function getShopAssociationError($id_slide)
    {
        return '<p class="alert alert-danger">'.
                        $this->trans(
                            'Unable to get slide shop association information (id_slide: %d)',
                            array(
                                (int)$id_slide
                            ),
                            'Modules.Imgleft.Admin'
                        ) .
                '</p>';
    }


    protected function getCurrentShopInfoMsg()
    {
        $shop_info = null;

        if (Shop::isFeatureActive()) {
            if (Shop::getContext() == Shop::CONTEXT_SHOP) {
                $shop_info = $this->trans(
                    'The modifications will be applied to shop: %s',
                    array(
                        $this->context->shop->name
                    ),
                    'Modules.Imgleft.Admin'
                );
            } elseif (Shop::getContext() == Shop::CONTEXT_GROUP) {
                $shop_info = $this->trans(
                    'The modifications will be applied to this group: %s',
                    array(
                        Shop::getContextShopGroup()->name
                    ),
                    'Modules.Imgleft.Admin'
                );
            } else {
                $shop_info = $this->trans('The modifications will be 
                    applied to all shops and shop groups', array(), 'Modules.Imgleft.Admin');
            }

            return '<div class="alert alert-info">'.
                        $shop_info.
                    '</div>';
        } else {
            return '';
        }
    }

    protected function getSharedSlideWarning()
    {
        return '<p class="alert alert-warning">'.
                    $this->trans('This slide is shared with other shops! 
                        All shops associated to this slide will apply 
                        modifications made here', array(), 'Modules.Imgleft.Admin').
                '</p>';
    }
}
