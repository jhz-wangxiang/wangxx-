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
<link rel="stylesheet" type="text/css" href="<%=basePath%>style/style.css" />
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
        		<span class="r">
        			<a href="javascript:;" onclick="" class="btn btn-primary radius" id="modifyDetails"><i class="Hui-iconfont Hui-iconfont-save"></i> 订单修改</a>
        			<a href="javascript:;" onclick="" class="btn btn-primary radius ml-5 mr-5"><i class="Hui-iconfont Hui-iconfont-dayinji"></i> 打印订单</a>
        			<a href="javascript:;" onclick="" class="btn btn-primary radius ml-5 mr-5"><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo"></i> 行李提取</a>
        			<a href="javascript:;" onclick="" class="btn btn-danger radius" id="orderAbnormalBox"></a>
        		</span>
        	</div>
            <form action="" method="post" class="form form-horizontal" id="form-details">
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
                            <label class="form-label col-xs-4 col-sm-4">详细地址：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <textarea class="textarea" id = "address" name="address"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="hidden" name = "id" id="id"/>
            </form>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
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
    		if(json.abnormaDisplay=="1"){
        		var b = ""
        		if(json.abnormalStatus=="是"){
        			b = "取消异常"
        		}else{
        			b = "订单异常"
        		}
        		$("#orderAbnormalBox").html('<i class="Hui-iconfont Hui-iconfont-shenhe-weitongguo"></i>'+b).click(function(){
        			Common.layer_show('订单异常','异常原因','600',''+json.id+'',ddyc);
        		});
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
    		updateOrder();
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
    	    			layer.msg('修改成功!',{icon: 6,time:1000});
    	    		}else{
    	    			layer.msg('修改失败!',{icon: 5,time:1000});
    	    		}
    	    	}
    		})
    	})
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
    				layer.msg('成功!',{icon: 6,time:1000,shade:0.3},function(){
    					location.replace(location.href)
    				});
    			}else{
    				layer.msg('失败!',{icon: 5,time:1000,shade:0.3},function(){
    					location.replace(location.href)
    				});
    			}
    		}
    	});
	}
</script>
</body>
</html>