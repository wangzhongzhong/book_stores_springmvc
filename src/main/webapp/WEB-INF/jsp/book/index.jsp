<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>首页</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/top/top.jsp"></jsp:include>


	<!-- 图书的内容begin -->
	<div class="container">

		<!--精选图书 begin-->
		<div>
			<div class="text-primary">
				<a href="#">精选图书</a>
			</div>
			<div id="first">


			</div>

		</div>
		<!--精选图书 end-->

		<!-- 推荐图书begin -->
		<div>
			<div class="text-primary">
				<a href="#">推荐图书</a>
			</div>
			<div class="row" id="second">

			</div>
			<!-- 分页end -->
		</div>
		<!-- 推荐图书end -->

		<!-- 特价图书begin -->
		<div>
			<div class="text-primary">
				<a href="#">特价图书</a>
			</div>
			<div class="row" id="three">


			</div>
			<!-- 分页end -->
		</div>
		<!-- 特价图书end -->

		<!-- 底部公司信息begin -->
		<jsp:include page="/WEB-INF/jsp/top/bottom.jsp"></jsp:include>
		<!-- 底部公司信息end -->

	</div>
	<!-- 图书的内容end -->


	
	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>
	<script src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>
	<script>

		//精选图书的分页操作
        $("#first").load("${pageContext.request.contextPath}/findPageBean",{"obj":"精选图书"})
        //推荐图书的分页
        $("#second").load("${pageContext.request.contextPath}/findPageBean",{"obj":"推荐图书"});
        $("#three").load("${pageContext.request.contextPath}/findPageBean",{"obj":"特价图书"});
			function findPage(pageNow,obj) {
			    if(obj=="精选图书"){
                    $("#first").load("${pageContext.request.contextPath}/findPageBean",{"pageNow":pageNow,"obj":obj});
				}else if(obj=="推荐图书"){
                    $("#second").load("${pageContext.request.contextPath}/findPageBean",{"pageNow":pageNow,"obj":obj});
                }else{
                    $("#three").load("${pageContext.request.contextPath}/findPageBean",{"pageNow":pageNow,"obj":obj});
                }
            }



	</script>

</body>
</html>