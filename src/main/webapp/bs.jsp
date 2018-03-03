<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>首页</title>
	</head>
	<body>
		
		<!-- 设置一个全局变量的path -->
		<c:set var="path" value="${pageContext.request.contextPath}" scope="application"></c:set>
		<!-- 设置一下跳转的页面 -->
		<jsp:forward page="/listAll"></jsp:forward>
	</body>
</html>