<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>회원가입 유형 선택</title>
<link rel="stylesheet" href="/css/user/selectRegisterType.css">
<script>
    let msg = "${msg}";
    if(msg == "Id is null") alert("회원만 파트너 입점 신청이 가능합니다.\n회원가입 페이지로 이동합니다.");
</script>
<div class="main">
    <div class="contents">
        <div class="slogan">
            <img class="character" src="${pageContext.request.contextPath}/user/characterImg/character.JPG">
            <p class="slogan-text">내 취향에 딱 맞는 여행, 트립쏘다</p>
        </div>
        <button class="kakao-register-btn btn" type="button"><img class="kakao-logo" src="${pageContext.request.contextPath}/user/socialImg/kakao.JPG">카카오로 회원 가입</button>
        <button class="email-register-btn btn" type="button">이메일로 회원 가입</button>
        <div class="ask-login">
            <p class="ask">이미 계정이 있으신가요?</p>
            <button class="login-btn" type="button">로그인</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/user/selectRegisterType.js"></script>
