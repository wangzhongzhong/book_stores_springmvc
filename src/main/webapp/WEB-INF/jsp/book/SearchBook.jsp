<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>图书列表</title>
	</head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
	<body>
		
	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>
		
	<!-- 图书的内容begin -->
	<div id="container" class="container">


	</div>

	<%@ include file="/WEB-INF/jsp/top/bottom.jsp" %>
		
	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>
	<script type="text/javascript">

		$("#container").load("${pageContext.request.contextPath}/searchBook",{"likeName":$("#likeName").val()})

        function query(pageNow) {
            $("#container").load("${pageContext.request.contextPath}/searchBook",{"pageNow":pageNow,"likeName":$("#likeName").val()})
        }
	</script>
	</body>
</html>