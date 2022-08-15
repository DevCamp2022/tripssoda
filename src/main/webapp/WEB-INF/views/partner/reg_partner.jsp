<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="content">
  <form action="/partner/reg" method="POST" onsubmit="return valid()">
  <!--나중에 hidden으로 바꿀것-->
  <input type="text" name="userId" value="${sessionScope.userId}">
  <table class="table-borderd">
    <tr>
      <th>사업자 등록번호</th>
      <td>
        <input type="text" name="regNumber" id="regNumber"/>
      </td>
    </tr>
    <tr>
      <th>회사명</th>
      <td>
        <input type="text" name="companyName" id="companyName"/>
      </td>
    </tr>
    <tr>
      <th>상폼소개</th>
      <td>
        <input type="text" name="intro" id="intro"/>
      </td>
    </tr>
    <tr>
      <th>상품 파일첨부</th>
      <td>
        <input type="file" name="introAttachment" id="introAttachment"/>
      </td>
    </tr>
    <tr>
      <th>서비스지역</th>
      <td>
        <input type="text" name="serviceRegion" id="serviceRegion"/>
      </td>
    </tr>
    <tr>
      <th>상품유형</th>
      <td>
        <input type="text" name="productType" id="productType"/>
      </td>
    </tr>
    <tr>
      <th>담당자 이름</th>
      <td>
        <input type="text" name="managerName" id="managerName" />
      </td>
    </tr>
    <tr>
      <th>담당자 연락처</th>
      <td>
        <input type="text" name="managerTel" id="managerTel"/>
      </td>
    </tr>
    <tr>
      <th>약관동의</th>
      <td>
        <input id="termsAgreement" type="checkbox" name="termsAgreement" value="0"/>
      </td>
    </tr>
  </table>
  <button type="submit">제출</button>
  </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/partner/reg_partner.js"></script>