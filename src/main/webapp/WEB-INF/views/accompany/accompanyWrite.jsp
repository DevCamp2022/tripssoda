<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <title>글쓰기 페이지</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
    .posting-page {
        width: 1200px;
        height: 3000px;
        margin: auto;
        text-align: center;
        border: 1px solid black;
    }
    .wrap1 {
        width: 900px;
        height: 650px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap1 > .main-img {
        width: 600px;
        height: 150px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap1 > .search-area {
        width: 600px;
        height: 300px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .member-wrap {
        display: flex;
    }
    .date-bar {
        display: flex;
    }
    .wrap1 > .thumbnail {
        width: 600px;
        height: 150px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap2 {
        width: 900px;
        height: 600px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap2 > div > .title {
        width: 600px;
        height: 150px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap2 > div > .content {
        width: 600px;
        height: 300px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap2 > div > .tag {

        width: 600px;
        height: 50px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }

    .wrap3 {
        display: flex;
        width: 900px;
        height: 100px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
    }
    .wrap3 > div{
        flex: 1;
    }
    .wrap3 > div > .complete-btn {
        width: 200px;
        height: 50px;
        border: 1px solid black;
        text-align: center;
        line-height: 50px;
        cursor: pointer;
    }
    .wrap3 > div > .cancel-btn {
        width: 200px;
        height: 50px;
        border: 1px solid black;
        text-align: center;
        line-height: 50px;
        cursor: pointer;
    }
</style>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록이 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<form id="form" class="frm" action="" method="">
<div class="posting-page">
    <div class="wrap1">
        <div class="main-img">
            <h1>여행친구사진</h1>
        </div>
        <div class="search-area">
            <div class="search">
                <h1>검색</h1>
            </div>
            <div class="member-wrap">
                <h4>모집인원 : </h4>
                <input type="text" class="member-cnt" name="memberCnt" value="${accompanyDto.memberCnt}" placeholder="1~20 인원수를 입력해주세요">
            </div>
            <div class="date-bar">
                <h4>날짜 선택 : </h4>
                <input type="date" name="startAt" value="${accompanyDto.startAt}">
                <input type="date" name="endAt" value="${accompanyDto.endAt}>
            </div>
        </div>
        <div class="thumbnail">
            <h1>썸네일</h1>
        </div>
    </div>
    <div class="wrap2">
        <c:if test="${mode ne 'new'}">
            <div>
                <input name="id" type="hidden" value="${accompanyDto.id}">
            </div>
        </c:if>
        <div>
            <input name="title" class="title" type="text" value="<c:out value='${accompanyDto.title}'/>" placeholder="제목을 입력해 주세요." ><br>
        </div>
        <div>
            <textarea name="content" class="content" rows="20" placeholder="내용을 입력해 주세요." ><c:out value="${accompanyDto.content}"/></textarea>
        </div>
        <div>
            <input name="hashtag" class="tag" type="text" value="<c:out value='${accompanyDto.hashtag}'/>" placeholder="해시태그를 입력해 주세요."><br>
        </div>
    </div>
    <div class="wrap3">
        <div>
            <button type="button" id="cancel-btn" class="cancel-btn" onclick="location.href='<c:url value="/accompany/list"/>?page=${page}&pageSize=${pageSize}'">취소</button>
        </div>
        <div>
            <c:if test="${mode eq 'new'}">
                <button type="button" id="write-btn" class="complete-btn">완료</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="modify-btn" class="complete-btn" >완료</button>
            </c:if>
        </div>
    </div>
    </form>
</div>
<script>
    $(document).ready(function() {
        let formCheck = function() {
            let form = document.getElementById("form");
            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            return true;
        }
        $("#write-btn").on("click", function() {
            let form = $("#form");
            form.attr("action", "<c:url value='/accompany/write'/>");
            form.attr("method", "post");
            if(formCheck()) {
                form.submit();
            }
        });
        $("#modify-btn").on("click", function() {
            let form = $("#form");
            // let isReadonly = $("input[name=title]").attr('readonly');
            // if(isReadonly=='readonly') {
            //     $("input[name=title]").attr('readonly', false);
            //     $("textarea").attr('readonly', false);
            //     return;
            // }
            form.attr("action", "<c:url value='/accompany/modify'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
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
