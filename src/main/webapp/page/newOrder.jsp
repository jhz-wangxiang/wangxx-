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
<style>
	.fee-box{
	float: left;
    margin: 0 60px;
    text-align: center;
}
.fee-box p.lab{
	line-height: 2;
    margin-bottom: 10px;
}
.fee-box p.fee{
	line-height: 2;
    font-size: 18px;
}
.fee-box p.fee span{
	color: red;
}
.fee-line{
border: 1px solid #eeeeee;
    float: left;
    margin-top: 3px;
    height: 60px;}
</style>
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
        订单管理
        <span class="c-gray en">&gt;</span>
        新建订单
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form class="form form-horizontal" id="form-admin-add">
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="phone" name="phone" readonly>
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>登机人信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">登机人姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="registerName" name="registerName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="registerPhone" name="registerPhone">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>行李信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">航班号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="flightNum" name="flightNum">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">日期：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="nowTimeStr" name="nowTimeStr">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggageNo" name="baggageNo">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李内物品：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggage" name="baggage">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李数量：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="baggageNum" name="baggageNum">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收件人：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="consignee" name="consignee">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收件人电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" value="" placeholder="" id="consigneePhone" name="consigneePhone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                        	<!-- <a class="btn btn-success" style="margin-left: 90px;" href="javascript:layer_show()">选择地址</a> -->
                        </div>
                        <div class="cl"></div>
                    </div>
                    <div class="row cl">
                    	<div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收获地址：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <textarea class="textarea"></textarea>
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>费用信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="fee-box"><p class="lab">基础服务费</p><p class="fee"><span>20</span>元</p><input type="hidden" name="basicFee" id="basicFee" value="20"/></div>
                        <div class="fee-box"><p class="lab">每公里加收2元</p><p class="fee"><span>20</span>元</p><input type="hidden" name="additionalFee" id="additionalFee" value="2" /></div>
                        <div class="fee-box"><p class="lab">合计服务费</p><p class="fee"><span>20</span>元</p><input type="hidden" name="totalFee" id="totalFee" value="30"></div>
                        <div class="fee-box"><p class="lab">折扣信息</p><p class="fee"><span>20</span>元</p><input type="hidden" name="discount" id="discount" value="0.8"></div>
                        <div class="fee-line"></div>
                        <div class="fee-box"><p class="lab">应收金额</p><p class="fee"><span>20</span>元</p><input type="hidden" name="paidFee" id="paidFee" value="60"></div>
                        <div class="cl"></div>
                    </div>
                </div>
                <div class="mt-20">
                    <div class="row cl">
                    	<a class="btn btn-success" style="float:right;" onclick="submit()">确认下单</a>
                    </div>
                </div>
                <input type="hidden" name="userId" id="userId">
            </form>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort" id="table">
                </table>
                <div id="page"></div>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
var id = Common.GetUrlRequest()['id'];
$('input[name="userId"]').val(id);
    var basePath = "<%=basePath %>";
    var pageNum = 1;
    var pageSize = 10;
    var formData = "";
    layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  laydate.render({
		    elem: '#nowTimeStr',
		    value: new Date(),
		    type:"datetime",
		    format: 'yyyy/MM/dd HH:mm:ss'
		  });
	})
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
    		$('#registerName').val(json['name']);
    		$('#registerPhone').val(json['phone']);
    	}
    })
    function layer_show(){
    	var html = [];
    	$.ajax({
    		url: basePath+"v1/address/getAddressListPage",
    		type: "POST",
    		data: {userid:id,pageSize:10,start:0,pageNumber:1,limit:10},
    		success: function (res){
    			var json = JSON.parse(res);
    			html.push('<article class="cl pd-20"><form action="" method="post" class="form form-horizontal" id="form-admin-add">');
    			for (var i = 0; i<json.list.length; i++){
    				html.push('<div class="row cl">');
    				html.push('<label class="form-label col-xs-3 col-sm-2"></label><div class="formControls col-xs-9 col-sm-10"></div></div>')
    			}
    	    	html.push('</form></article>');
    	    	layer.open({
    	     		  title: '选择地址',
    	     		  content: html.join(""),
    	     		  area:'800px',
    	     		  success:function(layero, index){
    	     		  },
    	     		  btn:['确定','取消'],
    	     		  yes: function(index, layero){
    	     			aaa(layero,id);
    	     		    layer.close();
    	     		  },
    	     		  btn2: function(){
    	     			  layer.close();
    	     		  }
    	     		}); 
    	      	function aaa () {
    	      		alert(11111111);
    	      	}
    		}
    	})
    	
    }
    function submit(){
    	var form = $('#form-admin-add');
    	$.ajax({
    		type:'POST',
    		url: basePath+'v1/order/insertOrder',
    		data: form.serialize(),
    		success: function (res){
    			var json = JSON.parse(res);
    			if(json.resultCode == 'SUCCESS'){
    				window.location.href= basePath + 'v1/page/orderList';
    			}
    		}
    	})
    }
</script>
</body>
</html>