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
	<jsp:param value="role" name="classify"/>
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
			h.push('<a title="编辑" href="javascript:;" onclick="modifyRole(\''+d.roleName+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="修改密码" href="javascript:;" onclick="modifyPwd(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-key"></i></a>');
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
	var modifyRole = function(roleName){
		$.ajax({
			url: basePath+"v1/role/getRoleListPage",
			type:"POST",
			data:{
				pageNumber:"1",
				pageSize:"10",
				roleName:roleName
			},
			success:function(data){
				var json = JSON.parse(data);
				var html = [];
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">角色名称：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="roleName" autocomplete="off" value="'+json.list[0].roleName+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">订单状态名称：</label>');
				html.push('<div class="layui-input-block">');
				html.push('<input type="checkbox" lay-filter="exp2" value="123" title="发呆" lay-skin="primary">');
				html.push('</div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">菜单名称：</label>');
				html.push('<div class="layui-input-block">');
				html.push('<input type="checkbox" lay-filter="exp1" name="" title="发呆" lay-skin="primary">');
				html.push('<input type="checkbox" lay-filter="exp1" name="" title="发呆" lay-skin="primary">');
				html.push('<input type="checkbox" lay-filter="exp1" name="" title="发呆" lay-skin="primary">');
				html.push('</div></div><div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="modifyRole">确认</button></div>');
				html.push('</form></div>');
				layui.use(['form','layer'],function(){
					var form = layui.form;
					
					var formData = {
						//id:id
					};
					layui.layer.open({
					     type: 1
					    ,title: '账号信息'
					    ,area: '600px'
					    ,maxmin: true
					    ,content: html.join(""),
					    success:function(){
					    	form.render('checkbox');
					    	form.on('checkbox(exp2)', function(data){
					    	  console.log(data.value); //复选框value值，也可以通过data.elem.value得到
					    	});  
					    	form.on('submit(modifyRole)', function(data){
					    		console.log(data.field)
					        	  /* var fd = {};
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
					        	  }) */
					        	  return false;
					        });
					    }
					  });
				});
			}
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