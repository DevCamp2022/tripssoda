<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/main/home.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>


<div class="gallery-wrap">
<div class="gallery">
    <img src="/image/main/trip3.jpg" alt="a house on the mountain">
    <img src="/image/main/trip7.jpg" alt="a big building">
    <img src="/image/main/trip1.webp" alt="another house">

<%--    <img src="/image/main/trip2.jpg" alt="a small road between two houses">--%>
<%--    <img src="/image/main/trip4.jpg" alt="a modern city">--%>
<%--    <img src="/image/main/trip5.jpg" alt="a lot of old houses">--%>
</div>



<div class="txt"><span><strong>동행</strong>함께 떠나는 여행</span></div>

    <section class="container">
        <h1 class="title">
            <span>Hi, nice</span>
            <span>to see</span>
            <span>you here</span>
        </h1>

        <h2 class="title">
            <span>Let's go</span>
            <span>a trip</span>
            <span>together</span>
        </h2>
    </section>


</div>



<div class="content">



<%--    <div class="slide-wrap">--%>

<%--        <h1> 여행정보 공유해요! </h1>--%>

<%--        <div class="slider">--%>
<%--            <div class="slide" id="slide-1"><img src="/image/main/trip2.jpg"></div>--%>
<%--            <div class="slide" id="slide-2"><img src="/image/main/trip3.jpg"></div>--%>
<%--            <div class="slide" id="slide-3"><img src="/image/main/trip4.jpg"></div>--%>
<%--            <div class="slide" id="slide-4"><img src="/image/main/trip5.jpg"></div>--%>
<%--            <div class="slide" id="slide-5"><img src="/image/main/trip6.jpg"></div>--%>
<%--            <div class="slide" id="slide-2"><img src="/image/main/trip3.jpg"></div>--%>
<%--            <div class="slide" id="slide-3"><img src="/image/main/trip4.jpg"></div>--%>
<%--            <div class="slide" id="slide-1"><img src="/image/main/trip2.jpg"></div>--%>
<%--            <div class="slide" id="slide-5"><img src="/image/main/trip6.jpg"></div>--%>
<%--            <div class="slide last" id="slide-2"><img src="/image/main/trip3.jpg"></div>--%>
<%--        </div>--%>

<%--&lt;%&ndash;        <a href="#slide-1">1</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="#slide-2">2</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="#slide-3">3</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="#slide-4">4</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <a href="#slide-5">5</a>&ndash;%&gt;--%>
<%--    </div>--%>



    <div class="slide-wrap">

        <div class="div-list-wrap">
            <h1>에디터 픽</h1>
            <div class="btn-lank">
                <a href="/product/list"><span>더보기</span><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>

            <c:forEach var="list" items="${list0}" varStatus="statusNm">
                <div class="div-editor">
                    <a href="/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}">
                        <!--썸네일-->
                        <div class="thumbnail-wrapper">
                            <!-- <img src="${list.thumbnail}" alt="thumbnail picture"> -->
                            <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${list.thumbnail}" alt="thumbnail picture">
                        </div>
                        <!--상품정보(제목, 평점, 출발일, 가격)-->
                        <div class="itemInfo-wrapper">
                            <div class="main-tourTitle">
                                <h4>${list.title}</h4>
                            </div>
                            <div class="articles__RatingDiv-sc-1mbly56-1 cHzgPP rating"><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="59.999999999999964" size="18"><i style="width: 60%;"></i></span></div>
                            <!—해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)—>
                            <div class="main-tourDate">2022년 08월 19일 출발 </div>
                            <div class="main-tourPrice">
                                <b>160,000원</b>
                            </div>
                        </div>
                    </a>
                </div>

            </c:forEach>
        </div>
    </div>


    <div class="slide-wrap">

        <div class="div-list-wrap">
            <h1>프라이빗 투어</h1>

            <div class="btn-lank">
                <a href="/product/list"><span>더보기</span><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>

            <c:forEach var="list" items="${list1}" varStatus="statusNm">
                <div class="div-editor">
                    <a href="/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}">
                        <!--썸네일-->
                        <div class="thumbnail-wrapper">
                            <!-- <img src="${list.thumbnail}" alt="thumbnail picture"> -->
                            <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${list.thumbnail}" alt="thumbnail picture">
                        </div>
                        <!--상품정보(제목, 평점, 출발일, 가격)-->
                        <div class="itemInfo-wrapper">
                            <div class="main-tourTitle">
                                <h4>${list.title}</h4>
                            </div>
                            <div class="articles__RatingDiv-sc-1mbly56-1 cHzgPP rating"><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="59.999999999999964" size="18"><i style="width: 60%;"></i></span></div>
                            <!—해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)—>
                            <div class="main-tourDate">2022년 08월 19일 출발 </div>
                            <div class="main-tourPrice">
                                <b>160,000원</b>
                            </div>
                        </div>
                    </a>
                </div>

            </c:forEach>
        </div>

    </div>



