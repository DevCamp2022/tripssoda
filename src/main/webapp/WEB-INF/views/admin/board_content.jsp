<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" href="/css/admin/combined_board.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>



<div class="combined-wrap">
    <div class="combined-wrap-tit"><h1 class="writing-header">${mode=="new" ? "Board Register" : "Contents"}</h1></div>
    <form id="form" class="frm" action="" method="post">

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
                    <button type="button" id="modifyBtn">수정</button>
                    <button id="conDelBtn" type="button">삭제</button>
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
                    <input name="title" type="text" value="${combinedBoardDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>
            </td>
        </tr>

        <tr>
            <th class="tit" colspan="10">내용</th>
        </tr>
        <tr>
            <td class="con concon" colspan="10">
<%--                ${dto.content}--%>
                    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${combinedBoardDto.content}</textarea>
            </td>
        </tr>
<%--            <tr>--%>
<%--                <td>--%>
<%--                    <c:if test="${mode eq 'new'}">--%>
<%--                        <button type="button" id="writeBtn">등록</button>--%>
<%--                        <button type="button" id="resetBtn"> 취소</button>--%>

<%--                    </c:if>--%>
<%--                </td>--%>
<%--            </tr>--%>


    </table>
<%--            <c:if test="${mode eq 'new'}">--%>
<%--                <button type="button" id="writeBtn">등록</button>--%>
<%--                <button type="button" id="resetBtn"> 취소</button>--%>

<%--            </c:if>--%>

    </form>
    <c:if test="${mode eq 'new'}">
        <button type="button" id="writeBtn">등록</button>
        <button type="button" id="resetBtn"> 취소</button>

    </c:if>
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

            if(${mode eq 'new'})
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
                    form.attr("action", '/admin/write');
                    form.attr("method", "post");
                    form.submit();
                }
        });

        $("#modifyBtn").on("click", function(){
            let form = $("#form");
            let isReadonly = $("input[name=title]").attr('readonly');

            // 1. 읽기 상태이면, 수정 상태로 변경
            if(isReadonly=='readonly') {
                $(".writing-header").html("Board Modify");
                $("input[name=title]").attr('readonly', false);
                $("textarea").attr('readonly', false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                $("#listBtn").html("취소");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/admin/boardModify${searchCondition.queryString}+&id=${param.id}'/>");
            form.attr("method", "post");
            alert("왓나 / ");
            if(formCheck()) {
                alert("수정ㄱ");
                form.submit();
            }
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

        $("#resetBtn").on("click", function(){
            if(!confirm("글 작성을 취소하시겠습니까?")){
                return;
            }else{
            location.href="<c:url value='/admin/boardList${searchCondition.queryString}'/>";
            }
        });

        $('#conDelBtn').on('click', function(){
            location.href="<c:url value='/admin/remove${searchCondition.queryString}'/>";
        })

    });
</script>