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
<div id="_desktop_language_selector" class="d-inline-block">
  <div class="language-selector-wrapper">
    {* <span id="language-selector-label" class="hidden-md-up">{l s='Language:' d='Shop.Theme.Global'}</span> *}
    <div class="language-selector dropdown js-dropdown">
      <button data-toggle="dropdown" class="hidden-sm-down btn-unstyle" aria-haspopup="true" aria-expanded="false" aria-label="{l s='Language dropdown' d='Shop.Theme.Global'}"> 
        {* <svg width="18px" height="17px"><use xlink:href="#hlan"></use></svg>  *}
        <span class="expand-more text-capitalize">{$current_language.name_simple}</span>
        <i class="fa fa-angle-down"></i>
      </button>
      <ul class="dropdown-menu dropdown-menu-right hidden-sm-down" aria-labelledby="language-selector-label">
        {foreach from=$languages item=language}
          <li {if $language.id_lang == $current_language.id_lang} class="current" {/if}>
            <a href="{url entity='language' id=$language.id_lang}" class="dropdown-item"><img class="lang-flag" src="{$urls.img_lang_url}{$language.id_lang}.jpg"/> {$language.name_simple}</a>
          </li>
        {/foreach}
      </ul>
      <select class="link hidden-md-up" aria-labelledby="language-selector-label">
        {foreach from=$languages item=language}
          <option value="{url entity='language' id=$language.id_lang}"{if $language.id_lang == $current_language.id_lang} selected="selected"{/if}>{$language.name_simple}</option>
        {/foreach}
      </select>
      <i class="fa fa-angle-down hidden-md-up"></i>
    </div>
  </div>
</div>