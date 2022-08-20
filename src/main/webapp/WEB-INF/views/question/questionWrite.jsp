<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Q&A 글쓰기&수정</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
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
    .wrap1 > .search {
        width: 600px;
        height: 300px;
        border: 1px solid black;
        margin: auto;
        text-align: center;
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
        line-height: 300px;
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
<<<<<<< Updated upstream
=======

    * {box-sizing: border-box}
    body {font-family: "Lato", sans-serif;}

    .region-container {
        width: 1200px;
        height: 2000px;
        border: 1px solid black;
        margin: auto;
    }
    /* Style the tab */
    .tab {
        float: left;
        border: 1px solid #ccc;
        background-color: #f1f1f1;
        width: 220px;
        height: 390px;
    }

    /* Style the buttons inside the tab */
    .tab button {
        display: block;
        background-color: inherit;
        color: black;
        padding: 22px 16px;
        width: 220px;
        border: none;
        outline: none;
        text-align: left;
        cursor: pointer;
        transition: 0.3s;
        font-size: 17px;
    }

    /* Change background color of buttons on hover */
    .tab button:hover {
        background-color: #ddd;
    }

    /* Create an active/current "tab button" class */
    .tab button.active {
        background-color: #ccc;
    }

    /* Style the tab content */
    .tabcontent {
        float: left;
        padding: 0px 12px;
        width: 900px;
        border-left: none;
        height: 300px;
        line-height: 70px;
    }
    .country-btn {
        width: 80px;
        height: 40px;
        margin-right: 30px;
        cursor: pointer;
        background-color: #fff;
    }
    .city-btn {
        width: 50px;
        height: 40px;
        border: 1px solid black;
        cursor: pointer;
        background-color: #fff;
    }
>>>>>>> Stashed changes
</style>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록이 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="posting-page">
    <div class="wrap1">
        <div class="main-img">
            <h1>고정사진</h1>
        </div>
        <div class="search">
<<<<<<< Updated upstream
            <h1>검색</h1>
=======
            검색
>>>>>>> Stashed changes
        </div>
    </div>
    <form id="form" class="frm" action="" method="">
        <div class="wrap2">
            <c:if test="${mode ne 'new'}">
                <div>
                    <input name="id" type="hidden" value="${questionDto.id}">
                </div>
            </c:if>
            <div>
                <input name="title" class="title" type="text" value="<c:out value='${questionDto.title}'/>" placeholder="물음표로 끝나는 제목을 입력해보세요.(100자 이내)" ><br>
            </div>
            <div>
                <textarea name="content" class="content" rows="20" placeholder="내용을 입력해 주세요.(1000자 이내)" ><c:out value="${questionDto.content}"/></textarea>
            </div>
            <div>
                <input name="hashtag" class="tag" type="text" value="<c:out value='${questionDto.hashtag}'/>" placeholder="태그 입력 (띄어쓰기로 구분) (100자 이내)"><br>
            </div>
        </div>
        <div class="wrap3">
            <div>
                <button type="button" id="cancel-btn" class="cancel-btn" onclick="location.href='<c:url value="/question/list"/>?page=${page}&pageSize=${pageSize}'">취소</button>
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
            form.attr("action", "<c:url value='/question/write'/>");
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
            form.attr("action", "<c:url value='/question/modify'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
        $("#remove-btn").on("click", function() {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action", "<c:url value='/question/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
</body>
</html>
