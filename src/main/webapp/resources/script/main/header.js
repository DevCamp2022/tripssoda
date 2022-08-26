
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


    // $('#sub_menu02').hide();
    // //tab menu
    // const tabList = document.querySelectorAll('.page-header .primary-nav .list li');
    // const contents = document.querySelectorAll('.page-header .sub-nav-wrap .sub-nav-tap')
    // let activeCont = ''; // 현재 활성화 된 컨텐츠 (기본:#tab1 활성화)
    //
    // for(var i = 0; i < tabList.length; i++){
    //     tabList[i].querySelector('.mainBtn').addEventListener('click', function(e){
    //         e.preventDefault();
    //         for(var j = 0; j < tabList.length; j++){
    //             // 나머지 버튼 클래스 제거
    //             tabList[j].classList.remove('is_on');
    //
    //             // 나머지 컨텐츠 display:none 처리
    //             contents[j].style.display = 'none';
    //         }
    //         // 버튼 관련 이벤트
    //         this.parentNode.classList.add('is_on');
    //
    //         // 버튼 클릭시 컨텐츠 전환
    //         activeCont = this.getAttribute('href');
    //
    //         document.querySelector(activeCont).style.display = 'block';
    //     });
    // }
});//function



