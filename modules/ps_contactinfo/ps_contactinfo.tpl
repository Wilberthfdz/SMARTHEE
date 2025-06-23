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

<div class="block-contact col-md-4 col-sm-6 col-lg-4 col-xs-12">
  <div class="foot-topb">
  <li class="d-inline-block hidden-sm-down"><svg width="70px" height="70px"><use xlink:href="#callus"></use></svg></li>
  <li class="d-inline-block">

  <span class="c-info">{l s='contact info' d='Shop.Theme.Catalog'}<hr></span>
  <ul id="footer_contact" class="fthr">
  {if $contact_infos.phone}
    <div class="block contact-no">
      <div class="icon">{* <svg width="20px" height="20px"><use xlink:href="#phone"></use></svg> *}</div>
      <div class="data">
        <a href="tel:{$contact_infos.phone}">{$contact_infos.phone}</a>
       </div>
    </div>
  {/if}
  <div class="block">
    <div class="icon"><svg width="20px" height="20px"><use xlink:href="#add"></use></svg></div>
    <div class="data ad">{$contact_infos.address.formatted nofilter}</div>
  </div>

  

  {* {if $contact_infos.fax}
    <li class="block">
      <div class="icon"><svg width="21px" height="20px"><use xlink:href="#fax"></use></svg></div>
      <div class="data">
             {$contact_infos.fax}
      </div>
    </li>
  {/if} *}
  {* {if $contact_infos.email}
    <li class="block">
      <div class="icon"><svg width="22px" height="22px"><use xlink:href="#mail"></use></svg></div>
      <div class="data email ad">
      <a href="mailto:{$contact_infos.email}">{$contact_infos.email}</a>
       </div>
    </li>
  {/if} *}
   
</ul>
</li>
  </div>
</div>