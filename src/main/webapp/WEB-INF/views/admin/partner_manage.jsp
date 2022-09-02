<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<link rel="stylesheet" href="/css/admin/combined_board.css" />
<link rel="stylesheet" href="/css/admin/partner_manage.css" />

<div class="combined-wrap">
    <div class="b-tit">
        <h1>파트너 관리</h1>
    </div>

    <div class="card">
        <div class="card-body">
            <h4 class="box-title">승인 대기 중 파트너 </h4>
        </div>
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <table class="table ">
                    <thead>


                    <tr>
                        <th class="order">No</th>
                        <th class="user-id">유저ID</th>
                        <th class="company-name">회사명</th>
                        <th class="location">상품지역</th>
                        <th class="product-type">상품유형</th>
                        <th class="telp">담당자 연락처</th>
                        <th class="date">신청일</th>
                        <th class="status">상태</th>
                    </tr>
                    </thead>
                    <tbody>
<%--                    <tr>--%>
<%--                        <td class="serial">1.</td>--%>
<%--                        <td class="avatar">--%>
<%--                            <div class="round-img">--%>
<%--                                <a href="#"><img class="rounded-circle" src="images/avatar/1.jpg" alt=""></a>--%>
<%--                            </div>--%>
<%--                        </td>--%>
<%--                        <td> #5469 </td>--%>
<%--                        <td>  <span class="name">Louis Stanley</span> </td>--%>
<%--                        <td> <span class="product">iMax</span> </td>--%>
<%--                        <td><span class="count">231</span></td>--%>
<%--                        <td>--%>
<%--                            <span class="badge badge-complete">Complete</span>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <c:forEach var="applicant" items="${applicantList}">
                        <tr>
                            <td class="con">${applicant.id}</td>
                            <td class="con" name="userId">${applicant.userId}</td>
                            <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${applicant.id}&userId=${applicant.userId}" >${applicant.companyName}</a></td>
                            <td class="con" name="serviceRegion">${applicant.serviceRegion}</td>
                            <td class="con" name="productType" data-menu-code="${applicant.productType}">${applicant.productType}</td>
                            <td class="con" name="managerTel">${applicant.managerTel}</td>
                            <td class="con" name="conclusionDate">${applicant.conclusionDate}</td>
                            <td class="con status"> ${applicant.onPartnership==1? '파트너' : '대기'} </td>
                            <script>

                                if(${applicant.onPartnership}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${applicant.onPartnership}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">파트너</span>`);

                                } else if (${applicant.onPartnership}===2){
                                    $("td.status").last().html(`<span class="badge badge-fail">반려</span>`);
                                }
                            </script>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div> <!-- /.table-stats -->
        </div>
    </div>


    <div class="card">
        <div class="card-body">
            <h4 class="box-title">반려된 파트너</h4>
        </div>
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <table class="table ">
                    <thead>


                    <tr>
                        <th class="order">No</th>
                        <th class="user-id">유저ID</th>
                        <th class="company-name">회사명</th>
                        <th class="location">상품지역</th>
                        <th class="product-type">상품유형</th>
                        <th class="telp">담당자 연락처</th>
                        <th class="date">신청일</th>
                        <th class="status">상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--                    <tr>--%>
                    <%--                        <td class="serial">1.</td>--%>
                    <%--                        <td class="avatar">--%>
                    <%--                            <div class="round-img">--%>
                    <%--                                <a href="#"><img class="rounded-circle" src="images/avatar/1.jpg" alt=""></a>--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td> #5469 </td>--%>
                    <%--                        <td>  <span class="name">Louis Stanley</span> </td>--%>
                    <%--                        <td> <span class="product">iMax</span> </td>--%>
                    <%--                        <td><span class="count">231</span></td>--%>
                    <%--                        <td>--%>
                    <%--                            <span class="badge badge-complete">Complete</span>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <c:forEach var="cancelled" items="${cancelledList}">
                        <tr>
                            <td class="con">${cancelled.id}</td>
                            <td class="con" name="userId">${cancelled.userId}</td>
                            <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${cancelled.id}&userId=${cancelled.userId}" >${cancelled.companyName}</a></td>
                            <td class="con" name="serviceRegion">${cancelled.serviceRegion}</td>
                            <td class="con" name="productType" data-menu-code="${cancelled.productType}">${cancelled.productType}</td>
                            <td class="con" name="managerTel">${cancelled.managerTel}</td>
                            <td class="con" name="conclusionDate">${cancelled.conclusionDate}</td>
                            <td class="con status"> ${cancelled.onPartnership==1? '파트너' : '대기'} </td>
                            <script>

                                if(${cancelled.onPartnership}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${cancelled.onPartnership}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">파트너</span>`);

                                } else if (${cancelled.onPartnership}===2){
                                    $("td.status").last().html(`<span class="badge badge-danger">반려</span>`);
                                }
                            </script>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div> <!-- /.table-stats -->
        </div>
    </div>


    <div class="card">
        <div class="card-body">
            <h4 class="box-title">승인 완료 파트너</h4>
        </div>
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <table class="table ">
                    <thead>


                    <tr>
                        <th class="order">No</th>
                        <th class="user-id">유저ID</th>
                        <th class="company-name">회사명</th>
                        <th class="location">상품지역</th>
                        <th class="product-type">상품유형</th>
                        <th class="telp">담당자 연락처</th>
                        <th class="date">파트너체결일</th>
                        <th class="status">상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--                    <tr>--%>
                    <%--                        <td class="serial">1.</td>--%>
                    <%--                        <td class="avatar">--%>
                    <%--                            <div class="round-img">--%>
                    <%--                                <a href="#"><img class="rounded-circle" src="images/avatar/1.jpg" alt=""></a>--%>
                    <%--                            </div>--%>
                    <%--                        </td>--%>
                    <%--                        <td> #5469 </td>--%>
                    <%--                        <td>  <span class="name">Louis Stanley</span> </td>--%>
                    <%--                        <td> <span class="product">iMax</span> </td>--%>
                    <%--                        <td><span class="count">231</span></td>--%>
                    <%--                        <td>--%>
                    <%--                            <span class="badge badge-complete">Complete</span>--%>
                    <%--                        </td>--%>
                    <%--                    </tr>--%>
                    <c:forEach var="partner" items="${partnerList}">
                        <tr>
                            <td class="con">${partner.id}</td>
                            <td class="con" name="userId">${partner.userId}</td>
                            <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${partner.id}&userId=${partner.userId}" >${partner.companyName}</a></td>
                            <td class="con" name="serviceRegion">${partner.serviceRegion}</td>
                            <td class="con" name="productType" data-menu-code="${partner.productType}">${partner.productType}</td>
                            <td class="con" name="managerTel">${partner.managerTel}</td>
                            <td class="con" name="conclusionDate">${partner.conclusionDate}</td>
                            <td class="con status"> ${partner.onPartnership==1? '파트너' : '대기'} </td>
                            <script>

                                if(${partner.onPartnership}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${partner.onPartnership}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">파트너</span>`);

                                } else if (${partner.onPartnership}===2){
                                    $("td.status").last().html(`<span class="badge badge-fail">반려</span>`);
                                }
                            </script>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div> <!-- /.table-stats -->
        </div>
    </div>


    <%--<div class="list-container">

