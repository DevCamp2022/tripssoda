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
</div>






    <div class="searchMain">
<%--        <input type="text" id="searchInput" placeholder="검색어를 입력하세요!">--%>
<%--        <button type="button" id="searchBtn"><i class="fa fa-search" aria-hidden="true"></i></button>--%>
<%--        <img src="/image/main/vacation.gif"  width="100px" alt="a big building">--%>
    </div>


<div class="txt">
    <span><strong>동행</strong>함께 떠나는 여행</span>
    <a href="/accompany/list"><button id="goBtn" type="button">함께하기</button></a>
</div>

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



<%--동행게시글--%>
    <div class="slide-wrap">
        <div class="div-list-wrap">
            <h1>취향저격 동행찾기</h1>
            <div class="btn-lank">
                <a href="/accompany/list"><span>더보기</span><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>


            <img class="pointImg" src="/image/main/vacation.gif"  alt="a big building">
            <img class="pointImg2" src="/image/main/tratxt.gif"  alt="a big building">
            <img class="pointImg3" src="/image/main/heart.gif"  alt="a big building">


            <c:forEach var="accompanyDto" items="${accompanyList}" varStatus="statusNm">

<%--                ${accompanyDto.nickname}  ${accompanyDto.thumbnail} ${accompanyDto.title}--%>
<%--                <img class="main-img" src="${pageContext.request.contextPath}/image/thumbnail/${accompanyDto.thumbnail}" alt="">--%>

                <div class="div-editor div-editor-${statusNm.count}">
                    <%-- 09.21 c:url태그로 수정 --%>
                    <a href="<c:url value='/accompany/read?id=${accompanyDto.id}'/>">
                        <!--썸네일-->
                        <div class="thumbnail-wrapper">
                            <!-- <img src="${accompanyDto.thumbnail}" alt="thumbnail picture"> -->
                            <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${accompanyDto.thumbnail}" alt="thumbnail picture">
                        </div>
                        <div class="itemInfoAccom-wrapper">

                                <div class="main-accomTitle">

                                    <div>
                                        <c:if test="${accompanyDto.status eq 0}">
                                            [모집중]
                                        </c:if>
                                        <c:if test="${accompanyDto.status eq 1}">
                                            [지난여행]
                                        </c:if>
                                    </div>
                                    <h4>${accompanyDto.title}</h4>


                                    <div class="list-content-line conn">
                                            ${accompanyDto.content}
                                    </div>
                                    <div class="list-nickname-line">
                                        <div class="profile-img">
                                            <img class="profile-img2" src="${pageContext.request.contextPath}/user/profileImg/${accompanyDto.profileImg}">
                                        </div>
                                        <div class="nickname">
                                                ${accompanyDto.nickname}
                                        </div>
                                        <div class="view-cnt-line">
                                            <div class="view-cnt-icon"></div>
                                            <div class="view-cnt">
                                                    ${accompanyDto.viewCnt}
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <!--해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)-->
<%--                            <div class="main-tourDate">--%>
<%--                                <fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" />--%>
<%--                            </div>--%>

<%--                            <div class="main-tourPrice">--%>
<%--                                <b>--%>
<%--                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원--%>
<%--                                </b>--%>
<%--                            </div>--%>
                        </div>
                    </a>
                </div>

            </c:forEach>
        </div>
    </div>
<%--    에디터픽--%>
    <div class="slide-wrap">
        <div class="div-list-wrap">
            <h1>에디터 픽</h1>
            <div class="btn-lank">
                <a href="/product/list"><span>더보기</span><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>

            <c:forEach var="list" items="${list0}" varStatus="statusNm">
                <div class="div-editor div-editor-${statusNm.count}">
                    <%-- 09.21 c:url태그로 수정 --%>
                    <a href="<c:url value='/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}&startDate=${list.startDate}'/>">
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
                            <!--해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)-->
                            <div class="main-tourDate">
                                <fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" />
                            </div>

                            <div class="main-tourPrice">
                                <b>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원
                                </b>

                            </div>
                        </div>
                    </a>
                </div>

            </c:forEach>
        </div>
    </div>


<%--    프라이빗투어--%>
    <div class="slide-wrap">

        <div class="div-list-wrap">
            <h1>프라이빗 투어</h1>

            <div class="btn-lank">
                <a href="/product/list"><span>더보기</span><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            </div>

            <c:forEach var="list" items="${list1}" varStatus="statusNm">
