<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/partner/partner_side.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<div class="side-container">
    <div class="side-container-board">
        <div class="menu-header">
            <div class="user-img-wrap">
                <img src="${pageContext.request.contextPath}/image/partnerLogo/${PartnerDto.partnerLogo}" class="profile-img" alt="프로필 이미지">
            </div><br>
            <p class="menu-nickname">${PartnerDto.companyName}</p>
        </div>
        <ul>
            <li id="all"><a href="/partner/info">파트너정보<span>></span></a></li>
            <li><a href="/product/partner/list">상품관리<span>></span></a></li>
        </ul>
    </div>
</div>

