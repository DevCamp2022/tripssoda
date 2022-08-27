<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<link rel="stylesheet" href="/css/admin/combined_board.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<script>
    let msg = "${msg}";
    if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
    if(msg=="MOD_SUCCESS") alert("게시물이 수정되었습니다.");
</script>



<div class="combined-wrap">
    <div class="combined-wrap-tit"><h1 class="writing-header">Inquiry Board</h1></div>
    <form id="form" class="frm" action="" method="post">

        <table class="combined-list-tb">

            <tr>
                <td colspan="10" class="bc-button-wrap">
<%--                    <button class="bc-btn" type="button" id="modifyBtn">답변</button>--%>
<%--                    <button class="bc-btn" id="conDelBtn" type="button">삭제</button>--%>
                    <button class="bc-btn" type="button" id="listBtn"> 목록</button>
                </td>
            </tr>



            <tr>
                <th class="tit" colspan="10">제목</th>
            </tr>
            <tr>
                <td class="con contit" colspan="10">
    <%--                ${dto.title}--%>
                        <input name="title" type="text" value="${combinedBoardDto.title}" placeholder="  제목을 입력해 주세요." readonly>${combinedBoardDto.title}
                </td>
            </tr>

            <tr>
                <th class="tit" colspan="10">내용</th>
            </tr>
            <tr>
                <td class="con concon" colspan="10">
    <%--                ${dto.content}--%>
                        <textarea name="content" id="unitContent" rows="20px" placeholder=" 내용을 입력해 주세요." >${combinedBoardDto.content}</textarea>
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
<%--        <tr>--%>
<%--            <td><span class="img-length"></span>글자수</td>--%>
<%--        </tr>--%>

    </table>
<%--            <c:if test="${mode eq 'new'}">--%>
<%--                <button type="button" id="writeBtn">등록</button>--%>
<%--                <button type="button" id="resetBtn"> 취소</button>--%>

<%--            </c:if>--%>

    </form>
<%--    <c:if test="${mode eq 'new'}">--%>
        <button type="button" id="answerBtn">답변</button>
        <button type="button" id="resetBtn"> 취소</button>

<%--    </c:if>--%>
<%--    <table>--%>
<%--        <c:if test="${mode ne 'new'}">--%>
<%--            <tr>--%>
<%--                <td><button>다음글</button></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><button>이전글</button></td>--%>
<%--            </tr>--%>
<%--        </c:if>--%>

<%--    </table>--%>
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

            if(CKEDITOR.instances.unitContent.getData()==''
                ||CKEDITOR.instances.unitContent.getData().length==0) {
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
                // $("textarea").attr('contenteditable', true);
                CKEDITOR.instances.unitContent.setReadOnly(false);
                $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
                $("#listBtn").html("취소");
                return;
            }

            // 2. 수정 상태이면, 수정된 내용을 서버로 전송
            form.attr("action", "<c:url value='/admin/boardModify${searchCondition.queryString}+&id=${param.id}+&menuCode=${combinedBoardDto.menuCode}'/>");
            form.attr("method", "post");
            if(formCheck()) {
                form.submit();
            }
        });

        //삭제버튼 눌렀을때
        $("#conDelBtn").on("click", function(){
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

        <%--$('#conDelBtn').on('click', function(){--%>
        <%--    location.href="<c:url value='/admin/remove${searchCondition.queryString}'/>";--%>
        <%--})--%>


        CKEDITOR.instances.unitContent.on('keyup',function(e) {

            console.log("키업!");
            alert("sdf");
            // var content = $(this).val();
            // $("#textLengthCheck").text("(" + content.length + " / 최대 45자)"); //실시간 글자수 카운팅
            // if (content.length > 45) {
            //     alert("최대 45자까지 입력 가능합니다.");
            //     $(this).val(content.substring(0, 45));
            //     $('#textLengthCheck').text("(45 / 최대 45자)");
            // }
        });




        ///

        //editor 의 id 값을 넣어줍니다.
        var editorStatus = false;
        var editor = CKEDITOR.instances.unitContent;

        //editor 텍스트가 변경되면 setContentsLength() 를 호출 경고창을 계속 띄운다.
        editor.on('change', function (event) {
            console.log('ggogogo');
            setContentsLength(this, 5, 300);
        });

        function setContentsLength(obj, imgMax, textMax) {
            var str = obj.getData();
            var status = false;
            var results = str.match(/<img/g);
            var imgCnt = 0;
            var textCnt = 0;
            var editorText = f_SkipTags_html(str);
            editorText = editorText.replace(/\s/gi,"");
            editorText = editorText.replace(/&nbsp;/gi, "");

            if(results != null) {
                imgCnt = results.length;
                $('.img-length').text(imgCnt+"장");
                if(imgCnt > imgMax) {
                    status = true;
                }
            }

            if(textCnt > textMax) {
                status = true;
            }

            if(status) {
                var msg = "등록오류\n글자수는 최대 "+textMax+"까지 등록이 가능합니다.\n현재 글자수 : "+textCnt+"자";
                if(obj.name == "ideaDetail3") {
                    msg = "등록오류\n글자수는 최대 "+textMax+"자, 이미지는 "+imgMax+"장까지만 사용이 가능합니다.\n총 글자수 : "+textCnt+"자, 총 이미지수 : "+imgCnt+"장";
                }
                alert(msg);
            }

            //추후 form submit할때 체크할 데이터(true 일 경우 데이터 넘기지 않음-오류)
            editorStatus = status;
        }

//태그제거용
        function f_SkipTags_html(input, allowed) {
            allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); // making sure the allowed arg is a string containing only tags in lowercase (<a><b><c>)
            var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
                commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
            return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
                return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
            });
        }

    });
</script>