&lt;%&ndash;        <ul class="nav nav-tabs">&ndash;%&gt;
&lt;%&ndash;            <li class="nav-item">&ndash;%&gt;
&lt;%&ndash;                <a class="nav-link active" data-toggle="tab" href="#qwe">파트너목록</a>&ndash;%&gt;
&lt;%&ndash;            </li>&ndash;%&gt;
&lt;%&ndash;            <li class="nav-item">&ndash;%&gt;
&lt;%&ndash;                <a class="nav-link" data-toggle="tab" href="#asd">상품목록</a>&ndash;%&gt;
&lt;%&ndash;            </li>&ndash;%&gt;
&lt;%&ndash;            <li class="nav-item">&ndash;%&gt;
&lt;%&ndash;                <a class="nav-link" data-toggle="tab" href="#zxc">통계</a>&ndash;%&gt;
&lt;%&ndash;            </li>&ndash;%&gt;
&lt;%&ndash;        </ul>&ndash;%&gt;

        <div class="tab-content">
            <div class="tab-pane fade show active" id="qwe">
&lt;%&ndash;                <div class="search-container">&ndash;%&gt;
&lt;%&ndash;                    <form action="<c:url value="/admin/partnerList"/>" class="search-form" method="get">&ndash;%&gt;
&lt;%&ndash;                        <select class="search-option" name="option">&ndash;%&gt;
&lt;%&ndash;                            <option value="NA" ${ph.sc.option=='NA' ? "selected" : ""}>회사명</option>&ndash;%&gt;
&lt;%&ndash;                            <option value="NI" ${ph.sc.option=='NI' ? "selected" : ""}>닉네임</option>&ndash;%&gt;
&lt;%&ndash;                            <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름+닉네임</option>&ndash;%&gt;
&lt;%&ndash;                        </select>&ndash;%&gt;

