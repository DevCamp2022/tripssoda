<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>tripssoda 회원가입</title>
<link rel="stylesheet" href="<c:url value="/css/user/selectInterest.css"/>">

<div class="main">
    <form class="contents" action="<c:url value='/register/submit'/>" method="post">
        <h2 class="title">여행 관심사를 선택해 주세요.</h2>
        <p class="sub-title">(대표 관심사를 포함한 선호 관심사 3개)</p>
        <div class="interest-list">
            <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                <div class="interest">
                    <h3 class="keyword"># ${tourInterestCodeDto.tourIntrKeyword}</h3>
                    <p>${tourInterestCodeDto.tourIntrDescription}</p>
                </div>
            </c:forEach>
        </div>
        <div class="select-box">
            <select name="firstInterest" class="interest-rank">
                <option value="">1순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
            <select name="secondInterest" class="interest-rank">
                <option value="">2순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
            <select name="thirdInterest" class="interest-rank">
                <option value="">3순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
        </div>
        <div class="button-wrap">
            <button class="prev-btn" type="button">이전으로</button>
            <button class="register-btn">완료</button>
        </div>
    </form>
</div>


