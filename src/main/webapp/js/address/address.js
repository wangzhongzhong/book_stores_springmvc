//验证一下地址添加的js
function checkTel(obj){
	
	var tijiao = document.getElementById("tijiao");
	
	var reg = /^1[34578]\d{9}$/;
	var tel = obj.value;
	if(tel.match(reg)){
		document.getElementById("stel").innerText = "";
		tijiao.className = "btn btn-primary ";
	}else{
		document.getElementById("stel").innerText = "*不合法的手机号!";
		tijiao.className = "btn btn-primary disabled";
	}
}

//验证一下我们的收货人的姓名
function checkName(obj){
	var tijiao = document.getElementById("tijiao");
	
	if(obj.value == null || obj.value.length<=0){
		document.getElementById("shouhuo").innerText = "*收货人不能为空!";
		tijiao.className = "btn btn-primary disabled";
	}else{
		document.getElementById("shouhuo").innerText = "";
		tijiao.className = "btn btn-primary";
	}
}