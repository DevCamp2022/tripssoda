<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/user/myPageSide.css" />


<div class="side-container">
    <div class="side-container-board">
        <ul>
            <li class="account-manage"><a href="<c:url value="/mypage/info"/>">계정 관리</a></li>
            <li class="point-manage"><a href="<c:url value="/mypage/pointHistory"/>">적립 내역</a></li>
            <li class="review-manage"><a href="<c:url value="/mypage/tourReviewList"/>">여행 후기</a></li>
            <li class="reservation-manage"><a href="<c:url value="/mypage/reservationList"/>">예약 내역</a></li>
            <li class="qna-manage"><a href="<c:url value="/mypage/qnaList"/>">내 Q&A</a></li>
            <li class="accompany-manage"><a href="<c:url value="/mypage/accompanyList"/>">내 동행게시글</a></li>
            <li class="inquire-manage"><a href="<c:url value="/mypage/inquiryList"/>">내 1:1문의</a></li>
            <li class="wishlist-manage"><a href="<c:url value="/mypage/wishList"/>">내 위시리스트</a></li>
        </ul>
    </div>
    <div class="side-container-stats">
        <ul>
            <li class="product-manage"><a href="">여행 상품 관리</a></li>
        </ul>
    </div>
</div>

