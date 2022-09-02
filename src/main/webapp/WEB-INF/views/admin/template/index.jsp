<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>


<!doctype html>
<%--<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->--%>
<%--<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->--%>
<%--<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->--%>
<%--<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->--%>
<head>
    <div class="bottom-wrap">












        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>트립쏘다 관리자페이지</title>
        <meta name="description" content="Ela Admin - HTML5 Admin Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages':['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Task', 'Hours per Day'],
                    ['10대',  2.5],
                    ['20대',  4.2],
                    ['30대',  6.6],
                    ['40대',  5.8],
                    ['50대',  4.12]
                ]);

                var options = {
                    title: '이용자 연령대',
                    width:'1200px'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>

        <style>
            #weatherWidget .currentDesc {
                color: #ffffff!important;
            }
            .traffic-chart {
                min-height: 335px;
            }
            #flotPie1  {
                height: 150px;
            }
            #flotPie1 td {
                padding:3px;
            }
            /*#flotPie1 table {*/
            /*    top: 20px!important;*/
            /*    right: -10px!important;*/
            /*}*/
            .chart-container {
                display: table;
                min-width: 270px ;
                text-align: left;
                padding-top: 10px;
                padding-bottom: 10px;
            }
            #flotLine5  {
                height: 105px;
            }

            #flotBarChart {
                height: 150px;
            }
            #cellPaiChart{
                height: 160px;
            }

        </style>



        <!-- Left Panel -->

        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">
            <!-- Header-->
            <header id="header" class="header">
                <div class="top-left">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="./"><img src="images/logo.png" alt="Logo"></a>
                        <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars" aria-hidden="true"></i></a>
                    </div>
                </div>
                <div class="top-right">
                    <div class="header-menu">
                        <div class="header-left">
                            <button class="search-trigger"><i class="fa fa-search" aria-hidden="true"></i></button>
                            <div class="form-inline">
                                <form class="search-form">
                                    <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                    <button class="search-close" type="submit"><i class="fa fa-close" aria-hidden="true"></i></button>
                                </form>
                            </div>

                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-bell" aria-hidden="true"></i>
                                    <span class="count bg-danger">3</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="notification">
                                    <p class="red">You have 3 Notification</p>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-check" aria-hidden="true"></i>
                                        <p>Server #1 overloaded.</p>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-info" aria-hidden="true"></i>
                                        <p>Server #2 overloaded.</p>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <i class="fa fa-warning" aria-hidden="true"></i>
                                        <p>Server #3 overloaded.</p>
                                    </a>
                                </div>
                            </div>

                            <div class="dropdown for-message">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                    <span class="count bg-primary">4</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="message">
                                    <p class="red">You have 4 Mails</p>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jonathan Smith</span>
                                            <span class="time float-right">Just now</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jack Sanders</span>
                                            <span class="time float-right">5 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Cheryl Wheeler</span>
                                            <span class="time float-right">10 minutes ago</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Rachel Santos</span>
                                            <span class="time float-right">15 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="user-area dropdown float-right">
                            <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="user-avatar rounded-circle" src="images/admin.jpg" alt="User Avatar">
                            </a>

                            <div class="user-menu dropdown-menu">
                                <a class="nav-link" href="#"><i class="fa fa- user" aria-hidden="true"></i>My Profile</a>

                                <a class="nav-link" href="#"><i class="fa fa- user" aria-hidden="true"></i>Notifications <span class="count">13</span></a>

                                <a class="nav-link" href="#"><i class="fa fa -cog" aria-hidden="true"></i>Settings</a>

                                <a class="nav-link" href="#"><i class="fa fa-power -off" aria-hidden="true"></i>Logout</a>
                            </div>
                        </div>

                    </div>
                </div>
            </header>
            <!-- /#header -->
            <!-- Content -->
            <div class="content">
                <!-- Animated -->
                <div class="animated fadeIn">
                    <!-- Widgets  -->
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-1">
                                            <i class="pe-7s-cash"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text">￦<span class="count">6439100</span></div>
                                                <div class="stat-heading">총매출</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-2">
                                            <i class="pe-7s-cart"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">33</span></div>
                                                <div class="stat-heading">누적판매량</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-3">
                                            <i class="pe-7s-browser"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">24</span></div>
                                                <div class="stat-heading">동행 게시글</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="stat-widget-five">
                                        <div class="stat-icon dib flat-color-4">
                                            <i class="pe-7s-users"></i>
                                        </div>
                                        <div class="stat-content">
                                            <div class="text-left dib">
                                                <div class="stat-text"><span class="count">14</span></div>
                                                <div class="stat-heading">활성유저</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Widgets -->
                    <!--  Traffic  -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">Traffic </h4>
                                </div>
                                <div class="row">
                                    <div class="col-lg-8">
                                        <div class="card-body">
                                            <!-- <canvas id="TrafficChart"></canvas>   -->
                                            <div id="traffic-chart" class="traffic-chart"><svg xmlns:ct="http://gionkunz.github.com/chartist-js/ct" width="100%" height="100%" class="ct-chart-line" style="width: 100%; height: 100%;"><g class="ct-grids"><line x1="50" x2="50" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line x1="182.065625" x2="182.065625" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line x1="314.13125" x2="314.13125" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line x1="446.19687500000003" x2="446.19687500000003" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line x1="578.2625" x2="578.2625" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line x1="710.328125" x2="710.328125" y1="15" y2="403.25" class="ct-grid ct-horizontal"></line><line y1="403.25" y2="403.25" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="375.51785714285717" y2="375.51785714285717" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="347.7857142857143" y2="347.7857142857143" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="320.05357142857144" y2="320.05357142857144" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="292.32142857142856" y2="292.32142857142856" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="264.5892857142857" y2="264.5892857142857" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="236.85714285714286" y2="236.85714285714286" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="209.125" y2="209.125" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="181.39285714285714" y2="181.39285714285714" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="153.66071428571428" y2="153.66071428571428" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="125.92857142857144" y2="125.92857142857144" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="98.19642857142856" y2="98.19642857142856" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="70.46428571428572" y2="70.46428571428572" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="42.73214285714283" y2="42.73214285714283" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line><line y1="15" y2="15" x1="50" x2="710.328125" class="ct-grid ct-vertical"></line></g><g><g class="ct-series ct-series-a"><path d="M50,403.25L50,403.25C94.022,336.693,138.044,268.234,182.066,203.579C226.088,138.923,270.109,15,314.131,15C358.153,15,402.175,108.863,446.197,125.929C490.219,142.995,534.241,139.684,578.263,159.207C622.284,178.731,666.306,321.902,710.328,403.25L710.328,403.25Z" class="ct-area"></path></g><g class="ct-series ct-series-b"><path d="M50,403.25L50,403.25C94.022,281.229,138.044,37.186,182.066,37.186C226.088,37.186,270.109,236.857,314.131,236.857C358.153,236.857,402.175,181.393,446.197,181.393C490.219,181.393,534.241,209.266,578.263,236.857C622.284,264.449,666.306,345.567,710.328,399.922L710.328,403.25Z" class="ct-area"></path></g><g class="ct-series ct-series-c"><path d="M50,403.25L50,403.25C94.022,347.786,138.044,288.36,182.066,236.857C226.088,185.355,270.109,92.65,314.131,92.65C358.153,92.65,402.175,236.857,446.197,236.857C490.219,236.857,534.241,70.464,578.263,70.464C622.284,70.464,666.306,255.345,710.328,347.786L710.328,403.25Z" class="ct-area"></path></g></g><g class="ct-labels"><foreignObject style="overflow: visible;" x="50" y="408.25" width="132.065625" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 132px; height: 20px;">Apr</span></foreignObject><foreignObject style="overflow: visible;" x="182.065625" y="408.25" width="132.065625" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 132px; height: 20px;">May</span></foreignObject><foreignObject style="overflow: visible;" x="314.13125" y="408.25" width="132.065625" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 132px; height: 20px;">Jun</span></foreignObject><foreignObject style="overflow: visible;" x="446.19687500000003" y="408.25" width="132.065625" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 132px; height: 20px;">Jul</span></foreignObject><foreignObject style="overflow: visible;" x="578.2625" y="408.25" width="132.06562499999995" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 132px; height: 20px;">May</span></foreignObject><foreignObject style="overflow: visible;" x="710.328125" y="408.25" width="30" height="20"><span class="ct-label ct-horizontal ct-end" xmlns="http://www.w3.org/2000/xmlns/" style="width: 30px; height: 20px;">Aug</span></foreignObject><foreignObject style="overflow: visible;" y="375.51785714285717" x="10" height="27.732142857142858" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">0</span></foreignObject><foreignObject style="overflow: visible;" y="347.78571428571433" x="10" height="27.732142857142858" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">2500</span></foreignObject><foreignObject style="overflow: visible;" y="320.05357142857144" x="10" height="27.732142857142854" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">5000</span></foreignObject><foreignObject style="overflow: visible;" y="292.32142857142856" x="10" height="27.73214285714286" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">7500</span></foreignObject><foreignObject style="overflow: visible;" y="264.5892857142857" x="10" height="27.732142857142847" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">10000</span></foreignObject><foreignObject style="overflow: visible;" y="236.85714285714286" x="10" height="27.73214285714286" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">12500</span></foreignObject><foreignObject style="overflow: visible;" y="209.125" x="10" height="27.73214285714286" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">15000</span></foreignObject><foreignObject style="overflow: visible;" y="181.39285714285714" x="10" height="27.73214285714286" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">17500</span></foreignObject><foreignObject style="overflow: visible;" y="153.66071428571428" x="10" height="27.73214285714286" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">20000</span></foreignObject><foreignObject style="overflow: visible;" y="125.92857142857144" x="10" height="27.732142857142833" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">22500</span></foreignObject><foreignObject style="overflow: visible;" y="98.19642857142856" x="10" height="27.73214285714289" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">25000</span></foreignObject><foreignObject style="overflow: visible;" y="70.46428571428572" x="10" height="27.732142857142833" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">27500</span></foreignObject><foreignObject style="overflow: visible;" y="42.73214285714283" x="10" height="27.73214285714289" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">30000</span></foreignObject><foreignObject style="overflow: visible;" y="15" x="10" height="27.732142857142833" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 28px; width: 30px;">32500</span></foreignObject><foreignObject style="overflow: visible;" y="-15" x="10" height="30" width="30"><span class="ct-label ct-vertical ct-start" xmlns="http://www.w3.org/2000/xmlns/" style="height: 30px; width: 30px;">35000</span></foreignObject></g></svg></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="card-body">
                                            <div class="progress-box progress-1">
                                                <h4 class="por-title">방문자수</h4>
                                                <div class="por-txt">96,930 Users (40%)</div>
                                                <div class="progress mb-2" style="height: 5px;">
                                                    <div class="progress-bar bg-flat-color-1" role="progressbar" style="width: 40%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="progress-box progress-2">
                                                <h4 class="por-title">이탈률</h4>
                                                <div class="por-txt">3,220 Users (24%)</div>
                                                <div class="progress mb-2" style="height: 5px;">
                                                    <div class="progress-bar bg-flat-color-2" role="progressbar" style="width: 24%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="progress-box progress-2">
                                                <h4 class="por-title">순 방문자수</h4>
                                                <div class="por-txt">29,658 Users (60%)</div>
                                                <div class="progress mb-2" style="height: 5px;">
                                                    <div class="progress-bar bg-flat-color-3" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <div class="progress-box progress-2">
                                                <h4 class="por-title">타겟 방문자</h4>
                                                <div class="por-txt">99,658 Users (90%)</div>
                                                <div class="progress mb-2" style="height: 5px;">
                                                    <div class="progress-bar bg-flat-color-4" role="progressbar" style="width: 90%;" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div> <!-- /.card-body -->
                                    </div>
                                </div> <!-- /.row -->
                                <div class="card-body"></div>
                            </div>
                        </div><!-- /# column -->
                    </div>
                    <!--  /Traffic -->
                    <div class="clearfix"></div>
                    <!-- Orders -->
                    <div class="orders">
                        <div id="piechart" style="width: 100%; height: 500px;"><div style="position: relative;"><div dir="ltr" style="position: relative; width: 1163px; height: 500px;"><div aria-label="A chart." style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%;"><svg width="1163" height="500" aria-label="A chart." style="overflow: hidden;"><defs id="_ABSTRACT_RENDERER_ID_0"></defs><rect x="0" y="0" width="1163" height="500" stroke="none" stroke-width="0" fill="#ffffff"></rect><g><text text-anchor="start" x="177" y="69.75" font-family="Arial" font-size="15" font-weight="bold" stroke="none" stroke-width="0" fill="#000000">이용자 연령대</text><rect x="177" y="57" width="809" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect></g><g><rect x="701" y="96" width="285" height="111" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g column-id="10대"><rect x="701" y="96" width="285" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="722" y="108.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">10대</text></g><circle cx="708.5" cy="103.5" r="7.5" stroke="none" stroke-width="0" fill="#3366cc"></circle></g><g column-id="20대"><rect x="701" y="120" width="285" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="722" y="132.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">20대</text></g><circle cx="708.5" cy="127.5" r="7.5" stroke="none" stroke-width="0" fill="#dc3912"></circle></g><g column-id="30대"><rect x="701" y="144" width="285" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="722" y="156.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">30대</text></g><circle cx="708.5" cy="151.5" r="7.5" stroke="none" stroke-width="0" fill="#ff9900"></circle></g><g column-id="40대"><rect x="701" y="168" width="285" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="722" y="180.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">40대</text></g><circle cx="708.5" cy="175.5" r="7.5" stroke="none" stroke-width="0" fill="#109618"></circle></g><g column-id="50대"><rect x="701" y="192" width="285" height="15" stroke="none" stroke-width="0" fill-opacity="0" fill="#ffffff"></rect><g><text text-anchor="start" x="722" y="204.75" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#222222">50대</text></g><circle cx="708.5" cy="199.5" r="7.5" stroke="none" stroke-width="0" fill="#990099"></circle></g></g><g><path d="M427,251L427,97A154,154,0,0,1,523.4125251498623,130.91409327391005L427,251A0,0,0,0,0,427,251" stroke="#ffffff" stroke-width="1" fill="#3366cc"></path><text text-anchor="start" x="445.3781273262374" y="140.03980245501492" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#ffffff">10.8%</text></g><g><path d="M427,251L523.4125251498623,130.91409327391005A154,154,0,0,1,576.5058415142244,287.93241602066706L427,251A0,0,0,0,0,427,251" stroke="#ffffff" stroke-width="1" fill="#dc3912"></path><text text-anchor="start" x="513.7088342118531" y="219.3227224494388" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#ffffff">18.1%</text></g><g><path d="M427,251L288.73218148032834,183.19136956248755A154,154,0,0,1,427,97L427,251A0,0,0,0,0,427,251" stroke="#ffffff" stroke-width="1" fill="#990099"></path><text text-anchor="start" x="341.0689080694332" y="154.4941194277376" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#ffffff">17.7%</text></g><g><path d="M427,251L359.00435969128955,389.1759490613633A154,154,0,0,1,288.73218148032834,183.19136956248755L427,251A0,0,0,0,0,427,251" stroke="#ffffff" stroke-width="1" fill="#109618"></path><text text-anchor="start" x="296.0814558347741" y="295.45476200193934" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#ffffff">25%</text></g><g><path d="M427,251L576.5058415142244,287.93241602066706A154,154,0,0,1,359.00435969128955,389.1759490613633L427,251A0,0,0,0,0,427,251" stroke="#ffffff" stroke-width="1" fill="#ff9900"></path><text text-anchor="start" x="455.82974122734237" y="366.52168297304604" font-family="Arial" font-size="15" stroke="none" stroke-width="0" fill="#ffffff">28.4%</text></g><g></g></svg><div aria-label="A tabular representation of the data in the chart." style="position: absolute; left: -10000px; top: auto; width: 1px; height: 1px; overflow: hidden;"><table><thead><tr><th>Task</th><th>Hours per Day</th></tr></thead><tbody><tr><td>10대</td><td>2.5</td></tr><tr><td>20대</td><td>4.2</td></tr><tr><td>30대</td><td>6.6</td></tr><tr><td>40대</td><td>5.8</td></tr><tr><td>50대</td><td>4.12</td></tr></tbody></table></div></div></div><div aria-hidden="true" style="display: none; position: absolute; top: 510px; left: 1173px; white-space: nowrap; font-family: Arial; font-size: 15px;">50대</div><div></div></div></div>

                        <div class="row">
                            <!-- /.col-lg-8 -->

                            <div class="col-xl-4">
                                <div class="row">
                                    <div class="col-lg-6 col-xl-12" style="position: absolute; top: -240px; left: 760px;">
                                        <div class="card br-0">
                                            <div class="card-body">
                                                <div class="chart-container ov-h">
                                                    <div id="flotPie1" class="float-chart" style="padding: 0px; position: relative;"><canvas class="flot-base" width="270" height="150" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 270px; height: 150px;"></canvas><canvas class="flot-overlay" width="270" height="150" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 270px; height: 150px;"></canvas><div class="legend"><div style="position: absolute; width: 54px; height: 62px; top: 5px; right: 5px; background-color: rgb(255, 255, 255); opacity: 0.85;"> </div><table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454"><tbody><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #5c6bc0;overflow:hidden"></div></div></td><td class="legendLabel">남자</td></tr><tr><td class="legendColorBox"><div style="border:1px solid #ccc;padding:1px"><div style="width:4px;height:0;border:5px solid #ef5350;overflow:hidden"></div></div></td><td class="legendLabel">여자</td></tr></tbody></table></div></div>
                                                </div>
                                            </div>
                                        </div><!-- /.card -->
                                    </div>







                                </div>


                            </div>
                        </div> <!-- /.col-md-4 -->

                    </div>
                </div>
                <!-- /.orders -->
                <!-- To Do and Live Chat -->

                <!-- /To Do and Live Chat -->
                <!-- Calender Chart Weather  -->

                <!-- /Calender Chart Weather -->
                <!-- Modal - Calendar - Add New Event -->
                <div class="modal fade none-border" id="event-modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title"><strong>Add New Event</strong></h4>
                            </div>
                            <div class="modal-body"></div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                                <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#event-modal -->
                <!-- Modal - Calendar - Add Category -->
                <div class="modal fade none-border" id="add-category">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h4 class="modal-title"><strong>Add a category </strong></h4>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label class="control-label">Category Name</label>
                                            <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="control-label">Choose Category Color</label>
                                            <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                                <option value="success">Success</option>
                                                <option value="danger">Danger</option>
                                                <option value="info">Info</option>
                                                <option value="pink">Pink</option>
                                                <option value="primary">Primary</option>
                                                <option value="warning">Warning</option>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        <div class="clearfix"></div>
        <!-- Footer -->
        <%--<footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright © 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>--%>
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="/adminTemplate/assets/js/main.js"></script>

    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
    <script src="/adminTemplate/assets/js/init/weather-init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script src="/adminTemplate/assets/js/init/fullcalendar-init.js"></script>

    <!--Local Stuff-->
    <script>
        jQuery(document).ready(function($) {
            "use strict";

            // Pie chart flotPie1
            var piedata = [
                { label: "남자", data: [[1,33]], color: '#5c6bc0'},
                { label: "여자", data: [[1,67]], color: '#ef5350'},
                // { label: "Mobile visits", data: [[1,35]], color: '#66bb6a'}
            ];

            $.plot('#flotPie1', piedata, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        innerRadius: 0.65,
                        label: {
                            show: true,
                            radius: 2/3,
                            threshold: 1
                        },
                        stroke: {
                            width: 0
                        }
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true
                }
            });
            // Pie chart flotPie1  End
            // cellPaiChart
            var cellPaiChart = [
                { label: "Direct Sell", data: [[1,65]], color: '#5b83de'},
                { label: "Channel Sell", data: [[1,35]], color: '#00bfa5'}
            ];
            $.plot('#cellPaiChart', cellPaiChart, {
                series: {
                    pie: {
                        show: true,
                        stroke: {
                            width: 0
                        }
                    }
                },
                legend: {
                    show: false
                },grid: {
                    hoverable: true,
                    clickable: true
                }

            });
            // cellPaiChart End
            // Line Chart  #flotLine5
            var newCust = [[0, 3], [1, 5], [2,4], [3, 7], [4, 9], [5, 3], [6, 6], [7, 4], [8, 10]];

            var plot = $.plot($('#flotLine5'),[{
                data: newCust,
                label: 'New Data Flow',
                color: '#fff'
            }],
            {
                series: {
                    lines: {
                        show: true,
                        lineColor: '#fff',
                        lineWidth: 2
                    },
                    points: {
                        show: true,
                        fill: true,
                        fillColor: "#ffffff",
                        symbol: "circle",
                        radius: 3
                    },
                    shadowSize: 0
                },
                points: {
                    show: true,
                },
                legend: {
                    show: false
                },
                grid: {
                    show: false
                }
            });
            // Line Chart  #flotLine5 End
            // Traffic Chart using chartist
            if ($('#traffic-chart').length) {
                var chart = new Chartist.Line('#traffic-chart', {
                  labels: ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
                  series: [
                  [0, 18000, 35000,  25000,  22000,  0],
                  [0, 33000, 15000,  20000,  15000,  300],
                  [0, 15000, 28000,  15000,  30000,  5000]
                  ]
              }, {
                  low: 0,
                  showArea: true,
                  showLine: false,
                  showPoint: false,
                  fullWidth: true,
                  axisX: {
                    showGrid: true
                }
            });

                chart.on('draw', function(data) {
                    if(data.type === 'line' || data.type === 'area') {
                        data.element.animate({
                            d: {
                                begin: 2000 * data.index,
                                dur: 2000,
                                from: data.path.clone().scale(1, 0).translate(0, data.chartRect.height()).stringify(),
                                to: data.path.clone().stringify(),
                                easing: Chartist.Svg.Easing.easeOutQuint
                            }
                        });
                    }
                });
            }
            // Traffic Chart using chartist End
            //Traffic chart chart-js
            if ($('#TrafficChart').length) {
                var ctx = document.getElementById( "TrafficChart" );
                ctx.height = 150;
                var myChart = new Chart( ctx, {
                    type: 'line',
                    data: {
                        labels: [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul" ],
                        datasets: [
                        {
                            label: "Visit",
                            borderColor: "rgba(4, 73, 203,.09)",
                            borderWidth: "1",
                            backgroundColor: "rgba(4, 73, 203,.5)",
                            data: [ 0, 2900, 5000, 3300, 6000, 3250, 0 ]
                        },
                        {
                            label: "Bounce",
                            borderColor: "rgba(245, 23, 66, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(245, 23, 66,.5)",
                            pointHighlightStroke: "rgba(245, 23, 66,.5)",
                            data: [ 0, 4200, 4500, 1600, 4200, 1500, 4000 ]
                        },
                        {
                            label: "Targeted",
                            borderColor: "rgba(40, 169, 46, 0.9)",
                            borderWidth: "1",
                            backgroundColor: "rgba(40, 169, 46, .5)",
                            pointHighlightStroke: "rgba(40, 169, 46,.5)",
                            data: [1000, 5200, 3600, 2600, 4200, 5300, 0 ]
                        }
                        ]
                    },
                    options: {
                        responsive: true,
                        tooltips: {
                            mode: 'index',
                            intersect: false
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true
                        }

                    }
                } );
            }
            //Traffic chart chart-js  End
            // Bar Chart #flotBarChart
            $.plot("#flotBarChart", [{
                data: [[0, 18], [2, 8], [4, 5], [6, 13],[8,5], [10,7],[12,4], [14,6],[16,15], [18, 9],[20,17], [22,7],[24,4], [26,9],[28,11]],
                bars: {
                    show: true,
                    lineWidth: 0,
                    fillColor: '#ffffff8a'
                }
            }], {
                grid: {
                    show: false
                }
            });
            // Bar Chart #flotBarChart End
        });
    </script>
</body>
</html>
