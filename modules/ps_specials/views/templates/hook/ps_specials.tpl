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
 <div class="spprow">
 <div class="deal-pro next-prevb">
		<div class="left-heading"><h2 class="firstWord">{l s='daily deal' d='Shop.Theme.Catalog'}</h2></div>
		<section class="next-prevb deal-pro-r">
		      <div class="products row marginrow">
		         	<div id="owl-special" class="owl-carousel owl-theme">
		                {foreach from=$products item="product"}
		                  {include file="catalog/_partials/miniatures/deal-product.tpl" product=$product}
		                {/foreach}
		      		</div>
		      </div>
		</section>
</div>
</div>
