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
	<jsp:param value="account" name="classify"/>
	<jsp:param value="staff_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        角色管理
        <span class="c-gray en">&gt;</span>
         角色管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal layui-form" id="form-admin-add">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">员工名称：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" id="" name="name">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">员工角色：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" id="" name="roleName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">账号状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
								<select name="status" class="select">
									<option value="">请选择</option>
									<option value="1">正常</option>
									<option value="0">停用</option>
								</select>
                            </div>
                        </div>
                     </div>
                    <div class='row cl text-c'>
                    	<button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
                    </div>
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="staff_add()" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加用户</a></span></div>
            <div class="mt-20">
                <table class="layui-hide" id="table"></table>
                <div id="page"></div>
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
			h.push('<a style="text-decoration:none" onclick="member_stop(this,\'10001\')" href="javascript:;" title="停用"><i class="Hui-iconfont Hui-iconfont-shenhe-tingyong"></i></a>')
			h.push('<a title="编辑" href="javascript:;" onclick="modifyStaff(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
		    return h.join("");
		},minWidth:"100",align:"center"},
		{field:"status",title:"状态",align:"center",minWidth:"100",templet:function(d){
        	if(d.status=="1"){
        		return '<span class="label label-success radius">正常</span>';
        	}else{
        		return '<span class="label label-defaunt radius">停用</span>';
        	}
        	
        }},
        {field:"username",title:"帐号",align:"center",minWidth:"100"},
        {field:"name",title:"员工名称",align:"center",minWidth:"90"},
        {field:"roleName",title:"角色名称",align:"center",minWidth:"90"},
        {field:"phone",title:"联系电话",align:"center",minWidth:"150"},
        {field:"createDate",title:"开通时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"updateDate",title:"上传登录时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.updateDate)
        }},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
	var searchTable = function(){
		var data = {
			name:Common.ltrim($("input[name='name']").val()),
			roleName:Common.ltrim($("input[name='roleName']").val()),
			status:$("select[name='status']").val()==""?null:$("select[name='status']").val(),
			start:start
		}
		tableIns.reload({
		  where: data
		});
	}
	var modifyStaff = function(id){
		$.ajax({
			url: basePath+"v1/sysuser/getSysUserListPage",
			type:"POST",
			data:{
				pageNumber:"1",
				pageSize:"10",
				id:id
			},
			success:function(data){
				var json = JSON.parse(data);
				var html = [];
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">账号</label>');
				html.push('<div class="layui-input-block"><input type="text" name="username" autocomplete="off" value="'+json.list[0].username+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">员工名称</label>');
				html.push('<div class="layui-input-block"><input type="text" name="name" autocomplete="off" value="'+json.list[0].name+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">联系电话</label>');
				html.push('<div class="layui-input-block"><input type="text" name="phone" autocomplete="off" value="'+json.list[0].phone+'" class="layui-input"></div></div>');
				html.push('</form></div>');
				layui.use(['form','layer'],function(){
					var form = layui.form;
					var formData = {
						id:id
					};
					layui.layer.open({
					     type: 1
					    ,title: '账号信息'
					    ,area: '600px'
					    ,maxmin: true
					    ,content: html.join("")
					    ,btn: ['确认', '取消']
					    ,yes: function(){
					    	formData.username = Common.ltrim(jQuery("input[name='username']").val());
					    	formData.phone = Common.ltrim(jQuery("input[name='phone']").val());
					    	if(formData.username!="" && formData.phone !=""){
					    		$.ajax({
						    		type:'POST',
						    		url:basePath+'v1/sysuser/updateStatus',
						    		data:formData,
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
		});
	}
	var staff_add = function(){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" id="staff_add">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">账号</label>');
		html.push('<div class="layui-input-block"><input type="text" name="username" lay-verify="required" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">员工名称</label>');
		html.push('<div class="layui-input-block"><input type="text" name="name" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">联系电话</label>');
		html.push('<div class="layui-input-block"><input type="text" name="phone" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-layer-btn layui-layer-btn-"><button class="btn btn-primary radius" lay-submit="" lay-filter="staff_add">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			//form.render(null, 'test1');
			layui.layer.open({
			     type: 1
			    ,title: '新增账号'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,success: function(layero, index){
			        console.log(layero, index);
			        form.on('submit(staff_add)', function(data){
		        	  console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
		        	  console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
		        	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		        	});
			    }
			  });
		});
	}
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/sysuser/getSysUserListPage",
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