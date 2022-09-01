<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<link rel="stylesheet" href="/css/admin/combined_board.css" />
<link rel="stylesheet" href="/css/admin/partner_manage.css" />

<div class="combined-wrap">
    <div class="b-tit">
        <h1>파트너 관리</h1>
    </div>


    <div class="list-container">

<%--        <ul class="nav nav-tabs">--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link active" data-toggle="tab" href="#qwe">파트너목록</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-toggle="tab" href="#asd">상품목록</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-toggle="tab" href="#zxc">통계</a>--%>
<%--            </li>--%>
<%--        </ul>--%>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="qwe">
<%--                <div class="search-container">--%>
<%--                    <form action="<c:url value="/admin/partnerList"/>" class="search-form" method="get">--%>
<%--                        <select class="search-option" name="option">--%>
<%--                            <option value="NA" ${ph.sc.option=='NA' ? "selected" : ""}>회사명</option>--%>
<%--                            <option value="NI" ${ph.sc.option=='NI' ? "selected" : ""}>닉네임</option>--%>
<%--                            <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름+닉네임</option>--%>
<%--                        </select>--%>

<%--                        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">--%>
<%--                        <input type="submit" class="search-button" value="검색">--%>
<%--                    </form>--%>
<%--                </div>--%>

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
                                    <td class="con"> ${partner.onPartnership==1? '파트너' : '해지'} </td>
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
                                    <td class="con" name="conclusionDate">${cancelled.conclusionDate}</td>
                                    <td class="con"> ${cancelled.onPartnership==2? '반려' : '해지'} </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </form>


                    <form name="boardListForm">
                        <table class="combined-list-tb">
<%--                            <tr>--%>
<%--                               <td colspan="5">--%>
    <%--                                    <button disabled>전체선택</button>--%>
    <%--                                </td>--%>
    <%--                                <td colspan="3">--%>
    <%--                                    <button id="bDelBtn" type="button">삭제</button>--%>
    <%--                                </td>--%>
    <%--                            </tr>--%>
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
                    <%--  --%>
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



