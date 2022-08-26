<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="/css/product/update_product.css" rel='stylesheet' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<div class="content">
  <br>
  <h4><strong>상품수정</strong><span style="font-size:0.6em;">(<span class="man-star">*</span>표시를 포함한 내용은 필수입력 항목입니다.)</span></h4>
  <hr>
  <form action="<c:url value='/product/update'/>" method="POST" enctype="multipart/form-data">
  <!--나중에 hidden으로 바꿀것-->
  <input type="hidden" name="productId" value="${dto.productId}" readonly>
  <input type="hidden" name="userId" value="${sessionScope.userId}">
  <input type="hidden" name="partnerId" value="${sessionScope.partnerId}">
  <table class="table reg-product">
    <!-- 상품 -->
    <tr>
      <th width="150px"><span class="man-star">*</span>상품제목</th>
      <td>
        <input type="text" name="title" id="title" value="${dto.title}"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품 카테고리 선택</th>
      <td>
        <input type="hidden" id="category" value="${dto.category}">
        <select name="category" id="sel-category">
          <option>카테고리를 선택해주세요</option>
          <option class="C001" value="C001">에디터 픽</option>
          <option class="C002" value="C002">프라이빗 투어</option>
          <option class="C003" value="C003">소규모 데이투어</option>
          <option class="C004" value="C004">버스데이투어</option>
          <option class="C005" value="C005">이색투어</option>
        </select>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>대표썸네일</th>
      <td class="td-thumbnail">
        <input type="file" name="uploadThumb" id="uploadThumb" value="${dto.thumbnail}"/>
        <div class="div-thumbnail">
          <img src="${pageContext.request.contextPath}/image/thumbnail/${dto.thumbnail}">
        </div>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>검색키워드</th>
      <td class="word-list">
        <input type="hidden" id="get-keyword" value="${dto.keyword}">
        <input type="text" class="gen-key" 
        placeholder="키워드 입력 후 엔터를 눌러주세요."
        onkeypress="if(event.keyCode=='13'){event.preventDefault(); handleKeyword();}"><br>
      </td>
    </tr>
    <!-- <tr>
      <th><span class="man-star">*</span>환급금</th>
      <td>
        <input type="text" name="refundAmount" id="refundAmount" value="${dto.refundAmount}"/>
      </td>
    </tr> -->
    <tr>
      <th><span class="man-star">*</span>모집 최소인원(명)</th>
      <td>
        <input type="number" name="minMember" id="minMember" value="${dto.minMember}"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>모집 최대인원(명)</th>
      <td>
        <input type="number" name="maxMember" id="maxMember" value="${dto.maxMember}"/>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>상품소개</th>
      <td>
        <textarea rows="30" id="prdIntro" name="prdIntro">${dto.prdIntro}</textarea>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>코스소개(시간별)</th>
      <td>
        <textarea id="courseIntro" name="courseIntro">${dto.courseIntro}</textarea>
      </td>
    </tr>
    
    <tr>
      <th>픽업정보</th>
      <td>
        <table class="table table-pickupInfo">
          <tr>
            <th>
              <input type="hidden" id="get-pickupType" value="${dto.pickupType}">
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
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
              <input type="hidden" id="get-pickupOption" value="${dto.pickupOption}">
              <input type="text" name="pickupOption" id="firstpo">&nbsp;
              <button type="button" class="btn btn-outline-info pickOption-addBtn">픽업옵션추가</button>
            </td>
          </tr>
          
        </table>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>만나는 장소 / 픽업장소</th>
      <td>
        <textarea name="meetingPoint" id="meetingPoint">${dto.meetingPoint}</textarea>
      </td>
    </tr>
    <tr>
      <th>포함사항</th>
      <td class="td-inclusion">
        <input type="hidden" id="get-inc" value="${dto.inclusion}">
        <input type="text" name="inclusion" id="inclusion"/>
        <button class="btn btn-outline-info" type="button" id="add-inclusion">추가</button><br>
      </td>
    </tr>
    <tr>
      <th>미포함사항</th>
      <td class="td-exclusion">
        <input type="hidden" id="get-exc" value="${dto.exclusion}">
        <input type="text" name="exclusion" id="exclusion"/>
        <button class="btn btn-outline-info" type="button" id="add-exclusion">추가</button><br>
      </td>
    </tr>
    <tr>
      <th>추가정보</th>
      <td class="td-additionalInfo">
        <input type="hidden" id="get-addin" value="${dto.additionalInfo}">
        <input type="text" name="additionalInfo" id="additionalInfo"/>
        <button class="btn btn-outline-info" type="button" id="add-additionalInfo">추가</button><br>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>필수안내</th>
      <td class="td-manGuide">
        <input type="hidden" id="get-manguid" value="${dto.mandatoryGuidance}">
        <input type="text" name="mandatoryGuidance" id="mandatoryGuidance"/>
        <button class="btn btn-outline-info" type="button" id="add-manGuide">추가</button><br>
      </td>
    </tr>
    <tr>
      <th><span class="man-star">*</span>환불정책</th>
      <td class="td-refund">
        <input type="hidden" id="get-rfp" value="${dto.refundPolicy}">
        <input type="text" name="refundPolicy" id="refundPolicy"/>
        <button class="btn btn-outline-info" type="button" id="add-refund">추가</button><br>
      </td>
    </tr>
    <!-- 상품옵션 -->
    <tr>
      <th>상품옵션</th>
      <td class="product-option">
        <button class="btn btn-outline-primary add-option-btn" type="button">상품옵션 추가</button>
        <input type="hidden" id="get-optionSize" value="${fn:length(poList)}">
        <input type="hidden" id="get-scheduleSize" value="${fn:length(psList)}">

        <c:forEach var="list" items="${poList}" varStatus="status">
          <input type="hidden" name="regProductOptionListDto[${status.index}].productOptionId" value="${list.optionId}" readonly>
          <input type="hidden" class="get-optionType-${status.index}" value="${list.type}">
          <input class="input-option-s-name_${status.index}" type="hidden" value="${list.name}" readonly>
          <input type="hidden" value="${list.content}" class="get-option-content-${status.index}" readonly>
          <input type="hidden" value="${list.optionPrice}" class="get-option-price-${status.index}" readonly>
          <input type="hidden" value="${list.orderNo}" class="get-option-orderNo-${status.index}" readonly>
        </c:forEach>
        <c:forEach var="list" items="${psList}" varStatus="status">
          <input type="hidden" name="regProductScheduleListDto[${status.index}].productScheduleId" value="${list.scheduleId}" readonly>
        </c:forEach>
        
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
              <input type="date" id="startDate">
            </td>
            <td class="td-schedule">
              <input type="date" id="endDate">
              <input type="hidden" name="dayCnt" id="dayCnt">
            </td>
          </tr>
        </table>
        <table class="table table-schedule">
          <tr>
            <th>번호</th>
            <th>시작여행일</th>
            <th>가격</th>
            <th>모집 최소인원</th>
            <th>모집 최대인원</th>
            <th>일정 삭제</th>
          </tr>

          <c:forEach var="list" items="${psList}" varStatus="status">
            <tr class='tr-schedule'>
              <td>${status.count}</td>
              <td>
                ${list.startDate}
                
                <input type="hidden" 
                name="regProductScheduleListDto[${status.index}].scheduleStartDate" 
                <c:if test="${status.first}">id="get-firstDate"</c:if>
                <c:if test="${status.last}">id="get-lastDate"</c:if>
                value="${list.startDate}" readonly>
              </td>
              <td>
                <input type="text" class='schedulePrice_${status.index}' name='regProductScheduleListDto[${status.index}].schedulePrice' value="${list.price}">
              </td>
              <td>
                <input type='text' class='scheduleMinMember_${status.index}' name='regProductScheduleListDto[${status.index}].scheduleMinMember' value="${list.scheduleMinMember}">
              </td>
              <td>
                <input type='text' class='scheduleMaxMember_${status.index}' name='regProductScheduleListDto[${status.index}].scheduleMaxMember' value="${list.scheduleMaxMember}">
              </td>
              <td>
                <button class='btn btn-outline-danger schedule-delBtn'>삭제</button>
              </td>
            </tr>
          </c:forEach>
        </table>
      </td>
    </tr>
    <tr>
      <th></th>
      <td class="td-submit">
        <button class="btn btn-outline-success submitBtn" type="submit">제출</button>
      </td>
    </tr>
  </table>
  
  </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/product/update_product.js"></script>