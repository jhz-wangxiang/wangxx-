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
        客户详情
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
        	<div class="cl pd-5 bg-1 bk-gray mt-20">
        		<span class="r">
        			<a href="javascript:;" onclick="addOrderFn()" id="addOrderDom" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-dayinji"></i> 创建订单</a>
        		</span>
        	</div>
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="name" name="name" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">信息认证：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="exp1" name="exp1" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" readonly  placeholder="" id="phone" name="phone"readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">微信号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="openid" name="openid" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">创建时间：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="createDate" name="createDate" readonly>
                            </div>
                        </div>
                    </div>
                </div>
                <h4>订单信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                	<div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">未完成订单：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="exp2" name="exp2" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">上次下单时间：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="orderDate" name="orderDate" readonly>
                            </div>
                        </div>
                    </div>
                    <table class="layui-hide" id="tableOrder"></table>
                </div>
                <h4>常用收货地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                	<table class="layui-hide" id="tableAddress"></table>
                </div>
            </form>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
	var id = Common.GetUrlRequest()['id'];
	var basePath = "<%=basePath %>";
	if(id == "" || id == null || id == undefined){
		location.href = basePath + "v1/page/orderList";
	}   
	var dtime = function(id,t){
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
			    elem: '#'+id,
			    value: new Date(t),
			    type:"datetime",
			    ready: function(date){
			        console.log(date); //得到初始的日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
			    }
			  });
		})
	}
    $.ajax({
    	url: basePath+"v1/user/getUserDetail",
    	type:"POST",
    	data:{id:id},
    	success:function(data){
    		var json = JSON.parse(data);
    		for(var i in json){
    			switch (i) {
				case "createDate":
					console.log(i,json[i])
					$("#"+i).val(Common.getLocalDate(json[i]));
					break;
				case "orderDate":
					console.log(i,json[i])
					$("#"+i).val(Common.getLocalDate(json[i]));
					break;
				default:
					$("#"+i).val(json[i]);
					break;
				}
    			
    		}
    	}
    })
    var colArr = [
        {field:"consignee",title:"收货人",align:"center",minWidth:"100"},
        {field:"consigneePhone",title:"收货人电话",align:"center",minWidth:"100"},
        {field:"address",title:"收货地址",align:"center",minWidth:"150"},
    ];
    layui.use("table",function(){
    	var table = layui.table;
    	tablecustomer = table.render({
    		elem:"#tableAddress",
    		url: basePath+"v1/address/getAddressListPage",
    		method:"POST",
    		where: {id:id,pageSize:10,start:0},
    		request: {pageName:"pageNumber",limitName:"limit"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:false
    	});
    	
    });
    function layer_show(t,b,w,id,fn){
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
   			fn(layero,id);
   		    layer.close();
   		  }
   		}); 
    }
    var zfzt = function(obj,id){
    	console.log($(obj).find("textarea").val())
    	$.ajax({
    		url: basePath+"v1/order/updateOrderStatus",
    		type:"POST",
    		data:{
    			id:id,
    			remark:$(obj).find("textarea").val()
    		},
    		success:function(json){
    			var json = JSON.parse(json);
    			if(json.resultCode=="SUCCESS"){
    				layer.msg('成功!',{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg('失败!',{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
    	
    }
	var qxdd = function(obj,id){
		console.log($(obj).find("textarea").val())
		$.ajax({
    		url: basePath+"v1/order/updateOrderCancel",
    		type:"POST",
    		data:{
    			id:id,
    			remark:$(obj).find("textarea").val()
    		},
    		success:function(json){
    			var json = JSON.parse(json);
    			if(json.resultCode=="SUCCESS"){
    				layer.msg('成功!',{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg('失败!',{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
	}
	var ddyc = function(obj,id){
		console.log($(obj).find("textarea").val())
		$.ajax({
    		url: basePath+"v1/order/updateAbnormalStatus",
    		type:"POST",
    		data:{
    			id:id,
    			remark:$(obj).find("textarea").val()
    		},
    		success:function(json){
    			var json = JSON.parse(json);
    			if(json.resultCode=="SUCCESS"){
    				layer.msg('成功!',{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg('失败!',{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
	}
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var colArrOrder = [
        {field:"orderNo",title:"订单编号",align:"center",minWidth:"100"},

        {field:"createDate",title:"下单时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"describe",title:"订单状态",align:"center",minWidth:"100"},
        {field:"abnormalStatus",title:"异常状态",align:"center",minWidth:"90"},
        {field:"operation",title:"操作",templet: function(d){
        	var h = [];
        	h.push('<a class="layui-btn layui-btn-xs" href="'+basePath+'v1/page/orderDetails?id='+d.id+'">详情</a>');
        	/* if(d.orderStatusDisplay == "1"){
        		if(d.orderStatus=="6"){
        			h.push('<a class="layui-btn layui-btn-disabled layui-btn-xs" href="javascript:;">'+d.button+'</a>')
        		}else{
        			h.push('<a class="layui-btn layui-btn-normal layui-btn-xs" href="javascript:Common.layer_show(\'状态确认\',\'备注\',\'600\',\''+d.id+'\',zfzt);">'+d.button+'</a>')
        		}
        	}
        	
        	if(d.cancelDisplay=="1"){
        		h.push('<a class="layui-btn layui-btn-xs layui-btn-warm" href="javascript:Common.layer_show(\'取消订单\',\'取消原因\',\'600\',\''+d.id+'\',qxdd);">取消订单</a>')
        	}
        	if(d.abnormaDisplay=="1"){
        		var b = ""
        		if(d.abnormalStatus=="是"){
        			b = "取消异常"
        		}else{
        			b = "订单异常"
        		}
        		h.push('<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:Common.layer_show(\'订单异常\',\'异常原因\',\'600\',\''+d.id+'\',ddyc);">'+b+'</a>')
        	}
        	if(d.stopDisplay == "1"){
        		h.push('<a class="layui-btn layui-btn-warm layui-btn-xs" href="javascript:Common.layer_show(\'终止\',\'备注\',\'600\',\''+d.id+'\',ddzz);">终止订单</a>')
        	} */
            return h.join("");
        },minWidth:"240",align:"center"},
    ];
    layui.use("table",function(){
    	var table = layui.table;
    	tableIns = table.render({
    		elem:"#tableOrder",
    		url: basePath+"v1/order/getOrderListPage",
    		method:"POST",
    		where: {pageSize:pageSize,start:start,userId:id},
    		request: {pageName:"pageNumber",limitName:"limit"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArrOrder],
    		page:true
    	});
    	
    });
    function addOrderFn (){
    	$('#addOrderDom').attr('href',basePath+'v1/page/newOrder?id='+id);
    }
</script>
</body>
</html>