<%--                <div class="div-editor">--%>
<%--                    <a href="/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}">--%>
<%--                        <!--썸네일-->--%>
<%--                        <div class="thumbnail-wrapper">--%>
<%--                            <!-- <img src="${list.thumbnail}" alt="thumbnail picture"> -->--%>
<%--                            <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${list.thumbnail}" alt="thumbnail picture">--%>
<%--                        </div>--%>
<%--                        <!--상품정보(제목, 평점, 출발일, 가격)-->--%>
<%--                        <div class="itemInfo-wrapper">--%>
<%--                            <div class="main-tourTitle">--%>
<%--                                <h4>${list.title}</h4>--%>
<%--                            </div>--%>
<%--                            <div class="articles__RatingDiv-sc-1mbly56-1 cHzgPP rating"><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="100" size="18"><i style="width: 100%;"></i></span><span class="articles__StarSpan-sc-1mbly56-2 gzTNBY star" width="59.999999999999964" size="18"><i style="width: 60%;"></i></span></div>--%>
<%--                            <!—해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)—>--%>
<%--                            <div class="main-tourDate">2022년 08월 19일 출발 </div>--%>
<%--                            <div class="main-tourPrice">--%>
<%--                                <b>160,000원</b>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </div>--%>
                <div class="div-editor div-editor-${statusNm.count}">
                    <%-- 09.21 c:url태그로 수정 --%>
                    <a href="<c:url value='/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}'/>">
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
                            <!--해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)-->
                            <div class="main-tourDate">
                                <fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" />
                            </div>

                            <div class="main-tourPrice">
                                <b>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원
                                </b>

                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>

    </div>




    <div class="slide-wrap">

    <div class="qna-section">
        <h1>여행정보 공유해요</h1>
<%--        <h2 class="section-title">여행정보 공유해요!</h2>--%>

        <div class="qna-wrap">
            <!-- forEach -->
            <div class="qna">
                <span class="region">부산</span>
                <span class="qna-title">낙곱새 맛집 소개좀</span>
                <p class="qna-info">부산 갈건데 맛있는 식당 추천좀 부산 갈건데 맛있는 식당 추천좀부산 갈건데 맛있는 식당 추천좀 부산 갈건데 맛있는 식당 추천좀</p>
                <div class="user-wrap">
                    <div class="user-img-wrap">
<%--                        <img src="/user/profileImg/${accompany.profileImg}" alt="프로필 이미지">--%>
                        <img class="img-thumbnail" src="${pageContext.request.contextPath}/user/profileImg/default_img.JPG" alt="profile image">
                    </div>
                    <p class="menu-nickname">ReMinD</p>
                </div>
                <div class="qna-answer">
                    <p>저도 낙곱새 먹고싶네요</p>
                    <div class="answer-cnt">
                        등 3개의 답변
                    </div>
                </div>
            </div>
            <!-- forEach -->
        </div>
    </div>









        <%--    게시판--%>
        <div id="wrap">
            <section class="tabArea">
                <ul class="tab">
                    <li class="on">
                        <a href="#!"><span>공지사항</span></a>
                    </li>
                    <li>
                        <a href="#!"><span>프로모션</span></a>
                    </li>
                    <li>
                        <a href="#!"><span>FAQ</span></a>
                    </li>
                    <%--                <li>--%>
                    <%--                    <a href="#!"><span></span></a>--%>
                    <%--                </li>--%>
                    <%--                <li>--%>
                    <%--                    <a href="#!"><span></span></a>--%>
                    <%--                </li>--%>
                </ul>
                <div class="tabBox on">
                    <div class="notice">
                        <ul>
                            <c:forEach var="noticeList" begin="0" end="4" step="1" items="${noticeList}">
                                <li>
                                    <a href="/board/detail${searchCondition.queryString}&menuCode=M001&id=${noticeList.id}">
                                        <p>${noticeList.title}</p>
                                        <p><fmt:formatDate value="${noticeList.createdAt}" pattern="yy-MM-dd" type="date"/></p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="tabBox">
                    <div class="promotion">
                        <ul>
                            <c:forEach var="promoList" begin="0" end="4" step="1" items="${promotionList}">
                                <li>
                                    <a href="/board/detail${searchCondition.queryString}&menuCode=M002&id=${promoList.id}">
                                        <p>${promoList.title}</p>
                                        <p><fmt:formatDate value="${promoList.createdAt}" pattern="yy-MM-dd" type="date"/></p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="tabBox">
                    <div class="faq">
                        <ul>
                            <c:forEach var="faqList" begin="0" end="4" step="1" items="${faqList}">
                                <li>
                                    <a href="/board/detail${searchCondition.queryString}&menuCode=M003&id=${faqList.id}">
                                        <p>${faqList.title}</p>
                                        <p><fmt:formatDate value="${faqList.createdAt}" pattern="yy-MM-dd" type="date"/></p>
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

            </section>
        </div>





    </div>






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

</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/main/home.js"></script>
<script>
$(document).ready(function(){
    $(".tabArea .tab li a").on("click", function(){

        // 해당 요소를 클릭하는 내 자신의 index 번호를 가져온다. [0], [1]
        const num = $(".tabArea .tab li a").index($(this));
        // 기존에 적용되어 있는 on class 삭제
        $(".tabArea .tab li").removeClass("on");
        $(".tabArea .tabBox").removeClass("on");

        // 다음 요소 클릭시 on class 추가
        $('.tabArea .tab li:eq(' + num + ')').addClass("on");
        $('.tabArea .tabBox:eq(' + num + ')').addClass("on");
    });
});










(function($) {

    var container = $('.container11');
    var location = $('#location');
    var section = $('.section');

    section.on('mouseover', function(){
        location.addClass('open-menu');
    });
    section.on('mouseout', function(){
        location.removeClass('open-menu');
    });
    location.on('mouseover', function(){
        location.addClass('open-menu');
    });
    location.on('mouseout', function(){
        location.removeClass('open-menu');
    });

})(jQuery);
</script>
