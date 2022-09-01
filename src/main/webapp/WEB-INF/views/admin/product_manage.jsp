<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<link rel="stylesheet" href="/css/admin/product_manage.css"/>

<div class="combined-wrap">
    <div class="b-tit">
        <h1>상품 관리</h1>
    </div>

    <div class="tab-pane fade show active" id="asd">
<%--        <div class="search-container">--%>
<%--            <form action="<c:url value="/admin/productList"/>" class="search-form" method="get">--%>
<%--                <select class="search-option" name="option">--%>
<%--                    <option value="NA" ${ph.sc.option=='NA' ? "selected" : ""}>회사명</option>--%>
<%--                    <option value="NI" ${ph.sc.option=='NI' ? "selected" : ""}>닉네임</option>--%>
<%--                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름+닉네임</option>--%>
<%--                </select>--%>

<%--                <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}"--%>
<%--                       placeholder="검색어를 입력해주세요">--%>
<%--                <input type="submit" class="search-button" value="검색">--%>
<%--            </form>--%>
<%--        </div>--%>

        <div class="product-container">
            <h1 class="product-container-title">승인 대기 중 상품</h1>
            <form name="boardListForm">
                <table class="combined-list-tb">
                    <th class="titb"><input type="checkbox" id="all_check"></th>
                    <th class="tit user">유저ID</th>
                    <th class="tit company">회사명</th>
                    <th class="tit title">제목</th>
<%--                    <th class="tit">소요시간</th>--%>
<%--                    <th class="tit">일정 수</th>--%>
<%--                    <th class="tit">최소 인원</th>--%>
<%--                    <th class="tit">최대 인원</th>--%>
                    <th class="tit price">가격</th>
                    <th class="tit status">상태</th>
<%--                    <th class="tit">취소사유</th>--%>
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
<%--                            <td class="con" name="reqTime">${unapproved.reqTime}</td>--%>
<%--                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>--%>
<%--                            <td class="con" name="minMember">${unapproved.minMember}</td>--%>
<%--                            <td class="con" name="maxMember">${unapproved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${unapproved.productPrice}</td>
                            <td class="con" name="approvalStatus">${unapproved.approvalStatus==0?"대기":nnapproved.approvalStatus==1?"완료":"취소"}</td>
<%--                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>--%>
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
                    <%--                    <th class="tit">소요시간</th>--%>
                    <%--                    <th class="tit">일정 수</th>--%>
                    <%--                    <th class="tit">최소 인원</th>--%>
                    <%--                    <th class="tit">최대 인원</th>--%>
                    <th class="tit price">가격</th>
                    <th class="tit status">상태</th>
                    <%--                    <th class="tit">취소사유</th>--%>
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
                                <%--                            <td class="con" name="reqTime">${unapproved.reqTime}</td>--%>
                                <%--                            <td class="con" name="dayCnt">${unapproved.dayCnt}</td>--%>
                                <%--                            <td class="con" name="minMember">${unapproved.minMember}</td>--%>
                                <%--                            <td class="con" name="maxMember">${unapproved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${canceled.productPrice}</td>
                            <td class="con" name="approvalStatus">${canceled.approvalStatus==0?"대기":canceled.approvalStatus==1?"완료":"취소"}</td>
                                <%--                            <td class="con" name="canceledReason">${unapproved.approvalStatus==0?"대기":napproved.approvalStatus==1?"완료":"취소"}</td>--%>
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
                    <%--                    <th class="tit">소요시간</th>--%>
                    <%--                    <th class="tit">일정 수</th>--%>
                    <%--                    <th class="tit">최소 인원</th>--%>
                    <%--                    <th class="tit">최대 인원</th>--%>
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
<%--                            <td class="con" name="reqTime">${approved.reqTime}</td>--%>
<%--                            <td class="con" name="dayCnt">${approved.dayCnt}</td>--%>
<%--                            <td class="con" name="minMember">${approved.minMember}</td>--%>
<%--                            <td class="con" name="maxMember">${approved.maxMember}</td>--%>
                            <td class="con" name="productPrice">${approved.productPrice}</td>
                            <td class="con" name="approvalStatus">${approved.approvalStatus==0?"대기":approved.approvalStatus==1?"완료":"취소"}</td>
                        </tr>
                    </c:forEach>
                </table>
            </form>

            <br>
            <%--  --%>
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
    </div>
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



