<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css" />

<title>购物车清单</title>
</head>
<body>

	<!-- 头信息begin -->
	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>
	<!-- 头信息end -->

	<!-- 内容信息begin -->
	<div class="container">

		<!--左边-->
		<div class="col-md-8 col-sm-12">
			<!--顶部-->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的宝贝</a></li>
			</ol>

			<!-- 表格begin -->
			<div class="table-responsive" id="imgDiv">
				<table class="table table-hover table-striped "
					style="vertical-align: middle;">
					<thead>
						<tr>
							<td colspan="8"><label class="text-primary">显示条数:</label> <select
								id="cartSzie" class="form-control" style="display: inline"
								onchange="displaySize(this)">
									<option value="2">2</option>
									<option value="4">4</option>
									<option value="6" selected>6</option>
									<option value="8">8</option>
									<option value="0">全部</option>
							</select></td>
						</tr>
						<tr class="text-success success" style="text-elgin:center;">
							<th><input type="checkbox" id="selectAll"
								onclick="selectAll(this)"></th>
							<th>图片</th>
							<th>书名</th>
							<th>作者</th>
							<th>单价</th>
							<th>数量</th>
							<th>合计</th>
						</tr>
					</thead>
					<tbody id="tby">
						<c:forEach items="${listCart }" var="item">
							<input type="hidden" id="sequence" value="${item.book.id }">
							<tr>
								<td><input type="checkbox" value="${item.book.id }" name="first"></td>
								<td><img src="${pageContext.request.contextPath}/images/${item.book.imgurl}"></td>
								<td>${item.book.bookName }</td>
								<td>${item.book.author }</td>
								<td>${item.book.price }</td>
								<td> 
									<button onclick="subtract(this);" class='btn btn-default' type='button'>-</button> 
									 	<span>${item.count }</span> 
									<button onclick="add(this);" class='btn btn-default' type='button'>+</button> 
								</td>
								<td id="${item.book.id }">${item.price }</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4"></td>
							<td class="text-success">总价:</td>
							<td class="text-danger" id="bTotal">${cartTotal }</td>
							<td class="text-success">元</td>
						</tr>
						<tr style="background-color: white;">
							<td><a href="${pageContext.request.contextPath}/userLoginView"
								class="btn btn-info">&lt;&lt;继续购买</a></td>
							<td><button class="btn btn-danger" data-toggle="modal" onclick="del();">删除商品</button></td>
							<td colspan="4"></td>
							<td><a href="${pageContext.request.contextPath}/getCartToOrderView" class="btn btn-warning">结算商品</a></td>
						</tr>
					</tfoot>

				</table>
			</div>
			<!-- 表格end -->

		</div>
		<!-- 左边end -->

		<!-- 右边begin -->
		<%@ include file="/WEB-INF/jsp/top/right.jsp"%>
	</div>
	<!-- 内容信息end -->

	<!-- 尾信息begin -->
	<%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>
	<!-- 尾信息end -->

	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script src="${pageContext.request.contextPath}/js/cart/cart.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>

</body>
</html>