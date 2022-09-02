<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/payment/success.css">

<div class="content">
    <div class="success-info-wrap">
        <h1 class="success-title"><strong>결제가 완료</strong >되었습니다.</h1>
        <div class="success-info">
            <div class="success-header">
                <img class="thumbnail" src="/image/sample/sample_img.png"/>
                <strong class="product-title">제목</strong>
            </div>
            <div class="success-detail">
                <ul class="detail-info">
                    <li class="product-start-date">
                        <em class="detail-info-tit">여행 날짜</em><span class="date">2000-01-01</span>
                    </li>
                    <li class="product-qty">
                        <em class="detail-info-tit">수량</em>
                            <span class="product-qty">0<span>개</span></span>
                    </li>
                    <li class="product-price"><em class="detail-info-tit">기본 가격</em>
                        <span class="product-price">0<span>원</span></span>
                    </li>
                    <li class="option-amount"><em class="detail-info-tit">옵션 가격</em>
                        <span class="option-amount">0<span>원</span></span>
                    </li>
                    <li class="used-point">
                        <em class="detail-info-tit">적립금 사용</em>
                            <span class="used-point">0<span>원</span></span>
                    </li>
                    <hr class='separator total-amount'>
                    <li class="total-amount">
                        <em class="detail-info-tit">최종 결제 금액</em>
                        <span class="total-amount">0<span>원</span></span>
                    </li>
                </ul>
            </div>
        </div>
        <div class="bottom-wrap">
            <button class="btn-home bottom-btn" onclick="location.href='/'">메인페이지 바로가기</button>
            <button class="btn-mypage bottom-btn" onclick="location.href='/mypage/reservationList'">내 예약 확인하기</button>
        </div>
    </div>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/payment/success.js"></script>
