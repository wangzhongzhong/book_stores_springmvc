//创建一下XMLHttpRequest
function getXMLHttp(){
	var xmlHttp;
	if(window.XMLHttpRequest!=null&&window.XMLHttpRequest!=undefined){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ActiveXObject("Micsoft.XMLHTTP");
	}
	return xmlHttp;
}
//这个是为了处理我们的首页的上下页的功能
function pageUp(){
	//
	var xmlHttp = getXMLHttp();
	var loveDiv = document.getElementById("love");
	var previous = document.getElementById("previous").value;
	loveDiv.innerHTML="";
	xmlHttp.open("post","/book_stores/book/previous");
	//设置一个请求头信息
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send("pageNow="+previous);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState==4&&xmlHttp.status==200){
			var str = xmlHttp.responseText;
			//转换成对象
			var strs = JSON.parse(str);
			for(var i=0;i<strs.pageDates.length;i++){
				alert(strs.pageDates[i]);
			}
			
		}
	}
}

//处理一下下一页
function pageDown(){
	var xmlHttp = getXMLHttp();
	var loveDiv = document.getElementById("love");
	var next = document.getElementById("next").value;
	loveDiv.innerHTML="";
	xmlHttp.open("post","/book_stores/book/next");
	//设置一个请求头信息
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send("pageNow="+next);
	xmlHttp.onreadystatechange = function(){
		if(xmlHttp.readyState==4&&xmlHttp.status==200){
			var str = xmlHttp.responseText;
//			alert(str);
			//转换成对象
			var s = JSON.eval(str);
			alert(s);
		}
	}
}




function findBook (pageCount) {
	var pageNow = $("#searchs").val();
	if(Number(pageNow)>Number(pageCount) || Number(pageNow)<1){
		alert("输入的页码有误!");
	}else{
		if(null!=pageNow && pageNow.length>0){
            window.location="userLoginView?pageNow="+pageNow;
		}
	}
}


//删除一本图书的信息
function deleteBook(id){
	//获取到我们要删除的图书的id
	//alert(id);
	var xmlHttp = getXMLHttp();
	//还需要获取一下我们要删除的div
	var deleDiv = document.getElementById(id);
	//获取一下存放图片的总的容器
	var conDiv = document.getElementById("con");
	xmlHttp.open("post","/book_stores_springmvc/deleteBook");
	//设置一个请求头信息
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send("id="+id);
	xmlHttp.onreadystatechange=function(){
		if(xmlHttp.readyState==4&&xmlHttp.status==200){
			var sign = xmlHttp.responseText;
//			console.log(sign);
			//说明删除成功
			if(sign == "1"){
				conDiv.removeChild(deleDiv);
				alert("删除成功!");
			}else{
				alert("删除失败!");
			}
		}
	}
}


//这个是为了处理搜索框里面的业务
function likeName(){
	window.location="/book_stores_springmvc/searchBookView";
}


//立即购买图书
function nowBuyBook(){
	
	var book_id = document.getElementById("hidden").value;
	
	var book_count = document.getElementById("nowBuyBookCount").value;
	
	window.location="/book_stores_springmvc/nowBuyBook?bookid="+book_id+"&bookCount="+book_count;
	
	
}




