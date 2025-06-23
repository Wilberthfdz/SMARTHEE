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

<div class="footer-container">
  <div class="container">
        <div class="row">
            {hook h='displayTopColumn'}
        </div>
        <div class="middle-footer">
          <div class="row">
            <div class="col-sm-9 col-xs-12">
              <div class="row">
                {block name='hook_footer'}
                  {hook h='displayFooter'}
                {/block}
              </div>
            </div>
            <div class="col-sm-3 col-xs-12">
              <ul class="list-inline list-unstyled foot-app d-inline-block">
              <h3 class="c-info">{l s='Download App' d='shop.theme.catalog'}</h3>
              <li>
              <div class="fb1"></div>
              </li>
              <li>
              <div class="fb2"></div>
              </li>
              </ul>
              {block name='hook_footerAfter'}
                {hook h='displayFooterAfter'}
              {/block}
            </div>
          </div>
        </div>
        <div class="foot-tag text-xs-center">
          {block name='hook_footer_before'}
              {hook h='displayFooterBefore'}
          {/block}
        </div>
       
  </div>

    <div class="foot-copy text-xs-center">
      <div class="container">
            {block name='copyright_link'}
              <a class="_blank" href="http://www.prestashop.com" target="_blank">
                {l s='%copyright% %year% - Ecommerce software by %prestashop%' sprintf=['%prestashop%' => 'PrestaShop™', '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
              </a>
            {/block}
             <div class="foot-bootom-bar">
              {block name='hook_footerDown'}
                {hook h='displayFooterDown'}
              {/block}
          </div>
      </div>
    </div>
  <a href="" id="scroll" title="Scroll to Top" style="display: none;"><i class="fa fa-angle-up"></i></a>
</div>
