<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>이메일 찾기</title>
<link rel="stylesheet" href="<c:url value="/css/user/findEmail.css"/>">

<div class="main">
    <form action="<c:url value="/login/findEmail"/>" method="POST" class="contents" onsubmit="return formCheck()">
        <h3 class="title">이메일 찾기</h3>
        <p class="error-msg">${URLDecoder.decode(param.msg)}</p>
        <input type="text" class="input-name" name="name" placeholder="이름">
        <p class="name-check check-text"></p>
        <input type="text" class="input-tel" name="tel" placeholder="핸드폰 번호(- 없이 입력)">
        <p class="tel-check check-text"></p>
        <button class="find-btn">찾기</button>
    </form>
</div>
<script>
    function formCheck() {
        let name = $('input[name=name]').val();
        let tel = $('input[name=tel]').val();

        if(name == "" || null) {
            $('input[name=name]').focus();
            $('.name-check').text('이름을 입력해주세요');
            $('.name-check').css('color', 'red');
            return false;
        } else if(tel == "" || null) {
            $('input[name=tel]').focus();
            $('.tel-check').text('휴대폰 번호를 입력해주세요');
            $('.tel-check').css('color', 'red');
            return false;
        }

        return true;
    }
</script>


