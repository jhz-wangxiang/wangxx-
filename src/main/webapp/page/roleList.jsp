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
	<jsp:param value="role_list" name="level"/>
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
                  <div class="text-c">
                  		角色名称：<input type="text" class="input-text" style="width:250px" id="" name="roleName">
                          <button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
                  	</div>
               </div>
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="addRole()" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加用户</a></span></div>
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
	var menuArr = [{exp1:"订单列表",menuId:"1"},{exp1:"新建订单",menuId:"2"},{exp1:"异常订单",menuId:"3"},{exp1:"客户账号",menuId:"4"},{exp1:"员工管理",menuId:"5"},{exp1:"角色管理",menuId:"6"},{exp1:"渠道管理",menuId:"7"},{exp1:"航班管理",menuId:"8"},{exp1:"区域管理",menuId:"9"},{exp1:"派送人管理",menuId:"10"},{exp1:"统计管理",menuId:"11"},{exp1:"总表统计",menuId:"12"}];
    var colArr = [
		{field:"operation",title:"操作",templet: function(d){
			var h = [];
			h.push('<a title="编辑" href="javascript:;" onclick="modifyRole(\''+d.roleName+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="删除" href="javascript:;" onclick="delRole(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>');
		    return h.join("");
		},width:"100",align:"center"},
        {field:"roleName",title:"角色名称",align:"center",width:"100"},
        {field:"exp2",title:"权限信息",align:"center",minWidth:"90"},
        {field:"exp1",title:"菜单权限",align:"center",minWidth:"150"},
        {field:"nameNum",title:"角色人数",align:"center",width:"100"},
        {field:"name",title:"角色成员",align:"center",minWidth:"400"},
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
			roleName:Common.ltrim($("input[name='roleName']").val()),
			start:start
		}
		tableIns.reload({
		  where: data
		});
	}
	var getStatus = function(){
		var j;
		$.ajax({
			url: basePath+"v1/order/getOrderStatus",
			async:false, 
			type:"POST",
			success:function(m){
				j = JSON.parse(m);
			}
		});
		return j;
	}
	var getFlightNumByCompayFun = function(){
		var j;
		$.ajax({
			url: basePath+"v1/order/getFlightNumByCompay",
			async:false, 
			type:"POST",
			success:function(m){
				j = JSON.parse(m);
			}
		});
		return j;
	}
	var modifyRole = function(roleName){
		$.ajax({
			url:basePath+"v1/role/getRoleListPage",
			type:"POST",
			data:{
				pageNumber:"1",
				pageSize:"10",
				roleName:roleName
			},
			success:function(data){
				var status = getStatus();
				var getFlightNumByCompay = getFlightNumByCompayFun();
				var html = [];
				var json = JSON.parse(data);
				var exp2 = json.list[0].exp2.split(","), 
					exp1 = json.list[0].exp1.split(","),
					statusQx = json.list[0].statusQx.split(","),
					menuId = json.list[0].menuId.split(","),
					buttonQx = json.list[0].buttonQx.split(",");
				
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">角色名称：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_roleName" lay-verify="required" autocomplete="off" value="'+roleName+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">订单状态名称：</label>');
				html.push('<div class="layui-input-block">');
				for(var i=0;i<status.length;i++){
					statusQx.indexOf(status[i].id+"") === -1 ? html.push('<input type="checkbox" lay-filter="exp2" value="'+status[i].id+'" title="'+status[i].button+'" lay-skin="primary" />') : html.push('<input type="checkbox" lay-filter="exp2" value="'+status[i].id+'" title="'+status[i].button+'" lay-skin="primary" checked />');  
		        } 
				html.push('</div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">菜单名称：</label>');
				html.push('<div class="layui-input-block">');
				for(var i=0;i<menuArr.length;i++){  
					menuId.indexOf(menuArr[i].menuId+"") === -1 ? html.push('<input type="checkbox" lay-filter="exp1" value="'+menuArr[i].menuId+'" title="'+menuArr[i].exp1+'" lay-skin="primary" />') : html.push('<input type="checkbox" lay-filter="exp1" value="'+menuArr[i].menuId+'" title="'+menuArr[i].exp1+'" lay-skin="primary" checked />');  
		        } 
				html.push('</div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">航站楼：</label>');
				html.push('<div class="layui-input-block">');
				for(var i=0;i<getFlightNumByCompay.length;i++){  
					buttonQx.indexOf(getFlightNumByCompay[i].compay+"") === -1 ? html.push('<input type="checkbox" lay-filter="compay" value="'+getFlightNumByCompay[i].compay+'" title="'+getFlightNumByCompay[i].compay+'" lay-skin="primary" />') : html.push('<input type="checkbox" lay-filter="compay" value="'+getFlightNumByCompay[i].compay+'" title="'+getFlightNumByCompay[i].compay+'" lay-skin="primary" checked />');
		        } 
				html.push('</div></div>');
				html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="modifyRole">确认</button></div></form></div>');
				layui.use(['form','layer'],function(){
					var form = layui.form;
					layui.layer.open({
					     type: 1
					    ,title: '角色信息'
					    ,area: '600px'
					    ,maxmin: true
					    ,content: html.join(""),
					    success:function(){
					    	form.render('checkbox');
					    	form.on('checkbox(exp2)', function(data){
					    		Common.filter_repeat(exp2,data.elem.title);
					    		Common.filter_repeat(statusQx,data.value);
					    	});
					    	form.on('checkbox(exp1)', function(data){
					    		Common.filter_repeat(exp1,data.elem.title);
					    		Common.filter_repeat(menuId,data.value);
						    });
					    	form.on('checkbox(compay)', function(data){
					    		//Common.filter_repeat(buttonQx,data.elem.title);
					    		Common.filter_repeat(buttonQx,data.value);
						    });
					    	form.on('submit(modifyRole)', function(data){
					    		  if(statusQx.length==0 || menuId.length==0){
					        		  layui.layer.msg('勾选项不能为空',{icon: 5,time:1000});
					        		  return false;
					        	  }
					        	  var fd = {
					        		id:json.list[0].id,
					    			statusQx :statusQx.join(","),
					    			exp2:exp2.join(","),
					    			exp1:exp1.join(","),
					    			menuId:menuId.join(","),
					    			buttonQx:buttonQx.join(',')
					    		  };
					        	  for(var d in data.field){
					        		  fd[d.replace("modify_","")] = data.field[d];
					        	  }
					        	  $.ajax({
					        		  url: basePath+"v1/role/updateRole",
					        		  type:"POST",
					        		  data:fd,
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
					        	  })
					        	  return false;
					        });
					    }
					  });
				});
			}
		})
	}
	var addRole = function(){
		var status = getStatus();
		var html = [];
		var exp2 = [] , exp1 = [],statusQx = [] , menuId = [];
		html.push('<div class="pd-20"><form class="layui-form" action="">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">角色名称：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_roleName" autocomplete="off" class="layui-input" lay-verify="required"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">订单状态名称：</label>');
		html.push('<div class="layui-input-block">');
		for(var i = 0 ;i<status.length;i++){
			html.push('<input type="checkbox" lay-filter="exp2" value="'+status[i].id+'" title="'+status[i].button+'" lay-skin="primary" />');
		}
		html.push('</div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">菜单名称：</label>');
		html.push('<div class="layui-input-block">');
		for(var i = 0 ;i<menuArr.length;i++){
			html.push('<input type="checkbox" lay-filter="exp1" value="'+menuArr[i].menuId+'" title="'+menuArr[i].exp1+'" lay-skin="primary" />');
		}
		html.push('</div></div><div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="modifyRole">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '新增角色'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join(""),
			    success:function(){
			    	form.render('checkbox');
			    	form.on('checkbox(exp2)', function(data){
			    		Common.filter_repeat(exp2,data.elem.title);
			    		Common.filter_repeat(statusQx,data.value);
			    	});
			    	form.on('checkbox(exp1)', function(data){
			    		Common.filter_repeat(exp1,data.elem.title);
			    		Common.filter_repeat(menuId,data.value);
				    });
			    	form.on('submit(modifyRole)', function(data){
			    		  if(statusQx.length==0 || menuId.length==0){
			        		  layui.layer.msg('勾选项不能为空',{icon: 5,time:1000});
			        		  return false;
			        	  }
			        	  var fd = {
			    			statusQx :statusQx.join(","),
			    			exp2:exp2.join(","),
			    			exp1:exp1.join(","),
			    			menuId:menuId.join(",")
			    		  };
			        	  for(var d in data.field){
			        		  fd[d.replace("add_","")] = data.field[d];
			        	  }
			        	  $.ajax({
			        		  url: basePath+"v1/role/insertRole",
			        		  type:"POST",
			        		  data:fd,
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
			        	  })
			        	  return false;
			        });
			    }
			  });
		});
	}
	var delRole = function(id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				url: basePath+"v1/role/deleteRole",
				type:"POST",
				data:{id:id},
				success:function(data){
					var j = JSON.parse(data);
					if(j.resultCode=="SUCCESS"){
						layer.msg('已删除!',{icon:1,time:1000},function(){
			    	    	location.reload();
			    	    });
					}else{
						layer.msg(j.msg,{icon:1,time:1000});
					}
				}
			})
			
		});
	}
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/role/getRoleListPage",
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