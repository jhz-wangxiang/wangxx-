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
	<jsp:param value="customer_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
       客户管理
        <span class="c-gray en">&gt;</span>
        客户列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="" name="nickname">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="" name="phone">
                            </div>
                        </div>
                        <button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
                   	</div>
                    <div class='row cl text-c'>
                    	<button name="" id="" class="btn btn-success" type="button" style="float: left;margin-left: 104px;">创建客户</button>
                    	
                    </div>
            </form>
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
        {field:"name",title:"客户姓名",align:"center",minWidth:"100"},
        {field:"exp1",title:"信息认证",align:"center",minWidth:"30"},
        {field:"phone",title:"联系电话",align:"center",minWidth:"150"},
        {field:"openid",title:"微信号",align:"center",minWidth:"100"},
        {field:"exp2",title:"未完成订单",align:"center",minWidth:"100"},
        {field:"card",title:"会员",align:"center",minWidth:"100"},
        {field:"createDate",title:"创建时间",align:"center",minWidth:"200",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"createDate",title:"上次下单时间",align:"center",minWidth:"200",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"operation",title:"操作",templet: function(d){
        	var h = [];
        	h.push('<a class="layui-btn layui-btn-xs" href="'+basePath+'v1/page/customerDetails?id='+d.id+'&name='+d.name+'">查看详情</a>');
        	h.push('<a class="layui-btn layui-btn-xs" href="'+basePath+'v1/page/newOrder?id='+d.id+'">创建订单</a>');
            return h.join("");
        },minWidth:"240",align:"center"},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tablecustomer ;
    function layer_show(t,b,w,fn){
    	var html = [];
    	html.push('<article class="cl pd-20"><form action="" method="post" class="form form-horizontal" id="form-admin-add">');
    	html.push('<div class="row cl"><label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>'+b+'：</label>');
    	html.push('<div class="formControls col-xs-9 col-sm-10"><textarea class="textarea" value="" placeholder="" name=""></textarea>');
    	html.push('</div></div></form></article>');
    	layer.open({
   		  title: t,
   		  content: html.join(""),
   		  area:w+'px',
   		  success:function(layero, index){
   		  },
   		  yes: function(index, layero){
   			fn(layero);
   		    layer.close();
   		  }
   		}); 
    }
    var skwc = function(obj){
    	console.log($(obj).find("textarea").val())
    }
	var qxdd = function(obj){
		console.log($(obj).find("textarea").val())
	}
	var ddyc = function(obj){
		console.log($(obj).find("textarea").val())
	}
	var searchTable = function(){
		var data = {
			nickname:Common.ltrim($("input[name='nickname']").val()),
			phone:Common.ltrim($("input[name='phone']").val()),
			pageSize:pageSize,start:start
		}
		tablecustomer.reload({
		  where: data,
		  page: {
		    curr: 1
		  }
		});
	}
	layui.use("table",function(){
    	var table = layui.table;
    	tablecustomer = table.render({
    		elem:"#table",
    		url: basePath+"v1/user/getUserListPage",
    		method:"POST",
    		where: {pageSize:pageSize,start:start},
    		request: {pageName:"pageNumber",limitName:"limit"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:true
    	});
    	
    });
    
</script>
</body>
</html>