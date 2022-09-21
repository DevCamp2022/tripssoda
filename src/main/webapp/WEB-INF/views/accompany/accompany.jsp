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
<form id="form" class="top-form" action="" method="">
    <input type="hidden" name="id" value="${accompanyDto.id}">
    <input type="hidden" name="msg" value="${msg}">
    <div class="main-img-area">
<%--        <div class="main-img2">--%>
            <img class="main-img" src="${pageContext.request.contextPath}/image/thumbnail/${accompanyDto.thumbnail}" alt="">
<%--        </div>--%>
    </div>
    <div class="content-profile-group">
        <div class="content-group">
            <div class="title-line">
                ${accompanyDto.title}
            </div>
            <div class="region-box">
                <div class="region-line">
                    <div class="region-text">
                        지역
                    </div>
                    <div class="region-data">
                        ${accompanyDto.cityName}
                    </div>
                    <div class="member-text">
                        모집인원
                    </div>
                    <div class="member-cnt">
                        ${accompanyDto.memberCnt}명
                    </div>
                </div>
                <div class="date-line">
                    <img class="calendar-icon" src="<c:url value='/image/accompany/calendar-icon.svg'/>">
                    <div class="start-date">
                        <fmt:formatDate value="${accompanyDto.startAt}" pattern="yyyy-MM-dd" type="date"/>
                    </div>
                    <p>&nbsp~&nbsp</p>
                    <div class="end-date">
                        <fmt:formatDate value="${accompanyDto.endAt}" pattern="yyyy-MM-dd" type="date"/>
                    </div>
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
<%--                        --%>
<%--                </div>--%>
            </div>
            <div class="tag2-line">
                ${modelHashtag}
            </div>
        </div>
    </div>
    <div class="profile-bottom">
        <div class="profile-icon-line">
            <div class="profile-icon">
            </div>
            <div class="profile-text">
                동행에 참여 해보세요!
            </div>
        </div>
<%--        글쓴이와 세션의 id가 같을 때 오픈채팅방을 열고싶으면 아래 주석을 해제 --%>
<%--        <c:if test="${sessionScope.id eq accompanyDto.userId}">--%>
<%--            <c:if test="${accompanyDto.status eq 1}">--%>
<%--                <div class="apply-btn2">--%>
<%--                    동행 신청이 마감되었습니다.--%>
<%--                </div>--%>
<%--            </c:if>--%>
<%--            <c:if test="${accompanyDto.status eq 0}">--%>
<%--                <a class="apply-text" href="https://${accompanyDto.chatUrl}">--%>
<%--                    <div class="apply-btn">--%>
<%--                        오픈채팅방입장--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </c:if>--%>
<%--        </c:if>--%>

        <c:if test="${sessionScope.id ne accompanyDto.userId}">
            <c:if test="${sessionScope.id ne null}">
                <c:if test="${accompanyDto.status eq 1}">
                    <div class="apply-btn2">
                        동행 신청이 마감되었습니다.
                    </div>
                </c:if>
                <c:if test="${accompanyDto.status eq 0}">
                    <a class="apply-text" href="https://${accompanyDto.chatUrl}">
                    <div class="apply-btn">
                        오픈채팅방입장
                    </div>
                    </a>
                </c:if>
            </c:if>
            <c:if test="${sessionScope.id eq null}">
                <c:if test="${accompanyDto.status eq 0}">
                <a class="apply-text" href="<c:url value='/login'/>">
                    <div class="apply-btn">
                        오픈채팅방입장
                    </div>
                </a>
                </c:if>
                <c:if test="${accompanyDto.status eq 1}">
                    <div class="apply-btn2">
                        동행 신청이 마감되었습니다.
                    </div>
                </c:if>
            </c:if>
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
