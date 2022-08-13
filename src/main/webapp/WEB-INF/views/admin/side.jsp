<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/admin/side.css" />


<%--<div class="side-container">--%>
<%--    <div class="side-container-board">--%>
<%--        <ul>--%>
<%--            <li><a href="/admin/boardList"/>전체관리</li>--%>
<%--            <li><a href="/admin/boardEachList"/>공지사항</li>--%>
<%--            <li><a href="/admin/boardEachList"/>프로모션</li>--%>
<%--            <li><a href="/admin/boardEachList"/>자주묻는질문</li>--%>
<%--            <li>1:1 문의</li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--    <div class="side-container-stats">--%>
<%--        <ul>--%>
<%--            <li>회원관리</li>--%>
<%--            <li>파트너관리</li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</div>--%>
<div class="side-container">
    <div class="side-container-board">
        <ul>
            <li id="all"><a href="/admin/boardList?">전체관리</a></li>
            <li id="noticeBtn"><a href="/admin/boardList?menuCode=M001" data-menu-code="M001">공지사항</a></li>
            <li id="promoBtn"><a href="/admin/boardList?menuCode=M002">프로모션</a></li>
            <li id="faqBtn"><a href="/admin/boardList?menuCode=M003">자주묻는질문</a></li>
            <li id="qBtn"><a href="/admin/inquiry?menuCode=M004">1:1 문의</a></li>
        </ul>
    </div>

    <div class="side-container-stats">
        <ul>
            <li>회원관리</li>
            <li>파트너관리</li>
        </ul>
    </div>
</div>

