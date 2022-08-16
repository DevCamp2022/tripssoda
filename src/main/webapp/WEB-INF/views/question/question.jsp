<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Q&A상세페이지</title>
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
        border-collapse: collapse;
        font-family: 'Noto Sans KR', sans-serif;
    }

    .container {
        display: flex;
        width: 1200px;
        height: 10000px;
        border: 1px solid black;
        margin: auto;
    }
    .wrap1 {
        flex: 2;
        width: 800px;
        height: 10000px;
        text-align: center;
        border: 1px solid black;
    }
    .wrap1 > .title {
        width: 800px;
        height: 100px;
        text-align: center;
        line-height: 100px;
        border: 1px solid black;
    }


    .wrap2 {
        flex: 1;
        width: 230px;
        height: 400px;
        text-align: center;
        border: 1px solid black;
    }
    .status-bar {
        display: flex;
        width: 800px;
        height: 50px;
        border: 1px solid black;
    }
    .status,
    .region {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        margin: auto 0 auto 0;
    }
    .content {
        width: 800px;
        height: 300px;
        border: 1px solid black;
        line-height: 300px;
    }
    .hashtag {
        width: 800px;
        height: 50px;
        border: 1px solid black;
        line-height: 50px;
    }
    .reg-date-bar {
        display: flex;
        width: 800px;
        height: 50px;
        border: 1px solid black;
        line-height: 50px;
    }
    .reg-date {
        width: 200px;
        height: 30px;
        line-height: 30px;
        margin: auto 0 auto 0;
        border: 1px solid black;
    }
    .view-cnt,
    .report,
    .answer-cnt {
        width: 100px;
        height: 30px;
        line-height: 30px;
        margin: auto 0 auto 0;
        border: 1px solid black;
    }
    .modify-btn,
    .remove-btn {
        width: 50px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        margin: auto 0 auto 0;
        cursor: pointer;
    }
    .answer-cnt2 {
        width: 100px;
        height: 30px;
        line-height: 30px;
        margin: auto 0 auto 0;
        border: 1px solid black;
    }
    .wrap3 {
        width: 300px;
        height: 62px;
        border: 1px solid black;
        margin: 20px auto 0px auto;
        line-height: 62px;
        text-align: center;
    }
    .profile-img-bar {
        display: flex;
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        margin: auto;
    }
    .profile-img,
    .nickname,
    .tag {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
    }
    .age-bar {
        display: flex;
        width: 300px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
        margin: auto;
    }
    .age,
    .gender,
    .country {
        width: 100px;
        height: 30px;
        border: 1px solid black;
        line-height: 30px;
    }
    .notice-area {
        width: 380px;
        height: 300px;
        border: 1px solid black;
        line-height: 30px;
        margin: 50px auto 50px auto;
    }
    .notice {
        margin: 50px auto 30px auto;
    }
    .answer-btn {
        width: 300px;
        height: 80px;
        border: 1px solid black;
        line-height: 80px;
        font-size: 30px;
        margin: auto;
        cursor: pointer;
    }



    /* start answer-css */
    .comment_area {
        width: 850px;
        height: 500px;
        margin: auto 0 auto 0;
        /*background-color: green;*/
    }
    .comment_area > input {
        background-color: #f8f8f8;
        outline-color: #e6e6e6;
    }
    #modBtn, #sendBtn {
        background-color: rgb(236, 236, 236); /* Blue background */
        border: none; /* Remove borders */
        color: black; /* White text */
        padding: 6px 12px; /* Some padding */
        font-size: 16px; /* Set a font size */
        cursor: pointer; /* Mouse pointer on hover */
        border-radius: 5px;
    }
    #commentList {
        margin: auto;
        width: 100%;
        height: 500px;
    }
    .commenter {
        font-weight: bold;
        font-size: 20px;
    }
    .comment {
        background-color: #f8f8f8;
        outline-color: #e6e6e6;
        height: 40px;
        line-height: 40px;
        border: 1px solid #e9e8e8;
    }
    .delBtn, .modBtn, .replyBtn, #wrtRepBtn {
        margin-right: 10px;
        font-size:10pt;
        color : black;
        background-color: #eff0f2;
        text-decoration: none;
        padding : 5px 10px 5px 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    .delBtn {
        margin-left: 10px;
    }
</style>

<form id="form" action="" method="">
    <input type="hidden" name="id" value="${questionDto.id}">
