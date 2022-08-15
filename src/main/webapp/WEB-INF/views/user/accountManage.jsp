<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>tripssoda 이용약관</title>
<link rel="stylesheet" href="<c:url value="/css/user/accountManage.css"/>">

<script>
    let msg = "${msg}";
    if(msg=="UPDATE_SUCCESS") alert("계정 정보가 수정되었습니다.");
</script>
<div class="main">
    <div class="contents">
        <h2 class="title">계정 관리</h2>
        <form action="<c:url value='/mypage/info/update'/>" class="user-info" method="post">
            <input type="hidden" name="id" value="${userDto.id}">
            <input type="hidden" name="email" value="${userDto.email}">

            <div class="img-wrap">
                <img src="" class="profile-img" alt="프로필 이미지">
            </div>
            <div class="update-img-form" style="display: none;">
                <input type="file" id="fileItem" name="" accept="image/*" multiple>
            </div>
            <div class="user-interest-list">
                <c:forEach var="userTourInterestDto" items="${userTourInterestDtoList}">
                    <div class="user-interest"># ${userTourInterestDto.tourIntrCode}</div>
                </c:forEach>
            </div>
            <div class="nickname-wrap wraps">
                <p class="user-nickname">닉네임</p>
                <input type="text" name="nickname" class="input-nickname" value="${userDto.nickname}" readonly>
            </div>
            <div class="intro-wrap wraps">
                <p class="user-intro">소개글</p>
                <input type="text" name="intro" class="input-intro" value="${userDto.intro}" readonly>
            </div>
            <div class="instagram-wrap wraps">
                <p class="user-instagram">인스타그램</p>
                <input type="text" name="instagramId" class="input-instagram" value="${userDto.instagramId}" readonly placeholder="@를 제외한 user ID만 입력">
            </div>
            <div class="tel-wrap wraps">
                <p class="user-tel">휴대폰 번호</p>
                <input type="text" name="tel" class="input-tel" value="${userDto.tel}" readonly>
            </div>
            <div class="pwd-wrap wraps">
                <p class="user-pwd">비밀번호</p>
                <input type="password" name="pwd" class="input-pwd" value="${userDto.pwd}" readonly>
            </div>
            <div class="pwd-confirm-wrap wraps">
                <p class="user-pwd-confirm">비밀번호 확인</p>
                <input type="password" name="pwdConfirm" class="input-pwd" value="${userDto.pwd}" readonly>
            </div>
            <div class="button-wrap">
                <button class="withdraw-btn" type="button">회원 탈퇴</button>
                <button class="update-btn" type="button">수정</button>
                <button class="update-complete-btn" style="display: none;">수정 완료</button>
            </div>
        </form>
    </div>
    <script>

        // 수정 버튼을 눌렀을 때
        $(".update-btn").on("click", function() {
            // 수정버튼을 누르면 readonly를 false로 바꿔줌
            $("input[name=nickname]").attr('readonly', false);
            $("input[name=intro]").attr('readonly', false);
            $("input[name=instagramId]").attr('readonly', false);
            $("input[name=tel]").attr('readonly', false);
            $("input[name=pwd]").attr('readonly', false);
            $("input[name=pwd-confirm]").attr('readonly', false);

            // 수정 버튼 숨김
            $(".update-btn").css("display", "none");
            // 회원 탈퇴 버튼 숨김
            $(".withdraw-btn").css("display", "none");
            // 수정 완료 버튼 보여줌
            $(".update-complete-btn").css("display", "block");
            // 이미지 수정 form 보여줌
            $(".update-img-form").css("display", "flex");
        });

        // 회원 탈퇴 버튼을 눌렀을 때
        $(".withdraw-btn").on("click", function () {
            if(!confirm("정말로 탈퇴 하시겠습니까?")) return;
            let form = $(".user-info");
            form.attr("action", "<c:url value='/mypage/delete'/>");
            form.attr("method", "post");
            form.submit();
        });
    </script>
</div>


