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
	<jsp:param value="order" name="classify"/>
	<jsp:param value="order_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        新建订单
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单编号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="" name="orderNo">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="" name="name">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <span class="select-box inline">
									<select name="channel" class="select">
										<option value="">请选择</option>
									</select>
								</span>
                            </div>
                        </div>
                        </div>
                        <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">异常状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <span class="select-box inline">
									<select name="abnormal" class="select">
										<option value="">请选择</option>
										<option value="">是</option>
										<option value="">否</option>
									</select>
								</span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <span class="select-box inline">
									<select name="orderStatus" class="select">
										<option value="">请选择</option>
									</select>
								</span>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">支付状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <span class="select-box inline">
									<select name="payStatus" class="select">
										<option value="">请选择</option>
										<option value="1">未支付</option>
										<option value="2">已支付</option>
										<option value="2">已退款</option>
									</select>
								</span>
                            </div>
                        </div>
                    </div>
                    <div class='row cl text-c'>
                    	<button name="" id="" class="btn btn-success" type="button"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
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
        {field:"orderNo",title:"订单编号",align:"center",minWidth:"100"},
        {field:"name",title:"客户姓名",align:"center",minWidth:"100"},
        {field:"phone",title:"联系方式",align:"center",minWidth:"150"},
        {field:"channel",title:"客户渠道",align:"center",minWidth:"100"},
        {field:"createDate",title:"下单时间",align:"center",minWidth:"200",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"consignee",title:"收货人",align:"center",minWidth:"100"},
        {field:"totalFee",title:"服务费",align:"center",minWidth:"100"},
        {field:"orderStatus",title:"订单状态",align:"center",minWidth:"100"},
        {field:"abnormalStatus",title:"订单异常",align:"center",minWidth:"100"},
        {field:"operation",title:"操作",templet: function(d){
            return '<a class="layui-btn layui-btn-xs" href="'+basePath+'v1/page/orderDetails?id='+d.id+'">详情</a><a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:layer_show(\'收款完成\',\'备注\',\'600\',skwc);">收款完成</a><a class="layui-btn layui-btn-xs layui-btn-warm" href="javascript:layer_show(\'取消订单\',\'取消原因\',\'600\',qxdd);">取消订单</a><a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:layer_show(\'订单异常\',\'异常原因\',\'600\',ddyc);">订单异常</a>'
        },minWidth:"240",align:"center"},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    function loadSelect(){
        $.ajax({
            url : basePath+'v1/order/getChannel',
            type : 'POST',
            async : false,
            datatype : 'json',
            success : function(data) {
            	var json = JSON.parse(data);
                if(json){
                    var programme_sel=[];
                    programme_sel.push('<option value="" selected>请选择</option>')
                    for(var i=0,len=json.length;i<len;i++){
                        programme_sel.push('<option value="'+json[i].id+'">'+json[i].channel+'</option>')
                    }
                    $("select[name='channel']").html(programme_sel.join(' '));
                }
            },
            error : function() {
                alert('查询异常');
            }
        });
        $.ajax({
            url : basePath+'v1/order/getOrderStatus',
            type : 'POST',
            async : false,
            datatype : 'json',
            success : function(data) {
            	var json = JSON.parse(data);
            	console.log(json)
                if(json){
                    var programme_sel=[];
                    programme_sel.push('<option value="" selected>请选择</option>')
                    for(var i=0,len=json.length;i<len;i++){
                        programme_sel.push('<option value="'+json[i].id+'">'+json[i].describe+'</option>')
                    }
                    $("select[name='orderStatus']").html(programme_sel.join(' '));
                }
            },
            error : function() {
                alert('查询异常');
            }
        });
    }
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
    loadSelect();
    layui.use("table",function(){
    	var table = layui.table;
    	table.render({
    		elem:"#table",
    		url: basePath+"v1/order/getOrderListPage",
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