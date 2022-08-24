<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.net.URLDecoder" %>

<title>tripssoda 이용약관</title>
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
        </div>
        <button class="find-btn">찾기</button>
    </form>
</div>
<script>
    let msg = "${msg}";
    if(msg == "UPDATE_PWD_ERR") alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요");
    // form 전송여부를 정하는 onsubmit 함수
    let nameResult = false;
    let emailResult = false;

    // 이름 정규식
    let nameJ = /^[가-힣]{2,6}$/;
    let emailJ = /^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$/;

    function formCheck() {
        nameResult = nameJ.test($('input[name=name]').val());
        emailResult = emailJ.test($('input[name=email]').val());
        if(!nameResult) {
            alert("정확한 이름을 입력해주세요");
            return false;
        } else if(!emailResult) {
            alert("올바른 이메일을 입력해주세요");
            return false;
        }
        return true;
    }

    // 인증번호 전송 버튼을 눌렀을 때
    $(".send-email-verf-btn").on("click", function () {
        let email = $('.input-email').val();
        let name = $('.input-name').val();

        $.ajax({
            type:"POST",
            url:"/login/findPwd/sendEmail",
            data: {email:email, name:name},
            cache : false,
            success :function(result){
                if(result == "Email has been sent") {
                    alert("인증번호를 전송하였습니다.");
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
    });
</script>


