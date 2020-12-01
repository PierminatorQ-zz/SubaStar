
document.addEventListener('turbolinks:load', function(){ 
    
    //$('#finalizada').hide()
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
  
//vertical scroll bar
$(document).scroll(function (e) {

    
    let scrollAmount = $(window).scrollTop() + 80;
    let documentHeight = $(document).height();
    let windowHeight = $(window).height()+250;
    let scrollPercent = (scrollAmount / (documentHeight - windowHeight)) * 100;
    let roundScroll = Math.round(scrollPercent);
   
    
      
    // vertical scroll
    $(".scrollBar").css("height", scrollPercent + "%");
    
    


    scrollCalc(46,".dos");
    scrollCalc(159,".tres");
    scrollCalc(296,".cuatro");
    scrollCalc(431,".cinco");
    scrollCalc(560,".seis");
    

   
});


});





function scrollCalc(scroll,clase){
    if ($(window).scrollTop() > scroll){
        $(clase).addClass( "actives");
    }
    else {
        $(clase).removeClass("actives");
    }

}
