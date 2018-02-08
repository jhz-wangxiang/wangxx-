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
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
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
        订单详情
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
        	<div class="cl pd-5 bg-1 bk-gray mt-20">
        		<span class="l">
        			<a href="javascript:;" onclick="" class="btn btn-primary radius" id="modifyDetails"><i class="Hui-iconfont Hui-iconfont-save"></i> 订单修改</a>
        			<a href="javascript:;" onclick="print()" class="btn btn-primary radius ml-5 mr-5"><i class="Hui-iconfont Hui-iconfont-dayinji"></i> 打印订单</a>
        		</span>
        		<span id="statusBox" class="r"></span>
        	</div>
            <form action="" method="post" class="form form-horizontal layui-form" id="form-details">
                <h4>订单信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单编号：</label>
                            <div class="formControls col-xs-8 col-sm-8" >
                                <input type="text" class="input-text air_input_readonly" value=""  readonly placeholder="" id="orderNo" name="orderNo">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value=""  readonly placeholder="" id="describe" name="describe">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">下单时间：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value="" readonly  placeholder="" id="createDate" name="createDate">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value=""  placeholder="" readonly id="channel" name="channel">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">下单人：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value=""  placeholder="" readonly id="operator" name="operator">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">服务费：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value=""  placeholder="" id="totalFee" name="totalFee">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="name" name="name">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="phone" name="phone">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>登机人信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">登机人姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="registerName" name="registerName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="registerPhone" name="registerPhone">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>行李信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">航班号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="flightNum" name="flightNum">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">日期：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" readonly value="" placeholder="" id="nowTime" name="nowTime">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggageNo" name="baggageNo">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李内物品：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggage" name="baggage">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李数量：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggageNum" name="baggageNum">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收件人：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="consignee" name="consignee">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系方式：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="consigneePhone" name="consigneePhone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">所在区域：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <div class="layui-form-item">
                                    <div class="layui-input-inline" style="width: 162px;">
                                        <select name="quiz1" lay-filter="province"><option value="北京" selected>北京市</option></select>
                                    </div>
                                    <div class="layui-input-inline" style="width: 162px;">
                                        <select name="quiz2" lay-filter="city"><option value="北京" selected>北京市</option></select>
                                    </div>
                                    <div class="layui-input-inline" style="width: 162px;">
                                        <select id="areaSelect" name="quiz3" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option><option value="海淀区">海淀区</option><option value="昌平区">昌平区</option><option value="朝阳区">朝阳区</option></select>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="province" id="province" value=""><input type="hidden" name="city" id="city" value=""><input type="hidden" name="area" id="area" value="">
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">详细地址：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <textarea class="textarea" id = "address" name="address"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name = "id" id="id"/>
            </form>
            <h4>订单历史记录</h4>
            <div class="line"></div>
            <div class="mt-20">
                <div class="row cl">
                    <div class="col-md-1" id="history">
                        
                    </div>
                </div>
            </div>
        </article>
    </div>
