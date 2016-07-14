// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$( document ).ready(function() {
 $(".invite").hide();
  $(".button1").click(function(){
       $(".invite").show();
    });

    //    $("#wrapper").click(function(){
    //     $(".invite").hide();
    // });

         $(".product").hide();
       $(".button2").click(function(){
        $(".product").show();
    });
    //    $("#wrapper").click(function(){
    //     $(".product").hide();
    // });
    // $(".img").hide();  hide img

    // $(".showproduct").hover(function(){
    //     $(".img").show(); on hover show img 
    // });
$(".tooltip").hide();
$(".button2").hover(function(){
$(".tooltip").show();

    });

 $(".button2").click(function(){
        $(".tooltip").toggle();
    });

$(".tooltip2").hide();
$(".button1").hover(function(){
$(".tooltip2").show();

    });
 $(".button1").click(function(){
        $(".tooltip2").toggle();
    });
  
});
