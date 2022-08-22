<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>계정 관리</title>
<link rel="stylesheet" href="<c:url value="/css/user/accountManage.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<script>
    let msg = "${msg}";
    if(msg=="UPDATE_SUCCESS") alert("계정 정보가 수정되었습니다.");
    if(msg=="UPDATE_USERINTEREST_SUCCESS") alert("여행 관심사가 수정되었습니다.");
    if(msg=="UPDATE_USERINTEREST_FAILED") alert("여행 관심사 수정에 실패했습니다. 다시 시도해주세요");
    if(msg=="INVALID_INFO_VALUE") alert("계정 정보 수정에 실패했습니다. 올바른 값을 입력해주세요.");
</script>
<div class="main">
    <div class="contents">
        <h2 class="title">계정 관리</h2>
        <input type="hidden" name="id" value="${userDto.id}">
        <input type="hidden" name="email" value="${userDto.email}">
        <form:form modelAttribute="userDto" action="/mypage/info/update" class="user-info" method="post">
            <div class="msg"><form:errors path="pwd"/></div>
            <div class="msg"><form:errors path="pwdConfirm"/></div>
            <div class="msg"><form:errors path="tel"/></div>
            <div class="msg"><form:errors path="nickname"/></div>

            <div class="img-wrap">
                <img src="${pageContext.request.contextPath}/user/profileImg/${userDto.profileImg}" class="profile-img" alt="프로필 이미지">
            </div>
            <div class="user-interest-list">
                <c:forEach var="userTourInterest" items="${userTourInterestList}">
                    <div class="user-interest"><span>#</span> ${userTourInterest}</div>
                </c:forEach>
            </div>
            <button class="update-interest-btn" type="button">여행관심사 테스트 다시보기</button>
            <div class="nickname-wrap wraps">
                <p class="user-nickname">닉네임</p>
                <input type="text" name="nickname" class="input-nickname inputs" value="${userDto.nickname}" readonly placeholder="닉네임 입력(4자~12자, 영대소문자와 숫자 조합)">
            </div>
            <div class="intro-wrap wraps">
                <p class="user-intro">소개글</p>
                <input type="text" name="intro" class="input-intro inputs" value="${userDto.intro}" readonly maxlength="2000">
            </div>
            <div class="instagram-wrap wraps">
                <p class="user-instagram"><i class="fa-brands fa-instagram"></i>인스타그램</p>
                <input type="text" name="instagramId" class="input-instagram inputs" value="${userDto.instagramId}" readonly maxlength="50">
            </div>
            <div class="tel-wrap wraps">
                <p class="user-tel">휴대폰 번호</p>
                <input type="text" name="tel" class="input-tel inputs" value="${userDto.tel}" readonly placeholder="휴대폰 번호 입력(- 없이 입력)" maxlength="11">
            </div>
            <div class="pwd-wrap wraps">
                <p class="user-pwd">비밀번호</p>
            </div>
            <div class="button-wrap">
                <button class="withdraw-btn" type="button">회원 탈퇴</button>
                <button class="update-btn" type="button">수정</button>
            </div>
        </form:form>
        <input type="hidden" class="secured-pwd" value="${userDto.pwd}">
    </div>
    <script>
        // 수정 버튼을 눌렀을 때
        $(".update-btn").on("click", function() {
            // 회원정보 수정 페이지로 이동
            location.href="/mypage/info/update"
        });

        // 회원 탈퇴 버튼을 눌렀을 때
        $(".withdraw-btn").on("click", function () {
            if(!confirm("정말로 탈퇴 하시겠습니까?")) return;
            let form = $(".user-info");
            form.attr("action", "<c:url value='/mypage/delete'/>");
            form.attr("method", "post");
            form.submit();
        });

        // 여행관심사 테스트 다시보기 버튼을 눌렀을 때
        $(".update-interest-btn").on("click", function () {
            location.href="/mypage/info/updateInterest";
        })
    </script>
</div>


