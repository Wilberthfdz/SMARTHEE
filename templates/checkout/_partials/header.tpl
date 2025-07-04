{**
 * 2007-2018 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2018 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{block name='header_banner'}
  <div class="header-banner">
    {hook h='displayBanner'}
  </div>
{/block}

{block name='header_nav'}
<nav class="header-nav hidden-sm-down">
  <div class="container">
    <div class="row">
          <div class="col-lg-5 col-md-4 col-sm-6 hidden-sm-down">
              {hook h='displayNav1'}
          </div>
          <div class="col-lg-7 col-md-8 col-sm-6 right-nav text-xs-right hidden-sm-down">
            {hook h='displayNav2'}
          </div>
       
      </div>
      </div>
  </nav>

{/block}

{block name='header_top'}
<div class="middel-header">
<div class="container">

<div class="hidden-md-up text-sm-center mobile col-xs-12 header-nav">
           {* menu *}
            <div class="float-xs-left">
            <div id="menu-icon">
            <div class="navbar-header">
                <button type="button" class="btn-navbar navbar-toggle" data-toggle="collapse" onclick="openNav()">
                <i class="fa fa-bars"></i></button>
            </div>
            </div>
            <div id="mySidenav" class="sidenav">
            <div class="close-nav">
                <span class="categories">{l s='Category' d='Shop.Theme.Catalog'}</span>
                <a href="javascript:void(0)" class="closebtn float-xs-right" onclick="closeNav()"><i class="fa fa-close"></i></a>
            </div>
            <div id="mobile_top_menu_wrapper" class="row hidden-lg-up">
                <div class="js-top-menu mobile" id="_mobile_top_menu"></div>
            </div>
            </div>
            </div>
            {* menu *}

            <div class="float-xs-right" id="_mobile_cart"></div>
            <div class="float-xs-right" id="_mobile_user_info"></div>
            <div class="float-xs-right xsse"></div>
            <div class="top-logo float-xs-left" id="_mobile_logo"></div>
            <div id="_mobile_currency_selector"></div>
          <div id="_mobile_language_selector"></div>
            <div class="clearfix"></div>
        </div>
<div class="sticky-head">
<div class="header-top row">
       <div class="col-lg-2 col-md-3 col-sm-3 hidden-sm-down" id="_desktop_logo">
            {if $page.page_name == 'index'}
              <h1>
                <a href="{$urls.base_url}">
                  <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                </a>
              </h1>
            {else}
                <a href="{$urls.base_url}">
                  <img class="logo img-responsive" src="{$shop.logo}" alt="{$shop.name}">
                </a>
            {/if}
        </div>
        <div class="col-lg-10 col-sm-9 col-md-9 col-xs-12 head-right text-xs-right">
          {hook h='displayTop'}
        </div>
</div>
</div>


</div>
</div>
<div class="topmenu hidden-sm-down">
  <div class="container">
    <div class="row">
        <div class="col-lg-2 col-md-3 col-sm-4 left-menu-st"></div>
        {hook h='displayNavFullWidth'}
    </div>
  </div>
</div>
{/block}
