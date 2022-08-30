<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>예약 상세</title>
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
                    <a href="/product/detail?productId=${reservationDto.productId}&scheduleId=${reservationDto.productScheduleId}">${reservationDto.productTitle}</a>
                </p>
                <c:if test="${reservationDto.status == 0}">
                    <button class="canceled">예약 취소 완료</button>
                </c:if>
                <c:if test="${reservationDto.status == 1}">
                    <button class="cancel-btn">예약 취소하기</button>
                </c:if>
                <c:if test="${reservationDto.status == 2}">
                    <button class="waiting-cancel">취소 대기중</button>
                </c:if>
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
<input type="hidden" name="paymentId" value="${reservationDto.paymentId}">
<input type="hidden" name="reservId" value="${reservationDto.id}">
<input type="hidden" name="userId" value="${reservationDto.userId}">


<script>
    $(".cancel-btn").on("click", function () {
        if(!confirm("정말 예약취소 신청을 하시겠습니까?\n예약취소 신청은 다시 되돌릴 수 없습니다.")) {
            return;
        }
        let paymentId = $("input[name=paymentId]").val();
        let reservationId = $("input[name=reservId]").val();
        let userId = $("input[name=userId]").val();

        $.ajax({
            type: "post",
            url : '/mypage/reservationList/reservationDetail/cancelReservation',
            traditional: true,
            data : { paymentId:paymentId, reservationId:reservationId, userId:userId},
            success : function(data){
                if(data=="success"){
                    location.href = location.href;
                    alert("예약취소를 신청하였습니다.");
                }else if(data=="fail"){
                    alert("예기치 않은 오류로 예약취소 신청에 실패했습니다. 나중에 다시 시도해주세요");
                }

            },
            error : function(){

            }
        })

    });
</script>



