$(function () {
    var wind = $(window),
        header = $('.page-header'),
        headerOffsetTop = header.offset().top;
    console.log(headerOffsetTop);

    wind.scroll(function(){
        if($(this).scrollTop() >= headerOffsetTop){
            header.addClass('sticky');
        }else{
            header.removeClass('sticky');
        }
    });

});//function


