<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" type="text/css" href="/css/payment/payment.css">

<div class="content">
    <div class="reservation-wrap">
        <form id="frm">
            <div class="reservation-info">
                <div class="necessary"><h1>입력사항<b>(필수)</b></h1></div>
                <div class="payment-title">예약자 정보<p>틀린 정보는 없나요? 꼼꼼하게 확인해주세요 👀</p></div>
                <div class="row row-name">
                    <input name="reserverName" class="reserver-name inp"/>
                    <select name="reserverGender" class="reserver-gender sel">
                        <option value="M">남</option>
                        <option value="F">여</option>
                    </select>
                </div>
                <div class="row row-birthday">
                    <input name="reserverBirthYear" class="reserver-birth-year inp"/>
                    <input name="reserverBirthMonth" class="reserver-birth-month inp"/>
                    <select name="reserverBirthDate" class="reserver-birth-date sel">
                    </select>
                </div>
                <div class="row row-tel">
                    <select name="reserverCntryCode" class="reserver-ctry-code sel">
                        <option value="+82">+82 대한민국</option>
                        <option value="+61">+61 호주</option>
                        <option value="+1">+1 미국/캐나다</option>
                        <option value="+65">+65 싱가포르</option>
                    </select>
                    <input name="reserverTel" class="reserver-tel inp"/>
                </div>
                <div class="row row-email">
                    <input name="reserverEmail" class="reserver-email inp"/>
                </div>
                <div class="pickup-info"></div>
                <div class="option-info"></div>

            </div>

            <div class='reservation-detail'>
                <div class="detail-header">
                    <img class="thumbnail" src="/image/sample/sample_img.png"/>
                    <strong name="title" class="title">상품제목</strong>
                    <input name="productTitle" type="hidden"/>
                    <input name="productId" class="product-id" readonly type="hidden"/>

                </div>
                <div class="detail-info-wrap">
                    <ul class="detail-info">
                        <li class="product-start-date">
                            <em class="detail-info-tit">날짜</em><span class="date">2000.01.01.</span>
                            <input name="scheduleId" class="schedule-id" readonly type="hidden"/>
                        </li>
                        <li class="product-qty">
                            <em class="detail-info-tit">수량</em>
                            <div class="qty-wrap">
                                <button type="button" class="btn-amount-minus" data-btn='product'>-</button>
                                <input type="number" name="productQty" value="1">
                                <button type="button" class="btn-amount-plus" data-btn='product'>+</button>
                            </div>
                        </li>
                        <li class="product-amount"><em class="detail-info-tit">기본 가격</em>
                            <span class="product-amount">0</span>
                            <input name="productAmount" type="hidden" class="product-amount" value="0" readonly />
                        </li>
                        <li class="option-amount"><em class="detail-info-tit">옵션 가격</em>
                            <span class="option-amount">0</span>
                            <input name="optionAmount" type="hidden" class="option-amount" value="0" readonly/>
                        </li>
                        <li class="reserver-point"><em class="detail-info-tit">적립금 사용</em>
                            <div class="section-point">
                                <input type="number" class="inp" type="text" name="usedPoint" placeholder="적립금 사용금액 입력" >
                                <p><span class="reserver-point">0</span>원</p>
                            </div>
                        </li>
                        <li class="line-top"><p class="pay-method">결제 방식<b>(필수)</b></p></li>
                        <li>
                            <button class="simple-pay" type="button"><input type="radio" name="payMethod" value="html5_inicis">
                                <p>간편결제</p><img src="/images/common/icon/toss_logo.svg"></button>
                        </li>
                        <li>
                            <button class="simple-pay" type="button"><input type="radio" name="payMethod" value="kakaopay">
                                <p>카카오페이</p><img src="/images/common/icon/toss_logo.svg"></button>
                        </li>
                        <li class="total-amount"><em class="detail-info-tit">최종 가격</em>
                            <span class="total-amount">0</span>
                            <input type="hidden" name="totalAmount" type="" class="total-amount" value="0" readonly/>
                        </li>

                    </ul>
                    <button type="button" id="payBtn">결제하기</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/payment/payment.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/payment/importApi.js"></script>
