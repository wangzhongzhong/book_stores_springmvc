<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!-- 图书信息begin -->
<div class="panel panel-danger">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseThree"> 图书信息 </a>
        </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse in">
        <div class="panel-body">
            <%-- 内容的begin --%>
            <div>
                <a href="${pageContext.request.contextPath}/book/getUpdateBook" class="text-danger"><span
                        class="glyphicon glyphicon-plus">:添加</span></a>
                <div class="row" id="con">
                    <%-- 遍历一下图书这个集合begin --%>
                    <c:forEach items="${pageBean.pageDates }" var="p">
                        <div id="${p.id }" class="col-sm-6 col-md-3 ">
                            <div class="thumbnail">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/${p.imgurl }"></a>
                                <div class="caption">
                                    <p class="text-info">图书名:${p.bookName }</p>
                                    <p class="text-info">图书作者:${p.author }</p>
                                    <p class="text-info">图书单价:${p.price }￥</p>
                                    <br> <a href="#" onclick="deleteBook('${p.id }');"
                                            class="text-danger"> <span
                                        class="glyphicon glyphicon-trash"></span>
                                </a> <a href="${pageContext.request.contextPath}/getUpdateBook/${p.id}"
                                        class="text-warning" style="float: right;"> <span
                                        class="glyphicon glyphicon-edit"></span>
                                </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%-- 内容的end --%>

            <%-- 分页进行begin --%>

            <!-- 处理一下页码begin -->
            <c:set var="now" value="${pageBean.pageNow }"/>
            <c:set var="count" value="${pageBean.pageCount }"/>
            <c:set var="flag" value="${now+2 }"/>
            <c:if test="${flag >= count }">
                <c:set var="flag" value="${count }"/>
                <c:set var="now" value="${count-2 }"/>
            </c:if>
            <c:if test="${now <=1 }">
                <c:set var="now" value="1"/>
            </c:if>
            <!-- 处理一下页码end -->

            <!-- 分页begin -->
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-12">
                        <ul class="pagination">
                            <li>
                                <a href="javascript:adminBookQuery(1)">首页</a>
                            </li>

                            <!-- 上一页的begin -->
                            <c:choose>
                                <c:when test="${pageBean.pageNow<=1 }">
                                    <li class="disabled"><a href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="javascript:adminBookQuery('${pageBean.pageNow-1}')">&laquo;</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <!-- 上一页的end -->

                            <!-- 中间的数字begin -->
                            <c:forEach begin="${now }" end="${flag }" var="n">
                                <c:if test="${n==pageBean.pageNow }">
                                    <li class="active">
                                        <a href="javascript:adminBookQuery('${n}')">${n }</a>
                                    </li>
                                </c:if>
                                <c:if test="${n ne pageBean.pageNow }">
                                    <li>
                                        <a href="javascript:adminBookQuery('${n}')">${n }</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!-- 中间的数字end -->

                            <!-- 下一页的begin -->
                            <c:choose>
                                <c:when test="${pageBean.pageNow>=pageBean.pageCount }">
                                    <li class="disabled"><a href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="javascript:adminBookQuery('${pageBean.pageNow+1}')">&raquo;</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <!-- 下一页的end -->

                            <li>
                                <a href="javascript:adminBookQuery('${count}')" style="border: 1px solid #ddd;">尾页</a>
                            </li>
                            <li><a style="border: 0px; margin-left: 0px;">当前页${pageBean.pageNow }/${pageBean.pageCount }总页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 分页end -->

            <%-- 分页进行end --%>
        </div>
    </div>
</div>
<!-- 图书信息end -->
