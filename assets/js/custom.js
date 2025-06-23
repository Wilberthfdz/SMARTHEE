/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */

// Webi Timer
$( document ).ready(function() {
  $('.wb_product_countdown').each(function() {
    $.wbCountDownTimer($(this));
  }); 
});
$.wbCountDownTimer = (function(event) {
  setInterval(function() {
    var countDownDate = new Date($(event).data("date")).getTime();
    var now = new Date().getTime();
    var distance = countDownDate - now;
      $(event).find('.wb_countdown_days .wb_countdown_days_digit').text(Math.floor(distance / (1000 * 60 * 60 * 24)));
      $(event).find('.wb_countdown_hours .wb_countdown_hours_digit').text(Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)));
      $(event).find('.wb_countdown_minutes .wb_countdown_minutes_digit').text(Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60)));
      $(event).find('.wb_countdown_seconds .wb_countdown_seconds_digit').text(Math.floor((distance % (1000 * 60)) / 1000));
    if (distance < 0) {
      clearInterval(x);
      $(event).text("EXPIRED");
    }
}, 1000);
});

$(document).ready(function() {
var owl = $("#xs-zoom");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1}
        
      },
      dots: true,
       nav: false,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
      margin:15
      });
  });
});


// rating
$(document).ready(function () {
$("#ratep").click(function() {
    $('html, body').animate({ 
        scrollTop: $(".pro-review").offset().top }, 1800);
    });
});
// rating end


/* Slider Loader*/
$(window).load(function myFunction() {
  $(".s-panel .loader").removeClass("wrloader");
});

 // $(document).ready(function(){
 //     var o = $('#page-preloader');
 //     if (o.length > 0) {
 //         $(window).on('load', function() {
 //             $('#page-preloader').removeClass('visible');
 //         });
 //    }
 // });


/* sidemenu */
function openNav() {
    $('body').addClass("active");
    document.getElementById("mySidenav").style.width = "280px";
    $('#mobile_top_menu_wrapper').addClass("dblock");
    $('#mobile_top_menu_wrapper').removeClass("dnone");
}
function closeNav() {
    $('body').removeClass("active");
    document.getElementById("mySidenav").style.width = "0";
    $('#mobile_top_menu_wrapper').addClass("dnone");
    $('#mobile_top_menu_wrapper').removeClass("dblock");
}
/* sidemenu over */

$(document).keyup(function(e) {
     if (e.keyCode == 27) { // escape key maps to keycode `27`
       $('body').removeClass("active");
    document.getElementById("mySidenav").style.width = "0";
    $('#mobile_top_menu_wrapper').addClass("dnone");
       }
});


//go to top
$(document).ready(function () {
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll').fadeIn();
        } else {
            $('#scroll').fadeOut();
        }
    });
    $('#scroll').click(function () {
        $("html, body").animate({scrollTop: 0}, 600);
        return false;
    });
});

/* list grid view */
$(document).ready(function(){
    listGrid();
});
(function($){var ls=window.localStorage;var supported;if(typeof ls=='undefined'||typeof window.JSON=='undefined'){supported=false;}else{supported=true;}
$.totalStorage=function(key,value,options){return $.totalStorage.impl.init(key,value);}
$.totalStorage.setItem=function(key,value){return $.totalStorage.impl.setItem(key,value);}
$.totalStorage.getItem=function(key){return $.totalStorage.impl.getItem(key);}
$.totalStorage.getAll=function(){return $.totalStorage.impl.getAll();}
$.totalStorage.deleteItem=function(key){return $.totalStorage.impl.deleteItem(key);}
$.totalStorage.impl={init:function(key,value){if(typeof value!='undefined'){return this.setItem(key,value);}else{return this.getItem(key);}},setItem:function(key,value){if(!supported){try{$.cookie(key,value);return value;}catch(e){console.log('Local Storage not supported by this browser. Install the cookie plugin on your site to take advantage of the same functionality. You can get it at https://github.com/carhartl/jquery-cookie');}}
var saver=JSON.stringify(value);ls.setItem(key,saver);return this.parseResult(saver);},getItem:function(key){if(!supported){try{return this.parseResult($.cookie(key));}catch(e){return null;}}
return this.parseResult(ls.getItem(key));},deleteItem:function(key){if(!supported){try{$.cookie(key,null);return true;}catch(e){return false;}}
ls.removeItem(key);return true;},getAll:function(){var items=new Array();if(!supported){try{var pairs=document.cookie.split(";");for(var i=0;i<pairs.length;i++){var pair=pairs[i].split('=');var key=pair[0];items.push({key:key,value:this.parseResult($.cookie(key))});}}catch(e){return null;}}else{for(var i in ls){if(i.length){items.push({key:i,value:this.parseResult(ls.getItem(i))});}}}
return items;},parseResult:function(res){var ret;try{ret=JSON.parse(res);if(ret=='true'){ret=true;}
if(ret=='false'){ret=false;}
if(parseFloat(ret)==ret&&typeof ret!="object"){ret=parseFloat(ret);}}catch(e){}
return ret;}}})(jQuery);



