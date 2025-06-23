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
<div class="container next-prevb">

<div class="home_blog_post_area {$wbbdp_designlayout} {$hookName}">
	<div class="home_blog_post">
 <div class="page_title_area">
			{if isset($wbbdp_title)}
				 <div class="home-heading"><h2><span>{$wbbdp_title}</span></h2></div>
			{/if}
			<!-- {if isset($wbbdp_subtext)}
				<p class="page_subtitle">{$wbbdp_subtext}</p>
			{/if} -->
			{* <div class="heading-line d_none"><span></span></div> *}
		</div>
		<div class="home_blog_post_inner row marginrow">
		<div id="blog" class="owl-theme owl-carousel home_blog_post_inner">
		{if (isset($wbblogposts) && !empty($wbblogposts))}
			{foreach from=$wbblogposts item=wbblgpst}
				<article class="blog_post col-xs-12 propadding">
					<div class="blog_post_content row">
						<div class="blog_post_content_top col-xs-9">
							<div class="post_thumbnail">
								{if $wbblgpst.post_format == 'video'}
									{assign var="postvideos" value=','|explode:$wbblgpst.video}
									{if $postvideos|@count > 1 }
										{include file="module:wbblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class="carousel"}
									{else}
										{include file="module:wbblog/views/templates/front/post-video.tpl" videos=$postvideos width='570' height="316" class=""}
									{/if}
								{elseif $wbblgpst.post_format == 'audio'}
									{assign var="postaudio" value=','|explode:$wbblgpst.audio}
									{if $postaudio|@count > 1 }
										{include file="module:wbblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class="carousel"}
									{else}
										{include file="module:wbblog/views/templates/front/post-audio.tpl" audios=$postaudio width='570' height="316" class=""}
									{/if}
								{elseif $wbblgpst.post_format == 'gallery'}
									{if $wbblgpst.gallery_lists|@count > 1 }
										{include file="module:wbblog/views/templates/front/post-gallery.tpl" gallery=$wbblgpst.gallery_lists imagesize="home_blog" class="carousel"}
									{else}
										{include file="module:wbblog/views/templates/front/post-gallery.tpl" gallery=$wbblgpst.gallery_lists imagesize="home_blog" class=""}
									{/if}
								{else}
									<img class="wbblog_img img-responsive" src="{$wbblgpst.post_img_home_blog}" alt="{$wbblgpst.post_title}">
										<div class="blog_mask content">
											<div class="blog_mask_content">
											<a class="thumbnail_lightbox icon" href="{$wbblgpst.post_img_large}" data-lightbox="example-set">
											<i class="sicon fa fa-search"></i>
											</a>
											<a href="{$wbblgpst.link}" class="icon"><i class="fa fa-link"></i></a>
											</div>
										</div>
										

								{/if}
								
							</div>
							
							
						</div>
							<div class="blog_post_content_bottom blog-ct text-xs-left col-xs-8">
							
							
							<div class="post_content">

								<div class="blogdau">
									<span class="blogd">
										{* <i class="fa fa-calendar"></i> *}
											{* <svg width="20px" height="20px"><use xlink:href="#cal"></use></svg> *}
											<span class="bdate">{$wbblgpst.post_date|date_format:"%d"}</span>
											<span class="bmonth">{$wbblgpst.post_date|date_format:" %b"}</span>
											<span class="byear">{$wbblgpst.post_date|date_format:"%Y"}</span>
									</span> 
									
								</div>
								
								
								<div class="bdes">
									<h3 class="post_title"><a href="{$wbblgpst.link}">{$wbblgpst.post_title|truncate:60:' ...'}</a></h3>
								</div>
								
								{* <span class="bauthor"><span class="meta_author">{l s='Admin' mod='wbblog'} : <span class="bauc">{$wbblgpst.post_author_arr.firstname} {$wbblgpst.post_author_arr.lastname}</span></span>
								</span> *}
								
								
								{if isset($wbblgpst.post_excerpt) && !empty($wbblgpst.post_excerpt)}
									<p>{$wbblgpst.post_excerpt|truncate:120:' ...'|escape:'html':'UTF-8'}</p>
								{else}
									<p>{$wbblgpst.post_content|truncate:120:' ...'|escape:'html':'UTF-8'}</p>
								{/if}
								
								<a class="read_more btn" href="{$wbblgpst.link}">{l s='Read More' mod='wbblog'}{*  <svg width="16px" height="16px" class=""> <use xlink:href="#arrowrightb"></use></svg> *}</a>
								{* <span class="content_more">
										
									</span> *}
								<!-- <a class="thumbnail_lightbox icon" href="{$wbblgpst.post_img_large}" data-lightbox="example-set">
									<i class="sicon fa fa-search"></i>
								</a> -->
							</div>
							

							
					</div>
					</div>
				</article>
			{/foreach}
		{else}
			<p>{l s='No Blog Post Found' mod='wbblog'}</p>
		{/if}
		</div>
		</div>
	</div>
</div>
</div>

