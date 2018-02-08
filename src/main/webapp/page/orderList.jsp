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
        订单列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal layui-form" id="form-admin-add">
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
								<select name="channel" class="select">
									<option value="">请选择</option>
								</select>
                            </div>
                        </div>
                     </div>
                        <div class="row cl">
	                    	<div class="col-xs-12 col-sm-6 col-md-4 mb-10">
	                            <label class="form-label col-xs-4 col-sm-4">航班号：</label>
	                            <div class="formControls col-xs-8 col-sm-8">
	                                <input type="text" class="input-text" value="" placeholder="" id="" name="flightNum">
	                            </div>
	                        </div>
	                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
	                            <label class="form-label col-xs-4 col-sm-4">手机号：</label>
	                            <div class="formControls col-xs-8 col-sm-8">
	                                <input type="text" class="input-text" value="" placeholder="" id="" name="phone">
	                            </div>
	                        </div>
		                    <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
		                    	<label class="form-label col-xs-4 col-sm-4">日期范围：</label>
	                            <div class="formControls col-xs-8 col-sm-8">
	                                <input type="text" id="timemin" class="input-text" placeholder="yyyy/MM/dd" name="nowTimeStart" readonly style="width:120px;">
									-
									<input type="text" id="timemax" class="input-text" placeholder="yyyy/MM/dd" name="nowTimeEnd" readonly style="width:120px;">
	                            </div>
		                    </div>
	                    </div>
                        <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">异常状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
									<select name="abnormal" class="select">
										<option value="">请选择</option>
										<option value="是">是</option>
										<option value="否">否</option>
									</select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
									<select name="orderStatus" class="select">
										<option value="">请选择</option>
									</select>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">支付状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
									<select name="payStatus" class="select">
										<option value="">请选择</option>
										<option value="未支付">未支付</option>
										<option value="已支付">已支付</option>
										<option value="已退款">已退款</option>
									</select>
                            </div>
                        </div>
                    </div>
                    
                    <div class='row cl text-c'>
                    	<button name="" id="" class="btn btn-success radius" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
                    	<button name="" id="" class="btn btn-primary radius" type="button" onclick="print()"><i class="Hui-iconfont Hui-iconfont-dayinji"></i>打印行李运输交接单</button>
                    </div>
            </form>
            <div class="mt-20">
                <table class="layui-hide" lay-filter="checkbox" id="table"></table>
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
		{checkbox: true},
		{field:"operation",title:"操作",templet: function(d){
			var h = [];
			h.push('<a class="layui-btn layui-btn-xs" href="'+basePath+'v1/page/orderDetails?id='+d.id+'">详情</a>');
			if(d.orderStatusDisplay == "1"){
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
			}
		    return h.join("");
		},minWidth:"260",align:"center"},
        {field:"orderNo",title:"订单编号",align:"center",minWidth:"100"},
        {field:"name",title:"客户姓名",align:"center",minWidth:"90"},
        {field:"phone",title:"联系方式",align:"center",minWidth:"90"},
        {field:"channel",title:"客户渠道",align:"center",minWidth:"90"},
        {field:"createDate",title:"下单时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
        {field:"consignee",title:"收货人",align:"center",minWidth:"50"},
        {field:"totalFee",title:"服务费",align:"center",minWidth:"10"},
        {field:"describe",title:"订单状态",align:"center",minWidth:"100"},
        {field:"abnormalStatus",title:"异常状态",align:"center",minWidth:"90"},
        {field:"abnormaReason",title:"异常原因",align:"center",minWidth:"100"},
        {field:"cancelReason",title:"取消原因",align:"center",minWidth:"100"},
       {field:"remark",title:"备注",align:"center",minWidth:"100"},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
    var table;
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
                    $("select[name='channel']").html(programme_sel.join(''));
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
    var zfzt = function(obj,id){
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
    				layer.msg(json.msg,{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
    	
    }
	var qxdd = function(obj,id){
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
    				layer.msg(json.msg,{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
	}
	var ddyc = function(obj,id){
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
    				layer.msg(json.msg,{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
	}
	var ddzz = function(obj,id){
		$.ajax({
    		url: basePath+"v1/order/updateOrderStop",
    		type:"POST",
    		data:{
    			id:id,
    			remark:$(obj).find("textarea").val()
    		},
    		success:function(json){
    			var json = JSON.parse(json);
    			if(json.resultCode=="SUCCESS"){
    				layer.msg(json.msg,{icon: 6,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000},function(){
    					tableIns.reload();
    					layer.closeAll();
    				});
    			}
    		}
    	});
	}
	var searchTable = function(){
		var data = {
			orderNo:Common.ltrim($("input[name='orderNo']").val()),
			name:Common.ltrim($("input[name='name']").val()),
			channelId:$("select[name='channel']").val()==""?null:$("select[name='channel']").val(),
			abnormalStatus:$("select[name='abnormal']").val()==""?null:$("select[name='abnormal']").val(),
			orderStatus:$("select[name='orderStatus']").val()==""?null:$("select[name='orderStatus']").val(),
			payStatus:$("select[name='payStatus']").val()==""?null:$("select[name='payStatus']").val(),
			flightNum:Common.ltrim($("input[name='flightNum']").val()),
			phone:Common.ltrim($("input[name='phone']").val()),
			nowTimeStart:Common.ltrim($("input[name='nowTimeStart']").val()),
			nowTimeEnd:Common.ltrim($("input[name='nowTimeEnd']").val()),
			start:start
		}
		tableIns.reload({
		  where: data
		});
	}
	var dtime = function(id){
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
			    elem: '#'+id,
			    format: 'yyyy/MM/dd',
			    //value: new Date
			  });
		})
	}
	var print = function(){
		var checkStatus = table.checkStatus('checkbox');
    	if(checkStatus.data.length==0){
    		layer.msg('请勾选订单',{icon: 5,time:1000});
  		  	return false;
    	}
    	var h = [];
    	var ind = 1;
		h.push('<table class="table table-border table-bordered radius" style="width:700px;">');
		h.push('<tbody class="text-c">');
		h.push('<tr><td colspan="8">行李送到家委托书提取单</td></tr>');
		h.push('<tr><td>填表人：</td><td colspan="2"></td><td>日期：</td><td colspan="2"></td><td>时间：</td><td></td></tr>');
		h.push('<tr><td>序号</td><td>收件人</td><td>联系方式</td><td>运输地址</td><td>乘机人</td><td>联系方式</td><td>行李号码</td><td>备注</td></tr>');
		for(var i =0;i<checkStatus.data.length;i++){
			
			h.push('<tr><td>'+(ind++)+'</td><td>'+checkStatus.data[i].consignee+'</td><td>'+checkStatus.data[i].consigneePhone+'</td><td>'+checkStatus.data[i].city+checkStatus.data[i].area+checkStatus.data[i].address+'</td><td>'+checkStatus.data[i].registerName+'</td><td>'+checkStatus.data[i].registerPhone+'</td><td>'+checkStatus.data[i].baggageNo+'</td><td>'+checkStatus.data[i].remark+'</td></tr>');
		}
		h.push('</tbody></table>');
		//h.push('');
		var index = layer.open({
    	    type: 1,
    	    title:false,
    	    content: h.join(""),
    	    shade: [1, '#fff'],
    	    skin: 'print_'
    	});
    	layer.full(index);
	}
    loadSelect();
    dtime("timemin");
    dtime("timemax");
    layui.use(['form','table'],function(){
    	table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/order/getOrderListPage",
    		method:"POST",
    		where: {start:start},
    		request: {pageName:"pageNumber",limitName:"pageSize"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:{
    			limits:[10, 20,50]
    		},
    		id: 'checkbox'
    	});
    	
    	/* table.on('checkbox(checkbox)', function(obj){
   		  console.log(obj.checked); //当前是否选中状态
   		  console.log(obj); //选中行的相关数据
   		  console.log(obj.type); //如果触发的是全选，则为：all，如果触发的是单选，则为：one
   		}); */
    });
</script>
</body>
</html>