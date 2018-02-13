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
                                <input type="text" class="input-text air_input_readonly" value=""  placeholder="" id="paidFee" name="paidFee">
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
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <select name="channelId" class="select" lay-verify="required" id="channelId">
                                    <option value="">请选择</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <h4>乘机人信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">乘机人姓名：</label>
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
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">支付方式：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <select name="payType" class="select" lay-verify="required" id="payTypeSelect">
                                    <option value="微信支付">微信支付</option>
                                    <option value="支付宝支付">支付宝支付</option>
                                    <option value="现金支付">现金支付</option>
                                    <option value="银行卡支付">银行卡支付</option>
                                    <option value="信用卡支付">信用卡支付</option>
                                </select>
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
                                <input type="text" class="input-text" value="" placeholder="" id="flightNum" name="flightNum" onblur="checkFlightNum(this)">
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
                        <div class="col-xs-12 col-sm-12 col-md-12 mb-10">
                            <label class="form-label col-xs-2 col-sm-2">所在区域：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <div class="layui-input-inline mr-5" style="width: 162px;">
                                    <select lay-filter="province" lay-verify="required"><option value="北京" selected>北京市</option></select>
                                </div>
                                <div class="layui-input-inline mr-5" style="width: 162px;">
                                    <select lay-filter="city" lay-verify="required"><option value="北京" selected>北京市</option></select>
                                </div>
                                <div class="layui-input-inline mr-5" style="width: 162px;">
                                    <select id="areaSelect" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option></select>
                                </div>
                            </div>
                            <input type="hidden" name="province" id="province" value="">
                            <input type="hidden" name="city" id="city" value="">
                            <input type="hidden" name="area" id="area" value="">
                            <input type="hidden" name="areafrom" id="areafrom" value="">
                            <input type="hidden" name="areaId" id="areaId" value="">
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12 mb-10">
                            <label class="form-label col-xs-2 col-sm-2">详细地址：</label>
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
            <div class="cl pd-5 bg-1 bk-gray mt-20">
        		<span class="r">
        			<a href="javascript:;" onclick="" class="btn btn-primary radius" id="modifyDetails"><i class="Hui-iconfont Hui-iconfont-save"></i> 订单修改</a>
        		</span>
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
	var getArea = function(){
		var j;
		$.ajax({
			url: basePath+"v1/area/getArea",
			async:false, 
			type:"POST",
			success:function(m){
				j = JSON.parse(m);
			}
		});
		return j;
	}
    $.ajax({
    	url: basePath+"v1/order/getOrderDetail",
    	type:"POST",
    	data:{id:id},
    	success:function(data){
    		var json = JSON.parse(data);
    		var area = getArea();
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
				case "areaId":
					$("#areaId").val(json[i]);
					$("#areafrom").val(json[i]);
					break;
				default:
					$("#"+i).val(json[i]);
					break;
				}
    		}
    		$("#statusBox").html(h.join(""));
    		$("#history").html('<a class="btn btn-default radius" href="'+basePath+'v1/page/orderHistory?id='+json.orderNo+'">订单历史记录</a>');
    		updateOrder();
    		$('#payTypeSelect').val(json.payType);
    		for(var i=0;i<area.length;i++){
            	if(json.area==area[i].area){
            		$("#areaSelect").append('<option value="'+area[i].id+'" selected>'+area[i].area+'</option>')
            	}else{
            		$("#areaSelect").append('<option value="'+area[i].id+'">'+area[i].area+'</option>');
            	}
            }
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
	            	$('input[name="areaId"]').val(data.value);
	            	$('input[name="areafrom"]').val(data.value);
                    $('input[name="area"]').val(data.elem.options[data.elem.selectedIndex].text);
	            })
	        })
          var _channelId = json.channelId;
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
                  $("select[name='channelId']").html(programme_sel.join(''));
                  $(".page-on-load").hide();
                  $('#channelId').val(_channelId);
                  layui.use(['form'], function () {
                      var layform = layui.form;
                      layform.render();
                  });
              }
          },
          error : function() {
              alert('查询异常');
          }
      });
    	}
    });
    var updateOrder = function(){
    	$("#modifyDetails").click(function(){
    		$.ajax({
           		url: basePath+"v1/order/getPrice",
           		type:"POST",
           		data:$("#form-details").serializeArray(),
           		success:function(d){
           			var j = JSON.parse(d);
           			if(j.resultCode=="SUCCESS"){
           				priceHtml(j,$("#form-details").serializeArray())
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
    			h.push('<tr><td colspan="2">航班号/日期：</td><td colspan="2">'+Common.getLocalDate(json.nowTime)+'</td></tr>');
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
    var priceHtml = function(d,dd){
    	var html = [];
    	html.push('<div class="pd-20"><form class="layui-form" action=""><h4>费用信息</h4><div class="line"></div><div class="mt-20"><div class="row cl text-c">');
    	html.push('<div class="fee-box"><p class="lab">物品单价</p><p class="fee"><span>'+d.price+'</span>元</p><input type="hidden" name="price" id="price" value="'+d.price+'" lay-verify="required"/></div>');
    	html.push('<div class="fee-box"><p class="lab">物品数量</p><p class="fee"><span>'+d.num+'</span>件</p><input type="hidden" name="num" id="num" value="'+d.num+'"  lay-verify="required"/></div>');
    	html.push('<div class="fee-box"><p class="lab">合计金额</p><p class="fee"><span>'+d.totalFee+'</span>元</p><input type="hidden" name="totalFee" id="totalFee" value="'+d.totalFee+'" lay-verify="required"></div>');
    	html.push('<div class="fee-box"><p class="lab">渠道折扣</p><p class="fee"><span>'+d.ChannelDiscount+'</span>折</p><input type="hidden" name="ChannelDiscount" id="ChannelDiscount" value="'+d.ChannelDiscount+'" lay-verify="required"></div>');
    	html.push('<div class="fee-box"><p class="lab">第二件起折扣</p><p class="fee"><span>'+d.AreaDiscount+'</span>折</p><input type="hidden" name="AreaDiscount" id="AreaDiscount" value="'+d.AreaDiscount+'" lay-verify="required"></div>');
    	html.push('<div class="fee-line"></div><div class="fee-box"><p class="lab">实际支付金额</p><p class="fee"><span>'+d.paid+'</span>元</p><input type="hidden" name="paid" id="paid" value="'+d.paid+'" lay-verify="required"></div>');
    	html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="addOrder">确认下单</button></div></div></div></form></div>');
    	layui.use(['form','layer'],function(){
    		var form = layui.form;
    		layui.layer.open({
	   		     type: 1
	   		    ,title: false
	   		    ,area: '600px'
	   		    ,maxmin: false
	   		    ,content: html.join(""),
	   		    success:function(){
	   		    	form.on('submit(addOrder)', function(data){
	   		    		var fd = {};
	   		    		for(var i in dd){
	   		    			fd[dd[i].name] = dd[i].value;
	   		    		}
	   		    		var json = $.extend({}, fd, data.field);
	   		    		$.ajax({
	                        type:'POST',
	                        url: basePath+'v1/order/updateOrder',
	                        data: json,
	                        success: function (res){
	                            var json = JSON.parse(res);
	                            if(json.resultCode == 'SUCCESS'){
	                            	layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
	                            		location.reload();
	                            	});
	                            }else{
	                                layer.msg(json.msg,{icon: 5,time:1000,shade:0.3});
	                            }
	                        }
	                    })
	   		    		return false;
	   		    	})
	   		    }
	   		});
    	});
    }
  function checkFlightNum(thisobj) {
      $.ajax({
          url: basePath + 'v1/order/checkflightNum',
          type: 'POST',
          data: {'flightNum':$(thisobj).val()},
          success: function (res) {
              var json = JSON.parse(res);
              if(json.resultCode == 'SUCCESS'){

              }else{
                  layui.layer.msg(json.msg);
              }
          }
      })
  }
</script>
</body>
</html>