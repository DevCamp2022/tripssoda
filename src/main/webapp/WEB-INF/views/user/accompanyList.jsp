<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 동행 게시글</title>
<link rel="stylesheet" href="<c:url value="/css/user/accompanyList.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<div class="main">
    <div class="contents">
        <h2 class="title">내 동행 게시글</h2>
            <c:forEach var="accompanyDto" items="${accompanyDtoList}">
                <div class="accompany">
                    <div class="thumbnail-wrap">
                        <img src="${pageContext.request.contextPath}/user/profileImg/default_img.JPG" class="thumbnail" alt="동행 게시글 썸네일">
                    </div>
                    <div class="accompany-info">
                        <span class="status">${accompanyDto.status == "0" ? "모집중" : "모집 완료"}</span>
                        <span class="accompany-title">${accompanyDto.title}</span>
                        <div class="region-and-date">
                            <i class="fa-solid fa-location-dot"></i><span class="region">제주도</span>
                            <span class="start-date"><fmt:formatDate value="${accompanyDto.startAt}" pattern="yyyy-MM-dd"/> ~</span>
                            <span class="end-date"><fmt:formatDate value="${accompanyDto.endAt}" pattern="yyyy-MM-dd"/></span>
                        </div>
                        <div class="btn-and-cnt-wrap">
                            <button class="btn" type="button">수정</button>
                            <button class="btn" type="button">삭제</button>
                            <i class="fa-solid fa-eye"></i><span class="view-cnt">${accompanyDto.viewCnt}</span>
                            <i class="fa-regular fa-comment"></i><span class="answer-cnt">${accompanyDto.applicantCnt}</span>
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

