<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="/css/admin/product_manage.css"/>

<div class="combined-wrap">
    <div class="b-tit">
        <h1>상품 관리</h1>
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
                        <th class="product-title">상품 제목</th>
                        <th class="price">가격</th>
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
                    <c:forEach var="unapproved" items="${unapprovedList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${unapproved.productId}</td>
                            <td class="con" name="userId">${unapproved.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${unapproved.partnerId}">${unapproved.companyName}</a>
                            </td>
                            <td class="con" name="title"><a
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${unapproved.productId}"><span class="product-title">${unapproved.title}</span></a>
                            </td>
                                <%--                            <td class="con" name="reqTime">${unapproved.reqTime}</td>--%>
                                <%--                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>--%>
                                <%--                            <td class="con" name="minMember">${unapproved.minMember}</td>--%>
                                <%--                            <td class="con" name="maxMember">${unapproved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${unapproved.productPrice}</td>
                            <td class="con status" name="approvalStatus"></td>
                                <%--                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>--%>
                            <script>

                                if(${unapproved.approvalStatus}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${unapproved.approvalStatus}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">승인완료</span>`);

                                } else if (${unapproved.approvalStatus}===2){
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
            <h4 class="box-title">반려된 상품 </h4>
        </div>
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <table class="table ">
                    <thead>


                    <tr>
                        <th class="order">No</th>
                        <th class="user-id">유저ID</th>
                        <th class="company-name">회사명</th>
                        <th class="product-title">상품 제목</th>
                        <th class="price">가격</th>
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
                    <c:forEach var="canceled" items="${canceledList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${canceled.productId}</td>
                            <td class="con" name="userId">${canceled.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${canceled.partnerId}">${canceled.companyName}</a>
                            </td>
                            <td class="con" name="title"><a
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${canceled.productId}"><span class="product-title">${canceled.title}</span></a>
                            </td>
                                <%--                            <td class="con" name="reqTime">${unapproved.reqTime}</td>--%>
                                <%--                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>--%>
                                <%--                            <td class="con" name="minMember">${unapproved.minMember}</td>--%>
                                <%--                            <td class="con" name="maxMember">${unapproved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${canceled.productPrice}</td>
                            <td class="con status" name="approvalStatus"></td>
                                <%--                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>--%>
                            <script>
                                if(${canceled.approvalStatus}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${canceled.approvalStatus}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">승인완료</span>`);

                                } else if (${canceled.approvalStatus}===2){
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
            <h4 class="box-title">승인 완료 된 상품 </h4>
        </div>
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <table class="table ">
                    <thead>


                    <tr>
                        <th class="order">No</th>
                        <th class="user-id">유저ID</th>
                        <th class="company-name">회사명</th>
                        <th class="product-title">상품 제목</th>
                        <th class="price">가격</th>
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
                    <c:forEach var="approved" items="${approvedList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${approved.productId}</td>
                            <td class="con" name="userId">${approved.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${approved.partnerId}">${approved.companyName}</a>
                            </td>
                            <td class="con" name="title"><a
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${approved.productId}"><span class="product-title">${approved.title}</span></a>
                            </td>
                                <%--                            <td class="con" name="reqTime">${unapproved.reqTime}</td>--%>
                                <%--                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>--%>
                                <%--                            <td class="con" name="minMember">${unapproved.minMember}</td>--%>
                                <%--                            <td class="con" name="maxMember">${unapproved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${approved.productPrice}</td>
                            <td class="con status" name="approvalStatus"></td>
                                <%--                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>--%>
                            <script>

                                if(${approved.approvalStatus}===0){
                                    $("td.status").last().html(`<span class="badge badge-warning">대기</span>`);

                                } else if (${approved.approvalStatus}===1) {
                                    $("td.status").last().html(`<span class="badge badge-complete">승인완료</span>`);

                                } else if (${approved.approvalStatus}===2){
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


    <%--------------------------------------------------------%>

<%--
    <div class="tab-pane fade show active" id="asd">
&lt;%&ndash;        <div class="search-container">&ndash;%&gt;
&lt;%&ndash;            <form action="<c:url value="/admin/productList"/>" class="search-form" method="get">&ndash;%&gt;
&lt;%&ndash;                <select class="search-option" name="option">&ndash;%&gt;
&lt;%&ndash;                    <option value="NA" ${ph.sc.option=='NA' ? "selected" : ""}>회사명</option>&ndash;%&gt;
&lt;%&ndash;                    <option value="NI" ${ph.sc.option=='NI' ? "selected" : ""}>닉네임</option>&ndash;%&gt;
&lt;%&ndash;                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름+닉네임</option>&ndash;%&gt;
&lt;%&ndash;                </select>&ndash;%&gt;

&lt;%&ndash;                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}"&ndash;%&gt;
&lt;%&ndash;                       placeholder="검색어를 입력해주세요">&ndash;%&gt;
&lt;%&ndash;                <input type="submit" class="search-button" value="검색">&ndash;%&gt;
&lt;%&ndash;            </form>&ndash;%&gt;
&lt;%&ndash;        </div>&ndash;%&gt;

        <div class="product-container">
            <h1 class="product-container-title">승인 대기 중 상품</h1>
            <form name="boardListForm">
                <table class="combined-list-tb">
                    <th class="titb"><input type="checkbox" id="all_check"></th>
                    <th class="tit user">유저ID</th>
                    <th class="tit company">회사명</th>
                    <th class="tit title">제목</th>
&lt;%&ndash;                    <th class="tit">소요시간</th>&ndash;%&gt;
&lt;%&ndash;                    <th class="tit">일정 수</th>&ndash;%&gt;
&lt;%&ndash;                    <th class="tit">최소 인원</th>&ndash;%&gt;
&lt;%&ndash;                    <th class="tit">최대 인원</th>&ndash;%&gt;
                    <th class="tit price">가격</th>
                    <th class="tit status">상태</th>
&lt;%&ndash;                    <th class="tit">취소사유</th>&ndash;%&gt;
                    </tr>

                    <c:forEach var="unapproved" items="${unapprovedList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${unapproved.productId}</td>
                            <td class="con" name="userId">${unapproved.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${unapproved.partnerId}">${unapproved.companyName}</a>
                            </td>
                            <td class="con" name="title"><a
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${unapproved.productId}">${unapproved.title}</a>
                            </td>
&lt;%&ndash;                            <td class="con" name="reqTime">${unapproved.reqTime}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="minMember">${unapproved.minMember}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="maxMember">${unapproved.maxMember}</td>&ndash;%&gt;
                            <td class="con" name="productPrice">${unapproved.productPrice}</td>
                            <td class="con" name="approvalStatus">${unapproved.approvalStatus==0?"대기":unapproved.approvalStatus==1?"완료":"취소"}</td>
&lt;%&ndash;                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>&ndash;%&gt;
                        </tr>
                    </c:forEach>
                </table>
            </form>

            <h1 class="product-container-title">반려된 상품</h1>
            <form name="boardListForm">
                <table class="combined-list-tb">
                    <th class="titb"><input type="checkbox" id="all_check"></th>
                    <th class="tit user">유저ID</th>
                    <th class="tit company">회사명</th>
                    <th class="tit title">제목</th>
                    &lt;%&ndash;                    <th class="tit">소요시간</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">일정 수</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">최소 인원</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">최대 인원</th>&ndash;%&gt;
                    <th class="tit price">가격</th>
                    <th class="tit status">상태</th>
                    &lt;%&ndash;                    <th class="tit">취소사유</th>&ndash;%&gt;
                    </tr>

                    <c:forEach var="canceled" items="${canceledList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${canceled.productId}</td>
                            <td class="con" name="userId">${canceled.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${canceled.partnerId}">${canceled.companyName}</a>
                            </td>
                            <td class="con" name="title"><a
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${canceled.productId}">${canceled.title}</a>
                            </td>
                                &lt;%&ndash;                            <td class="con" name="reqTime">${unapproved.reqTime}</td>&ndash;%&gt;
                                &lt;%&ndash;                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>&ndash;%&gt;
                                &lt;%&ndash;                            <td class="con" name="minMember">${unapproved.minMember}</td>&ndash;%&gt;
                                &lt;%&ndash;                            <td class="con" name="maxMember">${unapproved.maxMember}</td>&ndash;%&gt;
                            <td class="con" name="productPrice">${canceled.productPrice}</td>
                            <td class="con" name="approvalStatus">${canceled.approvalStatus==0?"대기":canceled.approvalStatus==1?"완료":"취소"}</td>
                                &lt;%&ndash;                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>&ndash;%&gt;
                        </tr>
                    </c:forEach>
                </table>
            </form>

            <h1 class="product-container-title">승인 완료된 상품</h1>
            <form name="boardListForm">
                <table class="combined-list-tb">
                    <th class="titb"><input type="checkbox" id="all_check"></th>
                    <th class="tit user">유저ID</th>
                    <th class="tit company">회사명</th>
                    <th class="tit title">제목</th>
                    &lt;%&ndash;                    <th class="tit">소요시간</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">일정 수</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">최소 인원</th>&ndash;%&gt;
                    &lt;%&ndash;                    <th class="tit">최대 인원</th>&ndash;%&gt;
                    <th class="tit price">가격</th>
                    <th class="tit status">상태</th>
                    </tr>

                    <c:forEach var="approved" items="${approvedList}">
                        <tr class="con-td">
                            <td class="con" name="productId">${approved.productId}</td>
                            <td class="con" name="userId">${approved.partnerId}</td>
                            <td class="con" name="companyName"><a
                                    href="/admin/partner/info${searchCondition.queryString}&id=${approved.partnerId}">${approved.companyName}</a>
                            </td>
                            <td class="con" name="title"><a class="title"
                                    href="/admin/productList/info${searchCondition.queryString}&productId=${approved.productId}">${approved.title}</a>
                            </td>
&lt;%&ndash;                            <td class="con" name="reqTime">${approved.reqTime}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="dayCnt">${approved.dayCnt}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="minMember">${approved.minMember}</td>&ndash;%&gt;
&lt;%&ndash;                            <td class="con" name="maxMember">${approved.maxMember}</td>&ndash;%&gt;
                            <td class="con" name="productPrice">${approved.productPrice}</td>
                            <td class="con" name="approvalStatus">${approved.approvalStatus==0?"대기":approved.approvalStatus==1?"완료":"취소"}</td>
                        </tr>
                    </c:forEach>
                </table>
            </form>

            <br>
            &lt;%&ndash;  &ndash;%&gt;
            <div class="paging-container">
                <div class="paging">
                    <c:if test="${totalCnt==null || totalCnt==0}">
                        <div> 게시물이 없습니다.</div>
                    </c:if>
                    <c:if test="${totalCnt!=null && totalCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page"
                               href="<c:url value="/admin/productList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}"
                               href="<c:url value="/admin/productList${ph.sc.getQueryString(i)}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page"
                               href="<c:url value="/admin/productList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                        </c:if>
                    </c:if>
                </div>
            </div>

        </div>
    </div>--%>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/board.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#all_check').change(function () {
            var is_check = $(this).is(':checked');
            console.log('is_check =' + is_check);

            $('.row_check').prop('checked', is_check);
        });
    });
</script>



