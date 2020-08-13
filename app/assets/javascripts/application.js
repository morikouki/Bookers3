// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
document.addEventListener("turbolinks:load"
, function () {
	$(function () {
	  $('#scroll-image').on('click',function(event){
	  	$('body, html').animate({
	  	  scrollTop:0
	  	}, 1000);
	  	event.preventDefault();
	  });
	  $('.fas').on('click',function(event){
	  	$('.fas').toggleClass('active');
	  });

	  $('.menu-trigger').on('click', function(event) {
	    $(this).toggleClass('active-menu');
	    $('#sp-menu').fadeToggle();
	    event.preventDefault();
	  });

	  $('#tab-contents .tab[id != "tab1"]').hide();

	  $('#tab-menu a').on('click',function(event){
	  	$('.tab').hide();
	  	$('.tab-active').removeClass('tab-active');
	  	$(this).addClass('tab-active');
	  	$($(this).attr('href')).show();
        event.preventDefault();
	  });

	  $('#favoriters').on('click',function(event){
	  	$('.none-box').slideToggle();
	  	event.preventDefault();
	  });
	});
 })