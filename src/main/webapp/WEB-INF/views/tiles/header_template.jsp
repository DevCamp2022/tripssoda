<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' || loginId==null ? '/login' : '/logout'}"/>
<c:set var="loginOut" value="${loginId=='' || loginId==null ? '로그인' : '로그아웃'}"/>


<link rel="stylesheet" href="/css/main/normalize.css">
<link rel="stylesheet" href="/css/main/header.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">



<style>
	/** {margin: 0;padding: 0;}*/
	li {list-style: none}
	a{text-decoration: none}

	header {
		font-size: 30px;
		width: 100%;
		height: 50px;
	}

	.container-menu {
		width: 1200px;
		height: 50px;
		margin: 0 auto;
		padding-top: 20px;
	}

	.menu-list {
		position: relative;
		padding-left: 30px;
		/*width: 1000px;*/
		width: 980px;
		overflow: hidden;
	}

	/*.menu-list>li {*/
	/*	float: left;*/
	/*	width:130px;*/
	/*	box-sizing: border-box;*/
	/*}*/

	.mmenu {
		float: left;
		width:130px;
		box-sizing: border-box;
	}

	.log{
		float:right;
	}

	.menu-list>li:hover{
		color: #00ce7c;
	}



	.menu-list>li>a {
		display: block;
		width: 100%;
		text-align: center;
		line-height: 3.4;
		font-size: 17px;
	}

	.menu-list .log{
		width:120px;
	}



	.sub {
		width: 800px;
		margin: 0 auto;
		/*top: 50px;*/
		z-index: 1;
		display: none;
		overflow: hidden;
	}

	.sub .sub-li {
		box-sizing: border-box;
		float: left;
		height: 50px;
		color: black;
		padding-right: 50px;
		font-size: 15px;
	}
	.sub .sub-li:first-child{
		padding-left: 30px;
	}
	.sub .sub-li:last-child{
		padding-right: 0px;
	}
	.sub .sub-li:hover {
		color: #00ce7c;
	}
	.sub .sub-li>a {
		/*display: inline-block;*/
		width: 100%;
		text-align: center;
		line-height: 3.4;
		font-size: 15px;
		font-weight: 500;
	}
	.searchLi{
		display: flex;
		justify-content: center;
		margin: 10px 60px 0 80px;
	}
</style>



<div class="header">


	<header class="page-header" role="banner">

		<div class="inner">
			<h1 class="site-logo"><a href="/"><img src="/image/main/ssoda_logo.png" alt="logo"></a></h1>
			<div class="container-menu">
			<nav class="primary-nav" role="navigation">
				<ul class="menu-list">
					<li id="menu01" class="mmenu"><a href="/#sub_menu01" class="mainBtn">커뮤니티</a>
						<ul class="sub sub1">
							<li class="sub-li"><a href="/#sub_menu01">홈</a></li>
							<li class="sub-li"><a href="/accompany/list">동행</a></li>
							<li class="sub-li"><a href="/question/list">Q&A</a></li>
							<li class="sub-li"><a href="/board/list?menuCode=M001">공지사항</a></li>
							<li class="sub-li"><a href="/board/list?menuCode=M002">프로모션</a></li>
							<li class="sub-li"><a href="/board/list?menuCode=M003">FAQ</a></li>
						</ul>
					</li>

					<li id="menu02" class="mmenu"><a href="/product/list#sub_menu02" class="mainBtn">여행상점</a>
						<ul class="sub sub2">
							<li class="sub-li"><a href="/product/list#sub_menu02">여행지 둘러보기</a></li>
							<li class="sub-li"><a href="#">제주</a></li>
							<li class="sub-li"><a href="#">프랑스</a></li>
							<li class="sub-li"><a href="#">스페인</a></li>
							<li class="sub-li"><a href="#">이탈리아</a></li>
							<li class="sub-li"><a href="#">체코</a></li>
							<li class="sub-li"><a href="#">오스트리아</a></li>
							<li class="sub-li"><a href="#">터키</a></li>
						</ul>
					</li>


					<li class="searchLi log">
						<input type="text" id="searchBox" placeholder="검색어를 입력하세요!">
						<button type="button" id="searchMainBtn"><i class="fa fa-search" aria-hidden="true"></i></button>
					</li>

					<c:if test="${sessionScope.userCode eq 'U003'}">
						<li class="log"><a href="/admin/home" class="">관리자</a></li>
					</c:if>
					<c:if test="${sessionScope.userCode eq 'U002'}">
						<li class="log"><a href="/partner/info" class="">파트너</a></li>
					</c:if>


					<c:if test="${loginId!=null}">
						<li class="log"><a href="<c:url value="/mypage/info"/>">MY</a></li>
					</c:if>
					<c:if test="${loginId==null}">
						<li class="log"><a href="/register" class="">회원가입</a></li>
					</c:if>

					<li class="log"><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>

				</ul>

			</nav>
			</div>
			</div>
	</header>

</div>


<script src="/script/main/vendor/modernizr.custom.min.js"></script>
<script src="/script/main/vendor/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/script/main/header.js"></script>
<script>
$(".menu-list li").hover(function() {

$(this).children("ul").stop().slideToggle(0)
})
</script>