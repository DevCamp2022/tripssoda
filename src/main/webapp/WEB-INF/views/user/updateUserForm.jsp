<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.net.URLDecoder" %>

<title>계정 정보 수정</title>
<link rel="stylesheet" href="<c:url value="/css/user/updateUserForm.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<script>
    let msg = "";
    if(msg=="INVALID_INFO_VALUE") alert("올바른 회원정보를 입력해주세요.");
</script>
<div class="main">
    <div class="contents">
        <h2 class="title">회원정보 수정</h2>
        <input type="hidden" name="id" value="${userDto.id}">
        <input type="hidden" name="email" value="${userDto.email}">
        <form:form modelAttribute="userDto" action="/mypage/info/update" class="user-info" method="post" enctype="multipart/form-data" onsubmit="return formCheck()">
            <div class="img-wrap">
                <img src="${pageContext.request.contextPath}/user/profileImg/${userDto.profileImg}" class="profile-img" alt="프로필 이미지">
            </div>
            <div class="update-img-form">
                <input type="file" name="img" id="uploadThumb"/>
            </div>
            <div class="user-interest-list">
                <c:forEach var="userTourInterestDto" items="${userTourInterestDtoList}">
                    <div class="user-interest"># ${userTourInterestDto.tourIntrCode}</div>
                </c:forEach>
                <button class="update-interest-btn" type="button">여행관심사 테스트 다시보기</button>
            </div>
            <div class="msg"><form:errors path="pwd"/></div>
            <div class="msg"><form:errors path="pwdConfirm"/></div>
            <div class="msg"><form:errors path="tel"/></div>
            <div class="msg"><form:errors path="nickname"/></div>
            <div class="nickname-wrap wraps">
                <p class="user-nickname">닉네임</p>
                <input type="text" name="nickname" class="input-nickname inputs" value="${userDto.nickname}" placeholder="닉네임 입력(4자~12자, 영대소문자와 숫자 조합)">
                <p class="nickname-check check-text"></p>
            </div>
            <div class="intro-wrap wraps">
                <p class="user-intro">소개글</p>
                <input type="text" name="intro" class="input-intro inputs" value="${userDto.intro}" maxlength="2000" placeholder="소개글을 입력해주세요(2000자 이내)">
            </div>
            <div class="instagram-wrap wraps">
                <p class="user-instagram"><i class="fa-brands fa-instagram"></i>인스타그램</p>
                <input type="text" name="instagramId" class="input-instagram inputs" value="${userDto.instagramId}" placeholder="@를 제외한 user ID만 입력" maxlength="30">
            </div>
            <div class="tel-wrap wraps">
                <p class="user-tel">휴대폰 번호</p>
                <input type="text" name="tel" class="input-tel inputs" value="${userDto.tel}" placeholder="휴대폰 번호 입력(- 없이 입력)" maxlength="11">
                <p class="tel-check check-text"></p>
            </div>
            <div class="pwd-wrap wraps">
                <p class="user-pwd">비밀번호</p>
                <input type="password" name="pwd" class="input-pwd inputs" placeholder="비밀번호 입력(8자~12자, 영문 문자+숫자+특수문자 사용)" maxlength="14">
                <p class="pwd-check check-text"></p>
            </div>
            <div class="pwd-confirm-wrap wraps">
                <p class="user-pwd-confirm">비밀번호 확인</p>
                <input type="password" name="pwdConfirm" class="input-pwd inputs" placeholder="비밀번호 확인" maxlength="14">
                <p class="pwd-confirm-check check-text"></p>
            </div>
            <input type="hidden" name="email" value="${userDto.email}">
            <input type="hidden" name="id" value="${userDto.id}">
            <div class="button-wrap">
                <button class="update-complete-btn">수정 완료</button>
            </div>
        </form:form>
        <input type="hidden" class="secured-pwd" value="${userDto.pwd}">
    </div>
    <script>
        $(document).ready(function() {
            // 닉네임을 변수에 저장
            let nickname = $("input[name=nickname]").val();
            // 닉네임 유효성 검사결과를 변수에 저장
            nicknameResult = nickJ.test(nickname);

            // 닉네임 중복체크 검사
            $.ajax({
                type:"POST",
                url:"/mypage/info/nicknameCheck",
                data: {nickname:nickname},
                cache : false,
                async: false,
                success :function(result) {
                    // 닉네임 중복검사결과를 저장
                    nickVerfResult = result;
                },
                error: function() {
                    alert("닉네임 중복체크중 오류가 발생했습니다. 다시 시도해주세요");
                }
            });

            if (nicknameResult && nickVerfResult) {
                $('.nickname-check').text('사용가능한 닉네임 입니다.');
                $('.nickname-check').css('color', 'blue');
            } else if (!nickVerfResult) {
                $('.nickname-check').text('중복되는 닉네임 입니다. 다른 닉네임을 입력해주세요');
                $('.nickname-check').css('color', 'red');
            } else if (!nicknameResult) {
                $('.nickname-check').text('4~12자리 영대소문자, 숫자 조합을 입력해주세요.');
                $('.nickname-check').css('color', 'red');
            }

            // 비밀번호 유효성 검사결과를 변수에 저장
            telResult = telJ.test($('input[name=tel]').val());

            if (telResult) {
                $('.tel-check').text('OK');
                $('.tel-check').css('color', 'blue');
            } else {
                $('.tel-check').text('- 를 제외한 올바른 휴대폰 번호를 입력해주세요.');
                $('.tel-check').css('color', 'red');
            }
        });
        // form 유효성 검사 함수
        function formCheck() {

            if(nicknameResult && nickVerfResult && telResult && pwdResult && pwdConfirmResult) {
                return true;
            } else if(!nicknameResult) {
                $('input[name=nickname]').focus();
                $('.nickname-check').text('양식에 맞게 닉네임을 입력해주세요');
                $('.nickname-check').css('color', 'red');
                return false;
            } else if(!nickVerfResult) {
                $('input[name=nickname]').focus();
                $('.nickname-check').text('양식에 맞게 닉네임을 입력해주세요');
                $('.nickname-check').css('color', 'red');
                return false;
            } else if(!telResult) {
                $('input[name=tel]').focus();
                $('.tel-check').text('올바른 휴대폰번호를 입력해주세요');
                $('.tel-check').css('color', 'red');
                return false;
            } else if(!pwdResult) {
                $('input[name=pwd]').focus();
                $('.pwd-check').text('양식에 맞게 비밀번호를 입력해주세요');
                $('.pwd-check').css('color', 'red');
                return false;
            } else if(!pwdConfirmResult) {
                $('input[name=pwdConfirm]').focus();
                $('.pwd-confirm-check').text('양식에 맞게 비밀번호를 입력해주세요');
                $('.pwd-confirm-check').css('color', 'red');
                return false;
            }
        }

        //thumbnail upload
        $("input[name=img]").change(function(){
            //정규표현식
            var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
            var f = $(this)[0].files[0]; //현재 선택한 파일
            if(!f.type.match(reg)){
                alert("유효한 확장자가 아닙니다.");
                return;
            }

            var reader = new FileReader();
            reader.onload = function(e){
                let newImg = document.createElement('img');
                newImg.setAttribute("src", e.target.result);
                $(".img-wrap").html(newImg);
                $(".img-wrap").children().css("width", "100%");
                $(".img-wrap").children().css("height", "100%");
                $(".img-wrap").children().css("border-radius", "200px");
            }
            reader.readAsDataURL($(this)[0].files[0]);
        });


        //모든 공백 체크 정규식
        let empJ = /\s/g;
        // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 조합)
        let pwdJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,12}$/;
        // 이름 정규식 (2~6자리 한글)
        let nameJ = /^[가-힣]{2,6}$/;
        // 휴대폰 번호 정규식
        let telJ = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
        // 닉네임 정규식 (4 ~ 12자리 영대소문자, 숫자 조합)
        let nickJ = /^[a-zA-Z0-9]{4,12}$/;

        // 유효성 검사 결과를 저장할 전역 변수 선언
        let pwdResult = false;
        let telResult = false;
        let pwdConfirmResult = false;
        let nicknameResult = false;
        let nickVerfResult = false;

        // 닉네임 유효성 검사
        $("input[name=nickname]").keyup(function() {
            // 닉네임을 변수에 저장
            let nickname = $("input[name=nickname]").val();
            // 닉네임 유효성 검사결과를 변수에 저장
            nicknameResult = nickJ.test(nickname);

            // 닉네임 중복체크 검사
            $.ajax({
                type:"POST",
                url:"/mypage/info/nicknameCheck",
                data: {nickname:nickname},
                cache : false,
                async: false,
                success :function(result) {
                    // 닉네임 중복검사결과를 저장
                    nickVerfResult = result;
                },
                error: function() {
                    alert("닉네임 중복체크중 오류가 발생했습니다. 다시 시도해주세요");
                }
            });

            if (nicknameResult && nickVerfResult) {
                $('.nickname-check').text('사용가능한 닉네임 입니다.');
                $('.nickname-check').css('color', 'blue');
            } else if (!nickVerfResult) {
                $('.nickname-check').text('중복되는 닉네임 입니다. 다른 닉네임을 입력해주세요');
                $('.nickname-check').css('color', 'red');
            } else if (!nicknameResult) {
                $('.nickname-check').text('4~12자리 영대소문자, 숫자 조합을 입력해주세요.');
                $('.nickname-check').css('color', 'red');
            }
        });

        // 비밀번호 유효성 검사
        $("input[name=pwd]").keyup(function() {
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
        $("input[name=pwdConfirm]").keyup(function() {
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
            }
        });

        // 휴대폰번호 유효성 검사
        $("input[name=tel]").keyup(function() {
            // 비밀번호 유효성 검사결과를 변수에 저장
            telResult = telJ.test($('input[name=tel]').val());

            if (telResult) {
                $('.tel-check').text('OK');
                $('.tel-check').css('color', 'blue');
            } else {
                $('.tel-check').text('- 를 제외한 올바른 휴대폰 번호를 입력해주세요.');
                $('.tel-check').css('color', 'red');
            }
        });

        // 여행관심사 테스트 다시보기 버튼을 눌렀을 때
        $(".update-interest-btn").on("click", function () {
            location.href="/mypage/info/updateInterest";
        })
    </script>
</div>

