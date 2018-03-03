<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<div class="panel panel-warning">
    <div class="panel-heading">
        <h4 class="panel-title">
            <a data-toggle="collapse" data-parent="#accordion"
               href="#collapseFour"> 用户信息</a>
        </h4>
    </div>
    <div id="collapseFour" class="panel-collapse collapse in">
        <div class="panel-body">
            <a href="#" class="text-success" data-toggle="modal"
               data-target="#register"><span class="glyphicon glyphicon-plus">:添加</span></a>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>真实姓名</th>
                    <th>性别</th>
                    <th>手机号</th>
                    <th>权限</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${userPageBean.pageDates }" var="userP"
                           varStatus="vsu">
                    <tr id="${userP.id }">
                        <td>${1000+vsu.count }</td>
                        <td>${userP.userName }</td>
                        <td>${userP.password }</td>
                        <td>${userP.realName }</td>
                        <!-- 处理一下性别 -->
                        <c:if test="${userP.gender=='M' }">
                            <td>男</td>
                        </c:if>

                        <c:if test="${userP.gender=='W' }">
                            <td>女</td>
                        </c:if>

                        <td>${userP.phone }</td>

                        <!-- 处理一下权限 -->
                        <c:if test="${userP.state ==0 }">
                            <td class="danger">普通会员</td>
                        </c:if>
                        <c:if test="${userP.state ==1 }">
                            <td class="danger">管理员</td>
                        </c:if>
                        <td>
                            <c:if test="${userP.state ==1 }">
                            <a class="text-danger" href="#"><span
                                    class="glyphicon glyphicon-trash"></span></a>
                            </c:if>
                            <c:if test="${userP.state ==0 }">
                            <a class="text-danger" href="${pageContext.request.contextPath}/deleteUser?user_id=${userP.id}&userName=${user.userName}&password=${user.password}">
                                <span class="glyphicon glyphicon-trash"></span>
                            </a>
                            </c:if> &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/getUpdateUser?user_id=${userP.id}">
                                <span class="glyphicon glyphicon-edit"></span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <%-- 分页进行begin --%>

            <!-- 处理一下页码begin -->
            <c:set var="nowUser" value="${userPageBean.pageNow }"/>
            <c:set var="countUser" value="${userPageBean.pageCount }"/>
            <c:set var="flagUser" value="${nowUser+2 }"/>
            <c:if test="${flagUser >= countUser }">
                <c:set var="flagUser" value="${countUser }"/>
                <c:set var="nowUser" value="${countUser-2 }"/>
            </c:if>
            <c:if test="${nowUser <=1 }">
                <c:set var="nowUser" value="1"/>
            </c:if>
            <!-- 处理一下页码end -->

            <!-- 分页begin -->
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-12">
                        <ul class="pagination">
                            <li><a href="javascript:adminQuery(1)">首页</a></li>
                            <!-- 上一页的begin -->
                            <c:choose>
                                <c:when test="${userPageBean.pageNow<=1 }">
                                    <li class="disabled"><a href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="javascript:adminQuery('${userPageBean.pageNow-1}')">&laquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            <!-- 上一页的end -->

                            <!-- 中间的数字begin -->
                            <c:forEach begin="${nowUser }" end="${flagUser }" var="nUser">
                                <c:if test="${nUser==userPageBean.pageNow }">
                                    <li class="active">
                                        <a href="javascript:adminQuery('${nUser}')">${nUser }</a>
                                    </li>
                                </c:if>
                                <c:if test="${nUser ne userPageBean.pageNow }">
                                    <li>
                                        <a href="javascript:adminQuery('${nUser}')">${nUser }</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <!-- 中间的数字end -->

                            <!-- 下一页的begin -->
                            <c:choose>
                                <c:when test="${userPageBean.pageNow>=userPageBean.pageCount }">
                                    <li class="disabled"><a href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="javascript:adminQuery('${userPageBean.pageNow+1}')">&raquo;</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                            <!-- 下一页的end -->

                            <li><a href="javascript:adminQuery('${countUser}')" style="border: 1px solid #ddd;">尾页</a></li>
                            <li><a style="border: 0px; margin-left: 0px;">当前页${userPageBean.pageNow }/${userPageBean.pageCount }总页</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 分页end -->

            <%-- 分页进行end --%>

        </div>
    </div>
</div>