</section>
<input type="hidden" name="userId" id="userId">
<jsp:include page="_footer.jsp"></jsp:include>
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
	var id = Common.GetUrlRequest()['id'];
	var basePath = "<%=basePath %>";
	if(id == "" || id == null || id == undefined){
		location.href = basePath + "v1/page/orderList";
	}
	layui.use(['form'], function () {
      var layform = layui.form;
  })
	var dtime = function(id,t){
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  laydate.render({
			    elem: '#'+id,
			    value: new Date(t),
			    type:"datetime",
			    format: 'yyyy/MM/dd HH:mm:ss'
			  });
		})
	}
    $.ajax({
    	url: basePath+"v1/order/getOrderDetail",
    	type:"POST",
    	data:{id:id},
    	success:function(data){
    		var json = JSON.parse(data);
    		var h = [];
    		if(json.orderStatusDisplay == "1"){
        		if(json.orderStatus=="6"){
        			h.push('<a class="btn disabled radius ml-5 mr-5" href="javascript:;">'+json.button+'</a>')
        		}else{
        			h.push('<a class="btn btn-primary radius ml-5 mr-5" href="javascript:Common.layer_show(\'状态确认\',\'备注\',\'600\',\''+json.id+'\',zfzt);"><i class="Hui-iconfont Hui-iconfont-shenhe-weitongguo"></i> '+json.button+'</a>')
        		}
        	}
        	
        	if(json.cancelDisplay=="1"){
        		h.push('<a class="btn btn-warning radius ml-5 mr-5" href="javascript:Common.layer_show(\'取消订单\',\'取消原因\',\'600\',\''+json.id+'\',qxdd);"><i class="Hui-iconfont Hui-iconfont-shenhe-butongguo2"></i> 取消订单</a>')
        	}
    		if(json.abnormaDisplay=="1"){
        		var b = ""
        		if(json.abnormalStatus=="是"){
        			b = "取消异常"
        		}else{
        			b = "订单异常"
        		}
        		h.push('<a href="javascript:;" onclick="Common.layer_show(\'订单异常\',\'异常原因\',\'600\',\''+json.id+'\',ddyc)" class="btn btn-danger radius ml-5 mr-5" id="orderAbnormalBox"><i class="Hui-iconfont Hui-iconfont-shenhe-weitongguo"></i> '+b+'</a>');
        	}
    		if(json.stopDisplay == "1"){
        		h.push('<a class="btn btn-warning radius" href="javascript:Common.layer_show(\'终止\',\'备注\',\'600\',\''+json.id+'\',ddzz);"><i class="Hui-iconfont Hui-iconfont-close"></i> 终止订单</a>')
        	}
    		for(var i in json){
    			switch (i) {
				case "createDate":
					$("#"+i).val(Common.getLocalDate(json[i]))
					break;
				case "nowTime":
					dtime(i,json[i])
					break;
				default:
					$("#"+i).val(json[i]);
					break;
				}
    		}
    		$("#statusBox").html(h.join(""));
    		$("#history").html('<a class="btn btn-default radius" href="'+basePath+'v1/page/orderHistory?id='+json.orderNo+'">订单历史记录</a>');
    		updateOrder();
    		$('#areaSelect').val(json.area);
        layui.use(['form'], function () {
            var layform = layui.form;
            layform.render();
            layform.on('select(province)',function (data) {
                $('input[name="province"]').val(data.value);
            })
            layform.on('select(city)',function (data) {
                $('input[name="city"]').val(data.value);
            })
            layform.on('select(area)',function (data) {
                $('input[name="area"]').val(data.value);
            })
        })
    	}
    });
    var updateOrder = function(){
    	$("#modifyDetails").click(function(){
    		$.ajax({
    			url: basePath+"v1/order/updateOrder",
    			type:"POST",
    	    	data:$("#form-details").serializeArray(),
    	    	success:function(json){
    	    		var json = JSON.parse(json);
    	    		if(json.resultCode=="SUCCESS"){
    	    			layer.msg(json.msg,{icon: 6,time:1000});
    	    		}else{
    	    			layer.msg(json.msg,{icon: 5,time:1000});
    	    		}
    	    	}
    		})
    	})
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
    				layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
    					location.replace(location.href);
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000,shade:0.3},function(){
    					location.replace(location.href);
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
    				layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
    					location.replace(location.href)
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000,shade:0.3},function(){
    					location.replace(location.href)
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
    				layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
    					location.replace(location.href)
    				});
    			}else{
    				layer.msg(json.msg,{icon: 5,time:1000,shade:0.3},function(){
    					location.replace(location.href)
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
    var print = function(){
    	$.ajax({
    		url: basePath+"v1/order/getOrderDetail",
    		type:"POST",
    		data:{id:id},
    		success:function(data){
    			var json = JSON.parse(data);
    			var h = [];
    			h.push('<table class="table table-border table-bordered radius" style="width:700px;">');
    			h.push('<tbody class="text-c">');
    			h.push('<tr><td colspan="4">行李送到家委托书提取单</td></tr>');
    			h.push('<tr><td colspan="2">航班号/日期：</td><td colspan="2">'+json.nowTime+'</td></tr>');
    			h.push('<tr><td>乘机人姓名：</td><td>'+json.registerName+'</td><td>联系电话：</td><td>'+json.registerPhone+'</td></tr>');
    			h.push('<tr><td>运输地址：</td><td colspan="3">'+json.city+json.area+json.address+'</td></tr>');
    			h.push('<tr><td>收件人姓名：</td><td>'+json.consignee+'</td><td>联系电话：</td><td>'+json.consigneePhone+'</td></tr>');
    			h.push('<tr><td colspan="2"><img src="'+basePath+'style/img/print01.png"/></td><td>行李号码：</td><td>'+json.baggageNo+'</td></tr>');
    			h.push('<tr><td colspan="4">备注：'+json.remark+'</td></tr>');
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
    	});
    }
</script>
</body>
</html>