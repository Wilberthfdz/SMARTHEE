{*
* 2007-2017 PrestaShop
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
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{extends file="helpers/form/form.tpl"}
{block name="input"}
	{if $input.type == 'gallery'}
		{* start gallery *}
		<div class="text_{$input.name}_multiple_parent">
		{if isset($input.defaults) && !empty($input.defaults)}
			<input type="hidden" name="{$input.name}_delete" class="{$input.name}_delete_class" id="{$input.name}_delete_id" value="{* {if isset($input.defaults_str)}{$input.defaults_str}{/if} *}">
			{foreach $input.defaults AS $defaul}
				<div class="row {$input.name}_class_parent">
					<div class="col-sm-3">
						<img src="{$input.url}{$defaul}" width="90" height="auto">
					{* </div>
					<div class="col-sm-3"> *}
						<button type="button" class="btn btn-default {$input.name}_cros_class" data-val="{$defaul}">X</button>
					</div>
				</div>
			{/foreach}
		{else}
			<div class="row {$input.name}_class_parent">
				<div class="col-sm-9">
					<input type="file" class="{$input.name}_class" name="{$input.name}[]">
				</div>
			</div>
		{/if}
			<button type="button" class="btn btn-default {$input.name}_add_class">+</button>
				<script>
					function adddeleteimages(id){
						if(typeof id !== 'undefined'){
							if($("#{$input.name}_delete_id").val() == ''){
								$("#{$input.name}_delete_id").val(id);
							}else{
								$("#{$input.name}_delete_id").val($("#{$input.name}_delete_id").val()+','+id);
							}
						}
					}
					$(".{$input.name}_add_class").on("click",function() { 
						$(this).before('<div class="row {$input.name}_class_parent"><div class="col-sm-9"><input type="file" class="{$input.name}_class" name="{$input.name}[]"></div><div class="col-sm-3"><button type="button" class="btn btn-default {$input.name}_cros_class">X</button></div></div>');
					 } );
					$(".text_{$input.name}_multiple_parent").on("click",".{$input.name}_cros_class",function() { 
						adddeleteimages($(this).data("val"));
						$(this).closest(".{$input.name}_class_parent").remove();
					 } );
				</script>
		</div>
		{* End gallery *}
	{elseif $input.type == 'text_multiple'}
		{* start text multiple *}
		<div class="text_{$input.name}_multiple_parent">
		{if isset($input.defaults) && !empty($input.defaults)}
			{foreach $input.defaults AS $defaul}
				<div class="row {$input.name}_class_parent"><div class="col-sm-9"><input type="text" class="{$input.name}_class" name="{$input.name}[]" value="{$defaul}"></div><div class="col-sm-3"><button type="button" class="btn btn-default {$input.name}_cros_class">X</button></div></div>
			{/foreach}
		{else}
			<div class="row {$input.name}_class_parent">
				<div class="col-sm-9">
					<input type="text" class="{$input.name}_class" name="{$input.name}[]">
				</div>
			</div>
		{/if}
			<button type="button" class="btn btn-default {$input.name}_add_class">+</button>
				<script>
					$(".{$input.name}_add_class").on("click",function() { 
						$(this).before('<div class="row {$input.name}_class_parent"><div class="col-sm-9"><input type="text" class="{$input.name}_class" name="{$input.name}[]"></div><div class="col-sm-3"><button type="button" class="btn btn-default {$input.name}_cros_class">X</button></div></div>');
					 } );
					$(".text_{$input.name}_multiple_parent").on("click",".{$input.name}_cros_class",function() { 
						// console.log($(this).closest(".{$input.name}_class_parent"));
						$(this).closest(".{$input.name}_class_parent").remove();
					 } );
				</script>
		</div>
		{* end text multiple *}
	{else}
		{$smarty.block.parent}
	{/if}
{/block}