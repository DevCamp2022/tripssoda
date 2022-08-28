<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행메인페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/accompany/accompanyList.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<input type="hidden" name="msg" value="${msg}">
<c:if test="${mode ne 'waiting'}">
    <form name="frm" method="get" action="<c:url value='/accompany/list'/>">
</c:if>
<c:if test="${mode eq 'waiting'}">
    <form name="frm" method="get" action="<c:url value='/accompany/waiting'/>">
</c:if>
<div class="main-img">

</div>
<div class="main-group">
    <div class="sort-bar2">
        <a href="<c:url value='/accompany/write'/>">
        <div class="new-write-btn">
            동행 글쓰기
        </div>
        </a>
        <div class="sort-text">
            정렬
        </div>
        <div class="sort-button">
            <select class="search-option" name="option" onchange="this.form.submit()">
                <option value="none" disabled selected>정렬선택</option>
                <option value="time">최신순</option>
                <option value="view">조회순</option>
            </select>
        </div>
        <c:if test="${mode ne 'waiting'}">
            <div class="only-recruit" onclick="location.href='<c:url value="/accompany/waiting"/>'">
            모집중인 글만 보기
        </div>
        </c:if>
        <c:if test="${mode eq 'waiting'}">
            <div class="only-recruit" onclick="location.href='<c:url value="/accompany/list"/>'">
                모든 글 보기
            </div>
        </c:if>
    </div>
    <div class="list-group">
        <c:forEach var="accompanyDto" items="${list}">
            <a class="a-tag" href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">
                <div class="list-one">
                    <div class="list-thumbnail2">
                        <img class="list-thumbnail" src="/image/thumbnail/${accompanyDto.thumbnail}" alt="">
                    </div>
                    <div class="list-title-line">
                        <div class="recruit-on-off">
                            <c:if test="${accompanyDto.status eq 0}">
                                모집중
                            </c:if>
                            <c:if test="${accompanyDto.status eq 1}">
                                지난여행
                            </c:if>
                        </div>
                        <div class="list-title">
                            ${accompanyDto.title}
                        </div>
                    </div>

                </div>
            </a>
        </c:forEach>
    </div>
    <c:if test="${mode ne 'waiting'}">
    <div class="paging-container">
        <div class="paging">
            <c:if test="${ph.showPrev}">
                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="paging-active" href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="paging-prev-next" href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
            </c:if>
        </div>
    </div>
    </c:if>
    <c:if test="${mode eq 'waiting'}">
        <div class="paging-container">
            <div class="paging">
                <c:if test="${ph.showPrev}">
                    <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="paging-active" href="<c:url value='/accompany/waiting?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="paging-prev-next" href="<c:url value='/accompany/waiting?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                </c:if>
            </div>
        </div>
    </c:if>
</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/accompany/accompany_list.js"></script>
</body>
</html>