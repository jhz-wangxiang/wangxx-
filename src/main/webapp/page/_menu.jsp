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
			<dt <c:if test="${param.classify=='file'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe616;</i> 文件管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd <c:if test="${param.classify=='file'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='file_list'}">class="current"</c:if>><a href="<%=basePath%>files-list.jsp" title="文件列表">文件列表</a></li>
				</ul>
			</dd>
		</dl>
		<shiro:hasPermission name="user:insert"><dl id="menu-admin">
			<dt <c:if test="${param.classify=='admin'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd <c:if test="${param.classify=='admin'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='admin_list'}">class="current"</c:if>><a href="<%=basePath%>admin-list.jsp" title="用户列表">用户列表</a></li>
				</ul>
			</dd>
		</dl></shiro:hasPermission>
		<shiro:hasPermission name="record"><dl id="menu-system">
			<dt <c:if test="${param.classify=='system'}">class="selected"</c:if>><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd <c:if test="${param.classify=='system'}">style="display: block;"</c:if>>
				<ul>
					<li <c:if test="${param.level=='system_log'}">class="current"</c:if>>
						<a href="system-log.jsp" title="系统日志">系统日志</a>
					</li>
					<li <c:if test="${param.level=='operation_log'}">class="current"</c:if>>
						<a href="operation-log.jsp" title="操作日志">操作日志</a>
					</li>
				</ul>
			</dd>
		</dl></shiro:hasPermission>
	</div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>