<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 Q&A</title>
<link rel="stylesheet" href="<c:url value="/css/user/qnaList.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<script>
    let msg = '${msg}';
    if(msg == 'DEL_OK') alert("질문이 삭제되었습니다.");
    if(msg == 'DEL_ERR') alert("예기치 않은 오류로 질문 삭제에 실패했습니다. 나중에 다시 시도해주세요");
    if(msg == 'MOD_OK') alert("질문을 수정하였습니다.");
</script>
<div class="main">
    <div class="contents">
        <h2 class="title">내 Q&A</h2>
        <div class="question">
            <div class="menu">
                <div class="show-question">작성한 질문 (${totalQuestionCnt})</div>
                <div class="show-answer">작성한 답변 (${totalAnswerCnt}) </div>
            </div>
            <c:forEach var="questionDto" items="${questionDtoList}">
                <div class="question-info">
                    <span class="place">${questionDto.cityName}</span>
                    <span class="answer-status">${questionDto.status=="1" ? "답변완료" : "답변대기"}</span>
                    <div class="question-title"><a href="/question/read?id=${questionDto.id}">${questionDto.title}</a></div>
                    <div class="hashtag-wrap">
                        <div class="first-tag">${questionDto.hashtag}</div>
                    </div>
                    <button class="update-btn">수정</button>
                    <button class="delete-btn">삭제</button>
                    <i class="fa-solid fa-eye"></i><span class="view-cnt"> ${questionDto.viewCnt}</span>
                    <i class="fa-regular fa-comment"></i><span class="answer-cnt"> ${questionDto.ansCnt}</span>
                    <input type="hidden" name="id" value="${questionDto.id}">
                </div>
            </c:forEach>
            <input type="hidden" name="toURL" value="${toURL}">
            <input type="hidden" name="page" value="${param.page}">
            <input type="hidden" name="pageSize" value="${param.pageSize}">
            <div class="paging-container">
                <div class="paging">
                    <c:if test="${totalQuestionCnt==null || totalQuestionCnt==0}">
                        <div> 게시물이 없습니다. </div>
                    </c:if>
                    <c:if test="${totalQuestionCnt!=null && totalQuestionCnt!=0}">
                        <c:if test="${ph.showPrev}">
                            <a class="page" href="<c:url value="/mypage/qnaList${ph.sc.getQueryString(ph.beginPage-1)}"/>"><i class="fa-solid fa-circle-arrow-left"></i></a>
                        </c:if>
                        <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/qnaList${ph.sc.getQueryString(i)}"/>">${i}</a>
                        </c:forEach>
                        <c:if test="${ph.showNext}">
                            <a class="page" href="<c:url value="/mypage/qnaList${ph.sc.getQueryString(ph.endPage+1)}"/>"><i class="fa-solid fa-circle-arrow-right"></i></a>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // 작성한 답변 탭 눌렀을 때
    $(".show-answer").on("click", function() {
        location.href="/mypage/answerList";
    });

    // 작성한 질문 탭 눌렀을 때
    $(".show-question").on("click", function() {
        location.href="/mypage/qnaList";
    });

    // Q&A의 삭제버튼 눌렀을 때
    $(".delete-btn").on("click", function () {
        let id = $(this).parent().children('input[name=id]').val();
        let page = $("input[name=page]").val();
        let pageSize = $("input[name=pageSize]").val();

        if(!confirm("정말로 삭제하시겠습니까?")) {
            return;
        }
        $.ajax({
            type: "post",
            url : '/mypage/qnaList/delete',
            traditional: true,
            data : { id:id, page:page, pageSize:pageSize},
            success : function(data){
                if(data=="success"){
                    location.href = "/mypage/qnaList?page="+ page + "&pageSize=" + pageSize;
                    alert("게시글이 삭제되었습니다");
                }else if(data=="fail"){
                    alert("예기치 않은 오류로 게시글 삭제에 실패했습니다. 나중에 다시 시도해주세요");
                }

            },
            error : function(){
                console.log(err);
            }
        })
    })
    // 수정버튼 눌렀을 때
    $(".update-btn").on("click", function () {
        let questionId = $(this).parent().children("input[name=id]").val();
        let toURL = $(this).parent().children("input[name=toURL]").val();
        let page = $("input[name=page]").val();
        let pageSize = $("input[name=pageSize]").val();

        location.href="/question/modify?id=" + questionId + "&toURL=" + toURL + "&page=" + page + "&pageSize=" + pageSize;
    });
</script>

