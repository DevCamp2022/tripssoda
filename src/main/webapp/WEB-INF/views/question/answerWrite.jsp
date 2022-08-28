<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Q&A 글쓰기&수정</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/question/answerWrite.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<div class="main-group">
    <div class="question-container">
        <div class="title-box">
            <div class="question-icon-box">
                <div class="question-icon">

                </div>
            </div>
            <div class="title-input-box">
                ${questionDto.title}
            </div>
        </div>
        <div class="only-line">
        </div>
        <div class="content-input-box">
            &nbsp ${questionDto.content}
        </div>
        <div class="profile-img-line">
            <div class="profile-img">

            </div>
            <div class="reg-date">
                <fmt:formatDate value="${questionDto.createdAt}" pattern="yyyy.MM.dd HH:mm" />
            </div>
        </div>
    </div>
    <form action="" method="">
        <div class="content-box">
            <textarea name="content" cols="30" class="content-text" rows="10" placeholder="내용을 입력해해주세요. (1000자 이내)">${answerDto.content}</textarea>
        </div>
    </form>
    <div class="button-line">
        <button type="button" class="cancel-btn" onclick="location.href='<c:url value="/question/read"/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}'">
            취소
        </button>
        <c:if test="${mode eq 'new'}">
            <button type="button" id="sendBtn" class="ok-btn">
                완료
            </button>
        </c:if>
        <c:if test="${mode ne 'new'}">
            <button type="button" id="modBtn" class="ok-btn">
                완료
            </button>
        </c:if>
    </div>
</div>
<script>
    let questionId = "<c:out value='${questionDto.id}'/>";

    function searchParam(key) {
        return new URLSearchParams(location.search).get(key);
    };

    $(document).ready(function() {
        $("#sendBtn").click(function(){
            let content = $("textarea[name=content]").val();

            if(content.trim()=='') {
                alert("답변을 입력해주세요.");
                $("textarea[name=content]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/answers?questionId='+questionId,  // 요청 URI // /ch4/comments?bno=1085 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({questionId:questionId, content:content}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    // alert(result);
                    location.href="<c:url value="/question/read"/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}";
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#modBtn").click(function(){
            let id = searchParam('answerId');
            let content = $("textarea[name=content]").val();

            if(content.trim()=='') {
                alert("답변을 입력해주세요.");
                $("textarea[name=content]").focus()
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/answers/'+id,  // 요청 URI // /ch4/comments?bno=1085 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({id:id, content:content}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    // alert(result);
                    alert('성공적으로 수정되었습니다.')
                    location.href="<c:url value="/question/read"/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}";
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });
    });
</script>
</body>
</html>
