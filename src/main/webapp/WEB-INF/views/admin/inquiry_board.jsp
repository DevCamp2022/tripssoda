<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" href="/css/admin/combined_board.css" />

<div>
    <div class="combined-wrap">
<%--    검색--%>

    <div class="b-tit">
        <h1>1:1 문의게시판</h1>

    </div>

    <div class="search-container">
        <form action="<c:url value="/admin/inquiry"/>" class="search-form" method="get">
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
                    <button type="button" id="bDelBtn" >삭제</button>
                </td>
            </tr>
            <tr>
                <th class="titb" ><input type="checkbox" id="all_check"></th>
                <th class="tit">번호</th>
                <th class="titt">제목</th>
                <th class="tit">작성자</th>
                <th class="tit">생성일</th>
                <th class="tit">상태</th>
            </tr>

            <c:forEach var="dto" items="${list}">
                <tr class="con-td">
                    <td class="con"><input type="checkbox" class="row_check" name="row_check" data-user-id="${dto.id}"></td>
                    <td class="con" name="id">${dto.id}</td>
                    <td class="con contitle ellipsis"><a href="/admin/inquiry/read${searchCondition.queryString}&id=${dto.id}" ><span>${dto.title}</span></a></td>
                    <td class="con">${dto.createdBy}</td>
                    <td class="con">
                        <fmt:formatDate value="${dto.createdAt}" pattern="yy-MM-dd" type="date"/>
                            <%--                        <fmt:formatDate value="${dto.createdAt}" pattern="HH:mm" type="time"/>--%>
                    </td>
                    <td class="con"> ${dto.status==1? '답변완료' : '미답변'} </td>
                </tr>
            </c:forEach>
        </table>
    </form>




<%--    페이징--%>
    <div class="paging-container">
        <div class="paging">
            <c:if test="${totalCnt==null || totalCnt==0}">
                <div> 게시물이 없습니다. </div>
            </c:if>
            <c:if test="${totalCnt!=null && totalCnt!=0}">
                <c:if test="${ph.showPrev}">
                    <a class="page" href="<c:url value="/admin/inquiry${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
                </c:if>
                <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/admin/inquiry${ph.sc.getQueryString(i)}"/>">${i}</a>
                </c:forEach>
                <c:if test="${ph.showNext}">
                    <a class="page" href="<c:url value="/admin/inquiry${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
                </c:if>
            </c:if>
        </div>
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
