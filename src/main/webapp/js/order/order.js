//提交订单的链接
function referOrder(){
	//因为我们需要把用户的收货地址传到后台，因此我们需要用js来传一下参数
	var inputAdds = document.getElementsByName("addr");
	//存放地址
	var address ;
	for(var i=0;i<inputAdds.length;i++){
		if(inputAdds[i].checked==true){
			address = inputAdds[i].value;
		}
	}
	console.log(address);
	window.location = "/book_stores_springmvc/saveOrder?address="+address
}

function getXMLHttp(){
	var xmlHttp ;
	
	if(window.XMLHttpRequest!=null&&window.XMLHttpRequest!=undefined){
		xmlHttp = new XMLHttpRequest();
	}else{
		xmlHttp = new ActiveXObject("Micsoft.XMLHTTP");
	}
	return xmlHttp;
}

//这个是删除订单的方法，通过异步删除
function deleteOrder(){
	var xmlHttp = getXMLHttp();
	
	//获取所有的checked类型的input标签
	var inputs = document.getElementsByName("cks");
	
	//获取所有的table标签
	var tables = document.getElementsByTagName("table");
	
	//定义一个str用来拼接一下我们的参数
	var str = "";
	
	//遍历这个input数组
	for(var i=0;i<inputs.length;i++){
		if(inputs[i].checked==true){
			str+=inputs[i].value+";";
		}
	}
	if(str.length>0){
		var flag = window.confirm("确认删除这些订单吗?");
		if(flag){
			xmlHttp.open("post","/book_stores_springmvc/deleteOrder");
			xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
			xmlHttp.send("ids="+str);
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					alert("删除成功!")
					$("#orderContainer").load("/book_stores_springmvc/orderByUserPage");
				}
			}
		}
	}else{
		alert("请至少选择一个要删除的订单!")
	}
}

//最下面的跳转页面指定页数
function findOrder(pageCount){
	var pageNow = document.getElementById("searchs").value;
	var path = document.getElementById("path").value;
	if(Number(pageNow)>Number(pageCount) || Number(pageNow)<1){
		alert("输入的页码有误!");
	}else{
		if(null!=pageNow && pageNow.length>0){
			window.location=path+"pageNow="+pageNow;
		}
	}
}

//检查一下我们的搜索的订单号是否存在
function checkSearchOrderNo(){
	var searchOrderNo = document.getElementById("searchOrderNo");
	if(searchOrderNo.value.length==0){
		alert("请输入你要查询的订单号!");
	}else{
		window.location = "/book_stores/bs/order/searchOrder?likeOrder="+searchOrderNo.value;
	}
}

//这个是为了处理搜索框里面的业务
function likeName(){
	//获取文本框里面的value
    window.location="/book_stores_springmvc/searchBookView";
}


