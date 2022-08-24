<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>예약내역</title>
<link rel="stylesheet" href="<c:url value="/css/user/reservationList.css"/>">

<div class="main">
    <div class="contents">
        <h2 class="title">예약내역</h2>
        <h3 class="search-condition">조회 기간</h3>
        <div class="search-wrap">
            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18"> -
            <input type="date" class="search-date" value="2019-09-22" min="1992-04-08" max="2022-08-18">
            <button class="search-btn" type="button">조회</button>
        </div>
        <div class="reserv-info">
            <div class="reserv-id"><span>예약번호</span> 1</div>
            <div class="reserv-date"><span>예약 날짜</span> 2022-08-18</div>
            <div class="reserv-status">예약 완료</div>
        </div>
        <div class="product-info">
            <div class="img-wrap">
                <img src="" alt="상품 대표 사진">
            </div>
            <div class="info-wrap">
                <h2 class="product-title">[제주도 서쪽] 제주도 서쪽 투어</h2>
                <div class="start-date"><span>날짜</span>2022-08-18</div>
                <div class="quantity"><span>수량</span>1개</div>
                <div class="total-price"><span>가격</span>10000</div>
            </div>
            <button class="write-review-btn">여행후기 작성</button>
        </div>
    </div>
</div>

