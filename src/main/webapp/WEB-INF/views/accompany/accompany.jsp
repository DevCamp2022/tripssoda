<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
    .detail-page {
        display: flex;
        margin: auto;
        text-align: center;
    }
    .thumbnail {
        width: 800px;
        height: 400px;
        margin: auto;
        text-align: center;
        border: 1px solid black;

    }

    .wrap {
        flex: 1;
        width: 800px;
        height: 900px;
        border: 1px solid black;
        margin: auto;
    }
    .wrap > .title {
        width: 600px;
        height: 200px;
        border: 1px solid black;
        margin: 0 auto 0 auto;
        text-align: center;
    }
    .wrap > .region {
        width: 600px;
        height: 200px;
        border: 1px solid black;
        margin: 0 auto 0 auto;
        text-align: center;
    }
    .wrap > .content {
        width: 600px;
        height: 200px;
        border: 1px solid black;
        margin: 0 auto 0 auto;
        text-align: center;
    }
    .wrap > .tag {
        width: 600px;
        height: 50px;
        border: 1px solid black;
        margin: 0 auto 0 auto;
        text-align: center;
    }

    .wrap2 {
        display: flex;
        width: 600px;
        height: 50px;
        margin: auto;
        text-align: center;
        border: 1px solid black;
    }
    .date {
        width: 300px;
        height: 30px;
        border: 1px solid black;
        margin: auto;
    }
    .view-cnt {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        margin: auto;
    }
    .button {
        width: 150px;
        height: 30px;
        margin: auto;
    }
    .wrap0 {
        display: flex;
    }
    .profile {
        flex: 1;
        width: 400px;
        height: 300px;
        border: 1px solid black;
        margin: 0 auto 0 auto;
        text-align: center;
    }
    .wrap3 {
        display: flex;
        width: 600px;
        height: 100px;
        border: 1px solid black;
        margin: auto;
    }
    .wrap3 > .member-cnt {
        flex: 1;
        width: 100px;
        height: 60px;
        border: 1px solid black;
        margin: auto;
    }
    .wrap3 > .date2 {
        flex: 1;
        width: 100px;
        height: 60px;
        border: 1px solid black;
        margin: auto;
    }

</style>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="wrap0">
<form id="form" action="" method="">
<div class="thumbnail">
    썸네일
</div>

<div class="detail-page">
    <div class="wrap">
        <input type="hidden" name="id" value="${accompanyDto.id}">
        <div class="title">제목 : <c:out value="${accompanyDto.title}"/></div>
        <div class="region">지역 : <c:out value="${accompanyDto.regionCode}"/></div>
        <div class="wrap3">
            <div class="member-cnt">인원수 : <c:out value="${accompanyDto.memberCnt}"/></div>
            <div class="date2">
                <div class="start-date">시작일 : ${accompanyDto.startAt}</div>
                <div class="end-date">마감일 : ${accompanyDto.endAt}</div>
            </div>
        </div>
        <div class="content">내용 : <c:out value="${accompanyDto.content}"/></div>
        <div class="tag">해시태그 : <c:out value="${accompanyDto.hashtag}"/></div>
        <div class="wrap2">
            <div class="date">
                등록일 : <fmt:formatDate value="${accompanyDto.createdAt}" pattern="yyyy.MM.dd HH:mm" />
            </div>
            <div class="view-cnt">
                조회수 : ${accompanyDto.viewCnt}
            </div>
            <div class="button">
                <button type="button" id="modify-btn" class="btn"><a href="<c:url value='/accompany/modify?id=${accompanyDto.id}&page=${page}&pageSize=${pageSize}'/>">수정</a></button>
                <button type="button" id="remove-btn" class="btn">삭제</button>
            </div>
        </div>
    </div>
</div>
</form>

<div class="profile">
    <div>
        프로필
    </div>
    <div class="chat-url">
        <a href="https://${accompanyDto.chatUrl}">오픈채팅방입장</a>
    </div>
</div>
</div>

<script>
    $(document).ready(function() {
        $("#remove-btn").on("click", function() {
        if(!confirm("정말로 삭제하시겠습니까?")) return;
        let form = $('#form');
        form.attr("action", "<c:url value='/accompany/remove'/>?page=${page}&pageSize=${pageSize}");
        form.attr("method", "post");
        form.submit();
        });
   });
</script>
</body>
</html>
