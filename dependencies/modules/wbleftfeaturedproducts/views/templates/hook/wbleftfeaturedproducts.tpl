{*
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
*}
<div class="next-prevb left-product">
<section class="featured-products clearfix">
 <div class="left-heading text-xs-left"><h2>{l s='new arrival' mod='wbleftfeaturedproducts'}</h2></div>
  <div class="products row marginrow">
  <div id="owl-leftf" class="owl-carousel owl-theme">
    {$num_row=2} <!-- Number of Row Ex 2,3,4,5....etc-->
    {$i=0}
    {if count($products) <= 1}
      {foreach from=$products item="product"}
        {include file="catalog/_partials/miniatures/left-product.tpl" product=$product}
      {/foreach}
    {else}
      {foreach from=$products item="product"}
        {if $i == 0}
          <ul>
            <li>
        {/if}
              {include file="catalog/_partials/miniatures/left-product.tpl" product=$product}
              {$i=$i+1}
        {if $i == $num_row}
            </li>
          </ul>
          {$i=0}
        {/if}
      {/foreach}
    {/if}
  </div>
</div>
</section>
</div>