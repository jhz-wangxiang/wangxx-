<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<dl id="menu-article">
			<dt <c:if test="${param.classify=='order'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe616;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd <c:if test="${param.classify=='order'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='order_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/orderList" title="订单列表">订单列表</a></li>
 					<li <c:if test="${param.level=='order_add'}">class="current"</c:if>><a href="<%=basePath%>v1/page/addOrder" title="新建订单">新建订单</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-abnormity">
			<dt <c:if test="${param.classify=='abnormity'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe616;</i> 异常管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd <c:if test="${param.classify=='abnormity'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='abnormity_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/abnormityOrderList" title="异常订单">异常订单</a></li>
				</ul>
			</dd>
		</dl>
		<dl id="menu-account">
			<dt <c:if test="${param.classify=='account'}">class="selected"</c:if>><i class="Hui-iconfont Hui-iconfont-user-group"></i> 账号管理<i class="Hui-iconfont menu_dropdown-arrow"></i></dt>
			<dd <c:if test="${param.classify=='account'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='customer_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/customerList" title="客户账号">客户账号</a></li>
					<li <c:if test="${param.level=='staff_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/staffList" title="角色管理">角色管理</a></li>
				</ul>
			</dd>
		</dl>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>