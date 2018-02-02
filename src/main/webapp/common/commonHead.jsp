<%@page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.efrobot.robotstore.baseapi.manager.pojo.SysUser" %>
<%@page language="java" import="com.efrobot.robotstore.util.Const" %>
<%@page language="java" import="java.util.Date" %>
<%@page language="java" import="java.text.SimpleDateFormat" %>
<%
    //系统根目录
	String rootPath = request.getContextPath();
	//获取当前的Subject
    SysUser user = (SysUser)request.getSession().getAttribute(Const.SESSION_USER);
	//操作员ID
	Integer userId = user.getId();
	System.out.println(userId);
	//操作员登陆用户名
	String userName = user.getUsername();
	System.out.println(userName);
	//操作员姓名
	String operName = user.getName();
	System.out.println(operName);
	//角色
	String roleId = user.getRoleId();
%>
<script type="text/javascript">
	//定义变量
	var rootPath = "<%=rootPath%>";
	var userId = "<%=userId%>";
	var userName = "<%=userName%>";
	var operName = "<%=operName%>";
</script>

