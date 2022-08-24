<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>Q&A상세페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/question/question.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"></head>
</head>
<body>
<form id="form" action="" method="">
    <input type="hidden" name="id" value="${questionDto.id}">
    <input type="hidden" name="answerId" value="">
    <div class="total-group">
        <div class="content-profile-group">
            <div class="content-group">
                <div class="title-line">
                    <div class="question-icon">

                    </div>
                    <div class="title-text">
                        ${questionDto.title}
                    </div>
                </div>
                <div class="region-box">
                    <div class="region-line">
                        <div class="status-text">
                            상태
                        </div>
                        <div class="answer-on-off">
                            ${questionDto.status}
                        </div>
                        <div class="region-text">
                            지역
                        </div>
                        <div class="region-selected">
                            ${questionDto.regionCode}
                        </div>
                    </div>
                </div>
                <div class="content-box">
                    ${questionDto.content}
                </div>
                <div class="hashtag-line">
                    <span class="hashtag-text">${questionDto.hashtag}</span>
                </div>
                <div class="view-cnt-line">
                    <div class="reg-date">
                        <fmt:formatDate value="${questionDto.createdAt}" pattern="yyyy.MM.dd HH:mm" />
                    </div>
                    <div class="view-cnt">
                        &nbsp· 조회수 ${questionDto.viewCnt}
                    </div>
                    <div class="answer-cnt">
                        &nbsp· 답변수 ${questionDto.ansCnt}
                    </div>
                    <button type="button" class="modify-btn">
                        <a href="<c:url value='/question/modify'/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}">수정</a>
                    </button>
                    <button type="button" id="remove-btn" class="remove-btn">
                        · 삭제
                    </button>
                </div>
                <div class="answer-cnt2">
                    <span class="answer-cnt2-number">${questionDto.ansCnt}</span>개의 답변
                </div>

                <div id="commentList"></div>

                <%--            <div class="answer-top-box">--%>
                <%--                <div class="answer-profile-img-line">--%>
                <%--                    <div class="answer-profile-img">--%>

                <%--                    </div>--%>
                <%--                    <div class="answer-nickname-reg-date-box">--%>
                <%--                        <!-- userId를 닉네임으로 변경해야함 -->--%>
                <%--                        <div class="answer-nickname-line">--%>
                <%--                            ${answerDto.userId}--%>
                <%--                        </div>--%>
                <%--                        <div class="answer-reg-date-line">--%>
                <%--                            <fmt:formatDate value="${answerDto.createdAt}" pattern="yyyy.MM.dd hh:mm" />--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
                <%--                <div class="answer-content-box">--%>
                <%--                    ${answerDto.content}--%>
                <%--                </div>--%>
                <%--                <div class="only-line">--%>
                <%--                </div>--%>
                <%--            </div>--%>
            </div>

            <!-- 우측 프로필 영역 -->
            <div class="profile-group">
                <div class="profile-top">
                    <div class="profile-img">

                    </div>
                    <div class="profile-right">
                        <div class="nickname-line">
                            <div class="nickname">
                                ${questionDto.nickname}
                            </div>
                            <!-- 프로필에서 태그를 얻어오는듯1 -->
                            <div class="profile-tag">
                                ${questionDto.hashtag}
                            </div>
                        </div>

                        <!-- 프로필에서 태그를 얻어오는듯2 -->
                        <div class="tag2-line">
                            20대·남성·대한민국·경험추구형
                        </div>
                    </div>
                </div>
                <div class="profile-bottom">
                    <div class="profile-icon-line">
                        <div class="profile-icon">

                        </div>
                        <div class="profile-text">
                            프로필 사진을 클릭해보세요!
                        </div>
                    </div>
                    <div class="apply-btn" onclick="location.href='<c:url value="/question/answer/write"/>?id=${questionDto.id}&page=${page}&pageSize=${pageSize}'">
                        답변하기
                    </div>

                </div>
            </div>
        </div>
    </div>
</form>
<input type="hidden" name="page" value="${page}">
<input type="hidden" name="pageSize" value="${pageSize}">
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
            <%--let id = $(this).parent().attr("data-id");--%>
            <%--// console.log("id",id);--%>
            <%--// console.log("questionId",questionId);--%>
            <%--$.ajax({--%>
            <%--    type:'GET',       // 요청 메서드--%>
            <%--    url: '/question/answer/modify?id='+questionId+"&answerId="+id,  // 요청 URI--%>
            <%--    success : function(result){--%>
            <%--        // $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수--%>
            <%--        location.href="<c:url value="/question/answer/modify"/>?page=${page}&pageSize=${pageSize}";--%>
            <%--        &lt;%&ndash;location.href="<c:url value="/question/answer/modify"/>";&ndash;%&gt;--%>
            <%--    },--%>
            <%--    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수--%>
            <%--}); // $.ajax()--%>
            let id = $(this).parent().attr("data-id");
            let page = $("input[name=page]").val();
            let pageSize = $("input[name=pageSize]").val();
            location.href="/question/answer/modify?id="+questionId+"&answerId="+id+"&page="+page+"&pageSize="+pageSize;
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

            return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM;
        }


        let tmp = "<div>";

        comments.forEach(function(comment){
            tmp += '<div class="repeat-answer-container" data-id='+comment.id
            tmp += ' data-questionId='+comment.questionId + '>'
            tmp += ' <div class="repeat-answer"><div class="answer-profile-img"></div>'
            tmp += ' <div><span class="commenter">' + comment.userId + '</span>'
            tmp += ' <div class="comment-date">' + dateToString(comment.createdAt) + '</div></div></div>'
            tmp += ' <div class="comment">' + comment.content + '</div>'
            tmp += '<button class="modBtn" type="button">수정</button>'
                <%--<a href="<c:url value='/question/answer/modify'/>?page=${page}&pageSize=${pageSize}">수정</a></button>--%>
            tmp += '<button class="delBtn" type="button">삭제</button>'
            tmp += '<div class="only-line"></div>'
            tmp += '</div>'

        })

        return tmp + "</div>";


    } //댓글 script2 끝
</script>
</body>
</html>
