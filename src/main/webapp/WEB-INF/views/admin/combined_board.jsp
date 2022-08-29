<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" href="/css/admin/combined_board.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>


<script>
    let msg = "${msg}";
    if(msg=="DEL_OK") alert("게시물이 삭제되었습니다.");
    if(msg=="DEL_ERR") alert("게시물 삭제에 실패했습니다. 다시 시도해 주세요.");

</script>


<div class="combined-wrap">
    <div class="b-tit">
        <c:if test='${param.menuCode==null}'><h1>Combined Board</h1></c:if>
        <c:if test='${param.menuCode=="M001"}'><h1>Notice Board</h1></c:if>
        <c:if test='${param.menuCode=="M002"}'><h1>Promotion Board</h1></c:if>
        <c:if test='${param.menuCode=="M003"}'><h1>FAQ Board</h1></c:if>
        <c:if test='${param.menuCode=="M004"}'><h1>Inquiry Board</h1></c:if>
    </div>

    <div class="search-container">
        <form action="<c:url value="/admin/boardList"/>" class="search-form" method="get">
            <select class="search-option" name="option">
                <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>
                <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>
                <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>
            </select>

            <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">
            <input type="submit" class="search-button" value="검색">
        </form>
    </div>


    <form name="boardListForm">
        <table class="combined-list-tb">
            <tr >
                <td colspan="11"  class="board-btns">
                    <button type="button" id="writeBtn">글쓰기</button>
                    <button type="button" id="bDelBtn" >삭제</button>
                </td>
            </tr>
            <tr>
                <th class="titb" ><input type="checkbox" id="all_check"></th>
                <th class="tit">번호</th>
                <th class="tit">구분</th>
                <th class="titt">제목</th>
                <th class="tit">조회수</th>
                <th class="tit">상태</th>
                <th class="tit">생성일</th>
                <th class="tit">작성자</th>
                <th class="tit">수정일</th>
                <th class="tit">수정자</th>
            </tr>

            <c:forEach var="dto" items="${list}">
                <tr class="con-td">
                    <td class="con"><input type="checkbox" class="row_check" name="row_check" data-user-id="${dto.id}"></td>
                    <td class="con" name="id">${dto.id}</td>
                    <td class="con" id="menuCode" data-menu-code="${dto.menuCode}">
                        <c:if test="${dto.menuCode eq 'M001'}">
                            공지사항
                        </c:if>
                        <c:if test="${dto.menuCode eq 'M002'}">
                            프로모션
                        </c:if>
                        <c:if test="${dto.menuCode eq 'M003'}">
                            FAQ
                        </c:if>
<%--                            ${dto.menuCode}--%>
                    </td>
                    <td class="con contitle ellipsis"><a href="/admin/boardContent${searchCondition.queryString}&id=${dto.id}" ><span>${dto.title}</span></a></td>
                    <%--<td>${dto.content}</td>--%>
                    <td class="con">${dto.viewCnt}</td>
                    <td class="con"> ${dto.status==1? '게시중' : '삭제'} </td>

                    <td class="con">
                        <fmt:formatDate value="${dto.createdAt}" pattern="yy-MM-dd" type="date"/>
<%--                        <fmt:formatDate value="${dto.createdAt}" pattern="HH:mm" type="time"/>--%>
                    </td>
                    <td class="con">${dto.createdBy}</td>
                    <td class="con">
                        <fmt:formatDate value="${dto.updatedAt}" pattern="yy-MM-dd" type="date"/>
<%--                        <fmt:formatDate value="${dto.updatedAt}" pattern="HH:mm" type="time"/>--%>
                    </td>
                    <td class="con">${dto.updatedBy}</td>
                </tr>
            </c:forEach>
        </table>
    </form>


    <br>
    <div class="paging-container">
        <div class="paging">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다. </div>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value="/admin/boardList${ph.sc.getQueryString(ph.beginPage-1)}&menuCode=${param.menuCode}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/boardList${ph.sc.getQueryString(i)}&menuCode=${param.menuCode}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page" href="<c:url value="/admin/boardList${ph.sc.getQueryString(ph.endPage+1)}&menuCode=${param.menuCode}"/>">&gt;</a>
                </c:if>
            </c:if>
        </div>
    </div>

</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/board.js"></script>

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
