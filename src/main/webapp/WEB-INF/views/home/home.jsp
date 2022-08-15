<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="image-banner"> 배너배너배너배너배너</div>
<div class="content">
    The time on the server is ${serverTime}.
</div>
<img src="${sample_img}" style="width:300px"/>

<a href="/register">회원가입</a>
<a href="/login">로그인</a>
<a href="/mypage/info">마이페이지</a>
<a href="/logout">로그아웃</a>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/sample/sampleJs.js"></script>