<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>여행 후기</title>
<link rel="stylesheet" href="<c:url value="/css/user/tourReviewList.css"/>">

<div class="main">
    <div class="contents">
        <h2 class="title">여행 후기</h2>
        <h3 class="search-condition">조회 기간</h3>
        <div class="search-wrap">
            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18"> -
            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18">
            <button class="search-btn" type="button">조회</button>
        </div>
        <div class="review-wrap">
            <p class="review-count">후기 ${totalCnt}건</p>
            <div class="th-wrap">
                <div class="th-review-id">후기 번호</div>
                <div class="th-review-content">후기 내용</div>
                <div class="th-review-rating">평점</div>
                <div class="th-reg-date">등록날짜</div>
            </div>
            <c:forEach var="productReviewDto" items="${productReviewDtoList}">
                <div class="td-wrap">
                    <div class="td-review-id">${productReviewDto.id}</div>
                    <div class="td-review-content">${productReviewDto.content}</div>
                    <div class="td-review-rating">${productReviewDto.rating}</div>
                    <div class="td-reg-date"><fmt:formatDate value="${productReviewDto.createdAt}" pattern="yyyy-MM-dd"/></div>
                </div>
            </c:forEach>
        </div>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/mypage/tourReviewList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/tourReviewList${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/tourReviewList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

