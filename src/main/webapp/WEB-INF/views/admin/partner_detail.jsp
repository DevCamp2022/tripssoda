<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/admin/detail_product.css" rel='stylesheet' />
<div class="content">
  zzzzzzzzzzzzzzzzzzzzzzzzzzzz

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
    <tr>
      <button>승인</button>
      <button>거절</button>
    </tr>
  </table>

</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/detail_product.js"></script>
