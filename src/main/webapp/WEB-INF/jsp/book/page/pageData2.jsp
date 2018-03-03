<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" >
    <!-- 遍历一下图书这个集合begin -->
    <c:forEach items="${pageBean.pageDates }" var="p">
        <div class="col-sm-6 col-md-3 fadeInLeft animated">
            <div class="thumbnail">
                <a href="${pageContext.request.contextPath}/moreBookMes?id=${p.id}"><img
                        src="${pageContext.request.contextPath}/images/${p.imgurl }" alt="通用的占位符缩略图"></a>
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
<!--分页 begin-->
<!-- 需要把这个pageNow的当前页设置一下，避免过界 -->
<c:set var="nowFrist" value="${pageBean.pageNow }"/>
<c:set var="countFrist" value="${pageBean.pageCount }"/>

<div class="container">
    <ul class="pager">
        <li><a href="javascript:findPage('${nowFrist-1 <= 1 ? 1 : nowFrist-1 }','特价图书')">&larr;上一页</a>
            <a href="javascript:findPage('${nowFrist+1 >= countFrist ? countFrist : nowFrist+1}','特价图书')">下一页
                &rarr;</a></li>
    </ul>
</div>
<!-- 分页end -->

