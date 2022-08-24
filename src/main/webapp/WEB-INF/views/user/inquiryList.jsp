<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<title>내 1:1 문의</title>
<link rel="stylesheet" href="<c:url value="/css/user/inquiryList.css"/>">
<script src="https://kit.fontawesome.com/66af10c0bc.js" crossorigin="anonymous"></script>

<script>
    let msg = "${msg}";
    if(msg == "MOD_OK") alert("문의글을 수정하였습니다.")
    if(msg == "MOD_ERR") alert("오류가 발생하여 문의글 수정에 실패했습니다. 다시 시도해주세요.")
    if(msg == 'DEL_OK') alert("문의글을 삭제하였습니다.")
    if(msg == "DEL_ERR") alert("오류가 발생하여 문의글 삭제에 실패했습니다. 다시 시도해주세요.")
    if(msg == 'WRT_OK') alert("문의글을 등록하였습니다.")
</script>
<div class="main">
    <div class="contents">
        <h2 class="title">내 1:1 문의</h2>
        <div class="thead-wrap">
            <div class="thead-id">번호</div>
            <div class="thead-title">제목</div>
            <div class="thead-date">문의 날짜</div>
            <div class="thead-status">답변 상태</div>
        </div>
        <c:forEach var="inquiryDto" items="${inquiryDtoList}">
            <div class="td-wrap">
                <div class="td-id">${inquiryDto.id}</div>
                <a class="td-title" href="<c:url value="/mypage/inquiryList/read${ph.sc.getQueryString()}&id=${inquiryDto.id}"/>">${inquiryDto.title}</a>
                <div class="td-date"><fmt:formatDate value="${inquiryDto.createdAt}" pattern="yyyy-MM-dd"/></div>
                <div class="td-status">${inquiryDto.status == "0" ? "답변 대기" : "답변 완료"}</div>
            </div>
        </c:forEach>
        <button class="write-btn"><i class="fa fa-edit"></i>글쓰기</button>
        <div class="paging-container">
            <div class="paging">
                <c:if test="${totalCnt==null || totalCnt==0}">
                    <div> 게시물이 없습니다. </div>
                </c:if>
                <c:if test="${totalCnt!=null && totalCnt!=0}">
                    <c:if test="${ph.showPrev}">
                        <a class="page" href="<c:url value="/mypage/inquiryList${ph.sc.getQueryString(ph.beginPage-1)}"/>"><i class="fa-solid fa-circle-arrow-left"></i></a>
                    </c:if>
                    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                        <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/mypage/inquiryList${ph.sc.getQueryString(i)}"/>">${i}</a>
                    </c:forEach>
                    <c:if test="${ph.showNext}">
                        <a class="page" href="<c:url value="/mypage/inquiryList${ph.sc.getQueryString(ph.endPage+1)}"/>"><i class="fa-solid fa-circle-arrow-right"></i></a>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>
</div>
<script>
    $(".write-btn").on("click", function () {
        location.href="/mypage/inquiryList/write";
    })
</script>

