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
	<jsp:param value="area" name="classify"/>
	<jsp:param value="area_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        区域管理
        <span class="c-gray en">&gt;</span>
         区域管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="area_add()" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 新增区域</a></span></div>
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
			h.push('<a title="编辑" href="javascript:;" onclick="modifyArea(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="删除" href="javascript:;" onclick="delArea(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>');
		    return h.join("");
		},width:"100",align:"center"},
        {field:"area",title:"区域名称",align:"center",width:"100"},
        {field:"price",title:"定价",align:"center",minWidth:"90"},
        {field:"discount",title:"折扣",align:"center",minWidth:"90"}
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
	var modifyArea = function(id){
		$.ajax({
			url:basePath+"v1/area/getAreaListPage",
			type:"POST",
			data:{
				pageNumber:"1",
				pageSize:"10",
				id:id
			},
			success:function(data){
				var html = [];
				var json = JSON.parse(data)
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">区域名称：</label>');
				html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="modify_area" autocomplete="off" value="'+json.list[0].area+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">定价：</label>');
				html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="modify_price" autocomplete="off" value="'+json.list[0].price+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">折扣：</label>');
				html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="modify_discount" autocomplete="off" value="'+json.list[0].discount+'" class="layui-input"></div></div>');
				html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="modifyArea">确认</button></div>');
				html.push('</form></div>');
				layui.use(['form','layer'],function(){
					var form = layui.form;
					layui.layer.open({
					     type: 1
					    ,title: '编辑'
					    ,area: '600px'
					    ,maxmin: true
					    ,content: html.join("")
					    ,success:function(){
					    	form.on('submit(modifyArea)', function(data){
					        	  var fd = {
					        		id:json.list[0].id,
					    		  };
					        	  for(var d in data.field){
					        		  fd[d.replace("modify_","")] = data.field[d];
					        	  }
					        	  $.ajax({
					        		  url: basePath+"v1/area/updateArea",
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
	var area_add = function(){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" action="">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">区域名称：</label>');
		html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="add_area" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">定价：</label>');
		html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="add_price" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">折扣：</label>');
		html.push('<div class="layui-input-block"><input type="text" lay-verify="required" name="add_discount" autocomplete="off" class="layui-input"></div></div>');
		html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="addArea">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer'],function(){
			var form = layui.form;
			layui.layer.open({
			     type: 1
			    ,title: '新增'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join("")
			    ,success:function(){
			    	form.on('submit(addArea)', function(data){
			        	  var fd = {
			    		  };
			        	  for(var d in data.field){
			        		  fd[d.replace("add_","")] = data.field[d];
			        	  }
			        	  $.ajax({
			        		  url: basePath+"v1/area/insertArea",
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
	var delArea = function(id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				url: basePath+"v1/area/deleteArea",
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
    		url: basePath+"v1/area/getAreaListPage",
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