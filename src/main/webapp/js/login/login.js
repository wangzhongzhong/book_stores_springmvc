function getXMLHttp() {
	var xmlHttp;
	if (window.XMLHttpRequest != null && window.XMLHttpRequest != undefined) {
		xmlHttp = new XMLHttpRequest();
	} else {
		xmlHttp = new ActiveXObject("Micsoft.XMLHTTP");
	}
	return xmlHttp;

}

// 小写字母开头,不含中文.
function check() {
	var username = document.getElementById("username").value;
	var suser = document.getElementById("suser");
	// 获取一下密码框里面的value
	var password = document.getElementById("password").value;
	var spwd = document.getElementById("spwd");
	var btn = document.getElementById("sub");
	
	// 获取一下我们的cookie记住密码的value
	var cookie = document.getElementById("cookie");
	var cookies = null;
	if (cookie.checked == true) {
		cookies = cookie.value;
	}
	// 获取一下xmlHttp
	var xmlHttp = getXMLHttp();
	// 设置一下请求方式
	xmlHttp.open("post", "checkUser");
	// 设置一个请求头信息
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	// 发送请求，记住密码需要返回一个对象
	xmlHttp.send("username=" + username + "&password=" + password + "&cookies="
			+ cookies );
	// 调用回调函数
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			var sign = xmlHttp.responseText;
			console.log(sign);
			if (sign == "1") {
				suser.className = "alert-danger";
				suser.innerText = "用户名不存在";
			} else {
				if (sign == "0") {
					spwd.className = "alert-danger";
					spwd.innerText = "密码错误";
				} else {
					spwd.className = "alert-success";
					spwd.innerText = "√";
					if(sign == "admin2" || sign == "pu2"){

					}else{

						if (sign == "admin") {
							btn.value = "a";
						} else if (sign == "pu") {
							btn.value = "p";
						}
					}
				}
				suser.className = "alert-success"
				suser.innerText = "√";
			}
		}
	}
}

// 登陆验证
function login() {
	// 先获取一下文本框后面的lable标签里面的数据
	var susername = document.getElementById("suser").innerText;
	var spwd = document.getElementById("spwd").innerText;

	var btn = document.getElementById("sub").value;
	if (susername == "√" && spwd == "√" ) {
		window.location = "/book_stores/book/loginListAll?state=" + btn;
	}
}
