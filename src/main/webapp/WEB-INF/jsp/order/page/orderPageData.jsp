<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!--内容展示 begin-->
<div class="table-responsive">
    <c:forEach items="${orderList.pageDates }" var="p" varStatus="vs">

        <table id="${p.id }" class="table table-hover table-striped">
            <thead>
                <%-- 这个是我们的订单的详情的点击处begin --%>
            <tr>
                <td colspan="9">
                    <div class="col-md-10" style="padding-left: 0px;">
                        <fm:formatDate value="${p.createDate }" pattern="yyyy-MM-dd"
                                       var="createDate" />
                        <input type="checkbox" value="${p.id }" name="cks">&nbsp; ${createDate }
                        订单号:${p.orderNo }单
                    </div>
                    <div class="col-md-2" style="text-align: right;">
                        <button type="button" class="btn btn-primary"
                                data-toggle="collapse" data-target="#${vs.count }">
                            订单详情</button>
                    </div>
                </td>
            </tr>
                <%-- 这个是我们的订单的详情的点击处end --%>

                <%-- 折叠框begin --%>
            <tr id="${vs.count }" class="collapse">
                <td colspan="9">
                    <div class="panel-body">
                        <!--tab选项卡 begin-->
                        <ul id="myTab" class="nav nav-tabs">
                            <li class="active"><a href="#first${vs.count }" data-toggle="tab">
                                联系人信息 </a></li>
                            <li><a href="#two${vs.count }" data-toggle="tab">订单信息</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="first${vs.count }">
                                <div class="row">
                                    <div>
                                        <ul class="nav navbar-collapse" style="line-height: 3;">
                                            <li class="text-info"><span class="text-success">姓名:</span><span
                                                    class="text-info">${p.address.peceiver }</span></li>
                                            <li class="text-info"><span class="text-success">联系方式:</span>
                                                    ${p.address.tel }</li>
                                            <li class="text-info"><span class="text-success">收货地址:</span>
                                                    ${p.address.provice }${p.address.city }${p.address.area }${p.address.detail }
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="two${vs.count }">
                                <div class="row">
                                    <div>
                                        <ul class="nav navbar-collapse" style="line-height: 3;">
                                            <li class="text-info"><span class="text-success">订单编号:</span><span
                                                    class="text-info">${p.orderNo }</span></li>
                                            <li class="text-info"><span class="text-success">交易时间:</span>
                                                <fm:formatDate value="${p.createDate }"
                                                               pattern="yyyy/MM/dd HH:mm:ss" /></li>
                                            <li class="text-info"><span class="text-success">订单总金额:</span>${p.total }元</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--tab选项卡 end-->
                    </div>
                </td>
            </tr>
                <%-- 折叠框end --%>

                <%-- 标题 --%>
            <tr class="active">
                <th>序号</th>
                <th>图片</th>
                <th>图书名称</th>
                <th>单价(元)</th>
                <th>数量</th>
                <th>实付款(元)</th>
                <th>付款日期</th>
                <th>交易状态</th>
            </tr>

                <%-- 内容 --%>
            <c:forEach items="${p.items }" var="item" varStatus="vst">
                <tr class="success">
                    <td >${1000+vst.count }</td>
                    <td><img src="${pageContext.request.contextPath}/images/${item.book.imgurl}"></td>
                    <td>${item.book.bookName}</td>
                    <td>${item.book.price}</td>
                    <td>${item.count}</td>
                    <td>${p.total }</td>
                    <td>${createDate }</td>
                    <td>${p.orderStatus }</td>
                </tr>
            </c:forEach>
            </thead>
        </table>

    </c:forEach>
</div>
<!-- 内容展示end -->


<!-- 处理一下页码begin -->
<c:set var="now" value="${orderList.pageNow }"/>
<c:set var="count" value="${orderList.pageCount }"/>
<c:set var="flag" value="${now+2 }"/>
<c:if test="${flag >= count }">
    <c:set var="flag" value="${count }"/>
    <c:set var="now" value="${count-2 }"/>
</c:if>
<c:if test="${now <=1 }">
    <c:set var="now" value="1"/>
</c:if>
<!-- 处理一下页码end -->

<!-- 处理一下我们要跳转的页面begin -->
<c:choose>
    <c:when test="${sign.equals('searchDate') }">
        <c:set value="${pageContext.request.contextPath}/bs/order/searchOrderByDate?minDate=${minDate }&maxDate=${maxDate }&" var="file"/>
    </c:when>
    <c:when test="${sign.equals('softOrder') }">
        <c:set value="${pageContext.request.contextPath}/bs/order/softOrder?softFlag=${softFlag }&" var="file"/>
    </c:when>
    <c:when test="${sign.equals('listAllOrder') }">
        <c:set value="${pageContext.request.contextPath}/bs/order/listAllOrder?" var="file"/>
    </c:when>
</c:choose>
<!-- 处理一下我们要跳转的页面end -->

<c:if test="${orderList.pageNow != null}">
    <!-- 分页begin -->
    <div class="container">
        <div class="row text-center">
            <div class="col-md-12">
                <ul class="pagination">
                    <li><a href="javascript:queryOrderByUser(1)">首页</a></li>

                    <!-- 上一页的begin -->
                    <c:choose>
                        <c:when test="${orderList.pageNow<=1 }">
                            <li class="disabled"><a href="#">&laquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:queryOrderByUser('${orderList.pageNow-1}')">&laquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                    <!-- 上一页的end -->

                    <!-- 中间的数字begin -->
                    <c:forEach begin="${now }" end="${flag }" var="n">
                        <c:if test="${n==orderList.pageNow }">
                            <li class="active"><a href="#">${n }</a></li>
                        </c:if>
                        <c:if test="${n ne orderList.pageNow }">
                            <li><a href="javascript:queryOrderByUser('${n}')">${n }</a></li>
                        </c:if>
                    </c:forEach>
                    <!-- 中间的数字end -->

                    <!-- 下一页的begin -->
                    <c:choose>
                        <c:when test="${orderList.pageNow>=orderList.pageCount}">
                            <li class="disabled"><a href="#">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:queryOrderByUser('${orderList.pageNow+1}')">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                    <!-- 下一页的end -->

                    <li>
                        <c:if test="${count==0 }">
                            <a href="#" style="border: 1px solid #ddd;" class="disabled">尾页</a>
                        </c:if>
                        <c:if test="${count>0 }">
                            <a href="javascript:queryOrderByUser('${count}')" style="border: 1px solid #ddd;">尾页</a>
                        </c:if>
                    </li>
                    <li><a style="border: 0px; margin-left: 0px;">当前页${orderList.pageNow }/${orderList.pageCount }总页</a></li>
                    <li class="col-md-14">
                        <div id="search" class="input-group">
                            <input id="searchs" type="text" name="pageNow" class="form-control" placeholder="跳转指定页" />
                            <span class="input-group-btn">
                            <button onclick="querySearchOrderByUser('${orderList.pageCount}');" class="btn btn-info btn-search">GO</button>
                        </span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- 分页end -->
</c:if>


</div>
<!-- 左边end -->
