<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <title>글쓰기 페이지</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/accompany/accompanyWrite.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<body>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록이 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="main-img">

</div>
<form id="form" action="" method="">
    <div class="main-group">
        <div class="upload-img">
            <input type="file" name="uploadThumb" id="uploadThumb" class="sdfadsf">
            <div class="div-thumbnail"></div>
        </div>
        <div class="select-region-box">

        </div>
        <div class="title-box">
            <c:if test="${mode ne 'new'}">
                <div>
                    <input name="id" type="hidden" value="${accompanyDto.id}">
                </div>
            </c:if>
            <input name="title" type="text" class="title-input-box" value="<c:out value='${accompanyDto.title}'/>" placeholder="&nbsp 제목을 입력해주세요.(100자 이내)">
        </div>
        <div class="only-line">
        </div>
        <textarea name="content" class="content-input-box" cols="30" rows="10" placeholder="&nbsp 내용을 입력하세요.(1000자 이내)"><c:out value="${accompanyDto.content}"/></textarea>
        <input name="hashtag" class="hashtag-input-box" type="text" value="<c:out value='${accompanyDto.hashtag}'/>" placeholder="&nbsp 태그 입력 (띄어쓰기로 구분) (100자 이내)"><br>
        <input name="chatUrl" class="chat-url-input-box" type="text" value="<c:out value='${accompanyDto.chatUrl}'/>" placeholder="&nbsp 오픈채팅방 주소를 입력해 주세요.">
        <div class="button-line">
            <button type="button" id="cancel-btn" class="cancel-btn" onclick="location.href='<c:url value="/accompany/list"/>?page=${page}&pageSize=${pageSize}'">
                취소
            </button>
            <c:if test="${mode eq 'new'}">
                <button type="button" id="write-btn" class="ok-btn">완료</button>
            </c:if>
            <c:if test="${mode ne 'new'}">
                <button type="button" id="modify-btn" class="ok-btn" >완료</button>
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
                // if(CKEDITOR.instances.content.getData()==''){
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return false;
            }
            if(form.title.value.length>100) {
                alert("제목은 100자 이하로 입력해주세요");
                form.title.focus();
                return false;
            }
            if(form.content.value.length>1000) {
                alert("내용은 1000자 이하로 입력해주세요");
                form.content.focus();
                // setTimeout(function(){form.hashtag.focus();}, 1);
                return false;
            }
            if(form.hashtag.value.length>100) {
                alert("해시태그는 100자 이하로 입력해주세요");
                form.hashtag.focus();
                // setTimeout(function(){form.hashtag.focus();}, 2);
                return false;
            }

            return true;
        }
        $("#write-btn").on("click", function() {
            let form = $("#form");
            form.attr("action", "<c:url value='/accompany/write'/>");
            form.attr("method", "post");
            form.attr("enctype", "multipart/form-data")
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
            if(formCheck()) {
                form.submit();
            }
        });
        $("#remove-btn").on("click", function() {
            if(!confirm("정말로 삭제하시겠습니까?")) return;
            let form = $('#form');
            form.attr("action", "<c:url value='/accompany/remove'/>?page=${page}&pageSize=${pageSize}");
            form.attr("method", "post");
            form.submit();
        });
        //thumbnail upload
        $("#uploadThumb").change(function(){
            //정규표현식
            // var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
            var f = $(this)[0].files[0]; //현재 선택한 파일
            // if(!f.type.match(reg)){
            //     alert("유효한 확장자가 아닙니다.");
            //     return;
            // }

            var reader = new FileReader();
            reader.onload = function(e){
                let newImg = document.createElement('img');
                newImg.setAttribute("src", e.target.result);
                newImg.setAttribute("width",500);
                $(".div-thumbnail").html(newImg);
            }
            reader.readAsDataURL($(this)[0].files[0]);
        });
    });
    // CKEDITOR.replace('content',
    //     {filebrowserUploadUrl:'/ckeditor/fileUploader'
    //     });
</script>
</body>
</html>
