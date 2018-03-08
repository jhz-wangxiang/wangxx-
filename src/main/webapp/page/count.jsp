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
        	<form class="layui-form">
	        	<div class="text-c">订单状态：
	        		<div class="" style="display:inline-block;width:200px" ><select name="orderStatus" class="select"><option value="">请选择</option></select></div>
	        		日期范围：
	        		<input type="text" id="timemin" class="input-text" placeholder="yyyy/MM/dd" name="createDateStart" readonly style="width:120px;">
					-
					<input type="text" id="timemax" class="input-text" placeholder="yyyy/MM/dd" name="createDateEnd" readonly style="width:120px;">
					<button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
		        </div>
	        </form>
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
            	<span class="l">
            		<a href="javascript:;" class="btn btn-primary radius" onclick="exe()"><i class="Hui-iconfont Hui-iconfont-daochu"></i>导出</a>
            	</span>
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
	var responseDataArr = ['time','operator','payType','flightNum','area','channel','flightNum'];
    var colArr = [
        {field:"time",title:"时间",align:"center"},
        {field:"name",title:"名称",align:"center"},
        {field:"count",title:"数量",align:"center",templet:function(d){
        	return '<a href="javascript:orderData(\''+d.time+'\',\''+d.name+'\');" class="orderFun">'+d.count+'</a>';
        }},
        {field:"price",title:"总金额",align:"center"},
    ];
    var colArr1 = [
        {field:"time",title:"时间",align:"center"},
        {field:"count",title:"数量",align:"center",templet:function(d){
        	return '<a href="javascript:orderData(\''+d.time+'\');" class="orderFun">'+d.count+'</a>';
        }},
        {field:"price",title:"总金额",align:"center"},
    ];
    var layoutOrderDataArr = [
		{field:"orderNo",title:"订单编号",align:"center",minWidth:"250"},
		{field:"registerName",title:"乘机人",align:"center",minWidth:"90"},
		{field:"registerPhone",title:"联系电话",align:"center",minWidth:"150"},
		{field:"describe",title:"订单状态",align:"center",minWidth:"100"},
		{field:"exp1",title:"是否派送",align:"center",minWidth:"100"},
		{field:"exp2",title:"派送人",align:"center",minWidth:"100"},
		{field:"channel",title:"客户渠道",align:"center",minWidth:"90"},
		{field:"createDate",title:"下单时间",align:"center",minWidth:"150",templet:function(d){
			return Common.getLocalDate(d.createDate)
		}},
		{field:"consignee",title:"收货人",align:"center",minWidth:"50"},
		{field:"paidFee",title:"服务费",align:"center",minWidth:"10"},
		{field:"abnormalStatus",title:"异常状态",align:"center",minWidth:"90"},
		{field:"abnormaReason",title:"异常原因",align:"center",minWidth:"100"},
		{field:"cancelReason",title:"取消原因",align:"center",minWidth:"100"},
		{field:"remark",title:"备注",align:"center",minWidth:"100"}
	];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
    $.ajax({
        url : basePath+'v1/order/getOrderStatus',
        type : 'POST',
        async : false,
        datatype : 'json',
        success : function(data) {
        	var json = JSON.parse(data);
            if(json){
                var programme_sel=[];
                programme_sel.push('<option value="" selected>请选择</option>')
                for(var i=0,len=json.length;i<len;i++){
                    programme_sel.push('<option value="'+json[i].id+'">'+json[i].button+'</option>')
                }
                $("select[name='orderStatus']").html(programme_sel.join(' '));
            }
        },
        error : function() {
            alert('查询异常');
        }
    });
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/order/getOrderCount",
    		method:"POST",
    		where: getOption(),
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
    var getOption = function(){
    	return {
    		exp1:$("input[name='exp1']").val(),
   			exp2:$("input[name='exp2']").val(),
			start:start,
			createDateStart:Common.ltrim($("input[name='createDateStart']").val()),
    		createDateEnd:Common.ltrim($("input[name='createDateEnd']").val()),
    		orderStatus:$("select[name='orderStatus']").val()==""?null:$("select[name='orderStatus']").val()
    	}
    }
    var searchTab = function(){
		if($("input[name='exp2']").val()==1){
			tableIns.reload({
			  where: getOption(),
			  cols:[colArr1]
			});
		}else{
			tableIns.reload({
			  where: getOption(),
			  cols:[colArr]
			});
		}
	}
    var searchTable = function(){
		if($("input[name='exp2']").val()==1){
			tableIns.reload({
			  where: getOption(),
			  cols:[colArr1]
			});
		}else{
			tableIns.reload({
			  where: getOption(),
			  cols:[colArr]
			});
		}
	}
    var exe = function(){
    	var u = basePath+"v1/order/exportCount?createDateStart="+Common.ltrim($("input[name='createDateStart']").val())
    			+"&createDateEnd="+Common.ltrim($("input[name='createDateEnd']").val())
    			+"&exp1="+$("input[name='exp1']").val()
    			+"&exp2="+$("input[name='exp2']").val();
    	var a = document.createElement ("a");
    	a.href = u;
    	a.onclick = function(){
    		a.onclick = null;
    		document.getElementsByTagName("body")[0].removeChild(a);
    	};
    	document.getElementsByTagName("body")[0].appendChild(a);
    	a.click();
    }
    function orderData(t,n){
    	var json = {};
    	if(responseDataArr[$("input[name='exp2']").val()-1]==''){return;}
    	json['time'] = t;
    	if(arguments.length>1){
        	json[responseDataArr[$("input[name='exp2']").val()-1]] = n;
    	}
    	$.extend(json,getOption());
    	layui.use(['layer','table'],function(){
    		layui.layer.open({
    		     type: 1
    		    ,title: "查看"
    		    ,resize :true
    		    ,area: ['1000px', '600px']
    		    ,content: '<div class="pd-20 cl"><table class="layui-hide" id="layout_table"></table></div>'
    		    ,success: function(layero, index){
    		    	var tableout = layui.table;
    		    	tableout.render({
    		    		elem:"#layout_table",
    		    		url: basePath+"v1/order/selectByOrder",
    		    		method:"POST",
    		    		where: json,
    		    		request: {pageName:"pageNumber",limitName:"pageSize"},
    		    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		    		cols:[layoutOrderDataArr],
    		    		page:{
    		    			layout:['prev','page','next','count']
    		    		},
    		    	});
    		    }
    		  });
    	});
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