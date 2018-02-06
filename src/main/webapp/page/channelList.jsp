<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="_meta.jsp"></jsp:include>
<title>后台管理 </title>
<meta name="keywords" content="后台">
<meta name="description" content="后台">
</head>
<body>

<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp">
	<jsp:param value="channel" name="classify"/>
	<jsp:param value="channel_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        渠道管理
        <span class="c-gray en">&gt;</span>
         渠道管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="channel_add()" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 新增渠道</a></span></div>
            <div class="mt-20">
                <table class="layui-hide" id="table"></table>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
    var colArr = [
		{field:"operation",title:"操作",templet: function(d){
			var h = [];
			h.push('<a title="编辑折扣" href="javascript:;" onclick="modifyChannel(\''+d.channel+'\',\''+d.discount+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="删除" href="javascript:;" onclick="" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>');
		    return h.join("");
		},width:"100",align:"center"},
        {field:"channel",title:"渠道名称",align:"center",width:"100"},
        {field:"discount",title:"折扣",align:"center",minWidth:"90",templet:function(d){
        	return (d.discount/10)
        }},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
	var modifyChannel = function(c,d){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" action="">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">渠道名称：</label>');
		html.push('<div class="layui-input-block"><input type="text" readonly autocomplete="off" value="'+c+'" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">折扣：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="modifyChannel_dis" autocomplete="off" value="'+d+'" class="layui-input"></div></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '编辑折扣'
			    ,area: '300px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,btn: ['确认', '取消']
			    ,yes: function(){
			    	if(Common.ltrim($("input[name='modifyChannel_dis']").val())!="" && new RegExp(/^\d+$/).test(Common.ltrim($("input[name='modifyChannel_dis']").val()))){
			    		$.ajax({
				    		type:'POST',
				    		url:basePath+'v1/channel/updateChannel',
				    		data:{channel:c,discount:Common.ltrim($("input[name='modifyChannel_dis']").val())},
				    	    success:function(d){
				    	    	var j = JSON.parse(d);
				    	    	if(j.resultCode=="SUCCESS"){
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 1000,
						    			shade: 0.4,
						    	    },function(){
						    	    	location.reload();
						    	    });
				    	    	}else{
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 3000,
						    	    	btn: ['好的'],
						    			shade: 0.4
						    	    });
				    	    	}
				    	    	
				    	    }
				    	});
			    	}else{
			    		layui.layer.msg('输入不能为空', {
			    	    	time: 3000,
			    	    	btn: ['好的'],
			    			shade: 0.4
			    	    });
			    	}
			    }
			    ,btn2: function(){
			    	layui.layer.closeAll();
			    }
			  });
		});
	}
	var channel_add = function(){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" action="">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">渠道名称：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="channel_add_name" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">折扣：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="channel_add_dis" autocomplete="off" class="layui-input"></div></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '新增折扣'
			    ,area: '300px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,btn: ['确认', '取消']
			    ,yes: function(){
			    	if(Common.ltrim($("input[name='channel_add_name']").val())!=""&&Common.ltrim($("input[name='channel_add_dis']").val())!="" && new RegExp(/^\d+$/).test(Common.ltrim($("input[name='channel_add_dis']").val()))){
			    		$.ajax({
				    		type:'POST',
				    		url:basePath+'v1/channel/insertChannel',
				    		data:{channel:Common.ltrim($("input[name='channel_add_name']").val()),discount:Common.ltrim($("input[name='channel_add_dis']").val())},
				    	    success:function(d){
				    	    	var j = JSON.parse(d);
				    	    	if(j.resultCode=="SUCCESS"){
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 1000,
						    			shade: 0.4,
						    	    },function(){
						    	    	location.reload();
						    	    });
				    	    	}else{
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 3000,
						    	    	btn: ['好的'],
						    			shade: 0.4
						    	    });
				    	    	}
				    	    	
				    	    }
				    	});
			    	}else{
			    		layui.layer.msg('输入不能为空', {
			    	    	time: 3000,
			    	    	btn: ['好的'],
			    			shade: 0.4
			    	    });
			    	}
			    }
			    ,btn2: function(){
			    	layui.layer.closeAll();
			    }
			  });
		});
	}
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/channel/getChannelListPage",
    		method:"POST",
    		where: {start:start},
    		request: {pageName:"pageNumber",limitName:"pageSize"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:{
    			limits:[10, 20,50]
    		}
    	});
    	
    });
</script>
</body>
</html>