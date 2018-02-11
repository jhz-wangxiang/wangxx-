<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page language="java" import="com.efrobot.robotstore.baseapi.manager.pojo.SysUser" %>
<%@page language="java" import="com.efrobot.robotstore.util.Const" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SysUser user = (SysUser)request.getSession().getAttribute(Const.SESSION_USER);
String  munuId = user.getMenuId();
System.out.println(munuId);
%>
<aside class="Hui-aside">
	<div class="menu_dropdown bk_2">
		<%if(munuId.contains("1") || munuId.contains("2")){%>
		<dl id="menu-article">
			<dt <c:if test="${param.classify=='order'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe616;</i> 订单管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='order'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("1")){%><li <c:if test="${param.level=='order_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/orderList" title="订单列表">订单列表</a></li><%} %>
 					<%if(munuId.contains("2")){%><li <c:if test="${param.level=='order_add'}">class="current"</c:if>><a href="<%=basePath%>v1/page/addOrder" title="新建订单">新建订单</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
		<%if(munuId.contains("3")){%>
		<dl id="menu-abnormity">
			<dt <c:if test="${param.classify=='abnormity'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe616;</i> 异常管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='abnormity'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("3")){%><li <c:if test="${param.level=='abnormity_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/abnormityOrderList" title="异常订单">异常订单</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
		<%if(munuId.contains("4") || munuId.contains("5") || munuId.contains("6") || munuId.contains("7")){%>
		<dl id="menu-account">
			<dt <c:if test="${param.classify=='account'}">class="selected"</c:if>><i class="Hui-iconfont Hui-iconfont-user-group"></i> 账号管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='account'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("4")){%><li <c:if test="${param.level=='customer_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/customerList" title="客户账号">客户账号</a></li><%} %>
					<%if(munuId.contains("5")){%><li <c:if test="${param.level=='staff_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/staffList" title="员工管理">员工管理</a></li><%} %>
					<%if(munuId.contains("6")){%><li <c:if test="${param.level=='role_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/roleList" title="角色管理">角色管理</a></li><%} %>
					<%if(munuId.contains("7")){%><li <c:if test="${param.level=='channel_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/channelList" title="渠道管理">渠道管理</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
		<%if(munuId.contains("8")){%>
		<dl id="menu-flight">
			<dt <c:if test="${param.classify=='flight'}">class="selected"</c:if>><i class="Hui-iconfont Hui-iconfont-log"></i> 航班管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='flight'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("8")){%><li <c:if test="${param.level=='flight_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/flightList" title="航班管理">航班管理</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
		<%if(munuId.contains("9")){%>
		<dl id="menu-area">
			<dt <c:if test="${param.classify=='area'}">class="selected"</c:if>><i class="Hui-iconfont Hui-iconfont-log"></i> 区域管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='area'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("9")){%><li <c:if test="${param.level=='area_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/areaList" title="区域管理">区域管理</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
		<%if(munuId.contains("10")){%>
		<dl id="menu-area">
			<dt <c:if test="${param.classify=='dispatch'}">class="selected"</c:if>><i class="Hui-iconfont Hui-iconfont-log"></i> 派送人管理<i class="Hui-iconfont menu_dropdown-arrow Hui-iconfont-arrow2-bottom"></i></dt>
			<dd <c:if test="${param.classify=='dispatch'}">style="display: block;"</c:if>>
				<ul>
					<%if(munuId.contains("10")){%><li <c:if test="${param.level=='dispatch_list'}">class="current"</c:if>><a href="<%=basePath%>v1/page/dispatchList" title="派送人管理">派送人管理</a></li><%} %>
				</ul>
			</dd>
		</dl>
		<%} %>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>