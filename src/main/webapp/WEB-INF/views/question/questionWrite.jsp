<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Q&A 글쓰기&수정</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/question/questionWrite.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록이 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>

<form id="form" class="frm" action="" method="">
<div class="main-img">

</div>
<div class="main-group">
        <div class="select-region-box">
                <div class="region-area">
                    <div class="continent-area">
                        <div class="continent-component">
                            <div value="00">동아시아</div>
                            <div>동남아시아</div>
                            <div>서남아시아</div>
                            <div>유럽</div>
                            <div>아메리카</div>
                            <div>오세아니아</div>
                            <div>아프리카</div>
                        </div>
                    </div>
                    <div class="country-area">
                        <div class="country-component">
                            <div value="00">한국</div>
                            <div>일본</div>
                            <div>홍콩</div>
                            <div>마카오</div>
                            <div>대만</div>
                            <div>중국</div>
                            <div>몽골</div>
                        </div>
                    </div>
                    <div class="city-area">
                        <div class="city-component">
                            <div value="000">서울</div>
                            <div>강원도</div>
                            <div>제주도</div>
                            <div>부산</div>
                            <div>경기도</div>
                            <div>인천</div>
                            <div>충청도</div>
                            <div>경상도</div>
                            <div>전라도</div>
                        </div>
                        <div class="city-component">
                            <div value="000">도쿄</div>
                            <div>오사카</div>
                            <div>후쿠오카</div>
                            <div>오키나와</div>
                            <div>나고야</div>
                            <div>교토</div>
                            <div>훗카이도</div>
                            <div>히로시마</div>
                        </div>
                        <div class="city-component">
                            <div value="000">홍콩</div>
                        </div>
                        <div class="city-component">
                            <div value="000">마카오</div>
                        </div>
                        <div class="city-component">
                            <div value="000">타이페이</div>
                            <div value="000">타이중</div>
                            <div value="000">가오슝</div>
                        </div>
                        <div class="city-component">
                            <div value="000">상하이</div>
                            <div>베이징</div>
                            <div>칭다오</div>
                            <div>청두</div>
                            <div>광저우</div>
                            <div>하이난</div>
                            <div>항저우</div>
                            <div>장가계</div>
                            <div>충칭</div>
                            <div>서안</div>
                        </div>
                        <div class="city-component">
                            <div value="000">울란바토르</div>
                        </div>
                    </div>
                </div>
            </div>
        <c:if test="${mode ne 'new'}">
            <div>
                <input name="id" type="hidden" value="${questionDto.id}">
            </div>
        </c:if>
        <div class="title-box">
            <div class="question-icon-box">
                <div class="question-icon">

                </div>
            </div>
            <input name="title" type="text" class="title-input-box" value="<c:out value='${questionDto.title}'/>" placeholder="물음표로 끝나는 제목을 입력해보세요.(100자 이내)">
        </div>
        <div class="only-line">
        </div>
        <textarea name="content" id="" class="content-input-box" cols="30" rows="10" placeholder="&nbsp 내용을 입력해주세요.(1000자 이내)"><c:out value="${questionDto.content}"/></textarea>
        <div class="hashtag-box">
            <input name="hashtag" type="text" class="hashtag-input-box" value="<c:out value='${questionDto.hashtag}'/>" placeholder="&nbsp 태그 입력 (띄어쓰기로 구분) (100자 이내)">
        </div>
        <div class="button-line">
            <button type="button" id="cancel-btn" class="cancel-btn" onclick="location.href='<c:url value="/question/list"/>?page=${page}&pageSize=${pageSize}'">
                취소
            </button>
            <c:if test="${mode eq 'new'}">
                <button type="button" id="write-btn" class="ok-btn">완료</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="modify-btn" class="ok-btn">완료</button>
            </c:if>
        </div>
</div>
</form>
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
            if(form.title.value.length>100) {
                alert("제목은 100자 이하로 입력해주세요.");
                form.title.focus();
                return false;
            }
            if(form.content.value.length>1000) {
                alert("내용은 1000자 이하로 입력해주세요.");
                form.title.focus();
                return false;
            }
            if(form.hashtag.value.length>100) {
                alert("해시태그는 100자 이하로 입력해주세요.");
                form.title.focus();
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
            if(formCheck())
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
</body>
</html>
