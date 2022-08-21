<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>tripssoda 이용약관</title>
<link rel="stylesheet" href="<c:url value="/css/user/findEmail.css"/>">

<div class="main">
    <form action="<c:url value="/login/findEmail"/>" method="POST" class="contents">
        <h3 class="title">이메일 찾기</h3>
        <p class="error-msg">${URLDecoder.decode(param.msg)}</p>
        <input type="text" class="input-name" name="name" placeholder="이름">
        <input type="text" class="input-tel" name="tel" placeholder="핸드폰 번호(- 없이 입력)">
        <button class="find-btn">찾기</button>
    </form>
</div>
<script>

</script>


