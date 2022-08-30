<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <button type="button" class="btnReg" onclick="location.href='/product/register'">새로운 상품 등록하기</button><br><br>
    <span>총<span  style="font-weight:bolder;color:rgb(0, 206, 124);">&nbsp;${pListSize}</span>건의 상품이 등록되어있습니다.</span><br><br>
    <input type="hidden" class="pListSize" value="${pListSize}">
    <c:forEach var="entry" items="${map}" varStatus="i">
      <table class="product-detail-list">
        <tr>
          <th>
            <!--썸네일자리-->
            <div class="img-thumbnail">
              <img class="img-thumbnail" src="${pageContext.request.contextPath}/image/thumbnail/${entry.key.thumbnail}" alt="thumbnail picture">
            </div>
          </th>
          <td rowspan="2" style="vertical-align: middle;padding: 10px;">
            <!--상품일정표 자리-->
            <table class="table-schedule">
              <tr>
                <td style="vertical-align: middle;padding: 15px 15px;border-bottom: 1px solid #e6e5e5;">
                  <strong>출발일이 다른 동일투어</strong>&nbsp;<span>총&nbsp;<span style="color:rgb(0, 206, 124);">${fn:length(entry.value)}</span>건</span>
                  <!-- <div style="float:right;color:rgb(119, 119, 119);"><span class="prevBtn" style="cursor:pointer;">< </span><span style="font-size: 0.7em;">&nbsp;&nbsp;|&nbsp;&nbsp;</span><span class="nextBtn" style="cursor:pointer;"> ></span></div> -->
                </td>
              </tr>
              <tr>
                <td class="td-schedule">
                  <c:forEach var="dto" items="${entry.value}" varStatus="status" begin="0" end="5" step="1">
                    <div class="div-schedule schedule-wrap-${i.index}-${status.index}">
                      <span class="show-startDate"><fmt:formatDate value="${dto.startDate}" pattern="MM월 dd일 출발" /></span><br>
                      <input class="scheduleSize-${i.index}" type="hidden" value="${fn:length(entry.value)}">
                      <input class="currentMember-${i.index}-${status.index}" type="hidden" value="${dto.currentMember}" >
                      <input class="minMember-${status.index}" type="hidden" value="${dto.minMember}" >
                      <input class="maxMember-${status.index}" type="hidden" value="${dto.maxMember}" >
                      <input class="min-current-${status.index}" type="hidden" value="${dto.minMember - dto.currentMember}" >
                      <span class="show-currentMember-${i.index}-${status.index}" style="font-weight:bolder;color:rgb(0, 206, 124);">${dto.currentMember}</span>
                      <span style="color:rgb(119, 119, 119);">/ ${dto.maxMember}명</span>
                      <progress class="currentMember" value="${dto.currentMember}" min="${dto.minMember}" max="${dto.maxMember}"></progress>
                      <br><br>
                      <span class="show-min-current-${status.index}" style="font-weight:bolder;color:rgb(0, 206, 124);">
                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.price}" />
                      </span>원
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
              <span class="ellipsis">${entry.key.title}</span><br>
              <button type="button" class="btnAdd" onclick='location.href="/product/update?productId=${entry.key.productId}"'>수정하기</button>
            </div>
          </td>
        </tr>
      </table><br>
    </c:forEach>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/product_info.js"></script>