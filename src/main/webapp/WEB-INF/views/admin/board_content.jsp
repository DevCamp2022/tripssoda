<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" href="/css/admin/combined_board.css" />

<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>



<%--    <div class="container">--%>
<%--        <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>--%>
<%--        <form id="form" class="frm" action="" method="post">--%>
<%--            <input type="hidden" name="id" value="${dto.id}">--%>
<%--    --%>
<%--            <input class="tit" name="title" type="text" value="${dto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}><br>--%>
<%--            <textarea class="con" name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${dto.content}</textarea><br>--%>
<%--    --%>
<%--            <c:if test="${mode eq 'new'}">--%>
<%--                <button type="button" id="writeBtn" >등록</button>--%>
<%--            </c:if>--%>
<%--            <c:if test="${mode ne 'new'}">--%>
<%--                <button type="button" id="writeNewBtn" >글쓰기</button>--%>
<%--            </c:if>--%>
<%--            <c:if test="${dto.id eq id}">--%>
<%--                <button type="button" id="modifyBtn" >수정</button>--%>
<%--                <button type="button" id="removeBtn" >삭제</button>--%>
<%--            </c:if>--%>
<%--            <button type="button" id="listBtn" > 목록</button>--%>
<%--        </form>--%>
<%--    </div>--%>


<div class="combined-wrap">

    <form id="form" class="frm" action="" method="post">
        <input type="hidden" name="id" value="${dto.id}">


        <table class="combined-list-tb">

        <c:if test='${mode eq "new"}'>
            <tr>
                <td colspan="9">

                    <select name="boardOption">
                        <option selected>--게시판선택--</option>
                        <option value="M001">공지사항</option>
                        <option value="M002">프로모션</option>
                        <option value="M003">자주묻는질문</option>
                    </select>
                </td>

            </tr>
        </c:if>

<%--  여기 조건문 손봐야함  --%>
        <c:if test="${mode ne 'new'}">
            <tr>
                <td colspan="10">
                    <button>수정</button>
                    <button>삭제</button>
                    <button type="button" id="listBtn"> 목록</button>
                </td>
            </tr>

<%--            <c:if test="${dto.id eq id}">--%>
<%--                <tr>--%>
<%--                    <td colspan="10">--%>
<%--                        <button type="button" id="modifyBtn">수정</button>--%>
<%--                        <button type="button" id="removeBtn">삭제</button>--%>
<%--                        <button type="button" id="listBtn"> 목록</button>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:if>--%>
        </c:if>


        <tr>
            <th class="tit" colspan="10">제목</th>
        </tr>
        <tr>
            <td class="con contit" colspan="10">
<%--                ${dto.title}--%>
                    <input name="title" type="text" value="${dto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>
            </td>
        </tr>

        <tr>
            <th class="tit" colspan="10">내용</th>
        </tr>
        <tr>
            <td class="con concon" colspan="10">
<%--                ${dto.content}--%>
                    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${dto.content}</textarea>
            </td>
        </tr>


    </table>

    <c:if test="${mode eq 'new'}">
        <button type="button" id="writeBtn">등록</button>
    </c:if>

    </form>

    <table>
        <c:if test="${mode ne 'new'}">
            <tr>
                <td><button>다음글</button></td>
            </tr>
            <tr>
                <td><button>이전글</button></td>
            </tr>
        </c:if>

    </table>
</div>






<script type="text/javascript" src="${pageContext.request.contextPath}/script/admin/board.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>
    $(document).ready(function(){

        let formCheck = function() {
            let form = document.getElementById("form");

            if(form.boardOption.selectedIndex==0){
                alert("게시판선택해주세요");
                return ;
            }

            if(form.title.value=="") {
                alert("제목을 입력해 주세요.");
                form.title.focus();
                return ;
            }

            if(form.content.value=="") {
                alert("내용을 입력해 주세요.");
                form.content.focus();
                return ;
            }
            return true;
        }

        <%--$("#writeNewBtn").on("click", function(){--%>
        <%--    location.href="<c:url value='/admin/write'/>";--%>
        <%--});--%>


        $("#writeBtn").on("click", function() {
            let form = $("#form");


            if (formCheck())
                if (!confirm("등록하시겠습니까?"))
                    return;
                else {
                    alert("url타쟈");
                    form.attr("action", "<c:url value='/admin/write'/>");
                    form.attr("method", "post");
                    form.submit();
                }
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');

            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("게시판 수정");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/board/modify${searchCondition.queryString}'/>");
            form.attr("method", "post");
            if(formCheck())
                form.submit();
        });

        $("#removeBtn").on("click", function(){
            if(!confirm("정말로 삭제하시겠습니까?")) return;

            let form = $("#form");
            form.attr("action", "<c:url value='/admin/remove${searchCondition.queryString}'/>");
            form.attr("method", "post");
            form.submit();
        });

        $("#listBtn").on("click", function(){
            location.href="<c:url value='/admin/boardList${searchCondition.queryString}'/>";
        });
    });
</script>