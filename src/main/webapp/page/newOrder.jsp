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
            <form class="form form-horizontal layui-form" id="form-admin-add">
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户姓名：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value="" placeholder="" id="name" name="name" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text air_input_readonly" value="" placeholder="" id="phone" name="phone" readonly>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">客户渠道：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <select name="channelId" class="select" lay-verify="required">
                                    <option value="">请选择</option>
                                </select>
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
                                <input type="text" class="input-text" lay-verify="required" value="" placeholder="" id="registerName" name="registerName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">联系电话：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" lay-verify="required|phone" value="" placeholder="" id="registerPhone" name="registerPhone">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">支付方式：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <select name="payType" class="select" lay-verify="required">
                                    <option value="微信支付">微信支付</option>
                                    <option value="支付宝支付">支付宝支付</option>
                                    <option value="现金支付">现金支付</option>
                                    <option value="银行卡支付">银行卡支付</option>
                                    <option value="信用卡支付">信用卡支付</option>
                                </select>
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
                                <input type="text" class="input-text" lay-verify="required|length" value="" placeholder="" id="flightNum" name="flightNum">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">日期：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" lay-verify="required|length" value="" placeholder="" id="nowTimeStr" name="nowTimeStr">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李号码：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" lay-verify="required|length" value="" placeholder="" id="baggageNo" name="baggageNo">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李内物品：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" lay-verify="required|length" value="" placeholder="" id="baggage" name="baggage">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-4 mb-10">
                            <label class="form-label col-xs-4 col-sm-4">行李数量：</label>
                            <div class="formControls col-xs-8 col-sm-8">
                                <input type="text" class="input-text" lay-verify="required|length" value="" placeholder="" id="baggageNum" name="baggageNum">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
               	<h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="layui-form-item">
                        <div class="layui-input-block" id="address-list" style="min-height:1px"></div>
                    </div>
                    <a href="javascript:;" class="btn btn-success" style="margin-left: 110px; margin-top: 10px;" onclick="layer_show('新增地址')">新增地址</a>
                    <input type="hidden" name="province" id="province" lay-verify="required">
                    <input type="hidden" name="city" id="city" lay-verify="required">
                    <input type="hidden" name="area" id="area" lay-verify="required">
                    <input type="hidden" name="address" id="address" lay-verify="required">
                  	<input type="hidden" name="consignee" id="consignee" lay-verify="required">
                  	<input type="hidden" name="consigneePhone" id="consigneePhone" lay-verify="required">
                  	<input type="hidden" name="areafrom" id="areafrom" lay-verify="required"/>
                </div>
                <div class="mt-20">
                    <div class="row cl text-c">
                    	<button class="btn btn-success radius" style="width:100px" lay-submit="" lay-filter="demo">费用计算</button>
                    </div>
                </div>
                <input type="hidden" name="userId" id="userId">
            </form>
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
    var layform;
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
    layui.use(['form', 'laydate'], function(){
        var laydate = layui.laydate;
        layform = layui.form;
        laydate.render({
            elem: '#nowTimeStr',
            value: new Date(),
            type:"datetime",
            format: 'yyyy/MM/dd HH:mm:ss'
        });
        layform.on('radio()', function(data){
            $('input[name="province"]').val($(data.elem).data('province'));
            $('input[name="city"]').val($(data.elem).data('city'));
            $('input[name="area"]').val($(data.elem).data('area'));
            $('input[name="address"]').val($(data.elem).data('address'));
            $('input[name="consignee"]').val($(data.elem).data('consignee'));
            $('input[name="consigneePhone"]').val($(data.elem).data('consigneephone'));
        });
        initAddress();
        layform.on('submit(demo)', function(data){
        	var fd = {};
        	for(var d in data.field){
        		  fd[d.replace("areafrom","areaId")] = data.field[d];
        	}
        	$.ajax({
        		url: basePath+"v1/order/getPrice",
        		type:"POST",
        		data:fd,
        		success:function(d){
        			var j = JSON.parse(d);
        			if(j.resultCode=="SUCCESS"){
        				priceHtml(j,fd)
        			}
        			
        		}
        	})
            return false;
        });
        layform.verify({
            length: function(value){
                if(value.length > 50){
                    return '长度不能超过50个字符';
                }
            }
        });
	  })
    //获取用户详细信息
    $.ajax({
    	url: basePath+"v1/user/getUserDetail",
    	type:"POST",
    	data:{id:id},
    	success:function(data){
    		var json = JSON.parse(data);
    		for(var i in json){
    			switch (i) {
				case "createDate":
					$("#"+i).val(Common.getLocalDate(json[i]));
					break;
				case "orderDate":
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

            }
        },
        error : function() {
            alert('查询异常');
        }
    });
    /**
     * 地址列表初始化
     * @param isAdd 是否是新增地址后获取列表
     */
    function initAddress(isAdd) {
        $.ajax({
            type:"POST",
            url: basePath + 'v1/address/getAddress',
            data:{"userid":id},
            success: function (res){
                var json = JSON.parse(res);
                var html = [];
                for(var i = 0; i< json.length; i++){
                    html.push('<div style="overflow: hidden"><input type="radio" name="sex" value="" title="'+json[i].consignee+' '+json[i].consigneePhone+'         '+json[i].province+' '+json[i].city+' '+json[i].area+' '+json[i].address+'" '+(isAdd?(i==json.length-1?'checked':''):(i==0?'checked':''))+' data-id="'+json[i].id+'" data-province="'+json[i].province+'" data-city="'+json[i].city+'" data-area="'+json[i].area+'" data-address="'+json[i].address+'" data-consigneePhone="'+json[i].consigneePhone+'" data-consignee="'+json[i].consignee+'" data-areafrom="'+json[i].areafrom+'"><a href="javascript:;" class="btn btn-success" style="float:left; margin-right: 10px;"  onclick="layer_show(\'编辑地址\',\''+json[i].id+'\')">编辑</a><a href="javascript:;" class="btn btn-success" style="float:left;" onclick="delAddress(\''+json[i].id+'\')">删除</a></div>');
                }
                $('#address-list').html(html.join(''));
                if(isAdd){
                    $('input[name="province"]').val(json[json.length-1].province);
                    $('input[name="city"]').val(json[json.length-1].city);
                    $('input[name="area"]').val(json[json.length-1].area);
                    $('input[name="address"]').val(json[json.length-1].address);
                    $('input[name="consignee"]').val(json[json.length-1].consignee);
                    $('input[name="consigneePhone"]').val(json[json.length-1].consigneePhone);
                    $('input[name="areafrom"]').val(json[json.length-1].areafrom);
                }else{
                    $('input[name="province"]').val(json[0].province);
                    $('input[name="city"]').val(json[0].city);
                    $('input[name="area"]').val(json[0].area);
                    $('input[name="address"]').val(json[0].address);
                    $('input[name="consignee"]').val(json[0].consignee);
                    $('input[name="consigneePhone"]').val(json[0].consigneePhone);
                    $('input[name="areafrom"]').val(json[0].areafrom);
                }
                layform.render();
            }
        });
    }
    function layer_show(title,addressid){
        var html = [],formAddress;
        var area = getArea();
        if(addressid){
            $.ajax({
                url: basePath + 'v1/address/getAddressDetail',
                type: "POST",
                data: {id:addressid},
                success: function (res){
                    var json = JSON.parse(res);
                    html.push('<article class="cl pd-20"><form method="post" class="form form-horizontal layui-form" id="form-address-add">');
                    html.push('<div class="row cl">');
                    html.push('<label class="form-label col-xs-3 col-sm-2 mb-15">收件人姓名：</label><div class="formControls col-xs-9 col-sm-10 mb-15"><input type="text" class="input-text" id="consignee" name="consignee" value="'+json.consignee+'" lay-verify="required|length50"></div>')
                    html.push('<label class="form-label col-xs-3 col-sm-2 mb-15">收件人电话：</label><div class="formControls col-xs-9 col-sm-10 mb-15"><input type="text" class="input-text" id="consigneePhone" name="consigneePhone" value="'+json.consigneePhone+'" lay-verify="required|phone"></div>')
                    html.push('<label class="form-label col-xs-3 col-sm-2">所在区域：</label><div class="formControls col-xs-9 col-sm-10">')
                    html.push('<div class="layui-form-item"><div class="layui-input-inline"><select name="quiz1" lay-filter="province"><option value="北京" selected>北京市</option></select></div>');
                    html.push('<div class="layui-input-inline"><select name="quiz2" lay-filter="city"><option value="北京" selected>北京市</option></select></div>')
                    html.push('<div class="layui-input-inline"><select name="quiz3" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option>');
                    for(var i=0;i<area.length;i++){
                    	if(json.area==area[i].area){
                    		html.push('<option value="'+area[i].id+'" selected>'+area[i].area+'</option>');
                    	}else{
                    		html.push('<option value="'+area[i].id+'">'+area[i].area+'</option>');
                    	}
                    }
                    html.push('</select></div></div></div>');
                    html.push('<label class="form-label col-xs-3 col-sm-2">详细地址：</label><div class="formControls col-xs-9 col-sm-10"><input type="text" class="input-text" placeholder="" id="address" name="address" value="'+json.address+'" lay-verify="required|length100"></div>');
                    html.push('</div>');
                    html.push('<input type="hidden" name="province" id="province" value="'+json.province+'"><input type="hidden" name="city" id="city" value="'+json.city+'"><input type="hidden" name="area" id="area" value="'+json.area+'"><input type="hidden" name="areafrom" id="areafrom" value="'+json.areafrom+'"><input type="hidden" name="id" id="id" value="'+addressid+'">');
                    html.push('<div class="layui-layer-btn layui-layer-btn-" style="margin-top: 20px;"><button class="btn btn-success aasdda" lay-submit="" lay-filter="address">确定</button></div>');
                    html.push('</form></article>');
                    layer.open({
                        title: title,
                        content: html.join(""),
                        area:['800px','400px'],
                        type:1,
                        success:function(layero, index){
                            layui.use(['form'], function(){
                                formAddress = layui.form;
                                formAddress.render();
                                formAddress.on('select(province)',function (data) {
                                    $('input[name="province"]').val(data.value);
                                })
                                formAddress.on('select(city)',function (data) {
                                    $('input[name="city"]').val(data.value);
                                })
                                formAddress.on('select(area)',function (data) {
                                    $('input[name="areafrom"]').val(data.value);
                                    $('input[name="area"]').val(data.elem.options[data.elem.selectedIndex].text);
                                })
                                formAddress.on('submit(address)',function (data) {
                                    $.ajax({
                                        url: basePath + 'v1/address/updateAddress',
                                        data: $('#form-address-add').serialize(),
                                        type: "POST",
                                        success: function (res) {
                                            layer.closeAll();
                                            initAddress();
                                        }
                                    })
                                    return false;

                                })
                                formAddress.verify({
                                    length50: function(value){
                                        if(value.length > 50){
                                            return '长度不能超过50个字符';
                                        }
                                    },
                                    length100: function(value){
                                        if(value.length > 100){
                                            return '长度不能超过100个字符';
                                        }
                                    },
                                });
                            })
                        }
                    });
                }
            })
        }else{
            html.push('<article class="cl pd-20"><form method="post" class="form form-horizontal layui-form" id="form-address-add">');
            html.push('<div class="row cl">');
            html.push('<label class="form-label col-xs-3 col-sm-2 mb-15">收件人姓名：</label><div class="formControls col-xs-9 col-sm-10 mb-15"><input type="text" class="input-text" id="consignee" name="consignee" value="" lay-verify="required|length50"></div>')
            html.push('<label class="form-label col-xs-3 col-sm-2 mb-15">收件人电话：</label><div class="formControls col-xs-9 col-sm-10 mb-15"><input type="text" class="input-text" id="consigneePhone" name="consigneePhone" value="" lay-verify="required|phone"></div>')
            html.push('<label class="form-label col-xs-3 col-sm-2">所在区域：</label><div class="formControls col-xs-9 col-sm-10">')
            html.push('<div class="layui-form-item"><div class="layui-input-inline"><select name="quiz1" lay-filter="province"><option value="北京" selected>北京市</option></select></div>');
            html.push('<div class="layui-input-inline"><select name="quiz2" lay-filter="city"><option value="北京" selected>北京市</option></select></div>')
            html.push('<div class="layui-input-inline"><select name="quiz3" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option>');
            for(var i=0;i<area.length;i++){
            	html.push('<option value="'+area[i].id+'">'+area[i].area+'</option>');
            }
            html.push('</select></div></div></div>');
            html.push('<label class="form-label col-xs-3 col-sm-2">详细地址：</label><div class="formControls col-xs-9 col-sm-10"><input type="text" class="input-text" placeholder="" id="address" name="address" value="" lay-verify="required|length100"></div>');
            html.push('</div>');
            html.push('<input type="hidden" name="province" id="province" value="北京"><input type="hidden" name="city" id="city" value="北京"><input type="hidden" name="area" id="area" value=""><input type="hidden" name="areafrom" id="areafrom" value=""><input type="hidden" name="userid" id="userid" value="'+id+'">');
            html.push('<div class="layui-layer-btn layui-layer-btn-" style="margin-top: 20px;"><button class="btn btn-success aasdda" lay-submit="" lay-filter="address">确定</button></div>');
            html.push('</form></article>');
            layer.open({
                title: title,
                content: html.join(""),
                area:['800px','400px'],
                type:1,
                success:function(layero, index){
                    layui.use(['form'], function(){
                        formAddress = layui.form;
                        formAddress.render();
                        formAddress.on('select(province)',function (data) {
                            $('input[name="province"]').val(data.value);
                        })
                        formAddress.on('select(city)',function (data) {
                            $('input[name="city"]').val(data.value);
                        })
                        formAddress.on('select(area)',function (data) {
                        	$('input[name="areafrom"]').val(data.value);
                            $('input[name="area"]').val(data.elem.options[data.elem.selectedIndex].text);
                        })
                        formAddress.on('submit(address)',function (data) {
                            $.ajax({
                                url: basePath + 'v1/address/insertAddress',
                                data: $('#form-address-add').serialize(),
                                type: "POST",
                                success: function (res) {
                                    layer.closeAll();
                                    initAddress(true);
                                }
                            })
                            return false;

                        })
                        formAddress.verify({
                            length50: function(value){
                                if(value.length > 50){
                                    return '长度不能超过50个字符';
                                }
                            },
                            length100: function(value){
                                if(value.length > 100){
                                    return '长度不能超过100个字符';
                                }
                            },
                        });
                    })

                },
            });
        }
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
              layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
                  window.location.href= basePath + 'v1/page/orderList';
              });
    			}else{
              layer.msg(json.msg,{icon: 5,time:1000,shade:0.3});
          }
    		}
    	})
    }
    function delAddress(id) {
        layer.confirm('是否删除此地址?', {icon: 3, title:'提示'}, function(index){
            //do something
            $.ajax({
                type: 'POST',
                url: basePath + 'v1/address/deletAddress',
                data:{id:id},
                success: function (res) {
                    layer.close(index);
                    initAddress();
                }
            })

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
	   		    		var json = $.extend({}, dd, data.field);
	   		    		$.ajax({
	                        type:'POST',
	                        url: basePath+'v1/order/insertOrderbyUser',
	                        data: json,
	                        success: function (res){
	                            var json = JSON.parse(res);
	                            if(json.resultCode == 'SUCCESS'){
	                                layer.msg(json.msg,{icon: 6,time:1000,shade:0.3},function(){
	                                    window.location.href= basePath + 'v1/page/orderList';
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
</script>
</body>
</html>