&lt;%&ndash;                        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">&ndash;%&gt;
&lt;%&ndash;                        <input type="submit" class="search-button" value="검색">&ndash;%&gt;
&lt;%&ndash;                    </form>&ndash;%&gt;
&lt;%&ndash;                </div>&ndash;%&gt;

                <div class="partner-container">

                    <form name="boardListForm" class="apply-form">
                        <table class="combined-list-tb">
                            <tr>
                                <th class="titb"><input type="checkbox" id="all_check"></th>
                                <th class="tit">유저ID</th>
                                <th class="tit">회사명</th>
                                <th class="tit">상품지역</th>
                                <th class="tit">상품유형</th>
                                <th class="tit">담당자연락처</th>
                                <th class="tit">파트너체결일</th>
                                <th class="tit">상태</th>
                            </tr>

                            <c:forEach var="applicant" items="${applicantList}">
                                <tr class="con-td">
                                    <td class="con">${applicant.id}</td>
                                    <td class="con" name="userId">${applicant.userId}</td>
                                    <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${applicant.id}" >${applicant.companyName}</a></td>
                                    <td class="con" name="serviceRegion">${applicant.serviceRegion}</td>
                                    <td class="con" name="productType" data-menu-code="${applicant.productType}">${applicant.productType}</td>
                                    <td class="con" name="managerTel">${applicant.managerTel}</td>
                                    <td class="con" name="conclusionDate">${applicant.conclusionDate}</td>
                                    <td class="con"> ${partner.onPartnership==1? '파트너' : '대기'} </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </form>

                    <form name="boardListForm">
                        <table class="c<form name="boardListForm" class="apply-form">
                        <table class="combined-list-tb">
                            <tr>
                                <th class="titb"><input type="checkbox" id="all_check"></th>
                                <th class="tit">유저ID</th>
                                <th class="tit">회사명</th>
                                <th class="tit">상품지역</th>
                                <th class="tit">상품유형</th>
                                <th class="tit">담당자연락처</th>
                                <th class="tit">파트너체결일</th>
                                <th class="tit">상태</th>
                            </tr>

                            <c:forEach var="cancelled" items="${cancelledList}">
                                <tr class="con-td">
                                    <td class="con">${cancelled.id}</td>
                                    <td class="con" name="userId">${cancelled.userId}</td>
                                    <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${cancelled.id}" >${cancelled.companyName}</a></td>
                                    <td class="con" name="serviceRegion">${cancelled.serviceRegion}</td>
                                    <td class="con" name="productType" data-menu-code="${cancelled.productType}">${cancelled.productType}</td>
                                    <td class="con" name="managerTel">${cancelled.managerTel}</td>
                                    <td class="con" name="conclusionDate">
                                        <fmt:parseDate var="formatToday" value="${cancelled.conclusionDate}" pattern="yyyy-MM-dd" /> <!-- 포멧 변경 -->

                                    </td>
                                    <td class="con"> ${cancelled.onPartnership==1? '파트너 ' : '해지'} </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </form>


                    <form name="boardListForm">
                        <table class="combined-list-tb">
