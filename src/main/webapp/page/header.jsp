<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String time=sdf.format(new Date());

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache, must-revalidate" />
	<meta http-equiv="expires" content="0" />
	<meta name="copyright" content="" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title>实物商品管理后台</title>
    <%@ include  file="../common/commonHead.jsp"%>
    <link type='text/css' rel='stylesheet' href='<%=basePath %>style/style.css'/>
    <link type='text/css' rel='stylesheet' href='<%=basePath %>js/plugin/jquery-easyui/themes/default/easyui.css'/>
    <link type='text/css' rel='stylesheet' href='<%=basePath %>js/plugin/jquery-easyui/themes/icon.css'/>
    <link type='text/css' rel='stylesheet' href='<%=basePath %>style/index.css'/>
</head>
<body>
<!-- 头部  -->
<div class="container0718 clearfix">
    <div class="header left">
        <a class="header-logo0718"></a>

        <p>实物商品管理后台</p>
    </div>
    <div class="header-r left">
        <div class="header-top0718 clearfix">
            <a class="header-r-logo0718 left"></a>

            <div class="left">
                <p class="login-info0718">欢迎，您好！<span class="username"><%=operName%></span></p>
            </div>
            <div class="right">
                <span class="day0718"><%=time %></span>
                <a href="<%=request.getContextPath()%>/v1/login/logout">退出</a>
            </div>
        </div>
        <div class="header-nav0718">
            <a href="javascript:;" class="icon0725 icon-nav0725">首页</a>
            <a class="icon0725"> > &nbsp;<span class="cur" id="sub-navlist"><c:if test="${!empty navName}">${navName}</c:if></a>
            <%-- <ul class="nav0718 clearfix">
                <li>
                    <i class="toggle0718"></i><a href="<%=request.getContextPath()%>/v1/login/homePage">首页</a>
                </li>
                <li>
                    <span> > </span><span class="cur" id="sub-navlist"><c:if test="${!empty navName}">${navName}</c:if>
                    </span>
                </li>
            </ul> --%>
        </div>
    </div>
</div>
