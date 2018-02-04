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
        订单详情
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
        	<div class="cl pd-5 bg-1 bk-gray mt-20">
        		<span class="r">
        			<a href="javascript:;" onclick="" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-dayinji"></i> 打印订单</a>
        			<a href="javascript:;" onclick="" class="btn btn-primary radius ml-5 mr-5"><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo"></i> 行李提取</a>
        			<a href="javascript:;" onclick="" class="btn btn-danger radius"><i class="Hui-iconfont Hui-iconfont-shenhe-weitongguo"></i> 订单异常</a>
        		</span>
        	</div>
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                <h4>订单信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单编号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="id" name="id">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">订单状态：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="orderStatus" name="orderStatus">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">下单时间：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" readonly  placeholder="" id="createDate" name="createDate">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="channel" name="channel">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">下单人：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="registerName" name="registerName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">服务费：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="totalFee" name="totalFee">
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
                            <label class="form-label col-xs-4 col-sm-4">身份证号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value=""  placeholder="" id="adminName" name="adminName">
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
                                <input type="text" class="input-text" value="" placeholder="" id="nowTime" name="nowTime">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggage" name="baggage">
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
    	url: basePath+"v1/order/getOrderDetail",
    	type:"POST",
    	data:{id:id},
    	success:function(data){
    		var json = JSON.parse(data);
    		for(var i in json){
    			switch (i) {
				case "createDate":
					dtime(i,json[i])
					break;
				case "nowTime":
					dtime(i,json[i])
					break;
				default:
					$("#"+i).val(json[i]);
					break;
				}
    			
    		}
    	}
    })
</script>
</body>
</html>