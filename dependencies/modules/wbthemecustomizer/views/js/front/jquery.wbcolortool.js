/*
* 2007-2020 PrestaShop
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
*  @copyright  2007-2020 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

$(document).ready(function() {
    function add_backgroundcolor(bgcolor) {
    $('<style type="text/css">.block_newsletter form button[type="submit"],.product-flags li,.container_wb_megamenu .title-menu,.carti.cart-c, .cart-wishlist-number,.nav.nav-tabs.cate-tab .slick-prev:hover, .nav.nav-tabs.cate-tab .slick-next:hover,#cate-re .nav-item.cate-menu.tab-menu:hover, #cate-re .nav-link:hover, #cate-re .nav-link.active,.offer-text .btn-primary,.pro-tab.tabs .nav-tabs .nav-link::after,.left-heading h2::before,.home-heading h2::before, .pro-tab h2::before,.pro-tab.tabs .nav-tabs .nav-link.active::before, .pro-tab.tabs .nav-tabs .nav-link:hover::before,#owl-onsale .button-group button:hover, #owl-onsale .button-group a:hover,.carti.cart-c,.block_newsletter .btn,#owl-new .cartb:hover,#cate-re .nav-tabs li.slick-current,.absbtntop a:hover, .absbtntop .add-cart:hover .cartb, .absbtntop .add-cart:hover,.product-additional-info .add_to_compare, .product-additional-info .prowish,#testi.owl-theme .owl-dots .owl-dot.active span, #testi.owl-theme .owl-dots .owl-dot:hover span,.pro-tab .nav-tabs .nav-item a.active::before,.frst-ds a:hover,.toppati,.banner-des a,.block-social .social li:hover,.headsvgic::before,.headsvgic::after,.stimenu,#product_comparison .btn-product.add-to-cart,.content_more::before,.catemore:hover,#product_comparison .btn-product.add-to-cart:hover, #product_comparison .btn-product.add-to-cart:focus,.custom-radio input[type="radio"]:checked + span,.products-sort-order .select-title,.product-tab .nav-tabs .nav-item a.active::before,.blog_mask .icon:hover,.btn-primary{ background-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.next-prevb .owl-theme .owl-nav [class*="owl-"]:hover,.sub-cat-ul li a::before,.button-search,.ico-menu .bar::after,.offerword a,.absbtn button:hover, .button-group button:hover, .button-group a:hover,#scroll,.custom-checkbox input[type="checkbox"] + span .checkbox-checked,#search_block_top .btn.button-search,.quickview .arrows .arrow-up:hover, .quickview .arrows .arrow-down:hover,.group-span-filestyle .btn-default,.input-group .input-group-btn > .btn[data-action="show-password"],.owl-theme .owl-dots .owl-dot.active span, .owl-theme .owl-dots .owl-dot span:hover, .owl-theme .owl-dots .owl-dot:hover span,.pagination .page-list li.current a,.pagination .page-list li a:hover, .pagination .page-list li a:focus,.has-discount .discount{ background:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.cat-img:hover h2.categoryName,span.userdess:hover,.statmenu li a:hover,.blogdau .blogd,.deliveryinfo ul:hover li h4,.cat-shop,.read_more:hover, .read_more:focus,.pro-tab.tabs .nav-tabs .nav-link.active, .pro-tab.tabs .nav-tabs .nav-link:hover,.star.star_on::after,.star::after,.view_more a:hover span,#testi h3,.foot-copy ._blank:hover,#cate-re .slick-current.slick-active::after,.slideshow-panel .owl-theme .owl-nav [class*="owl-"]:hover,.pro-tab ul li a:hover, .pro-tab ul li a.active,.headleft span,.sub-cat ul a:hover,.shopcate:hover,.currency-selector li.current a,#_desktop_language_selector button:hover, #_desktop_currency_selector button:hover, .wishtlist_top:hover, .hcom a:hover,.whishlist-am a,.noty_text_body a,.frst-ds a,.cart-products-count.cart-c,.cartn,.cateall:hover h5,.wb-menu-vertical ul li.level-1:hover > a, .view_menu a:hover,.offerword h4,.cartc,.block-categories .collapse-icons .add:hover, .block-categories .collapse-icons .remove:hover,.new,.block-categories .collapse-icons .add:hover,.block-categories .collapse-icons .remove:hover,#blog .post_title,.post_title a:hover,.right-nav .dropdown-menu a:hover,.next-prevb #testi.owl-theme .owl-nav .owl-prev:hover,.cate-img span:hover,#wbsearch_data .items-list li .content_price .price,.product-price,#cta-terms-and-conditions-0,.page-my-account #content .links a:hover,.page-my-account #content .links a:hover i,.thumbnail-container .product-title:hover, .thumbnail-container .product-title a:hover,.facet-title,.product-tab .nav-item a:hover, .product-tab .nav-item a.active,.social-sharing li:hover a,#header .wb-cart-item-info a.wb-bt-product-quantity:hover i,.view_more a:hover,.footer-container li a:hover, #footer .lnk_wishlist:hover, .foot-payment i:hover,a:hover, a:focus{ color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.product-flags li,.offer-text .btn-primary,.deliveryinfo ul:hover::before,.cat-img:hover,#owl-new .cartb:hover,.slideshow-panel .owl-theme .owl-nav [class*="owl-"]:hover,.absbtn button:hover, .button-group button:hover, .button-group a:hover,.frst-ds a:hover,.timg,.catb:hover,.product-images > li.thumb-container > .thumb.selected, .product-images > li.thumb-container > .thumb:hover,.form-control:focus,.owl-theme .owl-dots .owl-dot.active span, #testi.owl-theme .owl-dots .owl-dot:hover span,.blog_mask .icon:hover{ border-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.wb-menu-vertical ul li:hover .wbIcon span, .view_more a:hover span{ border-left-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ border-right-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.read_more:hover, .read_more:focus,.view_menu .more-menu, .view_cat_menu .more-menu,.shopcate:hover{ border-bottom-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.foot-topb hr,.bhr,#testi hr,.content_test,.header-nav .dropdown-menu, .user-down, .language-selector .dropdown-menu, .currency-selector .dropdown-menu, .se-do, .head-cart-drop, .se-do, .language-selector .dropdown-menu, .currency-selector .dropdown-menu,.wb-menu-vertical .menu-dropdown,.headsvg::before,.headsvg::after,.view_menu .more-menu{ border-top-color:#' + bgcolor + '}</style>').appendTo('head');
	$('<style type="text/css">.blogd svg,.csvg,#_desktop_user_info:hover svg, #_desktop_cart:hover svg,#testi svg,.read_more:hover, .read_more:focus,.button-search:hover svg, .button-search:focus svg,.usvg:hover svg,.slideshow-panel .owl-theme .owl-nav [class*="owl-"],.csvg:hover svg,.setting:hover svg, #search_toggle:hover svg,#svg-b,#footer_contact .icon svg,.headsvg svg,#_desktop_language_selector button:hover, #_desktop_currency_selector button:hover,.wishl:hover svg,.search-toggle:hover svg,.hcom:hover svg, #_desktop_language_selector:hover svg, #_desktop_currency_selector:hover svg,.blockcart:hover svg, .d-search:hover svg ,.wishl:hover svg,.border svg{ fill:#' + bgcolor + '}</style>').appendTo('head');
	if ($(window).width() >= 992){
        $('<style type="text/css">{ background-color:#' + bgcolor + '}</style>').appendTo('head');
        $('<style type="text/css">{ border-color:#' + bgcolor + '}</style>').appendTo('head');

    }
    if ($(window).width() <= 767){
        $('<style type="text/css">{ background-color:#' + bgcolor + '}</style>').appendTo('head');
        $('<style type="text/css">{ fill:#' + bgcolor + '}</style>').appendTo('head');
    } 
     if (LANG_RTL == '1') {
     	$('<style type="text/css">{ border-right-color:#' + bgcolor + ' !important}</style>').appendTo('head');
     } 
    }
    function add_hovercolor(hcolor) {
	$('<style type="text/css">{ background-color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ background:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ border-color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ border-bottom-color:#' + hcolor + '}</style>').appendTo('head');
	$('<style type="text/css">{ fill:#' + hcolor + '}</style>').appendTo('head');
    }
    
    $('.wbopen-closeclr').click(function() {

	if ($(this).hasClass('wbclrdisable')) {
	    $(this).removeClass('wbclrdisable');
	    $(this).addClass('wbclrenable');
	 //    if (LANG_RTL == '1') {
		// $('.wbcolor_box').animate({left: '0'}, 450);
	 //    } else {
		$('.wbcolor_box').animate({right: '30px'}, 450);
	    // }
	    $('.wbcolor_box').css({'box-shadow': '0 10px 35px 10px rgba(0,0,0,.06)', 'background': '#fff', 'border-radius': '4px 0 4px 4px'});
	    $('.wbcolor_option,.wbcolor_title').animate({'opacity': '1'}, 450);
	} else {
	    $(this).removeClass('wbclrenable');
	    $(this).addClass('wbclrdisable');
	 //    if (LANG_RTL == '1') {
		// $('.wbcolor_box').animate({left: '-250px'}, 450);
	 //    } else {
		$('.wbcolor_box').animate({right: '-250px'}, 450);
	    // }
	    $('.wbcolor_box').css({'box-shadow': 'none', 'background': 'transparent'});
	    $('.wbcolor_option,.wbcolor_title').animate({'opacity': '0'}, 450);
	}
    });
    $('#backgroundColor, #hoverColor').each(function() {
	var $el = $(this);
	var date = new Date();
	date.setTime(date.getTime() + (1440 * 60 * 1000));
	$el.ColorPicker({color: '#444444', onChange: function(hsb, hex, rgb) {
		$el.find('div').css('backgroundColor', '#' + hex);
		switch ($el.attr("id")) {
		    case 'backgroundColor' :
			add_backgroundcolor(hex);
			$.cookie('wbcolor_backg', hex, {expires: date});
			break;
		    case 'hoverColor' :
			add_hovercolor(hex);
			$.cookie('wbcolor_hoverg', hex, {expires: date});
			break;
		    }
	    }});
    });
    var date = new Date();
    date.setTime(date.getTime() + (1440 * 60 * 1000));
    if ($.cookie('wbcolor_backg') && $.cookie('wbcolor_hoverg')) {
	add_backgroundcolor($.cookie('wbcolor_backg'));
	add_hovercolor($.cookie('wbcolor_hoverg'));
	var backgr = "#" + $.cookie('wbcolor_backg');
	var activegr = "#" + $.cookie('wbcolor_hoverg');
	$('#backgroundColor div').css({'background-color': backgr});
	$('#hoverColor div').css({'background-color': activegr});
    }

    /*Theme mode layout*/
    if (!$.cookie('wbcolor_input') && WB_mainLayout == "boxed"){
	$('input[name=wbcolor_input][value=box]').attr("checked", true);
    } else if (!$.cookie('wbcolor_input') && WB_mainLayout == "fullwidth") {
	$('input[name=wbcolor_input][value=wide]').attr("checked", true);
    } else if ($.cookie('wbcolor_input') == "boxed") {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('boxed');
	$.cookie('wbcolor_input', 'boxed');
	$.cookie('wbcolor_input_input', 'box');
	$('input[name=wbcolor_input][value=box]').attr("checked", true);
    } else if ($.cookie('wbcolor_input') == "fullwidth") {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('fullwidth');
	$.cookie('wbcolor_input', 'fullwidth');
	$.cookie('wbcolor_input_input', 'wide');
	$('input[name=wbcolor_input][value=wide]').attr("checked", true);
    }
    $('input[name=wbcolor_input][value=box]').click(function() {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('boxed');
	$.cookie('wbcolor_input', 'boxed');
        fullwidth_click();
    });
    $('input[name=wbcolor_input][value=wide]').click(function() {
	$('body').removeClass('fullwidth');
	$('body').removeClass('boxed');
	$('body').addClass('fullwidth');
	$.cookie('wbcolor_input', 'fullwidth');
        fullwidth_click();
    });

 $('.wbcolorpart a').click(function() {
	var id_color = this.id;
	$.cookie('wbcolor_backg', id_color.substring(0, 6));
	$.cookie('wbcolor_hoverg', id_color.substring(7, 13));
	add_backgroundcolor($.cookie('wbcolor_backg'));
	add_hovercolor($.cookie('wbcolor_hoverg'));
	var backgr = "#" + $.cookie('wbcolor_backg');
	var activegr = "#" + $.cookie('wbcolor_hoverg');
	$('#backgroundColor div').css({'background-color': backgr});
	$('#hoverColor div').css({'background-color': activegr});
    });

    $('.wbcolor_reset').click(function() {
	$.cookie('wbcolor_backg', '');
	$.cookie('wbcolor_hoverg', '');
	$.cookie('wbcolor_input', '');
	$.cookie('wbdlmodecolor_input', '');
	location.reload();
    });

    function fullwidth_click(){
        $('.wbFullWidth').each(function() {
                var t = $(this);
                var fullwidth = $('main').width(),
                    margin_full = fullwidth/2;
        if (LANG_RTL != 1) {
                t.css({'left': '50%', 'position': 'relative', 'width': fullwidth, 'margin-left': -margin_full});
        } else{
                t.css({'right': '50%', 'position': 'relative', 'width': fullwidth, 'margin-right': -margin_full});
        }
    });
    }
    // Webibazaar Active Class Js
    $(".uscolorac").click(function () {
        $(".uscolorac").removeClass("active");
        $(this).addClass("active");        
    });
});