function listGrid()
{
  var view = $.totalStorage('display');

  if (!view && (typeof displayList != 'undefined') && displayList)
    view = 'list';

  if (view && view != 'grid')
    display(view);
  else
    $('.display').find('#wbgrid').addClass('selected');

  $(document).on('click', '#wbgrid', function(e){
    e.preventDefault();
    display('grid');
    $(this).parents("#products-list").find(".wb-product-grid .item-product").removeClass("fadeInRight");
    $(this).parents("#products-list").find(".wb-product-grid .item-product").addClass(" animated zoomIn"); 
  
  });

  $(document).on('click', '#wblist', function(e){
    e.preventDefault();
    display('list');
    $(this).parents("#products-list").find(".wb-product-list .item-product").addClass(" animated fadeInRight");
    $(this).parents("#products-list").find(".wb-product-list .item-product").removeClass(" zoomIn"); 

  });

}

function display(view)
{
  if (view == 'grid')
  {
    $('#js-product-list .product-thumbs').removeClass('wb-product-list').addClass('wb-product-grid row');
    $('.product-thumbs .item-product').removeClass('col-xs-12').addClass('col-xs-12 col-sm-6 col-md-4 col-xl-3 col-lg-3');
    $('.product-thumbs .item-product .wb-image-block').removeClass('col-lg-3 col-xl-3 col-md-4 col-sm-6 col-xs-12');
    $('.product-thumbs .item-product .wb-product-desc').removeClass('col-lg-9 col-xl-9 col-md-8 col-sm-6 col-xs-12');
    $('.display').find('#wbgrid').addClass('selected');
    $('.display').find('#wblist').removeAttr('class');
    $.totalStorage('display', 'grid');
  }
  else
  { 
    $('#js-product-list .product-thumbs').removeClass('wb-product-grid').addClass('wb-product-list row');
    $('.product-thumbs .item-product').removeClass('col-xs-12 col-sm-6 col-md-4 col-xl-3 col-lg-3').addClass('col-xs-12');
    $('.product-thumbs .item-product .wb-image-block').addClass('col-lg-3 col-xl-3 col-md-4 col-sm-6 col-xs-12');
    $('.product-thumbs .item-product .wb-product-desc').addClass('col-lg-9 col-xl-9 col-md-8 col-sm-6 col-xs-12');
    $('.display').find('#wblist').addClass('selected');
    $('.display').find('#wbgrid').removeAttr('class');
    $.totalStorage('display', 'list');
  }
}

$(document).ready(function() {
var owl = $("#owl-image-slider");
imagesLoaded(owl, function() {
  owl.owlCarousel({
        loop: true,
      autoplay:true,
      animateIn: 'fadeIn',
        animateOut: 'fadeOut',
      autoplayTimeout: 6000,
      responsive: {
        0: { items: 1}
      },
      dots: true,
      nav: true,
      navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
      margin:0
      });
  });
});

//testi
$(document).ready(function() {
var owl = $("#testi");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      //autoplay:true,
      //autoplayTimeout: 5000,
      responsive: {
        0: { items: 1}
        
      },
      dots: true,
       nav: false,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});
