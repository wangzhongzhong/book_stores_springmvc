<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>订单页面</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cart.css" />

<style type="text/css">
.form-control {
	width: 100%;
}
</style>

</head>


<body>

	<!-- 头部 -->
	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>

	<!-- 内容begin -->

	<div class="container">
		<!--左边-->
		<div class="col-md-8 col-sm-12">

			<!-- 结算清单begin -->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;收货地址</a></li>
			</ol>
			<!-- 结算清单end -->

			<!--收货地址  begin-->
			<div style="margin-bottom: 5px;" id="addrDiv">
				<ul class="list-group" id="address">
					<!-- 循环遍历我们的地址 -->
					<c:forEach items="${listAdd }" var="add">
						<li class="list-group-item">
							<c:if test="${add.isDefault == 1 }">
								<input value="${add.id }"  type="radio"  name="addr" checked="checked">
								<span>${add.provice };${add.city };${add.area };${add.detail }</span>
								<span class="text-danger">默认地址</span>
							</c:if> 
							<c:if test="${add.isDefault == 0 }">
								<input value="${add.id }" type="radio"  name="addr" >
								<span>${add.provice };${add.city };${add.area };${add.detail }</span>
							</c:if>
						</li>
					</c:forEach>
				</ul>
				<a href="#" id="addAddr"
					class="text-success" data-toggle="modal" data-target="#Modal">添加新地址</a>
			</div>
			<!--收货地址  end-->



			<!-- 结算清单begin -->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;结算清单</a></li>
			</ol>
			<!-- 结算清单end -->

			<!--购物车表格 begin-->
			<div class="table-responsive" id="imgDiv">
				<table class="table table-hover table-striped"
					style="vertical-align: middle;">
					<tr class="text-success success">
						<th>序号</th>
						<th>图片</th>
						<th>书名</th>
						<th>作者</th>
						<th>单价</th>
						<th>数量</th>
						<th>合计</th>
					</tr>
					<tbody id="tby">
						<c:forEach items="${set }" var="s" varStatus="vs">
							<tr>
								<td>${1000+vs.count }</td>
								<td><img src="${pageContext.request.contextPath}/images/${s.value.book.imgurl}"></td>
								<td>${s.value.book.bookName }</td>
								<td>${s.value.book.author }</td>
								<td>${s.value.book.price }元</td>
								<td>${s.value.count }</td>
								<td>${s.value.price }元</td>
							</tr>
						</c:forEach>
					</tbody>

					<tfoot>
						<tr>
							<td colspan="5"></td>
							<td class="text-success">总价:</td>
							<td class="text-danger">${sum }元</td>
						</tr>
						<tr style="background-color: white;">
							<td>
								<a href="${pageContext.request.contextPath}/userLoginView" class="btn btn-info">&lt;&lt;继续购买</a>
							</td>
							<td colspan="4"></td>
							<td>
								<c:if test="${set ne null}">
									<a href="#" onclick="referOrder();" class="btn btn-warning">提交订单</a>
								</c:if>
							</td>
						</tr>
					</tfoot>


				</table>

			</div>
			<!--购物车表格 end-->

		</div>
		<!-- 左边end -->

	</div>
	<!-- 内容end -->

	<!--添加新地址模态框 begin-->
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">
						<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;添加新收货地址
					</h4>
				</div>
				<div class="modal-body">
					<!--登录的form表单-->
					<form action="${pageContext.request.contextPath}/insertAddress" class="form-horizontal" role="form" method="post">
						<div class="form-group">
							<label class="col-md-2 control-label" style="margin-right: 2.9%;">所在地区:</label>
							<div data-toggle="distpicker">
								<div class="form-group col-sm-12 col-md-3">
									<label class="sr-only" for="province1">Province</label> <select
										class="form-control" id="province1" name="provice"></select>
								</div>
								<div class="form-group col-sm-12 col-md-3">
									<label class="sr-only" for="city1">City</label> <select
										class="form-control" id="city1" name="city"></select>
								</div>
								<div class="form-group col-sm-12 col-md-3">
									<label class="sr-only" for="district1">District</label> <select
										class="form-control" id="district1" name="area"></select>
								</div>
							</div>
						</div>
						<div class="form-group has-feedback" style="clear: both">
							<label class="col-sm-2 control-label">详细地址:</label>
							<div class="col-sm-5">
								<textarea name="detail" class="form-control" id="deatails"></textarea>
							</div>

						</div>
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">邮政编码</label>
							<div class="col-md-5">
								<input name="code" type="text" class="form-control" id="lastname2"
									placeholder="邮政编码"> <span
									class="glyphicon glyphicon-hand-left form-control-feedback"></span>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">姓名</label>
							<div class="col-sm-5">
								<input name="peceiver" onblur="checkName(this);" type="text" class="form-control" id="username" placeholder="收货人姓名">
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="col-sm-3 text-danger" style="padding-top: 10px;">
									<label id="shouhuo"></label>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-sm-5">
								<input name="tel" onblur="checkTel(this);" type="tel" class="form-control" id="tel"
									placeholder="合法手机格式"> <span
									class="glyphicon glyphicon-phone form-control-feedback"></span>
							</div>
							<div class="col-sm-3 text-danger" style="padding-top: 10px;">
									<label id="stel"></label>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input name="isDefault" value="f" type="checkbox" id="setDefaultAddr"><span
										class="text-success">设置默认地址</span>
									</label>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<input id="tijiao" type="submit" class="btn btn-primary" value="提交地址">
						</div>
					</form>
					<!--form结束-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>


	<!-- 尾部 -->
	<%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>

	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/confirm_order.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/distpicker.data.min.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/distpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/address/address.js"></script>
	<script src="${pageContext.request.contextPath}/js/order/order.js"></script>
</body>
</html>