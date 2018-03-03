<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<!-- 订单信息begin -->
            <!-- 订单内容begin -->
            <div>
                <div class="row" id="con">
                    <table class="table table-striped table-hover">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>订单编号</th>
                            <th>下单日期</th>
                            <th>订单总价</th>
                            <th>会员账号</th>
                            <th>会员姓名</th>
                            <th>收货人</th>
                            <th>收货电话</th>
                            <th>订单发往地</th>
                        </tr>
                        </thead>
                        <%-- 遍历一下订单这个集合begin --%>
                        <c:forEach items="${orderPageBean.pageDates }" var="ord" varStatus="vso">
                            <tr style="font-size: 14px;">
                                <td class="info">${1000+vso.count }</td>
                                <td>${ord.orderNo }</td>
                                <td><fm:formatDate value="${ord.createDate }" pattern="yyyy/MM/dd HH:mm" /></td>
                                <td class="text-danger">${ord.total }元</td>
                                <td>${ord.user.userName }</td>
                                <td class="success text-success">${ord.user.realName }</td>
                                <td>${ord.address.peceiver}</td>
                                <td>${ord.address.tel}</td>
                                <td class="danger">${ord.address.provice}${ord.address.city}${ord.address.area }${ord.address.detail}</td>
                            </tr>

                        </c:forEach>
                    </table>
                </div>

                <%-- 分页进行begin --%>

                <!-- 处理一下页码begin -->
                <c:set var="onow" value="${orderPageBean.pageNow }"/>
                <c:set var="ocount" value="${orderPageBean.pageCount }"/>
                <c:set var="oflag" value="${now+2 }"/>
                <c:if test="${oflag >= ocount }">
                    <c:set var="oflag" value="${ocount }"/>
                    <c:set var="onow" value="${ocount-2 }"/>
                </c:if>
                <c:if test="${onow <=1 }">
                    <c:set var="onow" value="1"/>
                </c:if>
                <!-- 处理一下页码end -->

                <%--处理一下我们的分页标签，当我们进行了多条件查询的话，就隐藏了这个分页标签--%>
                <c:if test="${select=='zero' || select==null}">
                    <!-- 分页begin -->
                    <div class="container">
                        <div class="row text-center">
                            <div class="col-md-12">
                                <ul class="pagination">
                                    <li>
                                        <a href="javascript:adminOrderQuery(1)">首页</a>
                                    </li>

                                    <!-- 上一页的begin -->
                                    <c:choose>
                                        <c:when test="${orderPageBean.pageNow<=1 }">
                                            <li class="disabled"><a href="#">&laquo;</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="javascript:adminOrderQuery('${orderPageBean.pageNow-1}')">&laquo;</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <!-- 上一页的end -->

                                    <!-- 中间的数字begin -->
                                    <c:forEach begin="${onow }" end="${oflag }" var="on">
                                        <c:if test="${on==orderPageBean.pageNow }">
                                            <li class="active">
                                                <a href="javascript:adminOrderQuery('${on }')">${on }</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${on ne orderPageBean.pageNow }">
                                            <li>
                                                <a href="javascript:adminOrderQuery('${on }')">${on }</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <!-- 中间的数字end -->

                                    <!-- 下一页的begin -->
                                    <c:choose>
                                        <c:when test="${orderPageBean.pageNow>=orderPageBean.pageCount }">
                                            <li class="disabled"><a href="#">&raquo;</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a href="javascript:adminOrderQuery('${orderPageBean.pageNow+1}')">&raquo;</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <!-- 下一页的end -->

                                    <li>
                                        <a href="javascript:adminOrderQuery('${ocount}')" style="border: 1px solid #ddd;">尾页</a>
                                    </li>
                                    <li><a style="border: 0px; margin-left: 0px;">当前页${orderPageBean.pageNow }/${orderPageBean.pageCount }总页</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- 分页end -->
                </c:if>

                <%-- 分页进行end --%>

            </div>
            <!-- 订单内容end -->
