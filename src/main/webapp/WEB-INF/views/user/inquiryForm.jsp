<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 동행 게시글</title>
<link rel="stylesheet" href="<c:url value="/css/user/inquiryForm.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>


<div class="main">
    <div class="contents">
        <h2 class="title">문의 게시글 ${mode == "new" ? "쓰기" : "읽기"}</h2>
        <form id="form" class="frm" action="" method="post" onsubmit="return formCheck()">
            <span>제목</span><input class="inquiry-title" name="title" type="text" value="${inquiryDto.title}" ${mode == "new" ? "" : "readonly"} placeholder=" 제목을 입력해 주세요."><br>
            <textarea name="content" ${mode == "new" ? "" : "readonly"} rows="20" placeholder="내용을 입력해 주세요.">${inquiryDto.content}</textarea><br>

            <c:if test="${mode eq 'new'}">
                <button type="button" id="write-btn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
            </c:if>
            <c:if test="${pageContext.request.session.getAttribute('id') eq inquiryDto.userId}">
                <button type="button" id="modify-btn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
                <button type="button" id="remove-btn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
                <button type="button" id="list-btn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
            </c:if>

<%--            <button type="button" id="modify-btn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>--%>
<%--            <button type="button" id="remove-btn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>--%>
<%--            <button type="button" id="list-btn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>--%>
        </form>
        <input type="hidden" name="id" value="${inquiryDto.id}" readonly>
        <c:if test="${inquiryDto.ansUserId != null}">
            <h2 class="title">답변</h2>
            <textarea class="reply-textarea" readonly rows="20" placeholder="내용을 입력해 주세요.">${inquiryDto.ansContent}</textarea><br>
        </c:if>
    </div>
</div>
<script>
    // CK EDITOR 적용
    CKEDITOR.replace('content', // 해당 name으로 된 textarea에 적용
        {filebrowserUploadUrl:'/ckeditor/fileUploader',
            width:'100%'
        });

    // form 유효성 검사
    let formCheck = function() {
        // let form = document.getElementById("form");
        //
        // alert(form.title.value);
        // alert(form.content.innerText);
        let title = $("input[name=title]").val();
        let content = CKEDITOR.instances.content.getData();

        if(title=="" || title.length == 0) {
            alert("제목을 입력해 주세요.");
            $("input[name=title]").focus();
            return false;
        }

        if(content=="" || content.length == 0) {
            alert("내용을 입력해 주세요.");
            $("textarea[name=content]").focus();
            return false;
        }


        return true;
    }

    // 수정 버튼을 눌렀을 때
    $("#modify-btn").on("click", function () {
        let form = $("#form");
        let isReadonly = $("input[name=title]").attr('readonly');

        // 1. 읽기 상태이면, 수정 상태로 변경
        if(isReadonly=='readonly') {
            $(".title").html("문의 게시글 수정");
            $("input[name=title]").attr('readonly', false);
            CKEDITOR.instances.content.setReadOnly(false);
            $("#modify-btn").html("<i class='fa fa-pencil'></i> 수정 완료");
            // $("#listBtn").html("취소");
            return;
        }

        let inquiryId = $("input[name=id]").val();
        // 2. 수정 상태이면, 수정된 내용을 서버로 전송
        form.attr("action", "<c:url value='/mypage/inquiryList/modify${sc.queryString}&id='/>" + inquiryId);
        form.attr("method", "post");
        if(formCheck()) {
            form.submit();
        }
    })

    // 삭제버튼을 눌렀을 때
    $("#remove-btn").on("click", function(){
        if(!confirm("정말로 삭제하시겠습니까?")) return;
        let form = $("#form");
        let inquiryId = $("input[name=id]").val();

        form.attr("action", "<c:url value='/mypage/inquiryList/remove${sc.queryString}&id='/>" + inquiryId);
        form.attr("method", "post");
        form.submit();
    });
    $("#list-btn").on("click", function(){
        location.href="<c:url value='/mypage/inquiryList${sc.queryString}'/>";
    });

    // 글쓰기 모드(mode == "new") 에서 등록버튼을 눌렀을 때
    $("#write-btn").on("click", function () {
        let form = $("#form");

        form.attr("action", "<c:url value='/mypage/inquiryList/write'/>");
        form.attr("method", "post");
        form.submit();
    });
</script>