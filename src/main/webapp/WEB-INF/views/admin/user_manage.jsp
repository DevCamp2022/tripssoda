<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<link rel="stylesheet" href="/css/admin/combined_board.css" />

<div class="combined-wrap">
    <div class="b-tit">
        <h1>회원 관리</h1>
    </div>


    <div class="list-container">

<%--        <ul class="nav nav-tabs">--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link active" data-toggle="tab" href="#qwe">회원목록</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-toggle="tab" href="#asd">통계</a>--%>
<%--            </li>--%>
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" data-toggle="tab" href="#zxc">ZXC</a>--%>
<%--            </li>--%>
<%--        </ul>--%>

        <div class="tab-content">

            <div class="tab-pane fade show active" id="qwe">

            <div class="search-container">
                <form action="<c:url value="/admin/userList"/>" class="search-form" method="get">
                    <select class="search-option" name="option">
                        <option value="NA" ${ph.sc.option=='NA' ? "selected" : ""}>이름</option>
                        <option value="NI" ${ph.sc.option=='NI' ? "selected" : ""}>닉네임</option>
                        <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>이름+닉네임</option>
                    </select>

                    <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>

            <div class="user-container">

                <form name="boardListForm">
                    <table class="combined-list-tb">
                        <tr>
                            <td colspan="10">
                                <button disabled>전체선택</button>
                            </td>
                            <td colspan="1">
                                <button id="bDelBtn" type="button">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <th class="titb"><input type="checkbox" id="all_check"></th>
                            <th class="tit">번호</th>
                            <th class="tit">이름</th>
                            <th class="tit">닉네임</th>
                            <th class="tit">이메일</th>
                            <th class="tit">전화번호</th>
                            <th class="tit">성별</th>
                            <th class="tit">생일</th>
                            <th class="tit">그룹</th>
                            <th class="tit">가입일</th>
                            <th class="tit">상태</th>
                        </tr>

                        <c:forEach var="userDto" items="${list}">
                            <tr class="con-td">
                                <td class="con"><input type="checkbox" class="row_check" name="row_check" data-user-id="${userDto.id}"></td>
                                <td class="con" name="id">${userDto.id}</td>
                                <td class="con" name="name">${userDto.name}</td>
                                <td class="con" name="nickname">${userDto.nickname}</td>
                                <td class="con" id="email" data-menu-code="${userDto.email}">${userDto.email}</td>
                                <td class="con" name="tel">${userDto.tel}</td>
                                <td class="con">${userDto.gender}</td>
                                <td class="con"><fmt:formatDate value="${userDto.birthday}" pattern="yy-MM-dd" type="date"/></td>
                                <td class="con">
                                    <c:if test="${userDto.userCode eq 'U001'}">
                                          일반
                                    </c:if>
                                    <c:if test="${userDto.userCode eq 'U002'}">
                                        파트너
                                    </c:if>
                                    <c:if test="${userDto.userCode eq 'U003'}">
                                        관리자
                                    </c:if>
<%--                                        ${userDto.userCode}--%>
                                </td>
                                <td class="con"><fmt:formatDate value="${userDto.createdAt}" pattern="yy-MM-dd" type="date"/></td>
                                <td class="con"> ${userDto.status==1? '회원' : '탈퇴'} </td>


                            </tr>
                        </c:forEach>
                    </table>
                </form>


                <div class="paging-container">
                    <div class="paging">
                        <c:if test="${totalCnt==null || totalCnt==0}">
                            <div> 게시물이 없습니다. </div>
                        </c:if>
                        <c:if test="${totalCnt!=null && totalCnt!=0}">
                            <c:if test="${ph.showPrev}">
                                <a class="page" href="<c:url value="/admin/userList${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                            </c:if>
                            <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                                <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/userList${ph.sc.getQueryString(i)}"/>">${i}</a>
                            </c:forEach>
                            <c:if test="${ph.showNext}">
                                <a class="page" href="<c:url value="/admin/userList${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                            </c:if>
                        </c:if>
                    </div>
                </div>


            </div>

        </div>


        <div class="tab-pane fade" id="asd">
            <p>Nunc vitae turpis id nibh sodales commodo et non augue. Proin fringilla ex nunc. Integer tincidunt risus ut facilisis tristique.</p>
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
