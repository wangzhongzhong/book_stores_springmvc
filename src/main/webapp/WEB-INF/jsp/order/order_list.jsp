<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>订单列表页面</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/order_list.css"/>

<style type="text/css">
	tr td{
		margin:auto;
	}
</style>

</head>
<body>

	<jsp:include page="/WEB-INF/jsp/top/top.jsp"/>

	<!--订单begin-->
	<!--外层div-->
	<div class="container">

		<!--左边-->
		<div class="container pull-left">
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的订单</a></li>
			</ol>

			<!--订单查询导航 begin-->
			<div>
				<nav class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<a class="navbar-brand" href="${pageContext.request.contextPath}/myOrder">所有订单</a>
					</div>

					<form class="navbar-form navbar-left" role="search">
						<input type="text" id="searchOrderNo" value="${likeOrderNo }" name="likeOrder" class="form-control" placeholder="输入订单号进行查询">
						<button type="button" onclick="queryOrderByOrderNo();" class="btn btn-search">
							<span class="text-success">Search</span>&nbsp;&nbsp;<span
								class="glyphicon glyphicon-search"></span>
						</button>
					</form>

					<%--<ul class="nav navbar-nav navbar-left" style="padding-top:10px">--%>
						<%--<select class="form-control" id="softDate">--%>
							<%--<option value="down">订单日期降序</option>--%>
							<%--<option value="top">订单日期升序</option>--%>
						<%--</select>--%>
					<%--</ul>--%>
					<ul class="nav navbar-nav navbar-right">
						<li style="padding-right: 15px;"><a data-toggle="collapse"
							data-parent="#accordion" href="#collapseTwo">更多筛选条件</a></li>
					</ul>

					<ul class="nav navbar-nav">
						<li><a href="#" onclick="deleteOrder();">删除订单</a></li>
					</ul>
					<ul class="nav navbar-nav">
						<li><a href="${pageContext.request.contextPath}/bs/order/deleteMoreOrder?user_id=${user.id}">清空订单列表</a></li>
					</ul>
				</nav>
			</div>
			
			<!-- 订单查询end -->

			<!--订单查询导航 end-->

			<!--日期控件-->
			<div id="collapseTwo" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="form-group">
						<div>
							<form action="${pageContext.request.contextPath}/bs/order/searchOrderByDate" method="post" class="form-horizontal">
								<div class="form-group has-feedback">
									<div class="col-md-1" style="padding-top: 5px;">成交日期:</div>
									<div class="col-md-3">
										<input type="text" value="${minDate }" name="minDate" class="form-control" id="datetimepicker" placeholder="开始时间">
										<span class="glyphicon glyphicon-time form-control-feedback"></span>
									</div>
									<div class="col-md-1"
										style="padding-top: 5px; text-align: center;">至</div>
									<div class="col-md-3">
										<input type="text" value="${maxDate }" name="maxDate" class="form-control" id="datetimepicker2" placeholder="结束日期">
										<span class="glyphicon glyphicon-time form-control-feedback"></span>
									</div>
									<div class="col-md-3">
										<button type="button" onclick="queryOrderByUser()" class="btn btn-default">
											查询&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--日期控件-->

			<%-- 该用户的订单的详情begin --%>
			<div id="orderContainer">

			</div>
			<%-- 该用户的订单的详情end --%>




	</div>
	<!-- 外层divend -->



	<jsp:include page="/WEB-INF/jsp/top/bottom.jsp"/>

	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/order/order.js"></script>
	<script src="${pageContext.request.contextPath}/js/moment.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.js"
		type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$('#datetimepicker').datetimepicker(
			{
				format:'YYYY-MM-DD'
			}		
		);
		$('#datetimepicker2').datetimepicker(
			{
				format:'YYYY-MM-DD'
			}		
		);

		<%-- 当我们进入这个页面的时候，就直接记载我们的第一页的订单的详细信息 --%>
        $("#orderContainer").load("${pageContext.request.contextPath}/orderByUserPage")

		function queryOrderByUser(pageNow) {
			$("#orderContainer").load("${pageContext.request.contextPath}/orderByUserPage",{"pageNow":pageNow,
				"startDate":$("#datetimepicker").val(),"endDate":$("#datetimepicker2").val()})
		}

		<%--这个是我们自己输入页码的方式来进行跳转--%>
		function querySearchOrderByUser(pageCount) {
            var pageNow = $("#searchs").val();
            <%-- 先进行判断一下用户输入的页码是否正确--%>
			if(pageNow < 1 || pageNow > pageCount){
			    alert("您输入的页码有误!")
			}else{
                $("#orderContainer").load("${pageContext.request.contextPath}/orderByUserPage",{"pageNow":pageNow,
                    "startDate":$("#datetimepicker").val(),"endDate":$("#datetimepicker2").val()})
			}
        }

        <%-- 根据单号进行查询 --%>
		function queryOrderByOrderNo() {
			var orderNo = $("#searchOrderNo").val();
			$("#orderContainer").load("${pageContext.request.contextPath}/orderByUserPage",{"likeOrder":orderNo})
        }


	</script>

</body>
</html>