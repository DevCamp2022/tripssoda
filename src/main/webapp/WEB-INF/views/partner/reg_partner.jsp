<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<title>파트너 등록</title>
<link href="/css/partner/reg_partner.css" rel='stylesheet' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div class="content">
  <div class="partner_form">
  <form action="/partner/register" method="POST" enctype="multipart/form-data" onsubmit="return valid()">
  <!--나중에 hidden으로 바꿀것-->
  <input type="hidden" name="userId" value="${sessionScope.userId}">
  <h4><strong>파트너 등록신청</strong><span style="font-size:14px;">(<span class="man-star" style="font-size:18px">*</span>표시를 포함한 내용은 필수입력 항목입니다.)</span></h4><br>
  <table class="table-borderd">
    <tr>
      <th>사업자 등록번호</th>
      <td>
        <input type="text" name="regNumber" id="regNumber" placeholder="국내에서 사업자 등록을 하셨다면 입력해주세요.">
      </td>
    </tr>
    <tr>
      <th>회사명<span class="man-star">*</span></th>
      <td>
        <input type="text" name="companyName" id="companyName"  required="required">
      </td>
    </tr>
    <tr>
      <th>회사소개<span class="man-star">*</span></th>
      <td>
        <textarea type="text" name="intro" id="intro"></textarea>
      </td>
    </tr>
    <tr>
      <th>회사로고</th>
      <td>
        <div class="filebox">
          <input type='text' class="uploadLogo" placeholder="회사로고 이미지를 첨부해주세요." style='width:300px;' readonly>
          <label for="uploadLogo">파일찾기</label> 
          <input type="file" name="uploadLogo" id="uploadLogo" >
          <div class="pvUploadLogo"></div>
        </div>
      </td>
    </tr>
    <tr>
      <th>파일첨부</th>
      <td>
        <div class="filebox">
          <input type='text' class="uploadAttach" style='width:300px;' placeholder="회사를 소개할 문서가 있다면, 첨부해주세요." readonly>
          <label for="uploadAttach">파일찾기</label> 
          <input type="file" name="uploadAttach" id="uploadAttach" >
        </div>
      </td>
    </tr>
    <tr>
      <th>서비스지역</th>
      <td>
        <input type="text" name="serviceRegion" id="serviceRegion" placeholder="하나의 또는 여러 지역을 입력해주세요.">
      </td>
    </tr>
    <tr>
      <th>상품유형<span class="man-star">*</span></th>
      <td>
        <span class="category-info">당장 판매하지 않더라도 보유하신 상품군을 모두 선택해주세요.</span><br><br>
        <label><input type="checkbox" name="productType" id="productType" value="C002"><span class="sel-category"  required="required">&nbsp;프라이빗투어(택시상품 같은)</span></label>
        <label><input type="checkbox" name="productType" id="productType" value="C003"><span class="sel-category">&nbsp;소규모 데이투어</span></label><br>
        <label><input type="checkbox" name="productType" id="productType" value="C004"><span class="sel-category">&nbsp;버스데이투어</span></label>
        <label><input type="checkbox" name="productType" id="productType" value="C005"><span class="sel-category">&nbsp;이색투어</span></label>
      </td>
    </tr>
    <tr>
      <th>담당자 이름<span class="man-star">*</span></th>
      <td>
        <input type="text" name="managerName" id="managerName"  required="required">
      </td>
    </tr>
    <tr>
      <th>담당자 연락처<span class="man-star">*</span></th>
      <td>
        <input type="text" name="managerTel" id="managerTel" required="required">
      </td>
    </tr>
    <tr>
      <th>약관동의<span class="man-star">*</span></th>
      <td>
        <label><input id="termsAgreement" type="checkbox" 
        style="vertical-align:middle;"  required="required"
        name="termsAgreement" value="0"/>&nbsp;<span class="terms">파트너 약관동의</span></label><a href="/terms/service" ><span style="font-size:16px;color:rgb(0, 0, 152)">&nbsp;[약관보기]</span></a>
      </td>
    </tr>
    <tr style="border-bottom:1px solid white;text-align:center;">
      <td colspan="2">
        <button class="submitBtn" type="submit">제출</button>
      </td>
    </tr>
  </table>
  
  </form>
</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/partner/reg_partner.js"></script>