&lt;%&ndash;                            <tr>&ndash;%&gt;
&lt;%&ndash;                               <td colspan="5">&ndash;%&gt;
    &lt;%&ndash;                                    <button disabled>전체선택</button>&ndash;%&gt;
    &lt;%&ndash;                                </td>&ndash;%&gt;
    &lt;%&ndash;                                <td colspan="3">&ndash;%&gt;
    &lt;%&ndash;                                    <button id="bDelBtn" type="button">삭제</button>&ndash;%&gt;
    &lt;%&ndash;                                </td>&ndash;%&gt;
    &lt;%&ndash;                            </tr>&ndash;%&gt;
                            <tr>
                                <th class="titb"><input type="checkbox" id="all_check"></th>
                                <th class="tit">유저ID</th>
                                <th class="tit">회사명</th>
                                <th class="tit">상품지역</th>
                                <th class="tit">상품유형</th>
                                <th class="tit">담당자연락처</th>
                                <th class="tit">파트너체결일</th>
                                <th class="tit">상태</th>
                            </tr>
                            <c:forEach var="partner" items="${partnerList}">
                                <tr class="con-td">
                                    <td class="con">${partner.id}</td>
                                    <td class="con" name="userId">${partner.userId}</td>
                                    <td class="con" name="companyName"><a href="/admin/partner/info${searchCondition.queryString}&partnerId=${partner.id}" >${partner.companyName}</a></td>
                                    <td class="con" name="serviceRegion">${partner.serviceRegion}</td>
                                    <td class="con" name="productType" data-menu-code="${partner.productType}">${partner.productType}</td>
                                    <td class="con" name="managerTel">${partner.managerTel}</td>
                                    <td class="con" name="conclusionDate">${partner.conclusionDate}</td>
                                    <td class="con"> ${partner.onPartnership==1? '파트너' : '해지'} </td>

                                </tr>
                            </c:forEach>



                        </table>
                    </form>

                    <br>
                    &lt;%&ndash;  &ndash;%&gt;
                    <div class="paging-container">
                        <div class="paging">
                            <c:if test="${totalCnt==null || totalCnt==0}">
                                <div> 게시물이 없습니다. </div>
                            </c:if>
                            <c:if test="${totalCnt!=null && totalCnt!=0}">
                                <c:if test="${ph.showPrev}">
                                    <a class="page" href="<c:url value="/admin/partnerList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                                </c:if>
                                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/partnerList${ph.sc.getQueryString(i)}"/>">${i}</a>
                                </c:forEach>
                                <c:if test="${ph.showNext}">
                                    <a class="page" href="<c:url value="/admin/partnerList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                                </c:if>
                            </c:if>
                        </div>
                    </div>

                </div>


            </div>


            <div class="tab-pane fade" id="asd">
                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
            </div>
            <div class="tab-pane fade" id="zxc">
                <p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut mattis leo, vel fermentum tellus. Sed sagittis rhoncus venenatis. Quisque commodo consectetur faucibus. Aenean eget ultricies justo.</p>
            </div>
        </div>
--%>


    </div>





</div>



<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/board.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#all_check').change(function(){
            var is_check = $(this).is(':checked');
            console.log('is_check =' + is_check);

            $('.row_check').prop('checked',is_check);
        });
    });
</script>



