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
<script>
    let msg = "${msg}";
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="WRT_OK")    alert("성공적으로 등록되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>
<!-- <div class="wrt-btn">
  <button id="write-btn" class="write-btn" onclick="location.href='<c:url value="/accompany/write"/>'">동행글쓰기</button>
</div> -->
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
            <select class="search-option" name="option">
                <option value="" >최신순</option>
                <option value="" >조회순</option>
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
                    <div class="list-content-line">
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
                            <div class="view-cnt-icon">

                            </div>
                            <div class="view-cnt">
                                    ${accompanyDto.viewCnt}
                            </div>
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


</body>
</html>