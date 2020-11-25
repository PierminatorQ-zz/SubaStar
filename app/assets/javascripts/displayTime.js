
document.addEventListener('turbolinks:load', function(){ 
  $('.timer').startTimer();


  $('#search').val('')


  $('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    navContainer:".owl-nav",
    autoplay:true,
    autoplayTimeout:3500,
    autoplayHoverPause:true,
    dots:false,
    navText:["<div class='nav-btn prev-slide'><i class='lni lni-32 lni-chevron-left-circle'></i></div>","<div class='nav-btn next-slide'><i class='lni lni-32 lni-chevron-right-circle'></i></div>"],
    responsive:{
        0:{
            items:1
        },
        600:{
            items:2
        },
        1000:{
            items:3
        }
    }
})
 


});

