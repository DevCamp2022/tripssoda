<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 동행 게시글</title>
<link rel="stylesheet" href="<c:url value="/css/user/accompanyList.css"/>">

<div class="main">
    <div class="contents">
        <h2 class="title">내 동행 게시글</h2>
        <div class="accompany">
            <c:forEach var="accompanyDto" items="${accompanyDtoList}">
                <div class="thumbnail-wrap">
                    <img src="" class="thumbnail" alt="동행 게시글 썸네일">
                </div>
                <div class="accompany-info">
                    <span class="status">답변 상태${accompanyDto.status}</span>
                    <span class="accompany-title">${accompanyDto.title}</span>
                    <div class="region-and-date">
                        <span class="region">제주도</span>
                        <span class="start-date"><fmt:formatDate value="${accompanyDto.startAt}" pattern="yyyy-MM-dd"/> ~</span>
                        <span class="end-date"><fmt:formatDate value="${accompanyDto.endAt}" pattern="yyyy-MM-dd"/></span>
                    </div>
                    <div class="btn-and-cnt-wrap">
                        <button class="btn" type="button">수정</button>
                        <button class="btn" type="button">삭제</button>
                        <span class="view-cnt">조회수${accompanyDto.viewCnt}</span>
                        <span class="answer-cnt">누적동행신청자수${accompanyDto.applicantCnt}</span>
                    </div>
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
                        <a class="page" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/accompanyList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>

