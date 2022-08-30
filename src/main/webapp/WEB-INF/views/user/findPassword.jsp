<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<c:url value="/css/user/findPassword.css"/>">

<div class="main">
    <form action="<c:url value="/login/findPwd"/>" method="POST" class="contents" onsubmit="return formCheck()">
        <h3 class="title">비밀번호 찾기</h3>
        <p class="error-msg">${URLDecoder.decode(param.msg)}</p>
        <p class="row-title">이름</p>
        <input type="text" class="input-name" name="name" placeholder="이름 입력">
        <p class="row-title">이메일</p>
        <div class="email-wrap">
            <input type="email" class="input-email" name="email" placeholder="이메일 주소 입력">
            <button class="send-email-verf-btn" type="button">인증번호 전송</button>
            <input type="text" class="verf-num" name="inputCode" placeholder="인증번호 입력">
            <button class="confirm-verf-num" type="button">인증번호 확인</button>
        </div>
        <button class="find-btn">찾기</button>
    </form>
</div>
<script>
    let msg = "${msg}";
    if(msg == "UPDATE_PWD_ERR") alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요");

    // 이메일 인증여부를 저장할 변수 선언
    let emailVerfResult = false;
    // 이메일 인증을 성공했을 때 해당 이메일을 저장할 변수 선언
    let verifiedEmail = "";

    // // 이름 정규식
    // let nameJ = /^[가-힣]{2,6}$/;
    // let emailJ = /^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$/;

    // form 전송여부를 정하는 onsubmit 함수
    function formCheck() {
        let email = $('.input-email').val();
        // 이메일 인증이 되지 않았을 때
        if(!emailVerfResult) {
            alert("이메일 인증을 먼저 진행해주세요.");
            return false;
        }
        // 인증된 이메일이 아닌 다른 이메일로 찾기를 시도할 때
        if(email != verifiedEmail) {
            alert("인증된 이메일이 아닙니다. 인증을 다시 진행해주세요.");
            return false;
        }

        return true;
    }

    // 인증번호 전송 버튼을 눌렀을 때
    $(".send-email-verf-btn").on("click", function () {
        let email = $('.input-email').val();
        let name = $('.input-name').val();
        if(email=="" || email==null) {
            alert("이메일을 입력해주세요");
            return;
        }

        $.ajax({
            type:"POST",
            url:"/login/findPwd/sendEmail",
            data: {email:email, name:name},
            cache : false,
            success :function(result){
                if(result == "Email has been sent") {
                    alert("인증번호를 전송하였습니다.");
                    emailVerfResult = true;
                } else if(result == "Invalid email") {
                    alert("해당하는 정보에 대한 계정을 찾을 수 없습니다. 올바른 정보를 입력해주세요.")
                } else {
                    alert("인증번호 전송에 실패했습니다. 다시 시도해주세요.");
                }
            },
            error: function() {
                alert("오류가 발생했습니다. 나중에 다시 시도해주세요");
            }

        });
        alert("인증번호 전송을 시작합니다.");
    });

    // 인증번호 확인 버튼을 클릭했을 때
    $('.confirm-verf-num').on("click", function() {
        let inputCode = ($('.verf-num').val()).trim();
        let email = $(".input-email").val();

        if(!emailVerfResult) {
            alert("먼저 인증번호 전송을 요청하세요");
            return;
        }
        if(inputCode=="" || inputCode==null) {
            alert("인증번호를 입력해주세요");
            return;
        }

        $.ajax({
            type:"POST",
            url:"/register/confirmVerfCode",
            data: {inputCode:inputCode, email:email},
            cache : false,
            success :function(result){
                if(result == "success") {
                    emailVerfResult = true;
                    verifiedEmail = email;
                    alert("인증에 성공하였습니다.");
                } else if(result == "fail") {
                    alert("유효시간이 지나 인증에 실패했습니다. 인증을 다시 진행해주세요.")
                } else {
                    alert("인증번호가 올바르지 않습니다. 다시 시도해주세요.");
                }
            },
            error: function() {
                alert("인증 중 오류가 발생했습니다. 다시 시도해주세요");
            }

        });
    })
</script>


