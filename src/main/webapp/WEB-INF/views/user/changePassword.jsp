<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>tripssoda 이용약관</title>
<link rel="stylesheet" href="<c:url value="/css/user/changePassword.css"/>">

<div class="main">
    <form action="<c:url value="/login/changePassword"/>" class="contents" method="post" onsubmit="return formCheck()">
        <h3 class="title">비밀번호 변경</h3>
        <p class="error-msg">${URLDecoder.decode(msg, "utf-8")}</p>
        <input type="password" class="input-pwd" name="pwd" placeholder="비밀번호(8자~12자, 영문 문자+숫자+특수문자 사용)">
        <p class="pwd-check check-text"></p>
        <input type="password" class="input-pwd-confirm" name="pwdConfirm" placeholder="비밀번호 확인" maxlength="14">
        <p class="pwd-confirm-check check-text"></p>
        <button class="change-btn">비밀번호 변경</button>
        <input type="hidden" name=email value="${email}">
    </form>
</div>
<script>
    // form 전송여부를 정하는 onsubmit 함수
    function formCheck() {
        if(pwdResult && pwdConfirmResult) {
            return true;
        } else if(!pwdResult) {
            $('input[name=pwd]').focus();
            return false;
        } else if(!pwdConfirmResult) {
            $('input[name=pwdConfirm]').focus();
            return false;
        }
    }
    // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 혼합)
    let pwdJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,12}$/;

    let pwdResult = false;
    let pwdConfirmResult = false;
    // 비밀번호 유효성 검사
    $("input[name=pwd]").blur(function() {
        // 비밀번호 유효성 검사결과를 변수에 저장
        pwdResult = pwdJ.test($('input[name=pwd]').val());

        if (pwdResult) {
            $('.pwd-check').text('사용가능한 비밀번호 입니다.');
            $('.pwd-check').css('color', 'blue');
        } else {
            $('.pwd-check').text('8~12자리의 영대소문자와 숫자, 특수기호 조합을 입력하세요.');
            $('.pwd-check').css('color', 'red');
        }
    });

    // 비밀번호확인 유효성 검사
    $("input[name=pwdConfirm]").blur(function() {
        // 비밀번호확인 유효성 검사결과를 변수에 저장
        pwdConfirmResult = pwdJ.test($('input[name=pwdConfirm]').val());
        let pwd = $('input[name=pwd]').val();
        let pwdConfirm = $('input[name=pwdConfirm]').val();

        if (pwdConfirmResult && (pwd === pwdConfirm)) {
            $('.pwd-confirm-check').text('비밀번호가 일치합니다.');
            $('.pwd-confirm-check').css('color', 'blue');
        } else if (!pwdConfirmResult) {
            $('.pwd-confirm-check').text('8~12자리의 영대소문자와 숫자, 특수기호 조합을 입력하세요.');
            $('.pwd-confirm-check').css('color', 'red');
        } else {
            $('.pwd-confirm-check').text('비밀번호가 일치하지 않습니다.');
            $('.pwd-confirm-check').css('color', 'red');
            pwdConfirmResult = false;
        }
    });


</script>


