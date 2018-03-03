<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	#head_img{
		width:50px;
		height: 50px;
		border-radius: 50%;
		border: 1px solid #999;
	}

</style>

	<!--导航部分  begin-->
	<div class="container" style="margin-top: 5px;">
		<nav class="navbar navbar-default well-sm" style="padding-left: 0px;"
			role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#example-navbar-collapse">
						<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">在线书城</a>
				</div>
				<div class="collapse navbar-collapse" id="example-navbar-collapse">
					<ul class="nav navbar-nav pull-left">
						<li><c:choose>
								<c:when test="${loginUser!=null }">
									<li><a href="#" class="alert-success">当前用户:${loginUser.realName }</a></li>
									<li>
										<a href="${pageContext.request.contextPath}/exit?state=${loginUser.state}" id="aexit">安全退出</a>
									</li>
									<c:if test="${loginUser.state ne 1 }">
										<li><a href="${pageContext.request.contextPath}/bs.jsp">首页</a></li>
										<li><a href="${pageContext.request.contextPath}/myOrder">我的订单</a></li>
										<li>
											<a href="${pageContext.request.contextPath}/listAllCart">
											<span class="glyphicon glyphicon-shopping-cart"> </span>我的购物车
											</a>
										</li>
										<li>
											<a href="${pageContext.request.contextPath}/findUserView?user_id=${loginUser.id}">修改资料</a>
										</li>
										<li>
											<img id="head_img" src="${pageContext.request.contextPath}/images/head/${user_head_img}">
										</li>
									</c:if>
								</c:when>
								<c:otherwise>
									<li><a href="#" data-toggle="modal" id="alogin"
										data-target="#myModal">登录</a></li>
									<li><a href="#" data-toggle="modal" id="areg"
										data-target="#register">注册</a></li>
								</c:otherwise>
							</c:choose>
					</ul>
					<c:if test="${loginUser.state ne 1 }">
					<form action="${path}/searchBookView" method="post">
						<div class="input-group col-md-3 pull-right" style="positon: relative; padding: 7px;">
								<input type="text" value="${likeName }" name="likeName" id="likeName" class="form-control" placeholder="请输入图书名" />
								<span class="input-group-btn">
								<button type="submit" class="btn btn-info btn-search">
									<span class="glyphicon glyphicon-search"></span>
								</button>
								</span>
						</div>
					</form>
					</c:if>
				</div>
			</div>
		</nav>
	</div>
	<!--导航部分 end-->
	
	<!-- 处理一下cookie集合begin -->
	<c:forEach items="${pageContext.request.cookies }" var="c">
		<c:if test="${c.name.equals('userCookie') }">
			<c:set var="ucookie" value="${c.value }"/>
		</c:if>
		<c:if test="${c.name.equals('pwdCookie') }">
			<c:set var="pcookie" value="${c.value }"/>
		</c:if>
	</c:forEach>
	<!-- cookie集合的end -->


	<%-- 当用户不等于1的时候，我们就有这个轮播图 --%>
	<div></div>
	<c:if test="${loginUser.state ne 1}">
		<!--最顶端轮播图片 begin-->
		<div id="gcarouse" class="container">
			<!--轮播-->
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner">
					<div class="item active">
						<a href="#"><img src="${pageContext.request.contextPath}/images/advert1.jpg"
							class="pull-left" alt="First slide"></a>
					</div>
					<div class="item">
						<a href="#"><img src="${pageContext.request.contextPath}/images/advert2.jpg"
							class="pull-left" alt="First slide"></a>
					</div>
					<div class="item">
						<a href="#"><img src="${pageContext.request.contextPath}/images/advert3.jpg"
							class="pull-left" alt="First slide"></a>
					</div>
				</div>

				<!-- 轮播（Carousel）导航 -->
				<a class="carousel-control left" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="carousel-control right"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
		<!--最顶端轮播图片 end-->
	</c:if>
	
	<!-- 登录模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">
					<!--登录的form表单-->
					<form class="form-horizontal" role="form" action="${path}/userLogin">
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-5">
								<input type="text" value="${ucookie }" name="userName" onblur="check()"
									class="form-control" id="username" placeholder="请输入用户名">
								<span class="glyphicon glyphicon-user form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="suser"></label>
							</div>
						</div>
						<div class="form-group has-feedback">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-5">
								<input type="password" value="${pcookie }" onblur="check()"
									class="form-control" id="password" name="password" placeholder="请输入密码">
								<span class="glyphicon glyphicon-lock form-control-feedback"></span>
							</div>
							<div class="col-sm-3" style="padding-top: 10px;">
								<label id="spwd"></label>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input id="cookie" name="cookie" onblur="check();"
										type="checkbox" value="f">请记住我
									</label>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="submit" id="sub" onclick="login()"
								class="btn btn-primary">登录</button>
						</div>
					</form>
					<!--form结束-->
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
	</div>
	<!-- 登录modal end/.modal -->

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
				<form action="${pageContext.request.contextPath}/regUser" method="post" onsubmit="return regUser();" class="form-horizontal" role="form">
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


	
	
