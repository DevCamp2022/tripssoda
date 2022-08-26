<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/board/board.css">

<div class="content">
    <h1 class="board-title">공지사항</h1>
    <hr class="separator">
    <div class="search-wrap">
        <input name="search" type="search" placeholder="검색어를 입력해주세요.">
    </div>
    <div>
        <table class="board-table">
            <th class="number">번호</th>
            <th class="title">제목</th>
            <th class="date">작성일</th>
            <th class="count">조회수</th>
            <c:forEach var="board" items="${list}">
                <tr>
                    <td>${board.id}</td>
                    <td><a href="/board/detail${searchCondition.queryString}&id=${board.id}">${board.title}</a></td>
                    <td><fmt:formatDate value="${board.createdAt}" pattern="yyyy-MM-dd"/></td>
                    <td>${board.viewCnt}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="paging-container">
        <div class="paging">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다. </div>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}&menuCode=M001"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}&menuCode=M001"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}&menuCode=M001"/>">&gt;</a>
                </c:if>
            </c:if>
        </div>
    </div>
</div>