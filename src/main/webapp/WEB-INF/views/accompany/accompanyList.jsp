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
        color: black;
    }

    .main1 {
        width: 1200px;
        margin: auto;
    }
    .main1 > .main-img {
        width: 1200px;
        height: 400px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
        line-height: 100px;
    }
    .main1 > .region {
        width: 1200px;
        height: 400px;
        border: 1px solid black;
        text-align: center;
    }
    .main1 > .date-bar {
        width: 1200px;
        height: 50px;
        border: 1px solid black;
        font-size: 25px;
        font-weight: bold;
    }
    .date-bar > .date-word,
    .start-date,
    .end-date,
    .search-btn {
        margin: 0px 50px 0px 50px;
    }
    .sort-bar {
        display: flex;
        width: 1200px;
        height: 50px;
        border: 1px solid black;
        margin: auto;
        font-size: 25px;
        font-weight: bold;
        justify-content: flex-end;
    }
    .sort-word,
    .sort-btn,
    .recruit-btn {
        margin-right: 30px;
    }
    .list-wrap-flex {
        width: 1200px;
        display: flex;
        flex-wrap: wrap;
        justify-content: flex-start;
        margin: auto;
    }
    .list-wrap {
        width: 250px;
        height: 350px;
        border: 1px solid black;
        margin: 20px;
    }
    .thumbnail {
        width: 250px;
        height: 200px;
        border: 1px solid black;
        margin: auto;

    }
    .list-region {
        width: 100px;
        height: 50px;
        border: 1px solid black;

    }
    .list-status-bar,
    .list-content,
    .profile-img-bar {
        width: 250px;
        height: 50px;
        border: 1px solid black;
        margin: auto;

    }
    .list-status-bar {
        display: flex;
    }
    .profile-img-bar {
        display: flex;
    }

    .wrt-btn {
        width: 1200px;
        height: 50px;
        border: 1px solid black;
    }
    .paging {
        width: 1200px;
        height: 100px;
        margin: auto;
        text-align: center;
    }
</style>
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
<div class="container">
    <div class="main1">
        <div class="wrt-btn">
            <button id="write-btn" class="write-btn" onclick="location.href='<c:url value="/accompany/write"/>'">동행글쓰기</button>
        </div>
        <div class="main-img">
            나와 맞는 여행동행과 이야기를 나누어 보아요!
            <h1>여행 친구 찾기</h1>
        </div>
        <br><br>
        <div class="region">
            <h4>지역선택</h4>
        </div>
        <div class="date-bar">
            <span class="date-word">날짜 선택</span>
            <input type="date" class="start-date" value="${accompanyDto.startAt}">
            -
            <input type="date" class="end-date" value="${accompanyDto.endAt}">
            <!-- 검색정보를 전송할 버튼 -->
            <button type="button" class="search-btn">검색하기</button>
        </div>
    </div>

    <div class="main2">
        <div class="sort-bar">
            <div class="sort-word">
                정렬
            </div>
            <div class="sort-btn">
                최신순
            </div>
            <div class="recruit-btn">
                모집중인 글만 보기
            </div>
        </div>



            <div class="list-wrap-flex">
                <c:forEach var="accompanyDto" items="${list}">
                <div class="list-wrap">
                    <div class="thumbnail">
                        <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>"><div class="list-region">
                            지역${accompanyDto.regionCode}
                        </div>썸네일</a>
                    </div>
                    <div class="list-status-bar">
                        <div class="list-status">
                            모집상태${accompanyDto.status}
                        </div>
                        <div class="list-title">
                            <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>"><c:out value="${accompanyDto.title}"/></a>
                        </div>
                    </div>
                    <div class="list-content">
                        <a href="<c:url value='/accompany/read?id=${accompanyDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>"><c:out value="${accompanyDto.content}"/></a>
                    </div>
                    <div class="profile-img-bar">
                        <div class="profile-img">
                            프로필사진
                        </div>
                        <div class="nickname">
                            닉네임${accompanyDto.nickname}
                        </div>
                        <div class="view-cnt">
                            조회수${accompanyDto.viewCnt}
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
    </div>
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