<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>tripssoda 로그인</title>
<link rel="stylesheet" href="<c:url value="/css/user/loginForm.css"/>">

<div class="main">
    <form action="<c:url value="/login/emailLogin"/>" class="contents" method="post">
        <h3 class="title">로그인</h3>
        <p class="error-msg">${URLDecoder.decode(param.msg)}</p>
        <input type="email" class="input-id" name="email" value="${cookie.email.value}" placeholder="이메일">
        <input type="password" class="input-pwd" name="pwd" placeholder="비밀번호">
        <div class="checkbox-wrap">
            <label><input type="checkbox" name="rememberId" class="remember-id" value="on" ${empty cookie.email.value ? "" : "checked"}>아이디 기억</label>
        </div>
        <input type="hidden" name="toURL" value="${param.toURL}">
        <button class="login-btn">로그인</button>
        <div class="link-wrap">
            <a href="<c:url value='/login/findEmail'/>" class="find-email">이메일 찾기</a>
            <a href="<c:url value='/login/findPwd'/>" class="find-pwd">비밀번호 찾기</a>
            <a href="<c:url value="/register"/>" class="register-link">회원가입</a>
        </div>
    </form>
</div>


