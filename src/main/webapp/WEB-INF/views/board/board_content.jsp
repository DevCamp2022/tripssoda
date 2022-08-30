<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<link rel="stylesheet" href="/css/board/combined_board.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<div class="combined-wrap">
    <div class="combined-wrap-tit"><h1 class="writing-header">${menuCode == 'M001'?'공지사항':menuCode=='M002'?'프로모션':menuCode=='M003'?'자주묻는질문':'게시판'}</h1></div>
    <table class="combined-list-tb">
        <tr>
            <th class="tit" >제목</th>
            <th class="title">${combinedBoardDto.title}</th>
            <th class="date"><fmt:formatDate value="${combinedBoardDto.createdAt}" pattern="yyyy-MM-dd"/></th>
        </tr>
        <tr>
            <td class="content" colspan="3">
                ${combinedBoardDto.content}
            </td>
        </tr>
    </table>
    <div class="pagination">
        <a href="/board/list?menuCode=${menuCode}" class="to-list">목록으로</a>
    </div>
<%--    <table>--%>
<%--        <c:if test="${mode ne 'new'}">--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <button>다음글</button>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <button>이전글</button>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:if>--%>

<%--    </table>--%>
</div>


<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/board.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>

