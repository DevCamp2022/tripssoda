<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>회원가입 유형 선택</title>
<link rel="stylesheet" href="<c:url value="/css/user/selectLoginType.css"/>">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>

<script>
    let msg = '${msg}'
    if(msg == "READ_INFO_ERR") alert("잘못된 접근입니다. 다시 로그인해주세요");
</script>
<div class="main">
    <input class="to-url" type="hidden" value="${param.toURL}">
    <div class="contents">
        <div class="slogan">
            <p class="slogan-text">내 취향에 딱 맞는 여행, 트립쏘다</p>
        </div>
        <button class="kakao-login-btn" type="button">카카오로 로그인</button>
        <button class="email-login-btn" type="button">이메일로 로그인</button>
        <div class="ask-register">
            <p class="ask">아직 계정이 없으신가요?</p>
            <button class="register-btn" type="button">회원가입</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/user/selectLoginType.js"></script>


