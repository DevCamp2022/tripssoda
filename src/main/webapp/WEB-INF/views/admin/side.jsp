<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/css/admin/side.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<%--<div class="side-wrap">--%>
<%--&lt;%&ndash;    <div class="side-container-board">&ndash;%&gt;--%>
<%--    <label for="all">게시판 통합 관리</label>--%>
<%--    <ul class="side-container">--%>
<%--            <li id="all"><a href="/admin/boardList?">통합</a></li><span>|</span>--%>
<%--            <li id="noticeBtn"><a href="/admin/boardList?menuCode=M001" data-menu-code="M001">공지사항</a></li><span>|</span>--%>
<%--            <li id="promoBtn"><a href="/admin/boardList?menuCode=M002">프로모션</a></li><span>|</span>--%>
<%--            <li id="faqBtn"><a href="/admin/boardList?menuCode=M003">FAQ</a></li><span>|</span>--%>
<%--            <li id="qBtn">  <a href="/admin/inquiry?menuCode=M004">1:1 문의</a></li>--%>
<%--        </ul>--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>

<%--&lt;%&ndash;    <div class="side-container-stats">&ndash;%&gt;--%>
<%--    <label for="user">사용자 관리·통계</label>--%>

<%--    <ul class="side-container">--%>
<%--            <li id="user"><a    href="/admin/userList">회원관리</a></li><span>|</span>--%>
<%--            <li id="partner"><a href="/admin/partnerList">파트너관리</a></li><span>|</span>--%>
<%--            <li id="product"><a href="/admin/productList">상품관리</a></li><span>|</span>--%>
<%--            <li id="mail"><a    href="/admin/email/sender">메일전송<span></span></a></li>--%>
<%--        </ul>--%>
<%--&lt;%&ndash;    </div>&ndash;%&gt;--%>
<%--</div>--%>
<div class="size-wrap">
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="/admin/home"><i class="menu-icon fa fa-laptop"></i>Dashboard </a>
                    </li>
                    <li class="menu-title">게시판</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/boardList?" > <i class="menu-icon fa fa-table"></i>통합게시판</a>
                        <%--<a href="/admin/boardList?" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-cogs"></i>Components</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">                            <li><i class="fa fa-puzzle-piece"></i><a href="ui-buttons.html">Buttons</a></li>
                            <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Badges</a></li>
                            <li><i class="fa fa-bars"></i><a href="ui-tabs.html">Tabs</a></li>

                            <li><i class="fa fa-id-card-o"></i><a href="ui-cards.html">Cards</a></li>
                            <li><i class="fa fa-exclamation-triangle"></i><a href="ui-alerts.html">Alerts</a></li>
                            <li><i class="fa fa-spinner"></i><a href="ui-progressbar.html">Progress Bars</a></li>
                            <li><i class="fa fa-fire"></i><a href="ui-modals.html">Modals</a></li>
                            <li><i class="fa fa-book"></i><a href="ui-switches.html">Switches</a></li>
                            <li><i class="fa fa-th"></i><a href="ui-grids.html">Grids</a></li>
                            <li><i class="fa fa-file-word-o"></i><a href="ui-typgraphy.html">Typography</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/boardList?menuCode=M001" data-menu-code="M001"> <i class="menu-icon fa fa-table"></i>공지사항</a>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Tables</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-basic.html">Basic Table</a></li>
                            <li><i class="fa fa-table"></i><a href="tables-data.html">Data Table</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/boardList?menuCode=M002" data-menu-code="M002"> <i class="menu-icon fa fa-table"></i>프로모션</a>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/boardList?menuCode=M003" data-menu-code="M003"> <i class="menu-icon fa fa-table"></i>FAQ</a>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="/admin/boardList?menuCode=M004" data-menu-code="M004"> <i class="menu-icon fa fa-table"></i>1:1 문의</a>
                        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Forms</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.html">Basic Form</a></li>
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-advanced.html">Advanced Form</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-title">사용자 관리·통계</li><!-- /.menu-title -->

                    <li class="menu-item-has-children ">
                        <a href="/admin/userList"><i class="menu-icon fa fa-user-o"></i>회원관리</a>
                        <%--<a href=""> <i class="menu-icon fa fa-tasks"></i>Icons</a>--%>
                        <%--<ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-fort-awesome"></i><a href="font-fontawesome.html">Font Awesome</a></li>
                            <li><i class="menu-icon ti-themify-logo"></i><a href="font-themify.html">Themefy Icons</a></li>
                        </ul>--%>
                    </li>
                    <li class="menu-item-has-children ">
                        <a href="/admin/partnerList"><i class="menu-icon fa fa-users"></i>파트너관리</a>
                    </li>
                    <li class="menu-item-has-children ">
                        <a href="/admin/productList"><i class="menu-icon fa fa-diamond"></i>상품관리</a>
                    </li>
                    <li class="menu-item-has-children ">
                        <a href="/admin/email/sender"><i class="menu-icon fa fa-envelope-o"></i>단체 메일 전송</a>
                    </li>
<%--                    <li class="menu-item-has-children dropdown">--%>
<%--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Charts</a>--%>
<%--                        <ul class="sub-menu children dropdown-menu">--%>
<%--                            <li><i class="menu-icon fa fa-line-chart"></i><a href="charts-chartjs.html">Chart JS</a></li>--%>
<%--                            <li><i class="menu-icon fa fa-area-chart"></i><a href="charts-flot.html">Flot Chart</a></li>--%>
<%--                            <li><i class="menu-icon fa fa-pie-chart"></i><a href="charts-peity.html">Peity Chart</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>

<%--                    <li class="menu-item-has-children dropdown">--%>
<%--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-area-chart"></i>Maps</a>--%>
<%--                        <ul class="sub-menu children dropdown-menu">--%>
<%--                            <li><i class="menu-icon fa fa-map-o"></i><a href="maps-gmap.html">Google Maps</a></li>--%>
<%--                            <li><i class="menu-icon fa fa-street-view"></i><a href="maps-vector.html">Vector Maps</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
<%--                    <li class="menu-title">Extras</li><!-- /.menu-title -->--%>
<%--                    <li class="menu-item-has-children dropdown">--%>
<%--                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-glass"></i>Pages</a>--%>
<%--                        <ul class="sub-menu children dropdown-menu">--%>
<%--                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-login.html">Login</a></li>--%>
<%--                            <li><i class="menu-icon fa fa-sign-in"></i><a href="page-register.html">Register</a></li>--%>
<%--                            <li><i class="menu-icon fa fa-paper-plane"></i><a href="pages-forget.html">Forget Pass</a></li>--%>
<%--                        </ul>--%>
<%--                    </li>--%>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
</div>
