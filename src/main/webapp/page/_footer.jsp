<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/static/h-ui.admin/js/H-ui.admin.page.js"></script>