$(document).ready(function() {
var owl = $("#owl-fea,#owl-best,#owl-related,#same-pro,#view-pro,#cross,#owl-new");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        320:{ items: 2, slideBy: 1},
        600:{ items: 3, slideBy: 1},
        700:{ items: 3, slideBy: 1},
        768:{ items: 2, slideBy: 1},
        992:{ items: 3, slideBy: 1},
        1200:{ items: 3, slideBy: 1},
        1410:{ items: 4, slideBy: 1},
        1590:{ items: 5, slideBy: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

$(document).ready(function() {
var owl = $("#owl-special");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        600: { items: 2},
        768: { items: 1},
        1200: { items: 1},
        1410: { items: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

$(document).ready(function() {
var owl = $("#owl-onsale");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        320:{ items: 1, slideBy: 1},
        600:{ items: 2, slideBy: 1},
        768:{ items: 1, slideBy: 1},
        992:{ items: 2, slideBy: 1},
        1200:{ items: 2, slideBy: 1},
        1410:{ items: 3, slideBy: 1},
        1590:{ items: 3, slideBy: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

$(document).ready(function() {
var owl = $("#owl-rate");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        320: { items: 1},
        600: { items: 2},
        768: { items: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

$(document).ready(function() {
var owl = $("#owl-leftf");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        320: { items: 2},
        600: { items: 3},
        768: { items: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

$(document).ready(function() {
var owl = $("#owl-catfeature");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 1},
        320:{ items: 2, slideBy: 1},
        412:{ items: 2, slideBy: 1},
        600:{ items: 3, slideBy: 1},
        700:{ items: 3, slideBy: 1},
        768:{ items: 3, slideBy: 1},
        992:{ items: 4, slideBy: 1},
        1200:{ items: 5, slideBy: 1},
        1410:{ items: 6, slideBy: 1},
        1590:{ items: 8, slideBy: 1}
        
      },
      dots: false,
       nav: true,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});

//category tab
$(document).ready(function() {
var owl = $(".wbContentProduct .wbContainer .wbProducts-Grid .owl-product");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
       0: { items: 1},
        320:{ items: 1, slideBy: 1},
        600:{ items: 2, slideBy: 1},
        768:{ items: 1, slideBy: 1},
        992:{ items: 2, slideBy: 1},
        1200:{ items: 2, slideBy: 1},
        1410:{ items: 3, slideBy: 1},
        1590:{ items: 4, slideBy: 1}
      },
      dots: false,
      autoplay:false,
    autoplayTimeout: 2000,
       nav: false,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
    margin:0
      });
  });
});

 $('.sub-cat-ul').slick({
   slidesToShow: 1,
   rows: 6,
   dots: false,
   arrows:true,
   focusOnSelect: true,
   responsive: [
    {
      breakpoint: 1200,
      settings: {
        slidesToShow: 1,
        rows: 6,
        infinite: true,
      }
    },
    {
      breakpoint: 992,
      settings: {
        slidesToShow: 1,
      }
    },
    {
      breakpoint: 767,
      settings: {
        slidesToShow: 1,
      }
    },
    {
      breakpoint: 600,
      settings: {
        slidesToShow: 1,
      }
    },
    {
      breakpoint: 576,
      settings: {
        slidesToShow: 1,
      }
    },
    {
      breakpoint: 500,
      settings: {
        slidesToShow: 1,
      }
    },
    {
      breakpoint: 361,
      settings: {
        slidesToShow: 1,
      }
    }
  ]
 });

 $(document).ready(function() {
  $('#owl-procati .tab-menu a').click(function(){
     $('#owl-procati .tab-menu a').addClass('active');
     $('#owl-procati .tab-menu a').removeClass('active');
  });
});


$(document).ready(function() {
var owl = $("#owl-add.product-images-home");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: false,
      responsive: {
        0: { items: 3},
        320:{ items: 3, slideBy: 1},
        480:{ items: 3, slideBy: 1},
        600:{ items: 4, slideBy: 1},
        768:{ items: 2, slideBy: 1},
        992:{ items: 2, slideBy: 1},
        1200:{ items: 3, slideBy: 1},
        1410:{ items: 3, slideBy: 1}
      },
      dots: false,
      nav: true,
      navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
      margin: 5
      });
  });
});

$('.img-thumb').click(function () {
     $(this).closest("article").find('.js-product-cover').attr("src",$(this).attr("data-image-large-src"));
       $(this).closest("article").find(".thumb").removeClass("selected"),$(this).addClass("selected");
});

$(document).ready(function() {
    var owl = $("#wb_cat_carousel");
    imagesLoaded(owl, function() {
      owl.owlCarousel({
          loop: false,
          autoplay:true,
          autoplayTimeout: 5000,
          responsive: {
            0: { items: 1},
            320:{ items: 1, slideBy: 1},
            412:{ items: 2, slideBy: 1},
            600:{ items: 3, slideBy: 1},
            768:{ items: 3, slideBy: 1},
            992:{ items: 3, slideBy: 1},
            1200:{ items: 4, slideBy: 1},
            1410:{ items: 6, slideBy: 1},
            1590:{ items: 6, slideBy: 1}
          },
          dots: false,
           nav: false,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
        margin:0
          });
      });
    });

//category page img
$(document).ready(function() {
    var owl = $("#subcat");
    imagesLoaded(owl, function() {
      owl.owlCarousel({
          loop: false,
          responsive: {
            0: { items: 3},
            360:{ items: 3, slideBy: 1},
            412:{ items: 3, slideBy: 1},
            600:{ items: 5, slideBy: 1},
            768:{ items: 4, slideBy: 1},
            992:{ items: 5, slideBy: 1},
            1200:{ items: 6, slideBy: 1},
        	1410:{ items: 7, slideBy: 1}
          },
          dots: false,
          autoplay:false,
           nav: false,
        navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
        margin:20
          });
      });
    });


//cate
$(document).ready(function() {
var owl = $("#blog");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: true,
      autoplay:false,
      responsive: {
        0: { items: 1},
        600:{ items: 1, slideBy: 1},
        768:{ items: 1, slideBy: 1},
        992:{ items: 2, slideBy: 1},
        1200:{ items: 2, slideBy: 1},
        1410:{ items: 3, slideBy: 1}
        
      },
      dots: false,
      nav: true,
      navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"> </i>'],
      margin:0
      });
  });
});


