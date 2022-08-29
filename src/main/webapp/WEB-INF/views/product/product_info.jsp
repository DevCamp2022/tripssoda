<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/partner/partner_common.css" rel='stylesheet' />
<link href="/css/product/product_info.css" rel='stylesheet' />
<div class="content">
  <div class="partner_content">
    <title>상품관리</title>
    <!-- <c:forEach var="pList" items="${pList}" varStatus="status">
      <div class="thumbnail-wrapper">
        <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${pList.thumbnail}" alt="thumbnail picture">
      </div>
      <div class="main-tourTitle">
        <h4>${pList.title}</h4>
      </div>
    </c:forEach> -->
    <span>총<span>${pListSize}</span>건의 상품이 등록되어있습니다.</span>
    <c:forEach var="pList" items="${pList}" varStatus="i">
      <table class="product-detail-list">
        <tr>
          <th>
            <!--썸네일자리-->
            <div class="img-thumbnail">
              <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${pList.thumbnail}" alt="thumbnail picture">
            </div>
          </th>
          <td rowspan="2" style="vertical-align: middle;padding: 10px;">
            <!--상품일정표 자리-->
            <table class="table-schedule">
              <tr>
                <td style="vertical-align: middle;padding: 15px 15px;border-bottom: 1px solid #e6e5e5;"><strong>출발일이 다른 동일투어</strong>&nbsp;<span>총&nbsp;<span>????</span>건</span></td>
              </tr>
              <tr>
                <td class="td-schedule">
                  <c:forEach var="psList" items="${psList}">
                    <div class="div-schedule">
                      <span>${psList.startDate}출발</span>
                      <span>${psList.currentMember}/${psList.maxMember}</span>
                      <span>${psList.price}</span>
                    </div>
                  </c:forEach>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr>
          <td>
            <!--타이틀자리-->
            <div class="div-title">
              <span>${pList.title}</span>
            </div>
          </td>
        </tr>
      </table><br>
    </c:forEach>
  </div>
</div>
<!-- <script type="text/javascript" src="${pageContext.request.contextPath}/script/partner/partner_info.js"></script> -->