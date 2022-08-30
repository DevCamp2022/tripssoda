<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>질문게시판 리스트 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/question/questionList.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"></head>
<body>
<script>
    let msg = "${msg}";
    if(msg=="LIST_ERR")  alert("게시물 목록을 가져오는데 실패했습니다. 다시 시도해 주세요.");
    if(msg=="READ_ERR")  alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_ERR")   alert("삭제되었거나 없는 게시물입니다.");
    if(msg=="DEL_OK")    alert("성공적으로 삭제되었습니다.");
    if(msg=="MOD_OK")    alert("성공적으로 수정되었습니다.");
</script>
<c:if test="${mode ne 'waiting'}">
    <form method="get" action="<c:url value='/question/list'/>">
</c:if>
<c:if test="${mode eq 'waiting'}">
    <form method="get" action="<c:url value='/question/waiting'/>">
</c:if>
<div class="main-img">

</div>
<div class="main-group">
    <div class="sort-bar-line">
        <a href="<c:url value='/question/write'/>">
            <div class="new-write-btn">
                질문 글쓰기
            </div>
        </a>
        <div class="sort-text">
            정렬
        </div>
        <div class="sort-button">
            <select class="search-option" name="option" onchange="this.form.submit()">
                <option value="none" disabled selected>정렬선택</option>
                <option value="time" >등록순</option>
                <option value="answer" >답변순</option>
            </select>
        </div>
        <c:if test="${mode ne 'waiting'}">
        <div class="only-recruit" onclick="location.href='<c:url value="/question/waiting"/>'">
            답변을 기다리는 질문만 보기
        </div>
        </c:if>
        <c:if test="${mode eq 'waiting'}">
            <div class="only-recruit" onclick="location.href='<c:url value="/question/list"/>'">
                모든 답변 보기
            </div>
        </c:if>
    </div>
    <div class="list-group">
        <c:forEach var="questionDto" items="${list}">
            <a class="a-tag" href="<c:url value='/question/read?id=${questionDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">
                <div class="list-one">
                    <div class="list-region-line">
                        <div class="list-region-box">
                            <div class="region-icon">

                            </div>
                            <div class="region-text">
                                ${questionDto.cityName}
                            </div>
                        </div>
                        <div class="answer-on-off">
                            <c:if test="${questionDto.status eq 0}">
                                답변대기
                            </c:if>
                            <c:if test="${questionDto.status eq 1}">
                                <span class="answer-off">채택완료</span>
                            </c:if>
                        </div>
                    </div>
                    <div class="list-title-line">
                            ${questionDto.title}
                    </div>
                    <div class="list-content-line">
                            ${questionDto.content}
                    </div>
                    <div class="hashtag-line">
                            ${questionDto.hashtag}
                    </div>
                    <div class="list-nickname-line">
                        <div class="profile-img">
                            <img class="profile-img2" src="${pageContext.request.contextPath}/user/profileImg/${questionDto.profileImg}">
                        </div>
                        <div class="nickname">
                                ${questionDto.nickname}
                        </div>
                        <div class="dash-img">
                        </div>
                        <div class="view-cnt-box">
                            <div class="view-cnt-icon">
                            </div>
                            <div class="view-cnt">
                                    ${questionDto.viewCnt}
                            </div>
                            <div class="answer-cnt-icon">
                            </div>
                            <div class="answer-cnt">
                                    ${questionDto.ansCnt}
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
                <a class="paging-prev-next" href="<c:url value='/question/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
            </c:if>
            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                <a class="paging-active" href="<c:url value='/question/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
            </c:forEach>
            <c:if test="${ph.showNext}">
                <a class="paging-prev-next" href="<c:url value='/question/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
            </c:if>
        </div>
    </div>
    </c:if>
    <c:if test="${mode eq 'waiting'}">
        <div class="paging-container">
            <div class="paging">
                <c:if test="${ph.showPrev}">
                    <a class="paging-prev-next" href="<c:url value='/question/waiting?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="paging-active" href="<c:url value='/question/waiting?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="paging-prev-next" href="<c:url value='/question/waiting?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
                </c:if>
            </div>
        </div>
    </c:if>
</div>
</form>
</body>
</html>
