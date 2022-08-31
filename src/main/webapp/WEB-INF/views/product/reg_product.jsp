<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<title>상품등록</title>
<link href="/css/product/reg_product.css" rel='stylesheet' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="content">
  <br>
  <h4><strong>상품등록</strong><span>(<span class="man-star">*</span>표시를 포함한 내용은 필수입력 항목입니다.)</span></h4>
  <form action="<c:url value='/product/register'/>" method="POST" enctype="multipart/form-data" onsubmit="return (valid())">
  <!-- <form action="<c:url value='/product/register'/>" method="POST" enctype="multipart/form-data" > -->
  <input type="hidden" name="userId" value="${sessionScope.userId}" >
  <input type="hidden" name="partnerId" value="${sessionScope.partnerId}">
  <table class="table reg-product">
    <!-- 상품 -->
    <tr>
      <th width="150px"><span class="man-star">*</span>상품제목</th>
      <td>
        <input type="text" name="title" id="title" required="required">
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품 카테고리 선택</th>
      <td>
        <select name="category" id="sel-category">
          <option selected disabled hidden>카테고리를 선택해주세요</option>
          <!-- <option class="C001" value="C001">에디터 픽</option> -->
          <option class="C002" value="C002">프라이빗 투어</option>
          <option class="C003" value="C003">소규모 데이투어</option>
          <option class="C004" value="C004">버스데이투어</option>
          <option class="C005" value="C005">이색투어</option>
        </select>
      </td>
    </tr>
    <tr>
      <th width="150px"><span class="man-star">*</span>여행소요시간</th>
      <td>
        <input type="number" name="reqTime" id="reqTime" required="required">
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>대표썸네일</th>
      <td class="td-thumbnail">

        <div class="filebox">
          <input type='text' class="uploadThumb" placeholder="대표썸네일을 입력해 주세요" style='width:300px;' readonly>
          <label for="uploadThumb">파일찾기</label> 
          <input type="file" name="uploadThumb" id="uploadThumb" required="required">
        </div>


        <div class="div-thumbnail">
        </div>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>검색키워드</th>
      <td class="word-list">
        <input type="text" class="gen-key" 
        placeholder="키워드 입력 후 엔터를 눌러주세요."
        onkeypress="if(event.keyCode=='13'){event.preventDefault(); handleKeyword();}"><br>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>모집 최소인원(명)</th>
      <td>
        <input type="number" name="minMember" id="minMember" min="1" max="255" required="required">
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>모집 최대인원(명)</th>
      <td>
        <input type="number" name="maxMember" id="maxMember" min="1" max="255" required="required">
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품소개</th>
      <td>
        <textarea id="prdIntro" name="prdIntro" rows="30"></textarea>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>코스소개(시간별)</th>
      <td>
        <textarea id="courseIntro" name="courseIntro" rows="30"></textarea>
      </td>
    </tr>
    
    <tr>
      <th>픽업정보</th>
      <td>
        <table class="table table-pickupInfo">
          <tr>
            <th>
              <div class="btn-group">
                <input type="radio" class="btn-check pt-0" id="pickup-type-s" name="pickupType" value="S" autocomplete="off">
                <label class="btn btn-outline-warning" for="pickup-type-s">선택형</label>
                <input type="radio" class="btn-check pt-1" id="pickup-type-a" name="pickupType" value="A" autocomplete="off">
                <label class="btn btn-outline-warning" for="pickup-type-a">단답형</label>
                <input type="radio" class="btn-check pt-2" id="pickup-type-f" name="pickupType" value="F" autocomplete="off">
                <label class="btn btn-outline-warning" for="pickup-type-f">고정형</label>
              </div>
            </th>
          </tr>
          <tr class="tr-pickupOption">
            <td colspan="3">
              <input type="text" name="pickupOption" id="firstpo">&nbsp;<button type="button" class="btnAdd pickOption-addBtn">픽업옵션추가</button>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>만나는 장소 / 픽업장소</th>
      <td>
        <textarea name="meetingPoint" id="meetingPoint"></textarea>
      </td>
    </tr>
    <tr>
      <th>포함사항</th>
      <td class="td-inclusion">
        <input type="text" name="inclusion" id="inclusion" />
        <button class="btnAdd" type="button" id="add-inclusion">추가</button><br>
      </td>
    </tr>
    <tr>
      <th>미포함사항</th>
      <td class="td-exclusion">
        <input type="text" name="exclusion" id="exclusion"/>
        <button class="btnAdd" type="button" id="add-exclusion">추가</button><br>
      </td>
    </tr>
    <tr>
      <th>추가정보</th>
      <td class="td-additionalInfo">
        <input type="text" name="additionalInfo" id="additionalInfo"/>
        <button class="btnAdd" type="button" id="add-additionalInfo">추가</button><br>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>필수안내</th>
      <td class="td-manGuide">
        <input type="text" name="mandatoryGuidance" id="mandatoryGuidance" required="required">
        <button class="btnAdd" type="button" id="add-manGuide">추가</button><br>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>환불정책</th>
      <td class="td-refund">
        <input type="text" name="refundPolicy" id="refundPolicy" required="required">
        <button class="btnAdd" type="button" id="add-refund">추가</button><br>
      </td>
    </tr>
    <!-- 상품옵션 -->
    <tr>
      <th>상품옵션</th>
      <td class="product-option">
        <button class="btnAdd add-option-btn" type="button">상품옵션 추가</button>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품일정</th>
      <td class="td-schedule">
        <table class="table">
          <tr>
            <th>여행상품 시작일</th>
            <th>여행상품 종료일</th>
          </tr>
          <tr>
            <td>
              <input type="date" id="startDate" required="required">
            </td>
            <td class="td-schedule">
              <input type="date" id="endDate" required="required">
              <input type="hidden" name="dayCnt" id="dayCnt">
            </td>
          </tr>
        </table>
        <table class="table table-schedule">
          <tr>
            <th>번호</th>
            <th width="150px">시작여행일</th>
            <th>가격</th>
            <th>모집 최소인원</th>
            <th>모집 최대인원</th>
            <th>일정 삭제</th>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <th></th>
      <td class="td-submit">
        <button class="submitBtn" type="submit">제출</button>
      </td>
    </tr>
  </table>
  </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/reg_product.js"></script>