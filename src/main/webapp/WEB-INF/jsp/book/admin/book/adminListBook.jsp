<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>管理员页面</title>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
</head>
<body onload="getSystemDate()">

	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>

	<%-- 管理员的内容页面begin --%>
	<div class="container">
	
		<div class="panel panel-info">
			<div class="panel-heading">
			<h4 class="panel-title ">
					<a data-toggle="collapse" data-parent="#accordion"
						href="#"> 北京时间:<span id="timeSpan"></span> </a>
				</h4>
			</div>
		</div>

		<!-- 订单信息begin -->
		<div>

			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
						   href="#collapseTwo"> 订单信息 </a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse in">
					<div class="panel-body">

						<!--订单查询导航 begin-->
						<div>
							<nav class="navbar navbar-default" role="navigation">
								<div class="navbar-header">
									<a class="navbar-brand"
									   href="#">查询条件</a>
								</div>

								<div class="modal-body">
									<!--多条件来进行查询客户的订单的信息-->
									<form id="orderPageByAddress" action="${pageContext.request.contextPath}/orderPageByArea" class="form-horizontal" role="form" method="post">
										<div class="form-group">
											<div data-toggle="distpicker">
												<div class="form-group col-sm-4 col-md-2">
													<label class="sr-only" for="province1">Province</label> <select
														class="form-control" id="province1" name="province"></select>
												</div>
												<div class="form-group col-sm-4 col-md-2">
													<label class="sr-only" for="city1">City</label> <select
														class="form-control" id="city1" name="city"></select>
												</div>
												<div class="form-group col-sm-4 col-md-2">
													<label class="sr-only" for="district1">District</label> <select
														class="form-control" id="district1" name="area"></select>
												</div>
												<div class="form-group col-sm-4 col-md-2">
													<select class="form-control" id="select" name="select">

														<option value="zero">请选择查询条件</option>
														<option value="one">只查询省</option>
														<option value="two">查询省市</option>
														<option value="three">查询省市区</option>
													</select>
												</div>
												<div class="form-group col-sm-4 col-md-2">
													<button type="button" id="btn" class="btn btn-primary">查询</button>
												</div>
											</div>
										</div>
									</form>
								</div>
							</nav>
						</div>

						<%-- 塞入订单的数据 --%>
						<div  id="orderContainer">

						</div>

					</div>
				</div>
			</div>

		</div>
		<!-- 订单信息end -->

		<!-- 图书信息begin -->
		<div id="bookContainer">


		</div>
		<!-- 图书信息end -->

		<!-- 用户信息的begin -->
		<div id="userContainer">


		</div>
		<!-- 用户信息的end -->


	</div>
	<%-- 管理员的内容页面end --%>

	<%-- 管理员的添加用户的界面 --%>
	<!-- 注册modal begin -->
	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		 aria-labelledby="ModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="ModalLabel">添加新用户</h4>
				</div>
				<div class="modal-body">
					<!--登录的form表单-->
					<form action="${pageContext.request.contextPath}/saveUser" method="post" onsubmit="return regUser();" class="form-horizontal" role="form">
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-5">
								<input type="text" name="userName" onblur="checkUser()"
									   class="form-control" id="regname" required
									   placeholder="请输入小写字母!"> <span
									class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="ruser"></label>
							</div>
						</div>
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-5">
								<input type="password" name="password" onblur="checkPwd()"
									   class="form-control" id="regpwd" placeholder="请输入纯数字,密码长度6-8位"
									   min="6" maxlength="8"><span
									class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="rpwd"></label>
							</div>
						</div>
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-5">
								<input type="password" onblur="againPwd()" class="form-control"
									   id="regpwd2" min="6" maxlength="8" placeholder="和密码保持一致">
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="apwd"></label>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">真实姓名</label>
							<div class="col-sm-5">
								<input type="text" name="realName" class="form-control"
									   id="realname" placeholder="请输入真实姓名"> <span
									class="glyphicon glyphicon-home form-control-feedback"></span>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">性别</label>
							<div class="col-sm-5">
								<select class="form-control" name="gender">
									<option value="M">男</option>
									<option value="W">女</option>
								</select>
							</div>

						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-5">
								<input type="email" name="email" onblur="checkEmail();"
									   class="form-control" id="email" placeholder="合法邮箱格式">
								<span
										class="glyphicon glyphicon-envelope form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="remail"></label>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">电话</label>
							<div class="col-sm-5">
								<input type="tel" name="phone" onblur="checkPhone(this);"
									   class="form-control" id="phone" placeholder="合法手机格式">
								<span
										class="glyphicon glyphicon-earphone form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="rphone"></label>
							</div>
						</div>

						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">公司</label>
							<div class="col-sm-5">
								<input type="text" name="company" class="form-control"
									   id="company" placeholder="请输入公司地址"> <span
									class="glyphicon glyphicon-home form-control-feedback"></span>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							<input type="submit" class="btn btn-primary" value="注册">
						</div>
					</form>
					<!--form结束-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- 注册modal end -->

	<%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>


	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/dist/js/distpicker.data.min.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/distpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/book/bookList.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/reg.js"></script>
	<script src="${pageContext.request.contextPath}/js/admin/systemDate.js"></script>
	<script>
		//在最开始的时候，先加载第一页数据
		$("#orderContainer").load("${pageContext.request.contextPath}/orderPage")
        $("#bookContainer").load("${pageContext.request.contextPath}/bookPage")
        $("#userContainer").load("${pageContext.request.contextPath}/userPage");

        //通过异步的来分页
        function adminQuery(pageNow) {
            $("#userContainer").load("${pageContext.request.contextPath}/userPage",{"pageNow":pageNow});
        }

        //异步分页图书的数据
		function adminBookQuery(pageNow){
            $("#bookContainer").load("${pageContext.request.contextPath}/bookPage",{"pageNow":pageNow});
		}

        //异步分页订单的数据
        function adminOrderQuery(pageNow){
            $("#orderContainer").load("${pageContext.request.contextPath}/orderPage",{"pageNow":pageNow});
        }

		/*我们的多条件查询*/
        $(function () {
            $("#btn").click(function () {
                var value = $("#orderPageByAddress").serialize();
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/orderPageByArea',
                    data:value,
                    success:function(result){
                        console.log(result)
                        $("#orderContainer").html(result)
                    }
                });
            })
        })

	</script>
</body>
</html>