$(document).ready(function() {
var owl = $("#owl-logo");
imagesLoaded(owl, function() {
  owl.owlCarousel({
      loop: true,
      autoplay:true,
      responsive: {
        0: { items: 1},
        320:{ items: 2, slideBy: 1},
        500:{ items: 2, slideBy: 1},
        600:{ items: 4, slideBy: 1},
        768:{ items: 5, slideBy: 1},
        992:{ items: 6, slideBy: 1},
        1200:{ items: 7, slideBy: 1},
        1410:{ items: 7, slideBy: 1}
        
      },
      dots: false,
       nav: false,
    navText: ['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
      margin:30
      });
  });
});


$(document).ready(function() {
  $('.imgbanner').appendTo('.slide-right');
});

/* language */
 if ($(window).width() <= 767) {
$('.user-info').click(function(event){
  if ($(".currency-selector")){
  $(".language-selector > ul").css('display', 'none');
  }
  if ($(".language-selector")){
  $(".currency-selector > ul").css('display', 'none');
  }
  $(this).toggleClass('active');
  event.stopPropagation();
  $(".user-down").slideToggle("fast");
  $(".language-selector").removeClass("open");
  $(".currency-selector").removeClass("open");
  return false;
  });
  $(".user-down").on("click", function (event) {
  event.stopPropagation();
  });
  $('.hcom').appendTo('.user-down');
  $('.wishl').appendTo('.user-down');
  $('.desktop-search').appendTo('.xsse');
  $('#_mobile_currency_selector').appendTo('.user-down');
  $('#_mobile_language_selector').appendTo('.user-down');

  
  $(".currency-selector").click(function(){
  $(this).toggleClass('open');                    
  $( ".currency-selector > ul" ).slideToggle( "1500" ); 
  $(".language-selector > ul").slideUp("medium");
  $(".language-selector").removeClass('open');
  
  });
  
  $(".language-selector").click(function(){
  $(this).toggleClass('open');                          
  $( ".language-selector > ul" ).slideToggle( "1500" );    
  $(".currency-selector > ul").slideUp("medium");
  $(".currency-selector").removeClass('open');
  });
  };
// disabled
$('.wbblog_submit_btn').on("click",function(e) {
	e.preventDefault();
	if(!$(this).hasClass("disabled")){
		var data = new Object();
		$('[id^="wbblog_"]').each(function()
		{
			id = $(this).prop("id").replace("wbblog_", "");
			data[id] = $(this).val();
		});
		function logErrprMessage(element, index, array) {
		  $('.wbblogs_message').append('<span class="wbblogs_error">'+element+'</span>');
		}
		function wbremove() {
		  $('.wbblogs_error').remove();
		  $('.wbblogs_success').remove();
		}
		function logSuccessMessage(element, index, array) {
		  $('.wbblogs_message').append('<span class="wbblogs_success">'+element+'</span>');
		}
		$.ajax({
			url: xprt_base_dir + 'modules/wbblog/ajax.php',
			data: data,
			type:'post',
			dataType: 'json',
			beforeSend: function(){
				wbremove();
				$(".wbblog_submit_btn").val("Please wait..");
				$(".wbblog_submit_btn").addClass("disabled");
			},
			complete: function(){
				$(".wbblog_submit_btn").val("Submit Button");
				$(".wbblog_submit_btn").removeClass("disabled");	
			},
			success: function(data){
				wbremove();
				if(typeof data.success != 'undefined'){
					data.success.forEach(logSuccessMessage);
				}
				if(typeof data.error != 'undefined'){
					data.error.forEach(logErrprMessage);
				}
			},
			error: function(data){
				wbremove();
				$('.wbblogs_message').append('<span class="error">Something Wrong ! Please Try Again. </span>');
			},
		});	
	}
});

 /* sticky header */
//   if ($(window).width() > 992) {
//  $(document).ready(function(){
//       $(window).scroll(function () {
//         if ($(this).scrollTop() > 120) {
//             $('#index .topmenu').addClass('fixed fadeInDown animated');         

//         } else {
//             $('#index .topmenu').removeClass('fixed fadeInDown animated');
//         }
//       });
// });
// };

/* responsive menu */
   if (($(document).width() >= 768) && ($(document).width() <= 991)) {
        $('.meni').click(function () {            
            $('.popover').hide();
            $(this).closest('li').find('.popover').show();
    });

      $('.wishl').appendTo('.user-down');     
      $('.hcom').appendTo('.user-down');     
   };



/* menu more */
  $(document).ready(function(){
if (($(document).width() >= 1410)){
     var count_block = $('.menu-vertical .level-1').length;
     var number_blocks = 10;
     if(count_block < number_blocks){
          return false; 
     } else {
          
          $('.menu-vertical .level-1').each(function(i,n){
                if(i == number_blocks) {
                     $('.menu-content').append('<li class="view_more"><a class="dropdown-item"><i class="fa fa-plus"></i><span>More</span></a></li>');
                }
                if(i> number_blocks) {
                     $(this).addClass('wr_hide_menu');
                }
          })
          $('.wr_hide_menu').hide();
          $('.view_more').click(function() {
                $(this).toggleClass('active');
                $('.wr_hide_menu').slideToggle();
          });
     }
}
});

  $(document).ready(function(){
if (($(document).width() >= 992) && ($(document).width() <= 1409)){
     var count_block = $('.menu-vertical .level-1').length;
     var number_blocks = 7;
     if(count_block < number_blocks){
          return false; 
     } else {
          
          $('.menu-vertical .level-1').each(function(i,n){
                if(i == number_blocks) {
                     $('.menu-content').append('<li class="view_more"><a class="dropdown-item"><i class="fa fa-plus"></i><span>More</span></a></li>');
                }
                if(i> number_blocks) {
                     $(this).addClass('wr_hide_menu');
                }
          })
          $('.wr_hide_menu').hide();
          $('.view_more').click(function() {
                $(this).toggleClass('active');
                $('.wr_hide_menu').slideToggle();
          });
     }
}
});


if ($(window).width() >= 992) {
$(document).ready(function() {
 $('#_desktop_top_menu .wb-menu-vertical').click(function(event) {
        $(this).toggleClass('active');
        event.stopPropagation();
        $('#_desktop_top_menu .menu-vertical').slideToggle("2000")
    });
    $("#_desktop_top_menu .menu-vertical").on("click", function(event) {
        event.stopPropagation()
    });
});
};



$(document).ready(function(){
function wbFilters(){
  if ($(window).width() <= 767) {
    $('#left-column').appendTo('#content-wrapper');
    $('#category #left-column #search_filters_wrapper').appendTo('#cat-left-column');
  
  } else {
    $('#left-column').appendTo('#column-left .wb-filters');
  }
}
$(document).ready(function(){ wbFilters(); });
$(window).resize(function(){ wbFilters(); });

});
