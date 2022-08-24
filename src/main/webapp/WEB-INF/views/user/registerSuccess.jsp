<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>tripssoda 회원가입</title>
<link rel="stylesheet" href="<c:url value="/css/user/registerSuccess.css"/>">

<div class="main">
    <div class="contents">
        <div class="img-wrap">
            <img src="${pageContext.request.contextPath}/user/characterImg/character2.JPG">
        </div>
        <p>회원가입을 축하합니다! 회원님의 이메일은 ${email} 입니다.</p>
        <button class="login-btn" type="button">로그인 하러 가기</button>
    </div>
</div>
<script>
    $(".login-btn").on("click", function (){
       location.href = "/login";
    });
</script>