<div class="container">
    <div class="wrap1">
        <div class="title">
            <h1>제목 : <c:out value='${questionDto.title}'/></h1>
        </div>
        <div class="status-bar">
            <div class="status">
                답변상태 : ${questionDto.status}
            </div>
            <div class="region">
                지역코드 : ${questionDto.regionCode}
            </div>
        </div>
        <div class="content">
            <h1>내용 : ${questionDto.content}</h1>
        </div>
        <div class="hashtag">
            해시태그 : ${questionDto.hashtag}
        </div>
        <div class="reg-date-bar">
            <div class="reg-date">
                등록일 : <fmt:formatDate value="${questionDto.createdAt}" pattern="yyyy.MM.dd hh:mm" />
            </div>
            <div class="view-cnt">
                조회수 : ${questionDto.viewCnt}
            </div>
            <div class="answer-cnt">
                답변수 : ${questionDto.ansCnt}
            </div>
            <div class="report">
                신고하기
            </div>
            <button type="button" class="modify-btn">
                <a href="<c:url value='/question/modify'/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}">수정</a>
            </button>
            <button type="button" id="remove-btn" class="remove-btn">
                삭제
            </button>
        </div>
        <div class="answer-cnt2">
            답변수 : ${questionDto.ansCnt}
        </div>
        <br><br>

        <%--댓글 html--%>
        <div class="comment_area">
            답변쓰기 : <input type="text" name="content" placeholder="답변을 남겨보세요"><br>
            <button id="sendBtn" type="button">답변등록</button>
            <button id="modBtn" type="button">답변수정</button>
            <div id="commentList"></div>
        </div>

    </div>
    <div class="wrap2">
        <div class="notice-area">
            <div class="wrap3">
                <div class="profile-img-bar">
                    <div class="profile-img">
                        프로필이미지
                    </div>
                    <div class="nickname">
                        닉네임 : ${questionDto.nickname}
                    </div>
                    <div class="tag">
                        등급태그
                    </div>
                </div>
                <div class="age-bar">
                    <div class="age">
                        나이태그
                    </div>
                    <div class="gender">
                        성별태그
                    </div>
                    <div class="country">
                        국적태그
                    </div>
                </div>
            </div>
            <div class="notice">
                프로필 사진을 클릭해보세요!
            </div>
            <div class="answer-btn">
                답변하기
            </div>
        </div>
    </div>
</div>
</form>
<script>
    $(document).ready(function() {
        $("#remove-btn").on("click", function() {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action", "<c:url value='/question/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
    });
</script>

<%-- 답변(댓글) script 시작 --%>
<script>
    let questionId = "<c:out value='${questionDto.id}'/>";

    let showList = function(questionId) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/answers?questionId='+questionId,  // 요청 URI
            success : function(result){
                $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수
            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function(){
        //  댓글 부분 scipt 시작
        showList(questionId);

        $("#modBtn").click(function(){
            let id = $(this).attr("data-id");
            let content = $("input[name=content]").val();

            if(content.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=content]").focus()
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/answers/'+id,  // 요청 URI // /ch4/comments/70 PATCH
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({id:id, content:content}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(questionId);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#sendBtn").click(function(){
            let comment = $("input[name=content]").val();

            if(comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=content]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/answers?questionId='+questionId,  // 요청 URI // /ch4/comments?bno=1085 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({questionId:questionId, content:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(questionId);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#commentList").on("click", ".modBtn", function() {
            let id = $(this).parent().attr("data-id");
            let content = $("div.comment", $(this).parent()).text();

            //1. comment의 내용을 input에 뿌려주기
            $("input[name=content]").val(content);
            //2. cno 전달하기
            $("#modBtn").attr("data-id", id);
        });

        // $(".delBtn").click(function(){
        $("#commentList").on("click", ".delBtn", function(){
            let id = $(this).parent().attr("data-id");
            let questionId = $(this).parent().attr("data-questionId");

            $.ajax({
                type:'DELETE',
                url: '/answers/'+id+'?questionId='+questionId,  // 요청 URI
                success : function(result){
                    alert(result)
                    showList(questionId);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });//end 댓글script
    });

    //댓글 script2 시작
    let toHtml = function(comments) {
        let addZero = function(value=1){
            return value > 9 ? value : "0"+value;
        }

        let dateToString = function(ms=0) {
            let date = new Date(ms);

            let yyyy = date.getFullYear();
            let mm = addZero(date.getMonth() + 1);
            let dd = addZero(date.getDate());

            let HH = addZero(date.getHours());
            let MM = addZero(date.getMinutes());
            let ss = addZero(date.getSeconds());

            return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
        }


        let tmp = "<div>";

        comments.forEach(function(comment){
            tmp += '<div data-id='+comment.id
            tmp += ' data-questionId='+comment.questionId + '>'
            tmp += ' <span class="commenter">' + comment.userId + '</span>'
            tmp += ' <div class="comment">' + comment.content + '</div>'
            tmp += dateToString(comment.createdAt)
            tmp += '<button class="delBtn" type="button">삭제</button>'
            tmp += '<button class="modBtn" type="button">수정</button>'
            tmp += '</div>'
        })

        return tmp + "</div>";
    } //댓글 script2 끝
</script>
</body>
</html>
