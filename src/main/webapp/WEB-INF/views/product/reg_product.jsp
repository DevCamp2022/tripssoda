<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/product/reg_product.css" rel='stylesheet' />
<div class="content">
  <!-- <form action="/product/register" method="POST" onsubmit="return valid()"> -->
  <form action="/product/register" method="POST">
  <!--나중에 hidden으로 바꿀것-->
  <input type="text" name="partnerId" value="${sessionScope.partnerId}">
  <table class="table-borderd">
    <!-- 상품 -->
    <tr>
      <th><span class="man-star">*</span>상품제목</th>
      <td>
        <input type="text" name="title" id="title"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>대표썸네일</th>
      <td>
        <input type="file" name="thumbnail" id="thumbnail"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>여행소요시간(단위:시간)</th>
      <td>
        <input type="number" name="reqTime" id="reqTime"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>검색키워드</th>
      <td class="word-list">
        <input type="text" class="gen-key" 
        placeholder="키워드 입력 후 엔터를 눌러주세요."
        onkeypress="if(event.keyCode=='13'){event.preventDefault(); handleKeyword();}"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>환급금</th>
      <td>
        <input type="text" name="refundAmount" id="refundAmount"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>총 기간(단위:일)</th>
      <td>
        <input type="text" name="dayCnt" id="dayCnt"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>모집 최소인원</th>
      <td>
        <input type="number" name="minMember" id="minMember" />
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>모집 최대인원</th>
      <td>
        <input type="number" name="maxMember" id="maxMember"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품소개</th>
      <td>
        <textarea id="prdIntro" name="prdIntro"></textarea>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>코스소개(시간별)</th>
      <td>
        <textarea id="courseIntro" name="courseIntro"></textarea>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>만나는 장소</th>
      <td>
        <input type="text" name="meetingPoint" id="meetingPoint"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>필수안내</th>
      <td>
        <input type="text" name="mandatoryGuidance" id="mandatoryGuidance"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>환불정책</th>
      <td>
        <input type="text" name="refundPolicy" id="refundPolicy"/>
      </td>
    </tr>
    <tr>
      <th>포함사항</th>
      <td class="td-inclusion">
        <input type="text" name="inclusion" id="inclusion"/>
        <button type="button" id="add-inclusion">추가하기</button><br>
      </td>
    </tr>
    <tr>
      <th>미포함사항</th>
      <td class="td-exclusion">
        <input type="text" name="exclusion" id="exclusion"/>
        <button type="button" id="add-exclusion">추가하기</button><br>
      </td>
    </tr>
    <tr>
      <th>추가정보</th>
      <td class="td-additionalInfo">
        <input type="text" name="additionalInfo" id="additionalInfo"/>
        <button type="button" id="add-additionalInfo">추가하기</button><br>
      </td>
    </tr>
    <!-- 상품옵션 -->
    <tr>
      <th>상품옵션</th>
      <td class="product-option">
        <button type="button" id="add-product-option">상품옵션추가하기</button><br>
        <input type="radio" name="regProductDtoList[0].type" value="S" checked>선택형
        <input type="radio" name="regProductDtoList[0].type" value="A">단답형

        <!-- 선택형 checked -->
        <div class="type_sel_0">
          <table>
            <tr>
              <th>옵션명</th>
              <th>옵션 가격</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="regProductDtoList[0].name">
              </td>
              <td class="td-option-content_0">
                <div class="option-content_0" name="regProductDtoList[0].content">
                <input type="text" name="regProductDtoList[0].content">
                <input type="number" name="regProductDtoList[0].price">
                <input type="text" name="regProductDtoList[0].orderNo" value="0">
                <button type="button" class="add-option">옵션추가</button><br>
                </div>
              </td>
            </tr>
          </table>
        </div>

        <!-- 단답형 checked -->
        <div class="type_ans_0" id="type_ans1">
          <table>
            <tr>
              <th>옵션명</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="regProductDtoList[0].name">
                <input type="text" name="regProductDtoList[0].orderNo" value="0">
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
  </table>
  <b><span class="man-star">*</span>가 붙은 것은 필수입력 항목입니다.</b><br>
  <button type="submit">제출</button><br>
  </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/reg_product.js"></script>