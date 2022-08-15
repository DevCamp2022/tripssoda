<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<link rel="stylesheet" href="/css/user/registerForm.css">
<title>tripssoda 회원가입</title>

<script>
    let msg = '${msg}';
    if(msg == "USER_WRITE_ERR") alert("잘못된 값을 입력하셨거나, 약관에 동의하지 않으셨습니다. 다시 회원가입 페이지로 이동합니다.");
    if(msg == 'USER_REGISTER_ERR') alert("회원가입에 실패했습니다. 다시 작성해주세요");
</script>
<div class="main">
    <div class="contents">
        <h3 class="title">회원가입</h3>
        <p class="form-title">입력사항</p>
        <form:form class="input-list" method="post">
            <p class="row-title">이메일</p>
            <div class="email-wrap">
                <input type="text" class="input-email" name="email" placeholder="이메일 주소 입력">
                <button class="send-email-verf-btn" type="button">인증번호 전송</button>
                <input type="text" class="verf-num" placeholder="인증번호 입력">
                <button class="confirm-verf-num" type="button">인증번호 확인</button>
            </div>
            <p class="row-title">비밀번호</p>
            <input type="password" class="input-password" name="pwd" placeholder="비밀번호(8자~12자, 영문 문자+숫자+특수문자 사용)">
            <input type="password" class="input-password" name="pwdConfirm" placeholder="비밀번호 확인">
            <p class="row-title">이름</p>
            <input type="text" class="input-name" name="name" placeholder="이름">
            <p class="row-title">휴대폰 번호</p>
            <input type="text" class="input-phone-number" name="tel" placeholder="휴대폰 번호 입력(- 없이)">
            <p class="row-title">성별</p>
            <select name="gender" class="select-gender">
                <option value="M">남자</option>
                <option value="F">여자</option>
            </select>
            <p class="row-title">생일</p>
            <input type="text" class="input-birth-year" name="year" placeholder="년(예시 : 1992)">
            <select name="month" class="select-birth-month">
                <option value="">월</option>
                <c:forEach begin="1" end="12" step="1" varStatus="month">
                    <option value="${month.count}">${month.count}월</option>
                </c:forEach>
            </select>
            <select name="day" class="select-birth-day">
                <option value="">일</option>
                <c:forEach begin="1" end="31" step="1" varStatus="day">
                    <option value="${day.count}">${day.count}일</option>
                </c:forEach>
            </select>
            <p class="row-title">이용약관</p>
            <div class="terms-wrap">
                <li class="terms-list">
                    <input type="checkbox" class="terms-checkbox" name="firstTermsStatus" value="1"/><p class="terms-title">(필수) 서비스 이용약관 동의</p>
                    <a class="first-terms-link terms-link" target="_blank" href="<c:url value='/terms/service'/>">약관보기</a>
                </li>
                <li class="terms-list">
                    <input type="checkbox" class="terms-checkbox" name="secondTermsStatus" value="1"/><p class="terms-title">(필수) 개인정보처리방침 동의</p>
                    <a class="second-terms-link terms-link" target="_blank" href="<c:url value='/terms/privacy'/>">약관보기</a>
                </li>
                <li class="terms-list">
                    <input type="checkbox" class="terms-checkbox" name="thirdTermsStatus" value="1"/><p class="terms-title">(선택) 마케팅 정보 활용 동의</p>
                    <a class="third-terms-link terms-link" target="_blank" href="<c:url value='/terms/marketing'/>">약관보기</a>
                </li>
            </div>
            <button type="submit" class="register-btn">회원가입</button>
        </form:form>
    </div>
</div>