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
			if(d.status=="1"){
				h.push('<a style="text-decoration:none" onclick="statusFun(\''+d.id+'\',0)" href="javascript:;" title="停用"><i class="Hui-iconfont Hui-iconfont-shenhe-tingyong"></i></a>')
			}else{
				h.push('<a style="text-decoration:none" onclick="statusFun(\''+d.id+'\',1)" href="javascript:;" title="启用"><i class="Hui-iconfont Hui-iconfont-gouxuan"></i></a>')
			}
			h.push('<a title="编辑" href="javascript:;" onclick="modifyStaff(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="修改密码" href="javascript:;" onclick="modifyPwd(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-key"></i></a>');
		    return h.join("");
		},minWidth:"100",align:"center"},
		{field:"status",title:"状态",align:"center",minWidth:"100",templet:function(d){
        	if(d.status=="1"){
        		return '<span class="label label-success radius">启用</span>';
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
    /*用户-启用-停用*/
    function statusFun(id,status){
    	if(status){
    		var fd = {
    			title:"确认要启用吗？",
    			icon:"6",
    			suc:"已启用!"
    		}
    	}else{
    		var fd = {
    			title:"确认要停用吗？",
    			icon:"5",
    			suc:"已停用!"
    		}
    	}
    	layer.confirm(fd.title,function(index){
    		var loadindex = layer.load();
    		$.ajax({
    			url: basePath+"v1/sysuser/updateStatus",
    			type:"POST",
    			data:{id:id,status:status},
    			success:function(data){
    				var json = JSON.parse(data)
    				if(json.resultCode="SUCCESS"){
    					layer.msg(fd.suc,{icon: fd.icon,time:1000},function(){
    						layer.close(loadindex);
    						tableIns.reload();
    		    		});
    				}else{
    					
    				}
    			}
    		})
    		
    	});
    }
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
	var getRoleId = function(){
		var j;
		$.ajax({
			url: basePath+"v1/role/getRoleAll",
			async:false, 
			type:"POST",
			success:function(m){
				j = JSON.parse(m);
			}
		});
		return j;
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
				var rId = getRoleId();
				var json = JSON.parse(data);
				var html = [];
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">账号</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modifyStaffusername" autocomplete="off" value="'+json.list[0].username+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">员工名称</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modifyStaffname" autocomplete="off" value="'+json.list[0].name+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">员工角色</label>');
				html.push('<div class="layui-input-block"><select name="modifyStaffrole" class="select">');
				for(var i=0;i<rId.length;i++){
					if(json.list[0].roleId==rId[i].id){
						html.push('<option value="'+rId[i].id+'" selected>'+rId[i].roleName+'</option>');
					}else{
						html.push('<option value="'+rId[i].id+'">'+rId[i].roleName+'</option>');
					}
				}
				html.push('</select></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">联系电话</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modifyStaffphone" autocomplete="off" value="'+json.list[0].phone+'" class="layui-input"></div></div>');
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
					    ,content: html.join(""),
					    success:function(){
					    	form.render('select');
					    }
					    ,btn: ['确认', '取消']
					    ,yes: function(){
					    	formData.username = Common.ltrim(jQuery("input[name='modifyStaffusername']").val());
					    	formData.name = Common.ltrim(jQuery("input[name='modifyStaffname']").val());
					    	formData.phone = Common.ltrim(jQuery("input[name='modifyStaffphone']").val());
					    	formData.roleId = $("select[name='modifyStaffrole']").val()==""?null:$("select[name='modifyStaffrole']").val();
					    	if(formData.username!="" && formData.phone !="" && formData.phone != "" && formData.roleId != ""){
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
		var rId = getRoleId();
		html.push('<div class="pd-20"><form class="layui-form" id="staff_add">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">账号</label>');
		html.push('<div class="layui-input-block"><input type="text" name="staff_add_username" lay-verify="required" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">员工名称</label>');
		html.push('<div class="layui-input-block"><input type="text" name="staff_add_name" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">员工密码</label>');
		html.push('<div class="layui-input-block"><input type="password" name="staff_add_password" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">员工角色</label>');
		html.push('<div class="layui-input-block"><select name="staff_add_roleId" class="select">');
		for(var i=0;i<rId.length;i++){
			html.push('<option value="'+rId[i].id+'">'+rId[i].roleName+'</option>');
		}
		html.push('</select></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">联系电话</label>');
		html.push('<div class="layui-input-block"><input type="text" name="staff_add_phone" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-layer-btn layui-layer-btn-"><button class="btn btn-primary radius" lay-submit="" lay-filter="staff_add">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '新增账号'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,success: function(layero, index){
			    	form.render('select');
			        form.on('submit(staff_add)', function(data){
		        	  var fd = {};
		        	  for(var d in data.field){
		        		  fd[d.replace("staff_add_","")] = data.field[d];
		        	  }
		        	  $.ajax({
		        		  url: basePath+"v1/sysuser/insert",
		        		  type:"POST",
		        		  data:fd,
		        		  success:function(data){
		        			var json = JSON.parse(data);
		        			location.reload();
		        		  }
		        	  })
		        	  return false;
		        	});
			    }
			  });
		});
	}
	var modifyPwd = function(id){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" id="staff_pwd">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">原密码</label>');
		html.push('<div class="layui-input-block"><input type="password" name="staff_pwd_passWord" lay-verify="required" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">新密码</label>');
		html.push('<div class="layui-input-block"><input type="password" name="staff_pwd_passWordNew" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">确认新密码</label>');
		html.push('<div class="layui-input-block"><input type="password" name="staff_pwd_passWordNewAg" autocomplete="off" lay-verify="required" class="layui-input"></div></div>');
		html.push('<div class="layui-layer-btn layui-layer-btn-"><button class="btn btn-primary radius" lay-submit="" lay-filter="staff_pwd">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '修改密码'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,success: function(layero, index){
			        form.on('submit(staff_pwd)', function(data){
			        	
		        	  var fd = {id:id};
		        	  for(var d in data.field){
		        		  fd[d.replace("staff_pwd_","")] = data.field[d];
		        	  }
		        	  console.log(fd)
		        	  $.ajax({
		        		  url: basePath+"v1/sysuser/updateUserPassWord",
		        		  type:"POST",
		        		  data:fd,
		        		  success:function(data){
		        			var json = JSON.parse(data);
		        			if(json.resultCode=="SUCCESS"){
		        				layui.layer.msg("修改成功", {icon: "6",time:1000},function(){
					    	    	layui.layer.closeAll();
					    	    });
		        			}else{
		        				layui.layer.msg(json.msg, {
					    	    	time: 2000,
					    	    	btn: ['好的'],
					    			shade: 0.4
					    	    });
		        			}
		        		  }
		        	  })
		        	  return false;
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