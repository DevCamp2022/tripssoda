<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/admin/side.css" />


<div class="side-wrap">
<%--    <div class="side-container-board">--%>
    <label for="all">게시판 통합 관리</label>
    <ul class="side-container">
            <li id="all"><a href="/admin/boardList?">통합</a></li><span>|</span>
            <li id="noticeBtn"><a href="/admin/boardList?menuCode=M001" data-menu-code="M001">공지사항</a></li><span>|</span>
            <li id="promoBtn"><a href="/admin/boardList?menuCode=M002">프로모션</a></li><span>|</span>
            <li id="faqBtn"><a href="/admin/boardList?menuCode=M003">FAQ</a></li><span>|</span>
            <li id="qBtn"><a href="/admin/inquiry?menuCode=M004">1:1 문의</a></li>
        </ul>
<%--    </div>--%>

<%--    <div class="side-container-stats">--%>
    <label for="user">사용자 관리·통계</label>

    <ul class="side-container">
            <li id="user"><a href="/admin/userList">회원관리</a></li><span>|</span>
            <li id="partner"><a href="/admin/partnerList">파트너관리</a></li><span>|</span>
            <li id="product"><a href="/admin/productList">상품관리</a></li><span>|</span>
            <li id="mail"><a href="/admin/email/sender">메일전송<span></span></a></li>
        </ul>
<%--    </div>--%>
</div>

