//为了获取当前系统时间
function getSystemDate(){
	//获取时间的标签
	var timeSpan = document.getElementById("timeSpan");
	var date = new Date();
	var weeks = new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
	var minutes = date.getMinutes();
	if(minutes < 10 ){
		minutes = "0"+minutes
	}
	var seconds = date.getSeconds();
	if(seconds < 10){
		seconds = "0"+seconds
	}
	timeSpan.innerText = date.getFullYear()+"-"+date.getMonth()+1+"-"+
						 date.getDate()+"\t\t\t"+weeks[date.getDay()]+"\t\t\t"+
						 date.getHours()+":"+minutes+":"+seconds;
	
	setTimeout("getSystemDate()", 1000);
}







