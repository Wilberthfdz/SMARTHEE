{**
 * 2007-2017 PrestaShop
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
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{extends file=$layout}

{block name='head_seo' prepend}
  <link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
  <meta property="og:type" content="product">
  <meta property="og:url" content="{$urls.current_url}">
  <meta property="og:title" content="{$page.meta.title}">
  <meta property="og:site_name" content="{$shop.name}">
  <meta property="og:description" content="{$page.meta.description}">
  <meta property="og:image" content="{$product.cover.large.url}">
  <meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
  <meta property="product:pretax_price:currency" content="{$currency.iso_code}">
  <meta property="product:price:amount" content="{$product.price_amount}">
  <meta property="product:price:currency" content="{$currency.iso_code}">
  {if isset($product.weight) && ($product.weight != 0)}
  <meta property="product:weight:value" content="{$product.weight}">
  <meta property="product:weight:units" content="{$product.weight_unit}">
  {/if}
{/block}

{block name='content'}

  <section id="main" itemscope itemtype="https://schema.org/Product">
    <meta itemprop="url" content="{$product.url}">

    <div class="row probg">
      <div class="col-lg-5 col-md-6 col-sm-12 col-xs-12 sticky">
        {block name='page_content_container'}
          <section class="page-content" id="content">
            {block name='page_content'}
              {* {block name='product_flags'}
                <ul class="product-flags">
                  {foreach from=$product.flags item=flag}
                    <li class="product-flag {$flag.type}">{$flag.label}</li>
                  {/foreach}
                </ul>
              {/block} *}

              {block name='product_cover_thumbnails'}
                {include file='catalog/_partials/product-cover-thumbnails.tpl'}
              {/block}
               <div class="scroll-box-arrows">
                <i class="material-icons left">&#xE314;</i>
                <i class="material-icons right">&#xE315;</i>
              </div>
            {/block}
          </section>
        {/block}
        </div>
        <div class="col-lg-7 col-md-6 col-sm-12 col-xs-12 propage">
          {block name='page_header_container'}
            {block name='page_header'}
              <h1 class="h1" itemprop="name">{block name='page_title'}{$product.name}{/block}</h1><hr>
            {/block}
          {/block}

         
           <div class="arltr">
             {block name='product_reviews'}
              {hook h='displayProductListReviewspro' product=$product}
            {/block}
            <a href="#rate" id="ratep"><i class="fa fa-comments-o"></i>{l s='review' d='Shop.Theme.Global'}</a></div>
            <hr>
          {block name='product_prices'}
            {include file='catalog/_partials/product-prices.tpl'}
          {/block}

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

          <div class="product-information">
            {block name='product_description_short'}
              <div id="product-description-short-{$product.id}" itemprop="description" class="prodes">{$product.description_short nofilter}</div>
            {/block}

            {if $product.is_customizable && count($product.customizations.fields)}
              {block name='product_customization'}
                {include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
              {/block}
            {/if}

            <div class="product-actions">
              {block name='product_buy'}
                <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
                  <input type="hidden" name="token" value="{$static_token}">
                  <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
                  <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
          
                  {block name='product_variants'}
                    {include file='catalog/_partials/product-variants.tpl'}
                  {/block}

                  {block name='product_pack'}
                    {if $packItems}
                      <section class="product-pack">
                        <h3 class="h4">{l s='This pack contains' d='Shop.Theme.Catalog'}</h3>
                        {foreach from=$packItems item="product_pack"}
                          {block name='product_miniature'}
                            {include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
                          {/block}
                        {/foreach}
                    </section>
                    {/if}
                  {/block}

                  {block name='product_discounts'}
                    {include file='catalog/_partials/product-discounts.tpl'}
                  {/block}
                  
                  <div class="pitemp">
                    {if $product->quantity > 0}
                      <span class="item-quantity d-inline-block">{$product.quantity|intval} {l s='items' d='Shop.Theme.Catalog'}</span>
                    {/if}
                    
                    <div class="obar d-inline-block">
                    {if $product->quantity <= 50}
                      <div class="ibar bar1"></div>
                      {elseif $product->quantity <= 100}
                      <div class="ibar bar2"></div>
                      {elseif $product->quantity <= 150}
                      <div class="ibar bar3"></div>
                      {elseif $product->quantity <= 200}
                      <div class="ibar bar4"></div>
                      {else}
                      <div class="ibar bar5"></div>
                    {/if}
                    </div>
                  </div>

                  {block name='product_add_to_cart'}
                    {include file='catalog/_partials/product-add-to-cart.tpl'}
                  {/block}

                  {block name='product_additional_info'}
                    {include file='catalog/_partials/product-additional-info.tpl'}
                  {/block}

                   {* Input to refresh product HTML removed, block kept for compatibility with themes *}
                  {block name='product_refresh'}{/block}

                </form>
              {/block}

            </div>

           
        </div>
       
      </div>
    </div>

             {block name='hook_display_reassurance'}
              {hook h='displayReassurance'}
            {/block}
 
            {block name='product_tabs'}
                <div class="product-tab">
                <ul class="nav nav-tabs" role="tablist">
                  {if $product.description}
                    <li class="nav-item">
                       <a
                         class="nav-link{if $product.description} active{/if}"
                         id="tab1"
                         data-toggle="tab"
                         href="#description"
                         role="tab"
                         aria-controls="description"
                         {if $product.description} aria-selected="true"{/if}>{l s='Description' d='Shop.Theme.Global'}</a>
                    </li>
                  {/if}
                  <li class="nav-item pdetail">
                    <a
                      class="nav-link{if !$product.description} active{/if}"
                      data-toggle="tab"
                      id="tab2"
                      href="#product-details"
                      role="tab"
                      aria-controls="product-details"
                      {if !$product.description} aria-selected="true"{/if}>{l s='Details' d='Shop.Theme.Global'}</a>
                  </li>
                  {if $product.attachments}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        id="tab3"
                        data-toggle="tab"
                        href="#attachments"
                        role="tab"
                        aria-controls="attachments">{l s='Attachments' d='Shop.Theme.Global'}</a>
                    </li>
                  {/if}
                  {foreach from=$product.extraContent item=extra key=extraKey}
                    <li class="nav-item">
                      <a
                        class="nav-link"
                        data-toggle="tab"
                        href="#extra-{$extraKey}"
                        role="tab"
                        aria-controls="extra-{$extraKey}">{$extra.title}</a>
                    </li>
                  {/foreach}
                  {* <li class="nav-item">
                      <a class="nav-link" href="#rate" data-toggle="tab" role="tab" id="rv"> {l s='Review' d='Shop.Theme.Global'}</a>
                  </li> *}
                </ul>

                <div class="tab-content" id="tab-content">
                 <div class="tab-pane fade in{if $product.description} active{/if}" id="description" role="tabpanel">
                   {block name='product_description'}
                     <div class="product-d">{$product.description nofilter}</div>
                   {/block}
                 </div>

                 {block name='product_details'}
                   {include file='catalog/_partials/product-details.tpl'}
                 {/block}

                 {block name='product_attachments'}
                   {if $product.attachments}
                    <div class="tab-pane fade in" id="attachments" role="tabpanel">
                       <section class="product-attachments">
                       {*   <h3 class="h5 text-uppercase">{l s='Download' d='Shop.Theme.Actions'}</h3> *}
                         {foreach from=$product.attachments item=attachment}
                           <div class="attachment">
                             <h4><a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a></h4>
                             <p>{$attachment.description}</p>
                             <a href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
                               <i class="fa fa-download"></i>    {l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
                             </a>
                           </div>
                         {/foreach}
                       </section>
                     </div>
                   {/if}
                 {/block}

                 {foreach from=$product.extraContent item=extra key=extraKey}
                 <div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey} tab2" role="tabpanel" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
                   {$extra.content nofilter}
                 </div>
                 {/foreach}
                {* <div class="tab-pane fade in" id="rate" role="tabpanel">
                  {hook h='displayProductFooter' product=$product}
                 </div> *}

              </div>
            </div>
          {/block}
          <div class="pro-review">
            <h2 class="rhead">{l s='Review' d='Shop.Theme.Global'}</h2>
            {hook h='displayProductFooter' product=$product}
          </div>


    {block name='product_accessories'}
      {if $accessories}
        <section class="product-accessories clearfix prelated tabpro next-prevb">
          
          <div class="home-heading"><h2><span>{l s='Related Product' d='Shop.Theme.Global'}</span></h2></div>
          <div class="products co-content row marginrow">
          <div id="owl-related" class="owl-carousel owl-theme">
            {foreach from=$accessories item="product_accessory"}
              {block name='product_miniature'}
                {include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
              {/block}
            {/foreach}
          </div>
          </div>
        </section>
      {/if}
    {/block}

    {block name='product_footer'}
      {hook h='displayFooterProduct' product=$product category=$category}
    {/block}

    {block name='product_images_modal'}
      {include file='catalog/_partials/product-images-modal.tpl'}
    {/block}

    {block name='page_footer_container'}
      <footer class="page-footer">
        {block name='page_footer'}
          <!-- Footer content -->
        {/block}
      </footer>
    {/block}
  </section>
{/block}
