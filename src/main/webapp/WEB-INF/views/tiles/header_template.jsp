<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' || loginId==null ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' || loginId==null ? '로그인' : '로그아웃'}"/>


<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Ropa+Sans">
<link rel="stylesheet" href="/css/main/normalize.css">
<link rel="stylesheet" href="/css/main/header.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

<div class="header">

	<header class="page-header" role="banner">

		<div class="inner">
			<h1 class="site-logo"><a href="/"><img src="/image/main/ssoda_logo.png" alt="logo"></a></h1>
			<nav class="primary-nav" role="navigation">

				<ul class="list">
					<li><a href="#sub_menu01" class="mainBtn">커뮤니티</a></li>
					<li><a href="#sub_menu02" class="mainBtn">여행상점</a></li>
					<li><a href="#sub_menu03" class="mainBtn">공지사항</a></li>

				</ul>

				<ul class="list_login">
					<li>
						<input type="text" id="searchBox" placeholder="검색어를 입력하세요!">
					</li>
					<li>
						<button type="button" id="searchMainBtn"><i class="fa fa-search" aria-hidden="true"></i></button>
					</li>
					<li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
					<c:if test="${loginId!=null}">
						<li><a href="<c:url value="/mypage/info"/>">마이페이지</a></li>
					</c:if>
					<c:if test="${loginId==null}">
						<li><a href="/register" class="">회원가입</a></li>
					</c:if>
					<c:if test="${sessionScope.userCode eq 'U003'}">
					<li><a href="/admin/home" class="">관리자</a></li>
					</c:if>
				</ul>
			</nav>
		</div>

		<div class="sub-nav-wrap" role="navigation">
			<section class="sub-nav-tap" id="sub_menu01" >
				<nav class="sub-nav-tap-menu" role="navigation">
					<ul>
						<li><a href="/#sub_menu01">홈</a></li>
						<li><a href="/accompany/list">동행</a></li>
						<li><a href="/question/list">Q&A</a></li>
					</ul>
				</nav>
			</section>

			<section class="sub-nav-tap" id="sub_menu02">
				<nav class="sub-nav-tap-menu" role="navigation">
					<ul>
						<li><a href="/product/list#sub_menu02">여행지 둘러보기</a></li>
						<li><a href="#">제주</a></li>
						<li><a href="#">프랑스</a></li>
						<li><a href="#">스페인</a></li>
						<li><a href="#">이탈리아</a></li>
						<li><a href="#">체코</a></li>
						<li><a href="#">오스트리아</a></li>
						<li><a href="#">터키</a></li>
					</ul>
				</nav>
			</section>

			<section class="sub-nav-tap" id="sub_menu03">
				<nav class="sub-nav-tap-menu" role="navigation">
					<ul>
						<li><a href="/board/list?menuCode=M001">공지사항</a></li>
						<li><a href="/board/list?menuCode=M002">프로모션</a></li>
						<li><a href="/board/list?menuCode=M003">FAQ</a></li>
					</ul>
				</nav>
			</section>
		</div>
	</header>

</div>



<script src="/script/main/vendor/modernizr.custom.min.js"></script>
<script src="/script/main/vendor/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/script/main/header.js"></script>


<%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>--%>
