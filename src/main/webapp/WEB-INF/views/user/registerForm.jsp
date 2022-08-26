<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.net.URLDecoder" %>

<link rel="stylesheet" href="/css/user/registerForm.css">
<title>tripssoda 회원가입</title>

<script>
    let msg = '${msg}';
    if(msg == "USER_WRITE_ERR") alert("잘못된 값을 입력하셨거나, 약관에 동의하지 않으셨습니다. 다시 회원가입 페이지로 이동합니다.");
    if(msg == 'USER_REGISTER_ERR') alert("회원가입에 실패했습니다. 다시 작성해주세요");
    if(msg == 'IllegalAccess') alert("잘못된 접근입니다. 회원가입 양식을 다시 작성해주세요");
</script>
<div class="main">
    <div class="contents">
        <h3 class="title">회원가입</h3>
        <form:form modelAttribute="userDto" action="/register/write" class="input-list" onsubmit="return formCheck()">
            <div class="msg"><form:errors path="email"/></div>
            <div class="msg"><form:errors path="pwd"/></div>
            <div class="msg"><form:errors path="pwdConfirm"/></div>
            <div class="msg"><form:errors path="name"/></div>
            <div class="msg"><form:errors path="tel"/></div>
            <div class="msg"><form:errors path="gender"/></div>
            <div class="msg"><form:errors path="birthday"/></div>
            <p class="row-title">이메일</p>
            <div class="email-wrap">
                <input type="email" class="input-email" name="email" placeholder="이메일 주소 입력">
                <button class="send-email-verf-btn" type="button">인증번호 전송</button>
                <p class="email-check check-text"></p>
                <input type="text" class="verf-num" placeholder="인증번호 입력">
                <button class="confirm-verf-num" type="button">인증번호 확인</button>
            </div>
            <p class="row-title">비밀번호</p>
            <div class="pwd-wrap">
                <input type="password" class="input-password" name="pwd" placeholder="비밀번호(8자~12자, 영문 문자+숫자+특수문자 사용)" maxlength="14">
                <p class="pwd-check check-text"></p>
                <input type="password" class="input-password pwd-confirm" name="pwdConfirm" placeholder="비밀번호 확인" maxlength="14">
                <p class="pwd-confirm-check check-text"></p>
            </div>
            <p class="row-title">이름</p>
            <div class="name-wrap">
                <input type="text" class="input-name" name="name" placeholder="이름(2~6자)" maxlength="6">
                <p class="name-check check-text"></p>
            </div>
            <p class="row-title">휴대폰 번호</p>
            <div class="tel-wrap">
                <input type="text" class="input-phone-number" name="tel" placeholder="휴대폰 번호 입력(- 없이 입력)" maxlength="11">
                <p class="tel-check check-text"></p>
            </div>
            <p class="row-title">성별</p>
            <div class="gender-wrap">
                <select name="gender" class="select-gender">
                    <option value="M">남자</option>
                    <option value="F">여자</option>
                </select>
            </div>
            <p class="row-title">생일</p>
            <div class="birthday-wrap">
                <input type="text" class="input-birth-year" name="year" placeholder="년(4자, 예시 : 1992)" maxlength="4">
                <select name="month" class="select-birth-month">
                    <option value="">월</option>
                    <c:forEach begin="1" end="12" step="1" varStatus="month">
                        <option value="${month.count}">${month.count}월</option>
                    </c:forEach>
                </select>
                <input type="text" class="input-birth-day" name="day" placeholder="일(예시 : 30)" maxlength="2">
                <p class="birthday-check check-text"></p>
                <input type="hidden" name="birthday" class="birthday">
            </div>
            <p class="row-title">이용약관</p>
            <div class="terms-wrap">
                <li class="terms-list">
                    <p class="terms-title"><label><input type="checkbox" class="terms-checkbox" name="firstTermsStatus" value="1"/>(필수) 서비스 이용약관 동의</label></p>
                    <a class="first-terms-link terms-link" target="_blank" href="<c:url value='/terms/service'/>">약관보기</a>
                </li>
                <li class="terms-list">
                    <p class="terms-title"><label><input type="checkbox" class="terms-checkbox" name="secondTermsStatus" value="1"/>(필수) 개인정보처리방침 동의</label></p>
                    <a class="second-terms-link terms-link" target="_blank" href="<c:url value='/terms/privacy'/>">약관보기</a>
                </li>
                <li class="terms-list">
                    <p class="terms-title"><label><input type="checkbox" class="terms-checkbox" name="thirdTermsStatus" value="1"/>(선택) 마케팅 정보 활용 동의</label></p>
                    <a class="third-terms-link terms-link" target="_blank" href="<c:url value='/terms/marketing'/>">약관보기</a>
                </li>
            </div>
            <button type="submit" class="register-btn">회원가입</button>
        </form:form>

    </div>
