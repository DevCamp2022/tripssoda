<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 1:1 문의</title>
<link rel="stylesheet" href="<c:url value="/css/user/inquiryList.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<div class="main">
    <div class="contents">
        <h2 class="title">내 1:1 문의</h2>
        <div class="thead-wrap">
            <div class="thead-id">번호</div>
            <div class="thead-title">제목</div>
            <div class="thead-date">문의 날짜</div>
            <div class="thead-status">답변 상태</div>
        </div>
        <c:forEach var="inquiryDto" items="${inquiryDtoList}">
            <div class="td-wrap">
                <div class="td-id">${inquiryDto.id}</div>
                <a class="td-title" href="">${inquiryDto.title}</a>
                <div class="td-date"><fmt:formatDate value="${inquiryDto.createdAt}" pattern="yyyy-MM-dd"/></div>
                <div class="td-status">${inquiryDto.status}</div>
            </div>
        </c:forEach>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(ph.beginPage-1)}"/>"><i class="fa-solid fa-circle-arrow-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(ph.endPage+1)}"/>"><i class="fa-solid fa-circle-arrow-right"></i></a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

