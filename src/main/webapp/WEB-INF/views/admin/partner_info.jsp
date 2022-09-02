<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/css/admin/partner_common.css" rel='stylesheet' />
<link href="/css/admin/partner_info.css" rel='stylesheet' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<div class="content">
  <div class="partner_content">
    <title>파트너 정보</title>
    <input type="hidden" name="id" value="${PartnerDto.id}" readonly>
    <input type="hidden" value="${sessionScope.id}" readonly>


    <table clas="table-partner-info" style="margin-bottom: 100px;">
      <tr>
        <th colspan="2">
          <img src="${pageContext.request.contextPath}/image/partnerLogo/${PartnerDto.partnerLogo}" class="profile-img" alt="회사로고">
        </th>
      </tr>
      <tr>
        <th><span>사업자 번호</span></th>
        <td><span>${PartnerDto.regNumber}</span></td>
      </tr>
      <tr>
        <th><span>회사명</span></th>
        <td><span>${PartnerDto.companyName}</span></td>
      </tr>
      <tr>
        <th><span>회사소개</span></th>
        <td>${PartnerDto.intro}</td>
      </tr>
      <tr>
        <!-- <th><span>회사소개</span><br><span>첨부문서</span></th> -->
        <th><span>회사소개 첨부문서</span></th>
        <td>
          <a href="${pageContext.request.contextPath}/image/partnerLogo/${PartnerDto.partnerLogo}" download="apple">
            <input type="hidden" class="attachment" value="${PartnerDto.introAttachment}" readonly>
            <span class="down-name"></span>
            <span class="material-symbols-outlined dwl-img">
              file_download
              </span>
          </a> 
        </td>
      </tr>
      <tr>
        <th><span>서비스지역</span></th>
        <td><span>${PartnerDto.serviceRegion}</span></td>
      </tr>
      <tr>
        <th><span>상품유형</span></th>
        <td>
          <input type="hidden" id="productType" value="${PartnerDto.productType}" readonly>
          <div class="show-productType"></div>
        </td>
      </tr>
      <tr>
        <th><span>담당자 이름</span></th>
        <td><span>${PartnerDto.managerName}</span></td>
      </tr>
      <tr>
        <th><span>담당자 연락처</span></th>
        <td><span class="tel"><input type="hidden" value="${PartnerDto.managerTel}" class="managerTel" readonly></span></td>
      </tr>
      <tr>
        <th><span>상태</span></th>
        <td>
          <input type="hidden" id="onPartnership" value="${PartnerDto.onPartnership}" readonly>
          <div class="show-onPartnership">1111</div>
        </td>
      </tr>
      <tr>
        <th><span>파트너쉽 승인 처리</span></th>
        <td>
        <form id="approvalForm">
          <select id="approvalSelection" data-target="product">
            <option value="0">대기</option>
            <option value="1">승인</option>
            <option value="2">반려</option>
            <%--<option>취소</option>--%>
          </select>
          <input type="text" id="reason" style="display: none" placeholder="사유를 입력하세요."/>
          <button type="button" id="btnApprove" class="btn btn-primary">적용하기</button>

        </form>

        </td>
      </tr>
    </table>
  </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/partner/partner_info.js"></script>
<script>
  const URLSearch = new URLSearchParams(location.search);

  $("#approvalSelection").on("change", function (){
    if($(this).val()==2){
      $("#reason").css("display","");
    } else  {
      $("#reason").css("display","none");
    }
  })


  $("#btnApprove").click(function (){

    const reason = $("#reason").val();
    const approval = $("#approvalSelection").val();

    if (approval==="2" && reason===""){
      alert("사유를 작성하세요.")
      return;
    }


    $.ajax({
      url: "/admin/partner/approval",
      method: "GET",
      data: {partnerId: URLSearch.get("partnerId"), reason: reason, approval:approval},
      success: function (result) {
        console.log(result);
        if (result==="success"){
          alert("처리가 완료되었습니다.")
          window.location.href="/admin/partnerList";
        }
      },
      error: function (result) {
        alert(result);
      }
    });
  })
</script>