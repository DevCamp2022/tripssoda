<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/product/list_product.css" rel='stylesheet' />
<div class="content">
  <!--카테고리 버튼-->
  <div class="div-category-button-wrap">
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/editor.svg"><br>
        <p>에디터 픽</p>
      </div>
      
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/private.svg">
        <p>프라이빗투어</p>
      </div>
      
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/small.svg">
        <p>소규모데이투어</p>
      </div>
      
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/bus.svg">
        <p>버스데이투어</p>
      </div>
      
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/theme.svg">
        <p>이색 투어</p>
      </div>
      
      <div class="div-category-button">
        <img src="https://tripsoda.com/images/common/icon/menu/store/deadline.svg">
        <p>마감임박투어</p>
      </div>
  </div>
  
  <!--에디터픽 list-->
  <div class="div-list-wrap">
    <!--이곳에 a태그 추가하여 상세로 넘어가도록 바인딩 할 것.-->
    <!-- <div class="prevBtn">PREV</div> -->
    <c:forEach var="list" items="${list0}" varStatus="statusNm">
        <div class="div-editor div-editor-${statusNm.count}">
          <a href="http://localhost:9100/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}">
            <!--썸네일-->
            <div class="thumbnail-wrapper">
              <!-- <img src="${list.thumbnail}" alt="thumbnail picture"> -->
              <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${list.thumbnail}" alt="thumbnail picture">
            </div>
            <!--상품정보(제목, 평점, 출발일, 가격)-->
            <div class="itemInfo-wrapper">
              <div class="main-tourTitle">
                <h4>${list.title}</h4>
              </div>
              <!--해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)-->
              <div class="main-tourDate">
                <fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" />
              </div>

              <div class="main-tourPrice">
                <b>
                  <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원
                </b>

              </div>
            </div>
          </a>
        </div>
    </c:forEach>
    <!-- <div class="nextBtn">NEXT</div> -->
  </div>

  <!--프라이빗 list-->
  <div class="div-list-wrap">
    <!--이곳에 a태그 추가하여 상세로 넘어가도록 바인딩 할 것.-->
    <!-- <div class="prevBtn">PREV</div> -->
    <c:forEach var="list" items="${list1}" varStatus="statusNm">
        <div class="div-editor div-editor-${statusNm.count}">
          <a href="http://localhost:9100/product/detail?productId=${list.productId}&scheduleId=${list.scheduleId}">
            <!--썸네일-->
            <div class="thumbnail-wrapper">
              <!-- <img src="${list.thumbnail}" alt="thumbnail picture"> -->
              <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${list.thumbnail}" alt="thumbnail picture">
            </div>
            <!--상품정보(제목, 평점, 출발일, 가격)-->
            <div class="itemInfo-wrapper">
              <div class="main-tourTitle">
                <h4>${list.title}</h4>
              </div>
              <!--해당상품의 상품일정에서 오늘로부터 가장 가까운 출발일/가격/최저가(해당상품일정중)-->
              <div class="main-tourDate">
                <fmt:formatDate value="${list.startDate}" pattern="yyyy년 MM월 dd일 출발" />
              </div>

              <div class="main-tourPrice">
                <b>
                  <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.price}" />원
                </b>

              </div>
            </div>
          </a>
        </div>
    </c:forEach>
    <!-- <div class="nextBtn">NEXT</div> -->
  </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/list_product.js"></script>
