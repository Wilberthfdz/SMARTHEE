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
{block name='product_miniature_item'}
  <article class="product-miniature js-product-miniature col-xs-12 propadding cless" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container">
      <div class="custw">
        <div class="wb-image-block">
       {block name='product_thumbnail'}
        {if $product.cover}
          <a href="{$product.url}" class="thumbnail product-thumbnail first-img">
            <img
              class = "center-block img-responsive"
              src = "{$product.cover.bySize.home_default.url}"
              width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}"
              alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
              data-full-size-image-url = "{$product.cover.large.url}"
            >
            {$count=0}
           {foreach from=$product.images item=image}
            {if $count==0}
              <img class="second-img img-responsive center-block"  
                src="{$image.bySize.home_default.url}"
                width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}"
                alt="{$image.legend}"
                title="{$image.legend}"
                itemprop="image"
              >
              {/if} {$count=$count+1}
            {/foreach}
          </a>
        {else}
          <a href="{$product.url}" class="thumbnail product-thumbnail">
            <img
              src = "{$urls.no_picture_image.bySize.medium_default.url}"
            >
          </a>
        {/if}
             
               
               {if $product.discount_type === 'percentage'}
                  <span class="discount-percentage discount-product">{$product.discount_percentage}</span>
                {elseif $product.discount_type === 'amount'}
                  <span class="discount-amount discount-product">{$product.discount_amount_to_display}</span>
                {/if}
          {/block}
           {block name='product_flags'}
            <ul class="product-flags">
              {foreach from=$product.flags item=flag}
                <li class="product-flag {$flag.type}">{$flag.label}</li>
              {/foreach}
            </ul>
          {/block}
         {*  {if $product.has_discount}
            <span class="reducep hidden-md-down">{l s='reduced price' d='Shop.Theme.Catalog'}</span>
          {/if} *}
          
        </div>
   </div>


      <div class="wb-product-desc text-xs-center">
       <div class="progre">
          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}
        </div>
       <div class="addimde d-inline-block">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h2>
          {/if}
        {/block}
        <div class="rate-var">
        
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="deal-price">
              <span itemprop="price" class="price">{$product.price}</span>
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}
                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
              {/if}
              {hook h='displayProductPriceBlock' product=$product type="before_price"}
              <span class="sr-only">{l s='Price' d='Shop.Theme.Catalog'}</span>
              {hook h='displayProductPriceBlock' product=$product type='unit_price'}
            </div>
          {/if}
        {/block}
        {* <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down d-inline-block">
          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div> *}
        {* {block name='product_description_short'}
          <div id="product-description-short-{$product.id}" itemprop="description" class="custlistds">{$product.description_short nofilter}</div>
        {/block} *}
        <div class="pavilable">
                  {if $product.quantity > 0}
                    <div class="item-quantity text-xs-left">{l s='Available :' d='Shop.Theme.Catalog'} {$product.quantity|intval}</div>
                  {/if}
                  <div class="obar d-inline-block">
                  {if $product.quantity <= 50}
                    <div class="ibar bar1"></div>
                    {elseif $product.quantity <= 100}
                    <div class="ibar bar2"></div>
                    {elseif $product.quantity <= 150}
                    <div class="ibar bar3"></div>
                    {elseif $product.quantity <= 200}
                    <div class="ibar bar4"></div>
                    {else}
                    <div class="ibar bar5"></div>
                  {/if}

                  </div>
        </div>
          <div class="d-inline-block timerdiv">
		  {hook h='displayProductPriceBlock' product=$product type='weight'}
		  
		  {* Winter Infotech Start 10-12-2020*}
{if  isset($product.specific_prices.to) && ($product.specific_prices.to|date_format:"%Y/%m/%d" > $smarty.now|date_format:"%Y/%m/%d")}
  <div data-date="{$product.specific_prices.to|date_format:"%Y/%m/%d"}" class="wbproductcountdown wb_product_countdown wbpc-main">
    <div class="time wb_countdown_days">
      <span class="count wb_countdown_days_digit"></span>
      <span class="label">{l s='Days' d='Shop.Theme.Catalog'}</span>
    </div>
    <div class="time wb_countdown_hours">
      <span class="count wb_countdown_hours_digit"></span>
      <span class="label">{l s='Hours' d='Shop.Theme.Catalog'}</span>
    </div>
    <div class="time wb_countdown_minutes">
      <span class="count wb_countdown_minutes_digit"></span>
      <span class="label">{l s='Mins' d='Shop.Theme.Catalog'}</span>
    </div>
    <div class="time wb_countdown_seconds">
      <span class="count wb_countdown_seconds_digit"></span>
      <span class="label">{l s='Sec' d='Shop.Theme.Catalog'}</span>
    </div>
  </div>
{/if}
{* Winter Infotech End*}


		  </div>
           
          </div>
      </div>
    </div>
  </article>
{/block}
