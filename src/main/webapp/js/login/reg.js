//创建一个XMLHttpRequest
function getXMLHttp(){
	var xmlHttp;
	if(window.XMLHttpRequest!=null&&window.XMLHttpRequest!=undefined){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ActiveXObject("Micsoft.XMLHTTP");
	}
	return xmlHttp;
}

function checkUser(){
	var username = document.getElementById("regname").value;
	var suser = document.getElementById("ruser");
	//还需要进行检查一下用户名是否合法
	var ureg = /^[a-z]+$/;
	if(ureg.test(username)){
		var xmlHttp = getXMLHttp();
		xmlHttp.open("post","/book_stores_springmvc/checkReg");
		//设置一个请求头信息
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.send("username="+username);
		xmlHttp.onreadystatechange=function(){
			if(xmlHttp.readyState==4&&xmlHttp.status==200){
				if(xmlHttp.responseText=="1"){
					suser.className = "alert-success";
					suser.innerText = "该用户名可以使用!";
				}else{
					suser.className = "alert-danger";
					suser.innerText = "该用户名已存在!";
				}
			}
		}
	}else{
		suser.className = "alert-danger";
		suser.innerText = "用户名不合法!";
	}
}

//检查一下密码是否合法
function checkPwd(){
	var pwd = document.getElementById("regpwd").value;
	var rpwd = document.getElementById("rpwd");
	var ureg = /[0-9]+[6,8]/;
	if(ureg.test(pwd)){
		rpwd.className = "alert-success";
		rpwd.innerText = "√";
	}else{
		rpwd.className="alert-danger";
		rpwd.innerText="密码不合法!";
	}
}

//检查一下重复密码
function againPwd(){
	var pwd = document.getElementById("regpwd").value;
	var pwd2 = document.getElementById("regpwd2").value;
	var apwd = document.getElementById("apwd");
	if(pwd!=pwd2){
		apwd.className = "alert-danger";
		apwd.innerText = "俩次密码不一致!";
	}else{
		apwd.className = "alert-success";
		apwd.innerText = "√";
	}
}

//这个是总的注册功能
function regUser(){
	//获取一下用户名和密码的label
	var apwd = document.getElementById("apwd");
	var suser = document.getElementById("ruser");
	if(apwd.innerText=="√"&&suser.innerText=="该用户名可以使用!"){
		return true;
	}else{
		return false;
	}
}

//检查一下邮箱是否合法
function checkEmail(){
	var email = document.getElementById("email").value;
	var remail = document.getElementById("remail");
	var ereg = /^([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
	if(email.match(remail)){
		remail.className = "alert-success";
		remail.innerText = "邮箱合法";
	}else{
		remail.className = "alert-danger";
		remail.innerText = "邮箱不合法";
	}
}

//检查手机是否合法
function checkPhone(obj){
	var phone = obj.value;
	var rphone = document.getElementById("rphone");
	var rreg = /^1[34578]\d{9}$/;
	if(phone.match(rreg)){
		rphone.className = "alert-success";
		rphone.innerText = "手机号合法";
	}else{
		rphone.className = "alert-danger";
		rphone.innerText = "手机号不合法";
	}
}








