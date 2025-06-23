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
  <article class="product-miniature js-product-miniature col-xs-12 propadding" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
    <div class="thumbnail-container text-xs-left">
      <div class="wb-image-block col-xs-4">
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
              src = "{$urls.no_picture_image.bySize.home_default.url}"
            >
          </a>
        {/if}
             
               
             
          {/block}
       
          {* {hook h='displayProductPriceBlock' product=$product type='weight'} *}
          
        </div>

      <div class="wb-product-desc product-description text-xs-left col-xs-8">
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h2>
          {/if}
        {/block}
        <div class="progre">
        {block name='product_reviews'}
          {hook h='displayProductListReviews' product=$product}
        {/block}
        </div>
       
        
        
        {block name='product_description_short'}
          <div id="product-description-short-{$product.id}" itemprop="description" class="listds">{$product.description_short nofilter}</div>
        {/block} 
        
        {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping-top">
              <span itemprop="price" class="price">{$product.price}</span>
              {if $product.has_discount}
                {hook h='displayProductPriceBlock' product=$product type="old_price"}

                <span class="sr-only">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
                <span class="regular-price">{$product.regular_price}</span>
               
              {/if}

              {hook h='displayProductPriceBlock' product=$product type="before_price"}
              

              {hook h='displayProductPriceBlock' product=$product type='unit_price'}

            </div>
          {/if}
        {/block}

      </div>

     

      

    </div>
  </article>
{/block}
