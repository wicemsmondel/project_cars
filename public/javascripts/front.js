// Menu-toggle button

$(document).ready(function() {
    $(".menu-icon").on("click", function() {
        $("nav ul").toggleClass("showing");
    });
});

// Scrolling Effect

$(document).on("scroll", function() {
    if ($(document).scrollTop()) {
        $('nav').addClass('black');
    } else {
        $('nav').removeClass('black');
    }
});

// $(".red").hide(onclick);
// $(".red").show(onclick);

// $(document).on("click", function() {
//     if ($(document).click()) {
//         $('img .red').addClass('red');
//     } else {
//         $('img .red').removeClass('black');
//     }
// });

$('.checkBox label img').on('click', function(){
    $('.checkBox label img.red').toggleClass('active');
});

// $('red.active').removeClass('active');
// $(this).addClass('active');

// $(document).ready(function() {  
//     $("[id^=checkBox label]").on('click', function() {
//        $("[id^=checkBox label img]").toggleClass('red');
//     });
//  });