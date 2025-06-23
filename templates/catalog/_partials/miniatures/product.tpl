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
                alt="{$image.legend}"
                width="{$product.cover.bySize.home_default.width}" height="{$product.cover.bySize.home_default.height}"
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

      <div class="wb-product-desc product-description text-xs-center">

        <div class="rate-var">
          <div class="progre d-inline-block">
          {block name='product_reviews'}
            {hook h='displayProductListReviews' product=$product}
          {/block}
          </div>
          {* <div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down d-inline-block">
          {block name='product_variants'}
            {if $product.main_variants}
              {include file='catalog/_partials/variant-links.tpl' variants=$product.main_variants}
            {/if}
          {/block}
        </div> *}
        </div>
      
        {block name='product_name'}
          {if $page.page_name == 'index'}
            <h3 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h3>
          {else}
            <h2 class="h3 product-title" itemprop="name"><a href="{$product.url}">{$product.name}</a></h2>
          {/if}
        {/block}
        {block name='product_description_short'}
          <div id="product-description-short-{$product.id}" itemprop="description" class="listds">{$product.description_short nofilter}</div>
        {/block} 
        
        <div class="price-rating">
         {block name='product_price_and_shipping'}
          {if $product.show_price}
            <div class="product-price-and-shipping">
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
       
        
        

         
        <div class="button-group">
              <div class="absbtn">
                
                {block name='quick_view'}
                    <a class="quick-view quick" href="#" data-link-action="quickview">
                      <svg width="18px" height="17px"><use xlink:href="#bquick" /></svg>{* <span>{l s='quick view' d='Shop.Theme.Catalog'}</span> *}
                    </a>
                {/block}
                
                <!-- <button data-toggle="tooltip" title="Wishlist" class="wish" id="wishlist_button" onclick="WishlistCart('wishlist_block_list', 'add', '{$product.id_product|intval}', {$product.id_product_attribute}, 1); return false;"><svg width="18px" height="17px"><use xlink:href="#heart"></use></svg>{* <span>{l s='wishlist' d='Shop.Theme.Catalog'}</span> *}</button> -->
                  {hook h='displayCompareButton' product=$product}

                  <div class="add-cart">
                  <form action="{$urls.pages.cart}" method="post" class="add-to-cart-or-refresh">
                    <input type="hidden" name="token" value="{$static_token}">
                    <input type="hidden" name="id_product" value="{$product.id}" class="product_page_product_id">
                    <input type="hidden" name="qty" value="1">
                    {if $product.quantity < 1 }
                    <button  data-toggle="tooltip" title="stock out" data-button-action="add-to-cart" class="cartb" disabled>
                        <svg width="20px" height="20px"><use xlink:href="#pcart"></use></svg>{* <span>{l s='stock out' d='Shop.Theme.Catalog'}</span> *}
                    </button>
                    {else}
                    <button  data-toggle="tooltip" title="Add to cart" data-button-action="add-to-cart" class="cartb">
                        <svg width="20px" height="20px"><use xlink:href="#pcart"></use></svg>{* <span>{l s='add to cart' d='Shop.Theme.Catalog'}</span> *}
                    </button>
                    {/if}
                  </form>
                </div>
                 
              </div>
        </div>
        
                {* <div class="pavilable">
                  {if $product.quantity > 0}
                    <div class="item-quantity">{l s='Available :' d='Shop.Theme.Catalog'} {$product.quantity|intval}</div>
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
                </div> *}
                  {* {hook h='displayProductPriceBlock' product=$product type='weight'} *}
      </div>

     

      

    </div>
  </article>
{/block}
