<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>예약 내역</title>
<link rel="stylesheet" href="<c:url value="/css/user/reservationList.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<div class="main">
    <div class="contents">
        <h2 class="title">예약 내역</h2>
<%--        <div class="search-wrap">--%>
<%--            <h3 class="search-condition">조회 기간</h3>--%>
<%--            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18"> ---%>
<%--            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18">--%>
<%--            <button class="search-btn" type="button">조회</button>--%>
<%--        </div>--%>
        <c:forEach var="reservationDto" items="${reservationDtoList}">
            <div class="reserv-wrap">
                <div class="reserv-info">
                    <div class="reserv-id"><span>예약번호</span> ${reservationDto.id}</div>
                    <div class="reserv-date"><span>예약 날짜</span> <fmt:formatDate value="${reservationDto.reservAt}" pattern="yyyy-MM-dd"/></div>
                    <div class="reserv-status"><span>${reservationDto.status == 1 ? "예약 완료" : reservationDto.status == 2 ? "취소 대기중" : "취소"}</span></div>
                </div>
                <div class="product-info">
                    <div class="img-wrap">
                        <img src="/image/thumbnail/${reservationDto.thumbnail}" alt="상품 대표 사진">
                    </div>
                    <div class="info-wrap">
                        <h2 class="product-title"><a href="/product/detail?productId=${reservationDto.productId}&scheduleId=${reservationDto.productScheduleId}">${reservationDto.productTitle}</a></h2>
                        <div class="start-date"><span>날짜</span><fmt:formatDate value="${reservationDto.startDate}" pattern="yyyy-MM-dd"/></div>
                        <div class="quantity"><span>수량</span>${reservationDto.qty}개</div>
                        <div class="total-price"><span>가격</span><fmt:formatNumber value="${reservationDto.totalAmount}"/>원</div>
                    </div>
<%--                    <input type="hidden" value="${reservationDto.productScheduleId}">--%>
                    <input type="hidden" class="query-string" value="${reservationDto.queryString}">
                    <div class="btn-wrap">
<%--                        <button type="button" class="write-review-btn">여행후기 작성</button>--%>
                        <button type="button" class="reserv-detail-btn">예약 상세보기</button>
                    </div>
                </div>
            </div>
        </c:forEach>

        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/mypage/reservationList${ph.sc.getQueryString(ph.beginPage-1)}"/>"><i class="fa-solid fa-circle-arrow-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/reservationList${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/reservationList${ph.sc.getQueryString(ph.endPage+1)}"/>"><i class="fa-solid fa-circle-arrow-right"></i></a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script>
    $(".reserv-detail-btn").on("click", function () {
        let queryString = $(this).parent().parent().children("input.query-string").val();
        location.href="/mypage/reservationList/reservationDetail" + queryString;
    })
</script>

