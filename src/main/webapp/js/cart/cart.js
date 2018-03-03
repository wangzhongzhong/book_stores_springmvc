function getXMLHttp() {
	var xmlHttp;
	if (window.XMLHttpRequest != null && window.XMLHttpRequest != undefined) {
		xmlHttp = new XMLHttpRequest();
	} else {
		xmlHttp = new AvtiveXObject("Micsoft.XMLHTTP");
	}
	return xmlHttp;
}

// 删除购物车里面的某个商品
function del() {
	var xmlHttp = getXMLHttp();
	var str = getTdStr();
	if (str == null || str == "") {
		alert("请先选中一个要删除的商品!");
	} else {
		var flag = window.confirm("确认删除该商品吗?");
		if (flag) {
			// 获取一下要删除图书的id
			xmlHttp.open("post", "/book_stores_springmvc/deleCart");
			xmlHttp.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");
			xmlHttp.send("id=" + str);
			xmlHttp.onreadystatechange = function() {
				if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
					var sign = xmlHttp.responseText;
					if (sign == "error") {
						alert("删除失败!");
					} else {
						// 成功的话还需要删除这些td
						var tds = document.getElementsByName("first");
						var sum = 0;
						var bookCount = 0;
						for (var i = 0; i < tds.length; i++) {
							if (tds[i].checked == true) {
								tds[i].parentElement.parentElement.remove();
								i--;
							} else {
								bookCount = i + 1;
								// 就获取一下这个id的td的price这个单元格
								var tdp = document.getElementById(tds[i].value);
								sum += Number(tdp.innerText)
							}
						}
						// 最后在获得一下我们的总计的节点,并且赋值
						document.getElementById("bTotal").innerText = sum
								.toFixed(1)
								+ "元"
						// 处理一下页面右边的购物车的信息
						document.getElementById("cartTotal").innerText = sum
								.toFixed(1)
								+ "元";
						// 处理一下页面右边的购物车的图书的数量
						document.getElementById("bookCount").innerText = bookCount
								+ "个商品"
						alert("删除成功!");
					}
				}
			}
		}
	}
}

// 这个是实现全选功能
function selectAll(obj) {
	var tds = document.getElementsByName("first");
	// alert(tds.length);
	for (var i = 0; i < tds.length; i++) {
		tds[i].checked = obj.checked;
	}
}

// 然后我们需要进行删除我们的页面上的单元格
function getTdStr() {
	// 定义一个str，用来存放参数
	var str = "";
	// 然后需要进行判断一下那些td被选中了
	var tds = document.getElementsByName("first");
	for (var i = 0; i < tds.length; i++) {
		if (tds[i].checked == true) {
			str += tds[i].value + ":";
		}
	}
	return str;
}

// 为了实现我们的根据指定的数目进行显示数据
function displaySize(size) {
	// 先获取所有的first，这个first是input标签，因此我们需要获取父节点的父节点
	var first = document.getElementsByName("first");

	// 还需要把每次的display的值清空一下
	for (var i = 0; i < first.length; i++) {
		var tr = first[i].parentElement.parentElement;
		tr.style.display = "";
	}

	// 显示全部
	if (size.value == 0) {
		for (var i = 0; i < first.length; i++) {
			var tr = first[i].parentElement.parentElement;
			tr.style.display = "";
		}
	} else {
		//
		for (var i = size.value; i < first.length; i++) {
			// 获取爷爷的节点
			var tr = first[i].parentElement.parentElement;
			tr.style.display = "none";
		}
	}
}

