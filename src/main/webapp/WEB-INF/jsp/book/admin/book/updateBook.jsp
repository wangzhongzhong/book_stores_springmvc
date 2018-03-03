<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>图书的信息</title>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animate.css" />
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-upload/css/jquery.fileupload.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/jquery-upload/css/jquery.fileupload-ui.css">
</head>
<body>

	<%@ include file="/WEB-INF/jsp/top/top.jsp"%>

	<div class="container">
		<div id="update" class="col-md-offset-2 col-md-8">
			<fieldset>
				<legend> 修改图书信息入口
					<a href="${pageContext.request.contextPath}/adminLogin?userName=${loginUser.userName}&password=${loginUser.password}" style="padding-left: 200px;">返回上一级</a>
				</legend>
				<form action="${pageContext.request.contextPath}/updateBookSubmit" method="post" class="form-horizontal" role="form" enctype=multipart/form-data>

					<input type="hidden" name="id" value="${updateBook.id}"/>

					<div class="form-group">
						<label class="col-sm-2 control-label">图书名称</label>
						<div class="col-sm-4">
							<input type="text" value="${updateBook.bookName }" name="bookName"
								class="form-control" id="bookName">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图书作者</label>
						<div class="col-sm-4">
							<input type="text" value="${updateBook.author }" name="author"
								class="form-control" id="author">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图书出版社</label>
						<div class="col-sm-4">
							<input type="text" value="${updateBook.publish }" name="publish"
								class="form-control" id="publish">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图书单价</label>
						<div class="col-sm-4">
							<input type="text" value="${updateBook.price }" name="price"
								class="form-control" id="price">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">出版日期</label>
						<div class="col-sm-4 has-feedback">
						<fm:formatDate var="date" value="${updateBook.publishDate}" pattern="yyyy/MM/dd"/>
							<input type="text" value="${date }" name="birthday"
								class="form-control" id="datetimepicker"> <span
								class="glyphicon glyphicon-time form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图片地址</label>
						<div class="col-sm-4">
							<c:if test="${updateBook.imgurl!=null }">
								<img id="imgAddress" alt="${updateBook.bookName }" src="${pageContext.request.contextPath}/images/${updateBook.imgurl}">
								<input type="file" name="multipartFile" class="form-control" id="imgUrl">
							</c:if>
							<c:if test="${updateBook.imgurl==null }">
								<input type="file" name="multipartFile" class="form-control" id="address">
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">图书简介</label>
							<div class="col-sm-5">
								<textarea name="instrduce" class="form-control" id="instrduce">${updateBook.instrduce }</textarea>
							</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default btn-info">确认</button>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="btn btn-default btn-warning">重置</button>
						</div>
					</div>
				</form>
			</fieldset>
		</div>
	</div>


	<%@ include file="/WEB-INF/jsp/top/bottom.jsp"%>


	<script src="${pageContext.request.contextPath}/dist/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-upload/vendor/jquery.ui.widget.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-upload/jquery.iframe-transport.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-upload/jquery.fileupload.js"></script>
	<script src="${pageContext.request.contextPath}/dist/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/moment.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/wow.js"></script>
	<script type="text/javascript">
		$('#datetimepicker').datetimepicker(
			{
				format:'YYYY-MM-DD'
			}		
		);
	</script>
</body>
</html>