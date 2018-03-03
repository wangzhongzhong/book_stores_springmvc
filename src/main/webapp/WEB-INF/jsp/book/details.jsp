<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>图书详细信息</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
</head>
<body>
	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>

	<!-- 最外层的div begin -->
	<div class="container">
		<!-- 左边begin -->
		<div class="col-md-8 col-sm-12">
			<ol class="breadcrumb">
				<li><a href="#">图书详情</a></li>
				<li><a href="#">${book.bookName }</a></li>
			</ol>
			<!-- 图书的详情begin -->
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="thumbnail">
						<a><img src="${pageContext.request.contextPath}/images/${book.imgurl }"
							style="height: 200px;" alt="通用的占位符缩略图"></a>
						<div class="caption">
							<h3>${book.bookName }</h3>
							<p>
								春节特价,包邮哟!亲<img src="${pageContext.request.contextPath}/images/emotions/3.gif"
									style="width: 24px; height: 24px;">
							</p>
							<form action="${pageContext.request.contextPath}/addCart" method="post">
								<div style="margin-bottom: 5px; width: 100px;">
									<input id="nowBuyBookCount" type="number" name="count"
										class="form-control" placeholder="购买数量" min="1" max="100"
										value="1">
									<input type="hidden" name="bookId" value="${book.id}"/>
								</div>
								<div style="clear: both;">
									<!--  -->
									<c:if test="${loginUser!=null }">
										<a href="#" onclick="nowBuyBook();" class="btn btn-default"
											role="button"> <span class="glyphicon glyphicon-usd"></span>
											立即购买 <input id="hidden" type="hidden" value="${book.id }"
											name="id">
										</a>
										<button class="btn btn-default" type="submit">
											<span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车
										</button>
									</c:if>
									<c:if test="${loginUser ==null }">
										<a href="#" class="btn btn-default disabled" role="button"> <span class="glyphicon glyphicon-usd"></span>
											立即购买 
										</a>
										<button class="btn btn-default disabled" type="button">
											<span class="glyphicon glyphicon-shopping-cart"></span> 加入购物车
										</button>
									</c:if>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-12 col-md-6">
					<div class="thumbnail">
						<ul class="list-group">
							<li class="list-group-item"><span class="text-success">图书名称:${book.bookName }</span></li>
							<li class="list-group-item"><span class="text-info">作者:</span>${book.author }</li>
							<li class="list-group-item"><span class="text-info">出版日期:<fm:formatDate
										value="${book.publishDate }" pattern="yyyy年MM月dd日" /></span></li>
							<li class="list-group-item"><span class="text-info">出版社:</span>${book.publish }</li>
							<li class="list-group-item"><span class="text-info">现价:</span>${book.price }￥</li>
							<li class="list-group-item"><span class="text-info">说明:</span>${book.instrduce }
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- 图书详情end -->
			<!-- 折叠begin -->
			<div class="panel panel-default">
				<!-- 头信息begin -->
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapseTwo"> 展开详细信息 </a>
					</h4>
				</div>
				<!-- 头信息end -->
				<!-- 折叠内容begin -->
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<!--tab选项卡 begin-->
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a href="#home" data-toggle="tab">
									商品详情 </a></li>
						</ul>
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="home">
							<p>
								<em>&nbsp;&nbsp;&nbsp;&nbsp;产品参数：</em>
							</p>
							<div class="row">
								<div class="col-sm-12 col-md-6">
									<ul class="nav navbar-collapse" style="line-height: 3;">
										<li class="text-danger">图书名称:&nbsp;${book.bookName }</li>
										<c:forEach items="${book.moreMes.split(';') }" var="mes">
											<li class="text-info">${mes }</li>
										</c:forEach>
									</ul>
								</div>
								<span class="visible-sm visible-xs"> </span>
							</div>
						</div>
					</div>
				</div>
				<!-- 折叠内容end -->
			</div>
			<!-- 折叠end -->
		</div>
		<!-- 左边end -->

		<!-- 右边begin -->
		<%@ include file="/WEB-INF/jsp/top/right.jsp"%>

	</div>
	<!-- 最外层的div end -->

	<%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>


	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script src="${pageContext.request.contextPath}/js/cart/cart.js"></script>
	<script src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/login.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>
</body>
</html>