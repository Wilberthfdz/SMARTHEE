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
 <div class="block_newsletter col-md-4 col-sm-6 col-xs-12">
  <div class="foot-topb">
      <li class="newssvg d-inline-block hidden-sm-down"><svg width="70px" height="70px"><use xlink:href="#esend"></use></svg></li>
      <li class="d-inline-block">
        <h1 class="c-info">{* <span>{l s='Sign up for' d='Shop.Theme.Catalog'}</span>  *}<span class="newsb">{l s='Newsletter' d='Shop.Theme.Catalog'}</span><hr></h1>
        <h4>{* {l s='Get our updates on new arrivals' d='Shop.Theme.Catalog'} *}{$conditions}</h4>
      
    <div class="fthr">
      {* <h3 class="h3">{l s='Newsletter' d='Shop.Theme.Catalog'}</h3>
     {if $conditions}
          <h5 class="emsg hidden-md-down">{$conditions}</h5>
        {/if} *}
      <form action="{$urls.pages.index}#footer" method="post">
            
            
            
            <div class="input-wrapper">
              <input
                name="email"
                type="email"
                value="{$value}"
                placeholder="{l s='Your email address' d='Shop.Forms.Labels'}"
                aria-labelledby="block-newsletter-label"
              >
            </div>
            <button class="btn btn-primary float-xs-right" name="submitNewsletter" type="submit"><svg height="20px" width="20px"><use xlink:href="#send"></use></svg></button>
            <input type="hidden" name="action" value="0">
            <div class="clearfix"></div>
          <div class="col-xs-12">
              {if $msg}
                <p class="alert {if $nw_error}alert-danger{else}alert-success{/if}">
                  {$msg}
                </p>
              {/if}
              {if isset($id_module)}
                {hook h='displayGDPRConsent' id_module=$id_module}
              {/if}
          </div>
      </form>
    </div>
    </li>
  </div>
</div>