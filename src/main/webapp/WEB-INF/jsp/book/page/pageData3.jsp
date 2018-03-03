<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--精选图书 begin-->
<div>
    <div class="row" id="con">
        <!-- 遍历一下图书这个集合begin -->
        <c:forEach items="${pageBean.pageDates }" var="p">
            <div class="col-sm-6 col-md-3 fadeInLeft animated">
                <div class="thumbnail">
                    <a href="${pageContext.request.contextPath}/moreBookMes?id=${p.id}"><img src="${pageContext.request.contextPath}/images/${p.imgurl }"
                                                                   alt="通用的占位符缩略图"></a>
                    <div class="caption">
                        <h3>${p.bookName }</h3>
                        <p>价格:${p.price }元&nbsp;&nbsp;作者:${p.author }&nbsp;&nbsp;</p>
                        <p>
                            <a href="${pageContext.request.contextPath}/moreBookMes?id=${p.id}"> 更多信息 </a>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
        <!-- 遍历这个图书集合end -->
    </div>
</div>
<!--精选图书 end-->

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
                <li><a href="javascript:query(1)">首页</a></li>

                <!-- 上一页的begin -->
                <c:choose>
                    <c:when test="${pageBean.pageNow<=1 }">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:query('${pageBean.pageNow-1}')">&laquo;</a></li>
                    </c:otherwise>
                </c:choose>
                <!-- 上一页的end -->

                <!-- 中间的数字begin -->
                <c:forEach begin="${now }" end="${flag }" var="n">
                    <c:if test="${n==pageBean.pageNow }">
                        <li class="active"><a href="javascript:query('${n}')">${n }</a></li>
                    </c:if>
                    <c:if test="${n ne pageBean.pageNow }">
                        <li><a href="javascript:query('${n}')">${n }</a></li>
                    </c:if>
                </c:forEach>
                <!-- 中间的数字end -->

                <!-- 下一页的begin -->
                <c:choose>
                    <c:when test="${pageBean.pageNow>=pageBean.pageCount}">
                        <li class="disabled"><a href="#">&raquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:query('${pageBean.pageNow+1}')">&raquo;</a></li>
                    </c:otherwise>
                </c:choose>
                <!-- 下一页的end -->

                <li><a href="javascript:query('${count}')" style="border: 1px solid #ddd;">尾页</a></li>
                <li><a style="border: 0px; margin-left: 0px;">当前页${pageBean.pageNow }/${pageBean.pageCount }总页</a></li>
                <li class="col-md-14">
                    <div id="search" class="input-group">
                        <input id="searchs" type="text" name="pageNow"
                               class="form-control" placeholder="跳转指定页" /> <span
                            class="input-group-btn">
									<button onclick="find('${pageBean.pageCount}');" class="btn btn-info btn-search">GO</button>
								</span>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 分页end -->
</div>