// 修改购物车里面的商品的数量
function chanCount(obj) {

	// 还需要获取一下我们的那个总价的元素
	var cartBookTotal = document.getElementById("bTotal");
	// 并且获取一下我们的总价的金额
	var cartBookTotalValue = cartBookTotal.innerText;
	// 先把这个td里面的innerText保存一下
	var oldCount = obj.innerText;

	// 我们需要先把这个总价的金额减去我们要修改的
	cartBookTotalValue = Number(cartBookTotalValue)
			- Number(obj.previousElementSibling.innerText) * Number(oldCount);

	// 然后在把原来的东西清空一下
	obj.innerHTML = "";
	// 然后创建一个input标签
	var input = document.createElement("input");
	// 然后再把这个创建出来的input标签，绑定到td中去
	obj.appendChild(input);
	// 双击过之后，把这个onclick这个事件清空一下,防止冒泡事件
	obj.ondblclick = "";
	input.type = "number";
	input.min = "1";
	input.max = "100";
	input.value = oldCount;
	input.style = "width:50px";
	// 再给我们的input标签绑定一个onblur事件，确定修改数量
	input.onblur = function() {
		// 需要获取这个input里面的数据
		var inputValue = this.value;
		obj.innerHTML = "";
		obj.innerText = inputValue;
		if (!this.value.match("[0-9]+")) {
			obj.innerText = oldCount;
		}
		// 重新绑定一下事件
		obj.ondblclick = chanCount;

		// 当鼠标离开聚焦的时候，并且把那个价格和总计也修改一下
		// 获取一下下一个节点
		var nextTd = obj.nextElementSibling;
		// 在获取一下上一个节点
		var previousTd = obj.previousElementSibling;
		// 然后进行计算出该条明细的总价格
		nextTd.innerText = Number(previousTd.innerText) * Number(obj.innerText);

		// 最后计算一下我们这个购物车的总金额
		cartBookTotal.innerText = Number(nextTd.innerText) + cartBookTotalValue;

		// 最后再把右边的购物车的总价也修改一下
		document.getElementById("cartTotal").innerText = "总金额:"
				+ (Number(cartBookTotal.innerText)).toFixed(1) + "元";

		// 需要继续调用一下后台的程序
		var xmlHttp = getXMLHttp();

		console.log(xmlHttp);

		// 打开请求
		xmlHttp.open("post", "/book_stores_springmvc/updateCart", true);
		// 设置请求头信息
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");

		// 获取当前这个对象父节点的第一个子节点的value
		var bookId = obj.parentElement.firstElementChild.firstElementChild;

		// 发送请求
		xmlHttp.send("count=" + obj.innerText + "&bookId=" + bookId.value);

		// 回调函数
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				// alert("修改成功!");
			}
		}
	}
}

// 这个是为了实现添加图书的数量
function add(obj) {
	// alert("添加图书");
	// 需要获取一下我们的图书数量的标签元素
	var spanBookCount = obj.previousElementSibling;
	var spanBookCountValue = spanBookCount.innerText;
	// alert(spanBookCountValue);
	// 然后把这个数据进行+1
	var sum = Number(spanBookCountValue) + 1;
	spanBookCount.innerText = sum;

	chanCount(spanBookCount, spanBookCountValue);
}

// 这个实现了图书数量的减少
function subtract(obj) {
	// alert("减少图书")

	obj.className = "btn btn-default";

	// 需要获取一下我们的图书数量的标签元素
	var spanBookCount = obj.nextElementSibling;
	var spanBookCountValue = spanBookCount.innerText;
	// alert(spanBookCountValue);
	// 然后把这个数据进行+1
	var sum = Number(spanBookCountValue) - 1;
	if (sum < 1) {
		sum = 1;
	} else {
		sum = sum ;
	}
	spanBookCount.innerText = sum;
	chanCount(spanBookCount, spanBookCountValue);
}

// 修改购物车里面的商品的数量
// obj,代表着当前元素，obj2代表着下一个或者上一个元素，count代表着要修改成的数量
function chanCount(obj2, count) {
	
	// 还需要获取一下我们的那个总价的元素
	var cartBookTotal = document.getElementById("bTotal");
	// 并且获取一下我们的总价的金额
	var cartBookTotalValue = cartBookTotal.innerText;

	// 获取我们当前的图书明细的下一个的总计
	var nextTd = obj2.parentElement.nextElementSibling;
	// 获取我们的图书的单价的元素
	var previousTd = obj2.parentElement.previousElementSibling;
	// 然后进行计算出该条明细的总价格
	nextTd.innerText = Number(previousTd.innerText) * Number(obj2.innerText);
	
	// 需要继续调用一下后台的程序
	var xmlHttp = getXMLHttp();

	// 打开请求
	xmlHttp.open("post", "/book_stores_springmvc/updateCart", true);
	// 设置请求头信息
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");

	// 获取当前这个对象父节点的第一个子节点的value
	var bookId = obj2.parentElement.parentElement.firstElementChild.firstElementChild;

	// 发送请求
	xmlHttp.send("count=" + obj2.innerText + "&bookId=" + bookId.value);

	// 回调函数
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			document.getElementById("cartTotal").innerText = xmlHttp.responseText;
			// alert(xmlHttp.responseText)
			cartBookTotal.innerText = xmlHttp.responseText;
		}
	}
}


//这个是为了处理搜索框里面的业务
function likeName(){
    window.location="/book_stores_springmvc/searchBookView";
}
