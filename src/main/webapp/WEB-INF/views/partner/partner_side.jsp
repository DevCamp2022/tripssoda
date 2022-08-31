<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/partner/partner_side.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div class="side-container">
    <div class="side-container-board">
        
        <ul>
            <div class="menu-header">
                <div class="user-img-wrap">
                    <img src="${pageContext.request.contextPath}/image/partnerLogo/${PartnerDto.partnerLogo}" class="profile-img" alt="프로필 이미지">
                </div><br>
                <p class="menu-nickname">${PartnerDto.companyName}</p>
            </div>
            <li id="all"><a href="/partner/info">파트너정보<span>></span></a></li>
            <li><a id="product-manage" href="/product/partner/list" onclick="preventClick(event)">상품관리<span>></span></a></li>
        </ul>
    </div>
</div>

<script>
    let onPartnership = ${PartnerDto.onPartnership};
    // $("#product-manage").on("click", function (e) {
    //     alert(onPartnership);
    //     if(onPartnership == 1) {
    //         alert("파트너쉽을 먼저 체결해야 합니다");
    //         e.preventDefault();
    //     }
    // });
    function preventClick(e) {
        if(onPartnership != 1) {
            alert("파트너쉽을 먼저 체결해야 합니다");
            e.preventDefault();
        }
    }
</script>

