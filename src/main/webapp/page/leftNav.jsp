<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include  file="../common/commonHead.jsp"%>
<div class="left">
    <ul class="menu0718">
    <%if(roleId.equals("1") || roleId.equals("0")){ %>
    <c:choose>
    	<c:when test="${param.obj=='orderDetail'}">
    		<li class="cur"><a href="<%=rootPath %>/v1/login/homePage" class="icon order-icon">官网订单</a>
                <ul class="sub-menu0719">
                    <li>
                        <a class="sub-a0719">订单详情</a>
                    </li>
                </ul>
            </li>
    	</c:when>
    	
    	<c:otherwise>

    		<li class="<c:if test="${param.nav=='index'}">cur</c:if> menu-li0718"><a href="<%=rootPath %>/v1/login/homePage" class="icon order-icon">官网订单</a></li>
    		<li class="<c:if test="${param.nav=='snLotterManagerPage'}">cur</c:if> menu-li0718"><a href="<%=rootPath %>/v1/snLotter/snLotterManagerPage" class="icon order-icon">中奖信息</a></li>
    	</c:otherwise>
    </c:choose>
        <% } %>
    	<%if(roleId.equals("0") || roleId.equals("1")) {%>
        <li class="menu-li0718 <c:if test="${param.nav=='goodsManager'}">cur cur-good1216</c:if>"><a href="<%=rootPath %>/v1/product/goodsManagerPage" class="icon goods-icon txt1216">商品管理(官)</a></li>
        <li class="menu-li0718 <c:if test="${param.nav=='rightsPictureManager'}">cur cur-rights0706</c:if>"><a href="<%=rootPath %>/v1/rights/legalRightsPicturePage" class="icon order-icon txtRights0706">维权图片管理</a></li>
        <%} %>
        <%if(roleId.equals("0") || roleId.equals("2")){ %>
    <c:choose>
    	<c:when test="${param.obj=='swOrderDetail'}">
    		<li class="cur"><a href="<%=rootPath %>/v1/storeOrder/swgoodsManagerPage" class="icon order-icon">商城订单</a>
                <ul class="sub-menu0719">
                    <li>
                        <a class="sub-a0719">实物详情</a>
                    </li>
                </ul>
            </li>
    	</c:when>
    	<c:otherwise>
    		<li class="menu-li0718 <c:if test="${param.nav=='swgoodsManager'}">cur</c:if>"><a href="<%=rootPath %>/v1/storeOrder/swgoodsManagerPage" class="icon order-icon">商城订单</a></li>
    	</c:otherwise>
    </c:choose>
    
    <li class="menu-li0718 <c:if test="${param.nav=='focusPicturePage'}">cur</c:if>"><a href!="" class="icon order-icon">商城商品</a>
        <ul class="sub-menu0719">
            <li>
                <a class="sub-a0719" href="<%=rootPath %>/v1/product/focusPicturePage">焦点图</a>
            </li>
            <li>
                <a class="sub-a0719" href="<%=rootPath %>/v1/product/foboGoodsPage">商品管理</a>
            </li>
        </ul>
    </li>
    <%} %>
    <%if(roleId.equals("1") || roleId.equals("0")|| roleId.equals("2")){ %>
    <li class="menu-li0718 <c:if test="${param.nav=='joinBusiness'}">cur</c:if>"><a href="<%=rootPath %>/v1/merchants/swMerchantsPage" class="icon log-icon">招商加盟</a></li>
    <% } %>
    <li class="menu-li0718 <c:if test="${param.nav=='operationLog'}">cur</c:if>"><a href="<%=rootPath %>/v1/syslog/operationLogPage" class="icon log-icon">操作日志</a></li>
    </ul>
</div>
