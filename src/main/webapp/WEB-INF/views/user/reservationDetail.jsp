<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>계정 관리</title>
<link rel="stylesheet" href="<c:url value="/css/user/reservationDetail.css"/>">
    <script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<script>
    let msg = "${msg}";
    if(msg=="UPDATE_SUCCESS") alert("계정 정보가 수정되었습니다.");
    if(msg=="UPDATE_USERINTEREST_SUCCESS") alert("여행 관심사가 수정되었습니다.");
    if(msg=="UPDATE_USERINTEREST_FAILED") alert("여행 관심사 수정에 실패했습니다. 다시 시도해주세요");
    if(msg=="INVALID_INFO_VALUE") alert("계정 정보 수정에 실패했습니다. 올바른 값을 입력해주세요.");
</script>

<div class="main">
    <div class="contents">
        <h2 class="title">예약내역 상세</h2>
        <div class="reservation-wrap">
            <div class="product-wrap">
                <div class="img-wrap">
                    <img src="${pageContext.request.contextPath}/image/thumbnail/${reservationDto.thumbnail}" alt="상품 대표 이미지">
                </div>
                <p class="tour-title-wrap">
                    <a href="">${reservationDto.productTitle}</a>
                </p>
                <button class="cancel-btn">예약 취소</button>
            </div>
            <ul class="payment-wrap">
                <li class="start-date-wrap">
                    <span>날짜</span>
                    <span><fmt:formatDate value="${reservationDto.startDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></span>
                </li>
                <li class="qty-wrap">
                    <span>수량</span>
                    <span>${reservationDto.qty}개</span>
                </li>
                <li class="pay-date-wrap">
                    <span>결제일</span>
                    <span><fmt:formatDate value="${reservationDto.reservAt}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></span>
                </li>
                <li class="pay-method-wrap">
                    <span>결제수단</span>
                    <span>${reservationDto.method}</span>
                </li>
                <li class="normal-price-wrap">
                    <span>기본가격(단가 * 수량)</span>
                    <span><fmt:formatNumber value="${reservationDto.price * reservationDto.qty}"/>원</span>
                </li>
                <li class="used-point-wrap">
                    <span>사용 적립금</span>
                    <span><fmt:formatNumber value="${reservationDto.usedPoint}"/>원</span>
                </li>
                <li class="total-amount-wrap">
                    <span>최종 결제 금액</span>
                    <span><fmt:formatNumber value="${reservationDto.price * reservationDto.qty - reservationDto.usedPoint}"/>원</span>
                </li>
            </ul>
        </div>
    </div>
</div>

<script>
    // 수정 버튼을 눌렀을 때
    $(".update-btn").on("click", function() {
        // 회원정보 수정 페이지로 이동
        location.href="/mypage/info/update"
    });

    // 회원 탈퇴 버튼을 눌렀을 때
    $(".withdraw-btn").on("click", function () {
        if(!confirm("정말로 탈퇴 하시겠습니까?")) return;
        let form = $(".user-info");
        form.attr("action", "<c:url value='/mypage/delete'/>");
        form.attr("method", "post");
        form.submit();
    });

    // 여행관심사 테스트 다시보기 버튼을 눌렀을 때
    $(".update-interest-btn").on("click", function () {
        location.href="/mypage/info/updateInterest";
    })
</script>



