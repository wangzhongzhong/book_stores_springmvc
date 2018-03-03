<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 右边begin -->
<div class="col-md-4 col-sm-3 col-xs-8">
	<ol class="breadcrumb ">
		<li><a href="# " class="text-success "><span
				class="glyphicon glyphicon-shopping-cart "></span>我的购物车</a></li>
		<li><a id="bookCount" href="# ">${bookCount}个商品</a></li>
		<!-- 处理一下总价格 -->
		<li><a id="cartTotal" href="# ">总金额:${cartTotal}元</a></li>
	</ol>
	<!--猜您喜欢begin-->
	<div>

		<!-- 处理一下我们的上下页的业务 -->
		<span class="text-info"><span class="glyphicon glyphicon-heart"></span><span
			style="font-size: 20px;">猜您喜欢</span></span>
		<div class="row" id="love">
			<c:forEach items="${pageBean.pageDates }" var="b">
				<div class="col-sm-12 col-md-12 wow fadeInRight animated">
					<div class="thumbnail">
						<a href="${pageContext.request.contextPath}/book/moreBookMes?id=${b.id}"><img
							src="${pageContext.request.contextPath}/images/${b.imgurl }" style="height: 200px;"
							alt="通用的占位符缩略图 "></a>
						<div class="caption ">
							<h4>${b.bookName }</h4>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!--猜您喜欢end-->
<!-- 右边end -->