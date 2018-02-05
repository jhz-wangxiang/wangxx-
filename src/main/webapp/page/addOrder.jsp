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
	<jsp:param value="order_add" name="level"/>
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
            <form class="form form-horizontal layui-form" id="form-order-add">
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="name" name="name">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required|phone" id="phone" name="phone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <select name="channel" class="select" lay-verify="required">
									<option value="">请选择</option>
								</select>
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
                                <input type="text" class="input-text layui-input" lay-verify="required" id="registerName" name="registerName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required|phone" id="registerPhone" name="registerPhone">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>行李信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">航班号：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="flightNum" name="flightNum">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">日期：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="nowTimeStr" name="nowTimeStr">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="baggageNo" name="baggageNo">
                            </div>
                        </div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李内物品：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="baggage" name="baggage">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李数量：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required|number" id="baggageNum" name="baggageNum">
                            </div>
                        </div>
                    </div>
                </div>
                <h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收件人：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required" id="consignee" name="consignee">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收件人电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text layui-input" lay-verify="required|phone" id="consigneePhone" name="consigneePhone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                        	<!-- <a class="btn btn-success" style="margin-left: 90px;" href="javascript:layer_show()">选择地址</a> -->
                        </div>
                    </div>
                    <div class="row cl">
                    	<div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">收获地址：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <textarea class="textarea layui-textarea" name="address" lay-verify="required"></textarea>
                            </div>
                        </div>
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
                    </div>
                </div>
                <div class="mt-20">
                    <div class="row cl">
                    	<a class="btn btn-success radius" style="float:right;" lay-submit="" lay-filter="demo1">确认下单</a>
                    </div>
                </div>
                <input type="hidden" name="userId" id="userId">
                <input type="hidden" name="channel" id="channel" value="微信">
            </form>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort" id="table"></table>
            </div>
            <div class="page-on-load">
            	<div ng-spinner-bar class="page-spinner-bar" >
				    <div class="cover"></div>
				    <div class="spinner0609 bounce1"></div>
				    <div class="spinner0609 bounce2"></div>
				    <div class="spinner0609 bounce3"></div>
				</div>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript" src="<%=basePath %>js/plugin/h-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="<%=basePath %>js/plugin/h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="<%=basePath %>js/plugin/h-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
    var basePath = "<%=basePath %>";
    var pageNum = 1;
    var pageSize = 10;
    var formData = "";
    layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  laydate.render({
		    elem: '#nowTimeStr',
		    format: 'yyyy/MM/dd'
		  });
	});
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
                $(".page-on-load").hide();
                layui.use(['form'], function(){
                	  var form = layui.form
                	  /* //监听提交
                	  form.on('submit(demo1)', function(data){
                		  console.log("123123")
                	    layer.alert(JSON.stringify(data.field), {
                	      title: '最终的提交信息'
                	    })
                	    return false;
                	  }); */
                });
                
            }
        },
        error : function() {
            alert('查询异常');
        }
    });
</script>
</body>
</html>