<%--&lt;%&ndash;    슬라이드리뷰&ndash;%&gt;--%>
<%--    <div id="slideShow">--%>
<%--        <ul class="slides">--%>
<%--            <li><img src="/image/main/trip2.jpg"></li>--%>
<%--            <li><img src="/image/main/trip3.jpg"></li>--%>
<%--            <li><img src="/image/main/trip4.jpg"></li>--%>
<%--            <li><img src="/image/main/trip5.jpg"></li>--%>
<%--            <li><img src="/image/main/trip6.jpg"></li>--%>
<%--            <li><img src="/image/main/trip7.jpg"></li>--%>
<%--        </ul>--%>
<%--        <p class="controller">--%>

<%--            <!-- &lang: 왼쪽 방향 화살표--%>
<%--            &rang: 오른쪽 방향 화살표 -->--%>
<%--            <span class="prev">&lang;</span>--%>
<%--            <span class="next">&rang;</span>--%>
<%--        </p>--%>
<%--    </div>--%>







<%--    동그라미--%>
    <div class="block_popular" id="popular" style="visibility: visible; opacity: 1;">
        <div class="bx-wrapper" style="max-width: 6000px;">
            <div class="bx-viewport" aria-live="polite" >
                <ul class="list_popular popular" style="width: 10215%; position: relative; transition-duration: 0s; transform: translate3d(-240px, 0px, 0px);">

            <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208101823394761205004001099.jpg">
								<em class="txt_local">괌</em>
								</span>
                </a>
            </li>

            <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191031152221709006001056.jpg">
								<em class="txt_local">다낭</em>
								</span>
                </a>
            </li>

            <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191040025151709006001084.jpg">
								<em class="txt_local">튀르키예(터키)</em>
								</span>
                </a>
            </li>

            <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191042113081709006001076.jpg">
								<em class="txt_local">일본</em>
								</span>
                </a>
            </li>

            <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191036380051709006001017.jpg">
								<em class="txt_local">보라카이</em>
								</span>
                </a>
            </li>

            <li aria-hidden="false" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191100302031709006001038.jpg">
								<em class="txt_local">스위스</em>
								</span>
                </a>
            </li>

            <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="#" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191046340011709006001090.jpg">
								<em class="txt_local">발리</em>
								</span>
                </a>
            </li>

            <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="/product/localList.yb?menu=PKG&amp;dspSid=AAFB000" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191048386421709006001095.jpg">
								<em class="txt_local">사이판</em>
								</span>
                </a>
            </li>

            <li aria-hidden="true" style="float: left; list-style: none; position: relative; width: 240px;">
                <a href="/product/localList.yb?menu=PKG&amp;dspSid=AAGD000" target="_self">
								<span class="thumb"> <img src="//cimgcdn.ybtour.co.kr/attachHome/HF/DM/202208/202208191103589181709006001069.jpg">
								<em class="txt_local">하와이</em>
								</span>
                </a>
            </li>

        </ul></div><div class="bx-controls bx-has-controls-direction"><div class="bx-controls-direction"><a class="bx-prev" href="">Prev</a><a class="bx-next" href="">Next</a></div></div></div>
    </div>




</div>


<%--<script src="/script/main/vendor/jquery-1.10.2.min.js"></script>--%>
<%--<script type="text/javascript" src="/script/main/home.js"></script>--%>


<script>

//    //이미지클릭슬라이드
//    const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
//    const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
//    let currentIdx = 0; //현재 슬라이드 index
//    const slideCount = slideImg.length; // 슬라이드 개수
//    const prev = document.querySelector('.prev'); //이전 버튼
//    const next = document.querySelector('.next'); //다음 버튼
//    const slideWidth = 300; //한개의 슬라이드 넓이
//    const slideMargin = 100; //슬라이드간의 margin 값
//
//    //전체 슬라이드 컨테이너 넓이 설정
//    slides.style.width = (slideWidth + slideMargin) * slideCount + 'px';
//
//    function moveSlide(num) {
//        slides.style.left = -num * 400 + 'px';
//        currentIdx = num;
//    }
//
//    prev.addEventListener('click', function () {
//        alert("clicl");
//        /*첫 번째 슬라이드로 표시 됐을때는
//        이전 버튼 눌러도 아무런 반응 없게 하기 위해
//        currentIdx !==0일때만 moveSlide 함수 불러옴 */
//
//        if (currentIdx !== 0) moveSlide(currentIdx - 1);
//    });
//
//    next.addEventListener('click', function () {
//        alert("clicrrrrrrrrrrl");
//        /* 마지막 슬라이드로 표시 됐을때는
//        다음 버튼 눌러도 아무런 반응 없게 하기 위해
//        currentIdx !==slideCount - 1 일때만
//        moveSlide 함수 불러옴 */
//        if (currentIdx !== slideCount - 1) {
//            moveSlide(currentIdx + 1);
//        }
//    });
//
//
//
    //
    // function mainPopInit(){
    //     $(".popular").bxSlider({
    //         captions : false,
    //         pager : false,
    //         infiniteLoop : false,
    //         hideControlOnEnd : true,
    //         minSlides : 5,
    //         maxSlides : 5,
    //         moveSlides : 1,
    //         slideWidth : 1200,
    //         onSliderLoad: function(){
    //             $("#popular").css("visibility", "visible").animate({opacity:1});
    //         }
    //     });
    // }


</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/main/home.js"></script>
