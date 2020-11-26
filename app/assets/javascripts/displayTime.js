
document.addEventListener('turbolinks:load', function(){ 
    
    $('#finalizada').hide()
    //countdown
    $('.timer').startTimer();
    

    //clean search
  $('#search').val('')

    //carousel related
  $('.owl-carousel').owlCarousel({
    loop:true,
    margin:10,
    nav:true,
    navContainer:".owl-nav",
    autoplay:true,
    autoplayTimeout:3500,
    autoplayHoverPause:true,
    dots:false,
    navText:["<div class='nav-btn prev-slide'><i class='lni lni-chevron-left'></i></div>","<div class='nav-btn next-slide'><i class='lni lni-chevron-right'></i></div>"],
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
 
    //topbar hide
$(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
    $('#header').addClass('header-scrolled');
    $('#topbar').addClass('topbar-scrolled');
    } else {
    $('#header').removeClass('header-scrolled');
    $('#topbar').removeClass('topbar-scrolled');
    }
});

 if ($(window).scrollTop() > 100) {
    $('#header').addClass('header-scrolled');
    $('#topbar').addClass('topbar-scrolled');
} 
    


});

function borraContador(){
    $('.timer').hide();
    $('#finalizada').delay(2000).show();
    toastr["success"]("la subasta ha terminado, recibiràs un email si has sido el ganador.", "Subasta finalizada")
    console.log("nada")
    
}

