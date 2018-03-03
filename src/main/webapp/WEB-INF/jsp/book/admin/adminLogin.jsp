<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>管理员登陆界面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/dist/css/bootstrap.min.css">

    <style>
        #login{
            border: 1px solid #ccc;
            margin-top: 100px;
            border-radius: 6px 6px 0px 0px;
            box-shadow: -1px 1px 4px #ccc;
            padding: 20px 30px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <!--header-begin-->
    <div>
        <nav class="navbar navbar-inverse" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">在线书城</a>
                </div>
                <div>
                    <ul class="nav navbar-nav navbar-left">
                        <li class="active"><a href="#">管理员登陆</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">设为主页</a></li>
                        <li><a href="#">加入收藏</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <!--header-end-->

    <!--登录的form表单begin-->
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <div id="login">
                    <fieldset>
                        <legend>管理员登录入口</legend>
                        <form role="form" action="${pageContext.request.contextPath}/adminLogin" method="post" class="form-horizontal" role="form">

                            <div class="form-group">
                                <label class="col-md-2 control-label">用户名</label>
                                <div class="col-md-5 has-feedback">
                                    <input type="text" id="username" name="userName" class="form-control" placeholder="请输入用户名">
                                    <span class="glyphicon glyphicon-user form-control-feedback"></span>

                                </div>
                                <div class="col-md-4" style="padding-top:5px">
                                    <label id="name" class="alert-danger"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">密 码</label>
                                <div class="col-md-5 has-feedback">
                                    <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码">
                                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                </div>
                                <div class="col-md-4" style="padding-top:5px">
                                    <label id="pwd" class="alert-danger"></label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" id="btn" class="btn btn-primary disabled">登录</button>
                                </div>
                            </div>
                        </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <!--登录的form表单end-->

    <!-- 尾信息begin -->
    <%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>
    <!-- 尾信息end -->

<script src="${pageContext.request.contextPath }/dist/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/checkAdmin.js"></script>
</body>
</html>