</div>

<script>
    //모든 공백 체크 정규식
    let empJ = /\s/g;
    // 비밀번호 양식 검증 (8~12자리 문자,숫자,특수문자 혼합)
    let pwdJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,12}$/;
    // 이름 정규식
    let nameJ = /^[가-힣]{2,6}$/;
    // 휴대폰 번호 정규식
    let telJ = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;
    // 이메일 정규식
    let emailJ = /^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$/;

    // 유효성 검사 결과를 저장할 변수 선언
    let pwdResult = false;
    let nameResult = false;
    let telResult = false;
    let birthResult = false;
    let emailResult = false;
    let pwdConfirmResult = false;
    // 이메일 인증번호 전송 버튼을 눌렀는지 안 눌렀는지 체크하는 변수 선언
    let emailSendCheck = false;
    // 이메일 인증 여부를 저장할 변수 선언
    let emailVerfResult = false;

    // form 전송여부를 정하는 onsubmit 함수
    function formCheck() {
        let firstTermsStatus = $('input[name=firstTermsStatus]').is(':checked');
        let secondTermsStatus = $('input[name=secondTermsStatus]').is(':checked');
        if(!firstTermsStatus || !secondTermsStatus) {
            alert("필수 약관에 동의해주세요");
            return false;
        }

        if(telResult && pwdResult && nameResult && birthResult && emailVerfResult && pwdConfirmResult) {
            return true;
        } else if(!emailVerfResult) {
            alert("이메일 인증을 완료해야 합니다");
            return false;
        } else if(!pwdResult) {
            $('input[name=pwd]').focus();
            $('.pwd-check').text('올바른 비밀번호를 입력해주세요');
            $('.pwd-check').css('color', 'red');
            return false;
        } else if(!pwdConfirmResult) {
            $('input[name=pwdConfirm]').focus();
            $('.pwd-confirm-check').text('올바른 비밀번호를 입력해주세요');
            $('.pwd-confirm-check').css('color', 'red');
            return false;
        } else if(!nameResult) {
            $('input[name=name]').focus();
            $('.name-check').text('정확한 이름을 입력해주세요');
            $('.name-check').css('color', 'red');
            return false;
        } else if(!telResult) {
            $('input[name=tel]').focus();
            $('.tel-check').text('올바른 휴대폰번호를 입력해주세요');
            $('.tel-check').css('color', 'red');
            return false;
        } else if(!birthResult) {
            $('.birthday-check').text('올바른 생년월일을 입력해주세요');
            $('.birthday-check').css('color', 'red');
            return false;
        }
    }

    function birthCheck() {

        let today = new Date();
        let year = today.getFullYear(); // 년도
        let month = today.getMonth() + 1;  // 월
        let date = today.getDate();  // 날짜
        let day = today.getDay();  // 요일

        let birthYear = $("input[name=year]").val();
        let birthMonth = $("select[name=month]").val();
        let birthDay = $("input[name=day]").val();

        if(birthYear < 1900 || birthYear > year || '') {
            $('.birthday-check').text('올바른 생년을 입력해주세요.');
            $('.birthday-check').css('color', 'red');
        } else if(birthMonth == '') {
            $('.birthday-check').text('태어난 월을 선택해주세요');
            $('.birthday-check').css('color', 'red');
        } else if(birthDay == '') {
            $('.birthday-check').text('태어난 날짜를 입력해주세요');
            $('.birthday-check').css('color', 'red');
        } else if(birthDay != '') {
            if(birthMonth == 1 || birthMonth == 3 || birthMonth == 5 || birthMonth == 7 || birthMonth == 8 || birthMonth == 10 || birthMonth == 12) {
                if(birthDay < 1 || birthDay > 31) {
                    $('.birthday-check').text('올바른 생년월일을 입력해주세요');
                    $('.birthday-check').css('color', 'red');
                } else {
                    $('.birthday-check').text('OK');
                    $('.birthday-check').css('color', 'blue');
                    birthResult = true;
                }
            } else if (birthMonth == 4 || birthMonth == 6 || birthMonth == 9 || birthMonth == 11) {
                if(birthDay < 1 || birthDay > 30) {
                    $('.birthday-check').text('올바른 생년월일을 입력해주세요');
                    $('.birthday-check').css('color', 'red');
                } else {
                    $('.birthday-check').text('OK');
                    $('.birthday-check').css('color', 'blue');
                    birthResult = true;
                }
            } else if (birthMonth == 2) {
                if((parseInt(birthYear%4) != 0) && (birthDay < 1 || birthDay > 28)) {
                    $('.birthday-check').text('올바른 생년월일을 입력해주세요');
                    $('.birthday-check').css('color', 'red');
                } else if((parseInt(birthYear%4) == 0) && (birthDay < 1 || birthDay > 29)) {
                    $('.birthday-check').text('올바른 생년월일을 입력해주세요');
                    $('.birthday-check').css('color', 'red');
                } else {
                    $('.birthday-check').text('OK');
                    $('.birthday-check').css('color', 'blue');
                    birthResult = true;
                }
            } else {
                $('.birthday-check').text('OK');
                $('.birthday-check').css('color', 'blue');
                birthResult = true;
            }
        } else {
            $('.birthday-check').text('');
            $('.birthday-check').css('color', 'blue');
            birthResult = true;
        }
    }

    // 인증번호 전송 버튼을 클릭했을 때
    $('.send-email-verf-btn').on("click", function() {

        let email = $(".input-email").val();
        if(email=="" || email==null) {
            alert("이메일을 입력해주세요");
            return;
        }
        if(!emailResult) {
            alert("올바른 이메일을 입력해주세요")
            return;
        }

       $.ajax({
            type:"POST",
            url:"/register/emailCheck",
            data: {email:email},
            cache : false,
            success :function(result){
                if(result == "Email has been sent") {
                    alert("인증번호 전송이 완료되었습니다.");
                    emailSendCheck = true;
                } else if (result == "Email already exists") {
                    alert("이미 가입된 이메일입니다.");
                } else {
                    alert("이메일 전송에 오류가 발생했습니다. 잠시 후 다시 시도해주세요.")
                }

            },
            error: function() {
                alert("오류가 발생하여 인증번호 전송에 실패했습니다.");
            }
        });
        alert("인증번호 전송을 시작합니다.");
    });
    // 인증번호 확인 버튼을 클릭했을 때
    $('.confirm-verf-num').on("click", function() {
        let inputCode = ($('.verf-num').val()).trim();
        let email = $(".input-email").val();

        if(!emailSendCheck) {
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

    // 이메일 유효성 검사
    $("input[name=email]").keyup(function () {
        emailResult = emailJ.test($('input[name=email]').val());

        // 이메일 형식에 맞지 않으면 메세지 표시
        if(!emailResult) {
            $('.email-check').text('올바른 이메일을 입력해주세요.');
            $('.email-check').css('color', 'red');
        } else {
            $('.email-check').text('');
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
            $('.pwd-confirm-check').text('OK');
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

    // 이름 유효성 검사
    $("input[name=name]").keyup(function() {
        // 비밀번호 유효성 검사결과를 변수에 저장
        nameResult = nameJ.test($('input[name=name]').val());

        if (nameResult) {
            $('.name-check').text('OK');
            $('.name-check').css('color', 'blue');
        } else {
            $('.name-check').text('2~6자리의 한글 이름을 입력하세요.');
            $('.name-check').css('color', 'red');
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

    // 생일 유효성 검사
    $("input[name=day]").keyup(birthCheck);
    $("input[name=year]").keyup(birthCheck);
    $("select[name=month]").change(birthCheck);


    // 회원가입 버튼 눌렀을 때 생일을 종합하여 input 태그에 저장
    $(".register-btn").click(function (){
        let year = $(".input-birth-year").val();
        let month = $(".select-birth-month").val();
        let day = $(".input-birth-day").val();
        let birthday = year + "-" + month + "-" + day;

        // let email = $(".input-email").val();

        $(".birthday").val(birthday);

        // // 인증상태를 확인하는 Ajax
        // $.ajax({
        //     type:"POST",
        //     url:"/register/confirmVerfStatus",
        //     data: {email:email},
        //     async : false,
        //     cache : false,
        //     success :function(result){
        //         emailVerfResult = result;
        //     },
        //     error: function() {
        //         alert("이메일 인증을 완료해야 합니다");
        //         return false;
        //     }
        // });
    });
        // let form = $(".input-list");
        // form.attr("action", "/register/write?birthday=" + birthday);
        // form.attr("method", "post");
        // form.submit();

</script>