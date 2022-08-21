<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Q&A리스트페이지</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<style>
    * {
        list-style: none;
        text-decoration: none;
        margin: 0px;
        padding: 0px;
        border-collapse: collapse;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .container {
        width: 1200px;
<<<<<<< Updated upstream
        height: 2000px;
=======
>>>>>>> Stashed changes
        border: 1px solid black;
        margin: auto;
    }
    .container > .main-img {
<<<<<<< Updated upstream
        width: 1200px;
=======
        width: 1100px;
>>>>>>> Stashed changes
        height: 200px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
        line-height: 80px;
    }
    .sort-bar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
<<<<<<< Updated upstream
        width: 1200px;
=======
        width: 1100px;
>>>>>>> Stashed changes
        height: 50px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .sort-bar > .sort {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
    }
    .sort-bar > .only-qna {
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
    }
    .qna-container {
        display: flex;
        flex-wrap: wrap;
<<<<<<< Updated upstream
        width: 1200px;
        height: 800px;
=======
        width: 1100px;
>>>>>>> Stashed changes
        border: 1px solid black;
        margin: auto;
    }
    .qna-container > .qna-wrap {
        width: 500px;
        height: 200px;
        border: 1px solid black;
<<<<<<< Updated upstream
        margin-left: 50px;
=======
        margin-left: 30px;
>>>>>>> Stashed changes
    }
    .region-bar {
        display: flex;
        width: 500px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .region {
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .status {
        width: 200px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .title {
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
<<<<<<< Updated upstream
    .content {
        width: 300px;
=======
    .cont {
        width: 500px;
>>>>>>> Stashed changes
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .hashtag {
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .qna-bottom {
        display: flex;
        width: 400px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .profile-img,
    .nickname,
    .view-cnt,
    .answer-cnt {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        text-align: center;
    }
    .paging {
<<<<<<< Updated upstream
        width: 1200px;
=======
        width: 800px;
>>>>>>> Stashed changes
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
<button id="write-btn" class="write-btn" onclick="location.href='<c:url value="/question/write"/>'">질문글쓰기</button>
<div class="container">
    <div class="main-img">
        <h3>여행에 대한 질문을 해보세요</h3>
        <h1>여행 Q&A</h1>
    </div>
    <div class="sort-bar">
        <div class="sort">
            정렬
        </div>
        <div class="only-qna">
            답변을 기다리는 질문만 보기
        </div>
    </div>
    <div class="qna-container">
        <c:forEach var="questionDto" items="${list}">
        <div class="qna-wrap">
            <div class="region-bar">
                <div class="region">
                    <a href="<c:url value='/question/read?id=${questionDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">지역코드 : ${questionDto.regionCode}</a>
                </div>
                <div class="status">
                    답변상태 : ${questionDto.status}
                </div>
            </div>
            <div class="title">
                <a href="<c:url value='/question/read?id=${questionDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">제목 : ${questionDto.title}</a>
            </div>
<<<<<<< Updated upstream
            <div class="content">
=======
            <div class="cont">
>>>>>>> Stashed changes
                <a href="<c:url value='/question/read?id=${questionDto.id}&page=${ph.page}&pageSize=${ph.pageSize}'/>">내용 : ${questionDto.content}</a>
            </div>
            <div class="hashtag">
                해시태그 : ${questionDto.hashtag}
            </div>
            <div class="qna-bottom">
                <div class="profile-img">
                    프로필이미지
                </div>
                <div class="nickname">
                    닉네임 : ${questionDto.nickname}
                </div>
                <div class="view-cnt">
                    조회수 : ${questionDto.viewCnt}
                </div>
                <div class="answer-cnt">
                    답변수 : ${questionDto.ansCnt}
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    <br>
    <div class="paging">
        <c:if test="${ph.showPrev}">
            <a href="<c:url value='/question/list?page=${ph.beginPage-1}&pageSize=${ph.pageSize}'/>">&lt;</a>
        </c:if>
        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
            <a href="<c:url value='/question/list?page=${i}&pageSize=${ph.pageSize}'/>">${i}</a>
        </c:forEach>
        <c:if test="${ph.showNext}">
            <a href="<c:url value='/question/list?page=${ph.endPage+1}&pageSize=${ph.pageSize}'/>">&gt;</a>
        </c:if>
    </div>
</div>
</body>
</html>
