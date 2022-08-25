<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
    <link rel="stylesheet" href="<c:url value='/css/accompany/accompany.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<form id="form" action="" method="">
    <input type="hidden" name="id" value="${accompanyDto.id}">
    <div class="main-img-area">
        <div class="main-img2">
            <img class="main-img" src="${pageContext.request.contextPath}/image/thumbnail/${accompanyDto.thumbnail}" alt="">
        </div>
    </div>
    <div class="content-profile-group">
        <div class="content-group">
            <div class="title-line">
                ${accompanyDto.title}
            </div>
            <div class="region-box">
                <div class="region-line">

                </div>
                <div class="date-line">

                </div>
            </div>
            <div class="content-box">
                ${accompanyDto.content}
            </div>
            <div class="hashtag-line">
                <span class="hashtag-text">${accompanyDto.hashtag}</span>
            </div>
            <div class="view-cnt-line">
                <div class="reg-date">
                    <fmt:formatDate value="${accompanyDto.createdAt}" pattern="yyyy.MM.dd HH:mm" />
                </div>
                <div class="view-cnt">
                    &nbsp· 조회수 ${accompanyDto.viewCnt}
                </div>
                <c:if test="${sessionScope.id eq accompanyDto.userId}">
                <button type="button" class="modify-btn">
                    <a href="<c:url value='/accompany/modify'/>?id=${accompanyDto.id}&page=${page}&pageSize=${pageSize}">수정</a>
                </button>
                <button type="button" id="remove-btn" class="remove-btn">
                    · 삭제
                </button>
                </c:if>
            </div>
        </div>

<div class="profile-group">
    <div class="profile-top">
        <div class="profile-img">
            <img class="profile-img2" src="${pageContext.request.contextPath}/user/profileImg/${accompanyDto.profileImg}">
        </div>
        <div class="profile-right">
            <div class="nickname-line">
                <div class="nickname">
                    ${accompanyDto.nickname}
                </div>
<%--                <div class="profile-tag">--%>
<%--                    # 맛집탐방러--%>
<%--                </div>--%>
            </div>
            <div class="tag2-line">
<%--                40대 · 남성 · 대한민국 · 경험추구형--%>
            </div>
        </div>
    </div>
    <div class="profile-bottom">
        <div class="profile-icon-line">
            <div class="profile-icon">
            </div>
            <div class="profile-text">
<%--                프로필 사진을 클릭해보세요!--%>
                동행에 참여 해보세요!
            </div>
        </div>
        <c:if test="${sessionScope.id ne accompanyDto.userId}">
        <div class="apply-btn">
            <a class="apply-text" href="https://${accompanyDto.chatUrl}">오픈채팅방입장</a>
        </div>
        </c:if>
    </div>
</div>
</div>
</form>

<script>
    $(document).ready(function() {
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

</script>
</body>
</html>
