<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>官网管理后台</title>
<!-- <title>物流管理后台</title> -->
<link type='text/css' rel='stylesheet' href='<%=basePath %>style/style.css'/>
<link type='text/css' rel='stylesheet' href='<%=basePath %>js/plugin/jquery-easyui/themes/default/easyui.css'/>
<link type='text/css' rel='stylesheet' href='<%=basePath %>js/plugin/jquery-easyui/themes/icon.css'/>
<link type='text/css' rel='stylesheet' href='<%=basePath %>style/login.css'/>
</head>
<body>
<div class="body-container0718">
	<div class="container0718">
		<div class="login-header0718">
			<img src="<%=basePath %>/image/logo.png" width="65" height="67" alt="北京进化者机器人科技有限公司">
			<div class="logo-title0718">
				<p>北京进化者机器人科技有限公司</p>
                <p>官网管理后台</p>
				<!-- <p>物流管理后台</p> -->
			</div>
		</div>
	</div>
	<div class="login-content0718">
		<div class="container0718 clearfix">
			<div class="left">
				<img src="<%=basePath %>/image/login_bg.jpg">
			</div>
			<div class="right">
				<div class="right-info0718">
					<form id="login" class="easyui-form login-form0718" method="post" data-options="novalidate:true">
					<h2 class='form-title0718'>管理员登录</h2>
					<div class="form-div0715">
								<input class="easyui-textbox" type="text" name="username" data-options="prompt:'用户名',required:true" missingMessage="请输入用户名" style="width:300px;;height:32px"/>
						</div>
						<div class="form-div0715">
							<input id="pwd" class="easyui-textbox" type="password"  name="password"  data-options="prompt:'密码',required:true" missingMessage="请输入密码" style="width:300px;;height:32px"/>
						</div>
						<div class="form-div0715 validate">
							<input id="validate" class="easyui-textbox" type="text" name="verifyCode"  data-options="prompt:'验证码',required:true" missingMessage="请输入验证码"  style="width:193px;;height:32px"/>
							<img src="<%=request.getContextPath()%>/v1/login/getVerifyCodeImage" width='100' height='30' id="verifyCodeImage" />
						</div>
						<div class="form-action">
							<a href="javascript:;" class="easyui-linkbutton login-btn0718" id="loginbtn" style="height:32px">登录</a>
						</div>
					</form>
					<p class="com-wenhua0718">成为代表地球智慧的企业</p>
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/login.js'></script>
<script>
var basePath = "<%=basePath %>";
Login.init();

</script>
</body>
</html>