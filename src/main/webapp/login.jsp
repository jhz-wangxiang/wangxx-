<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="Cache-Control" content="no-siteapp" />
	<!--[if lt IE 9]>
	<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/html5.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/respond.min.js"></script>
	<![endif]-->
	<link href="<%=basePath%>js/plugin/h-ui/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>js/plugin/h-ui/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>js/plugin/h-ui/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>js/plugin/h-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<!--[if IE 6]>
	<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
	<script>DD_belatedPNG.fix('*');</script><![endif]-->
	<title>后台登录</title>
	<meta name="keywords" content="">
	<meta name="description" content="">
</head>
<body>
<div class="loginWraper">
	<div id="loginform" class="loginBox">
		<form class="form form-horizontal" method="post">
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
				<div class="formControls col-xs-8">
					<input type="text" name="username" placeholder="账户" class="input-text size-L">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
				<div class="formControls col-xs-8">
					<input type="password" name="password" placeholder="密码" class="input-text size-L">
				</div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;" name="verifyCode">
					<img src="<%=request.getContextPath()%>/v1/login/getVerifyCodeImage" width='100' height='30' id="code" />
					<a id="kanbuq" href="javascript:;">看不清，换一张</a>
				</div>
			</div>
			<div class="row cl">
				<div class="formControls col-xs-8 col-xs-offset-3">
					<input id="button" type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/plugin/h-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/plugin/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/plugin/h-ui/static/h-ui.admin/js/H-ui.admin.page.js"></script>
<script>
	var basePath = "<%=basePath%>";
	var imgPath = "<%=request.getContextPath()%>/v1/login/getVerifyCodeImage";
    $("#kanbuq").click(function(){
        $("#code").attr("src",imgPath+"?"+Math.random())
    });
    $("#button").click(function(){
        var username = Common.ltrim($("input[name='username']").val());
        var password = Common.ltrim($("input[name='password']").val());
        var captcha = Common.ltrim($("input[name='verifyCode']").val());
        if(username!=""&&password!=""&&captcha!=""){
            $.ajax({
                url: basePath+"v1/login/login",
                type:"POST",
                //dataType:'json',
                //contentType: 'application/json;charset=utf-8',
				//data:JSON.stringify(),
				data:{username:username,
                    password:password,
                    verifyCode:captcha},
                success:function(json){
                    var res=eval('('+json.split("<aud")[0]+')');
                    if(res.resultCode == "SUCCESS"){
                        window.location.href = basePath + "v1/login/new-order.jsp";
                    }else{
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg(res.msg, {
                                time: 3000,
                                btn: ['好的'],
                                shade: 0.4,
                                zIndex:100
                            });
						});

                    }
                }
            })
        }else{
            layui.use('layer', function() {
                var layer = layui.layer;
                layer.msg('请正确填写', {
                    time: 30000,
                    btn: ['好的'],
                    shade: 0.4,
                    zIndex: 100
                });
            })
        }

    });
</script>
</body>
</html>