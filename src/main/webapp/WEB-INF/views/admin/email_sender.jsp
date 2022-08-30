<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<link rel="stylesheet" href="/css/admin/email_sender.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>

<div class="email-sender-wrap">
    <div class="frm-wrap">
        <form id="email-sender-frm" ><%--action="/admin/email/send" method="post">--%>
            <div class="receiver-wrap detail-wrap">
                <span class="receiver ">받는사람</span>
                <select name="receiver" class="receiver email-sel">
                    <option value="U001">일반유저</option>
                    <option value="U002">파트너</option>
                </select>
            </div>
            <div class="title-wrap detail-wrap">
                <span class="title">제목</span>
                <input name="title" class="title email-inp" type="text"/>
            </div>
            <textarea name="content" class="content email-inp" type="text"></textarea>
            <button type="button" id="send-email">전송하기</button>
        </form>

    </div>
</div>

<script src="${pageContext.request.contextPath}/script/admin/email_sender.js"></script>
