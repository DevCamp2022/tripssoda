<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/product/reg_product.css" rel='stylesheet' />
<div class="content">
  <form action="<c:url value='/product/regSchedule'/>" method="POST">
    <input type="text" name="userId" value="${sessionScope.userId}">
    <input type="text" name="partnerId" value="${sessionScope.partnerId}">
    <button type="submit">제출</button>
  </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/reg_product.js"></script>