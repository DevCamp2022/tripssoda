<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>tripssoda 회원가입</title>
<link rel="stylesheet" href="<c:url value="/css/user/selectInterest.css"/>">

<div class="main">
    <form class="contents" action="<c:url value='/register/submit'/>" method="post" onsubmit="return formCheck()">
        <h2 class="title">여행 관심사를 선택해 주세요.</h2>
        <p class="sub-title">(대표 관심사를 포함한 선호 관심사 3개, 중복선택 불가)</p>
        <div class="interest-list">
            <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                <div class="interest">
                    <h3 class="keyword"># ${tourInterestCodeDto.tourIntrKeyword}</h3>
                    <p>${tourInterestCodeDto.tourIntrDescription}</p>
                </div>
            </c:forEach>
        </div>
        <div class="select-box">
            <select name="firstInterest" class="interest-rank first">
                <option value="">1순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option class="first-keyword" value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
            <select name="secondInterest" class="interest-rank second">
                <option value="">2순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option class="second-keyword" value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
            <select name="thirdInterest" class="interest-rank third">
                <option value="">3순위</option>
                <c:forEach var="tourInterestCodeDto" items="${tourInterestCodeDtoList}">
                    <option class="third-keyword" value="${tourInterestCodeDto.tourIntrCode}">${tourInterestCodeDto.tourIntrKeyword}</option>
                </c:forEach>
            </select>
        </div>
        <div class="button-wrap">
            <button class="register-btn">완료</button>
        </div>
    </form>
</div>
<script>

    function formCheck() {
        let firstInterest = $("select[name=firstInterest]").val();
        let secondInterest = $("select[name=secondInterest]").val();
        let thirdInterest = $("select[name=thirdInterest]").val();

        if (firstInterest == '' || secondInterest == '' || thirdInterest == '') {
            alert("관심사를 선택해주세요")
            return false;
        } else if (firstInterest == secondInterest || firstInterest == thirdInterest || secondInterest == thirdInterest) {
            alert("중복되는 관심사를 선택할 수 없습니다. 다시 선택해주세요");
            return false;
        }
    }

</script>

