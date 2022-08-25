<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%--
    <script type="text/javascript">
        const CONTEXT_PATH = "${CONTEXT_PATH}";
        const RESOURCES_PATH = "${RESOURCES_PATH}";
    </script>
    --%>
    <link href="/css/common/reset.css" rel='stylesheet'/>
    <link href="/css/common/tiles_sub_layout.css" rel='stylesheet'/>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


</head>

<body>
<div class='wrap'>
    <div class="header-wrap">
        <tiles:insertAttribute name="header"/>
    </div>
    <div class="content-container">
        <div class="content-wrap">
            <div class="left-wrap">
                <tiles:insertAttribute name="part"/>
            </div>
            <div class='right-wrap'>
                <tiles:insertAttribute name="content"/>
            </div>
        </div>
    </div>
    <div class="footer-wrap">
        <tiles:insertAttribute name="footer"/>
    </div>
</div>
</body>

</html>