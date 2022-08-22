<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>적립 내역</title>
<link rel="stylesheet" href="<c:url value="/css/user/pointHistory.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<div class="main">
    <div class="contents">
        <h2 class="title">적립 내역</h2>
        <div class="point-status-wrap">
            <div class="point">현재 보유 적립금 : <fmt:formatNumber value="${point}"/>원</div>
            <button class="reg-coupon-btn">쿠폰 등록</button>
        </div>
        <div class="thead-wrap">
            <div class="thead-id">번호</div>
            <div class="thead-detail">내용</div>
            <div class="thead-price">금액</div>
        </div>
        <c:forEach var="userPointHistoryDto" items="${userPointHistoryDtoList}">
            <div class="td-wrap">
                <div class="td-id">${userPointHistoryDto.id}</div>
                <div class="td-detail"><div class="td-title">${userPointHistoryDto.processDetail}</div><div class="td-date"><fmt:formatDate value="${userPointHistoryDto.processAt}" pattern="yyyy-MM-dd"/></div></div>
                <div class="td-price"><fmt:formatNumber value="${userPointHistoryDto.amount}"/>원</div>
            </div>
        </c:forEach>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/mypage/pointHistory${ph.sc.getQueryString(ph.beginPage-1)}"/>"><i class="fa-solid fa-circle-arrow-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/pointHistory${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/pointHistory${ph.sc.getQueryString(ph.endPage+1)}"/>"><i class="fa-solid fa-circle-arrow-right"></i></a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>


