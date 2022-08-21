<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/product/detail_product.css" rel='stylesheet' />
<div class="content">
  <div class="product-banner-wrap">11</div>
  <!-- <div class="detail-wrap"> -->
    <div class="right-area">
      <!-- banner생각해볼것 -->
      <p class="showCategory">${details.category}</p>
      <span class="showRating">평점 : ${details.rating}    |    ???명의 선택    |    (시계)${details.reqTime}시간 소요</span><br>
      <b class="detail-title">${details.title}</b>
      <input type="text" value="${details.keyword}" id="keywords">히든으로 바꿀예정

    </div>
    <div class="left-area">
      <div class="purple-circle"></div>
    </div>
  <!-- </div> -->
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/detail_product.js"></script>
