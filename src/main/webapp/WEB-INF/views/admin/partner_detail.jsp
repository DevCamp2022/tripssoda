<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/admin/detail_product.css" rel='stylesheet' />
<div class="content">
  <form id="approvalForm">
    <select id="approvalSelection" data-target="product">
      <option value="0">대기</option>
      <option value="1">승인</option>
      <option value="2">반려</option>
      <%--<option>취소</option>--%>
    </select>
    <input type="text" id="reason" style="display: none" placeholder="사유를 입력하세요."/>
  </form>
  <button type="button" id="btnApprove">적용하기</button>

  <table>
    <th>zz</th>
    <th>zz</th>
    <th>zz</th>
    <th>zz</th>
    <th>zz</th>
    <th>zz</th>
    <th>zz</th>
    <tr class="con-td">
      <td class="con" name="userId">${partnerDto.id}</td>
      <td class="con" name="userId">${partnerDto.userId}</td>
      <td class="con" name="companyName">${partnerDto.companyName}</td>
      <td class="con" name="serviceRegion">${partnerDto.serviceRegion}</td>
      <td class="con" name="productType" data-menu-code="${partner.productType}">${partnerDto.productType}</td>
      <td class="con" name="conclusionDate">${partnerDto.onPartnership==0? '심사대기' : '파트너'}</td>
    </tr>

  </table>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/detail_partner.js"></script>
