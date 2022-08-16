<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<style>
    * {
        list-style: none;
        text-decoration: none;
        margin: 0px;
        padding: 0px;
        font-family: 'Noto Sans KR', sans-serif;
    }
    .main-img {
        width: 1200px;
        height: 300px;
        border: 1px solid black;
        margin: auto;
        text-align: center;

    }
    .search {
        width: 1200px;
        height: 300px;
        border: 1px solid black;
        margin: auto;
        text-align: center;


    }
    .main-list {
        /*display: flex;*/
        /*width: 1280px;*/
        /*height: 1000px;*/
        /*border: 1px solid black;*/
        /*margin: auto;*/
        /*text-align: center;*/
        display: flex;
        width: 1200px;
        height: 1000px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
        flex-wrap: wrap;


    }
    .list-parent {
        /*flex: 1;*/
        margin-left: 55px;
    }
    .thumbnail {
        width: 250px;
        height: 200px;
        border: 1px solid black;
    }
    .title {
        width: 250px;
        height: 30px;
        border: 1px solid black;
    }
    .content {
        width: 250px;
        height: 30px;
        border: 1px solid black;
    }
    .paging {
        width: 1200px;
        height: 100px;
        margin: auto;
        text-align: center;
    }

</style>
<script>
    let msg = "${msg}";
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>
<div class="main-img">
    <h1>여행친구사진</h1>
</div>
<div class="search">
    <h1>검색</h1>
</div>
<button id="write-btn" class="write-btn" onclick="location.href='<c:url value="/accompany/write"/>'">동행글쓰기</button>
<div class="main-list">
    <c:forEach var="accompanyDto" items="${list}">
        <div class="list-parent">
            <div class="thumbnail">
                <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">썸네일</a>
            </div>
            <div class="title">
                <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>"><c:out value="${accompanyDto.title}"/></a>
            </div>
            <div class="content">
                <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>"><c:out value="${accompanyDto.content}"/></a>
            </div>
        </div>

    </c:forEach>
</div>

<br>
<div class="paging">
    <c:if test="${ph.showPrev}">
        <a href="<c:url value='/accompany/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
    </c:if>
    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a href="<c:url value='/accompany/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
    </c:forEach>
    <c:if test="${ph.showNext}">
        <a href="<c:url value='/accompany/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
    </c:if>
</div>
</body>
</html>