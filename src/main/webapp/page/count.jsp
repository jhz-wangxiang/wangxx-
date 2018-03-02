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
	<jsp:param value="count" name="classify"/>
	<jsp:param value="count_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        统计管理
        <span class="c-gray en">&gt;</span>
        统计管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
        	<div class="text-c">日期范围：
        		<input type="text" id="timemin" class="input-text" placeholder="yyyy/MM/dd" name="createDateStart" readonly style="width:120px;">
				-
				<input type="text" id="timemax" class="input-text" placeholder="yyyy/MM/dd" name="createDateEnd" readonly style="width:120px;">
				<button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
	        </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20"> 
            	<span class="l" id="count_list">
            		<a href="javascript:;" data-index = "1" class="btn btn-primary radius active">订单总量</a>
            		<a href="javascript:;" data-index = "2" class="btn btn-primary radius">员工新建订单</a>
            		<a href="javascript:;" data-index = "3" class="btn btn-primary radius">支付方式</a>
            		<a href="javascript:;" data-index = "4" class="btn btn-primary radius">航空公司</a>
            		<a href="javascript:;" data-index = "5" class="btn btn-primary radius">区域</a>
            		<a href="javascript:;" data-index = "6" class="btn btn-primary radius">渠道</a>
            		<a href="javascript:;" data-index = "7" class="btn btn-primary radius">航班号</a>
            	</span>
            </div>
            <div class="cl pd-5 bg-1 bk-gray mt-20"> 
            	<span class="r" id="date_list">
            		<a href="javascript:;" data-date = "YEAR" class="btn btn-secondary radius">年</a>
            		<a href="javascript:;" data-date = "MON" class="btn btn-secondary radius">月</a>
            		<a href="javascript:;" data-date = "WEEK" class="btn btn-secondary radius">周</a>
            		<a href="javascript:;" data-date = "DAY" class="btn btn-secondary radius active">日</a>
            	</span>
            </div>
            <div class="mt-20">
                <table class="layui-hide" id="table"></table>
            </div>
        </article>
    </div>
</section>
<input type="hidden" name="exp1" value="DAY"/>
<input type="hidden" name="exp2" value="1"/>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
    var colArr = [
        {field:"time",title:"时间",align:"center"},
        {field:"name",title:"名称",align:"center"},
        {field:"count",title:"数量",align:"center"},
        {field:"price",title:"总金额",align:"center"},
    ];
    var colArr1 = [
        {field:"time",title:"时间",align:"center"},
        {field:"count",title:"数量",align:"center"},
        {field:"price",title:"总金额",align:"center"},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/order/getOrderCount",
    		method:"POST",
    		where: {
    			start:start,
    			exp1:$("input[name='exp1']").val(),
    			exp2:$("input[name='exp2']").val(),
    			createDateStart:Common.ltrim($("input[name='createDateStart']").val()),
        		createDateEnd:Common.ltrim($("input[name='createDateEnd']").val())
        	},
    		request: {pageName:"pageNumber",limitName:"pageSize"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr1],
    		page:{
    			limits:[10, 20,50]
    		}
    	});
    });
    var dtime = function(id){
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
			    elem: '#'+id,
			    format: 'yyyy/MM/dd',
			  });
		})
	}
    var searchTab = function(){
		var data = {
			exp1:$("input[name='exp1']").val(),
   			exp2:$("input[name='exp2']").val(),
			start:start,
			createDateStart:Common.ltrim($("input[name='createDateStart']").val()),
    		createDateEnd:Common.ltrim($("input[name='createDateEnd']").val()),
		}
		if($("input[name='exp2']").val()==1){
			tableIns.reload({
			  where: data,
			  cols:[colArr1]
			});
		}else{
			tableIns.reload({
			  where: data,
			  cols:[colArr]
			});
		}
	}
    var searchTable = function(){
		var data = {
    		createDateStart:Common.ltrim($("input[name='createDateStart']").val()),
    		createDateEnd:Common.ltrim($("input[name='createDateEnd']").val()),
    		exp1:$("input[name='exp1']").val(),
			exp2:$("input[name='exp2']").val(),
			start:start
		}
		if($("input[name='exp2']").val()==1){
			tableIns.reload({
			  where: data,
			  cols:[colArr1]
			});
		}else{
			tableIns.reload({
			  where: data,
			  cols:[colArr]
			});
		}
	}
    $(function(){
    	dtime("timemin");
        dtime("timemax");
    	$("#count_list a").click(function(){
    		$("#count_list a").removeClass("active");
    		var that = $(this);
    		$("input[name='exp2']").val(that.data("index"));
    		that.addClass("active");
    		searchTab();
    	});
    	$("#date_list a").click(function(){
    		var that = $(this);
    		$("#date_list a").removeClass("active");
    		$("input[name='exp1']").val(that.data("date"));
    		that.addClass("active");
    		searchTab();
    	});
    })
</script>
</body>
</html>