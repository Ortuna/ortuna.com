$(document).ready(function(){
  setTimeout(function(){ scrollTo($(".container")) }, 250);
  function scrollTo($element) {
    $('html, body').animate({ scrollTop: $element.offset().top }, 1000);
  }
});
