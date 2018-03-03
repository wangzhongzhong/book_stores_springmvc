<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>图书页面</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
</head>
<body>

	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>

	<!-- 图书的内容begin -->
	<div class="container" id="list_book">

	</div>

	<!-- 图书的内容end -->
	<%@ include file="/WEB-INF/jsp/top/bottom.jsp" %>

	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>
	<script src="${path}/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>

		<script>
			$("#list_book").load("${pageContext.request.contextPath}/listAllBookPageBean");
			function query(pageNow) {
				$("#list_book").load("${pageContext.request.contextPath}/listAllBookPageBean",{"pageNow":pageNow})
            }
            function find(pageCount) {
			    //需要先获取我们的输入框的数据
				var pageNow = $("#searchs").val()
				if(pageNow<1 || pageNow>pageCount){
				    alert("页码输入有误!")
				}else{
                    $("#list_book").load("${pageContext.request.contextPath}/listAllBookPageBean",{"pageNow":pageNow});
				}
            }

		</script>

</body>
</html>