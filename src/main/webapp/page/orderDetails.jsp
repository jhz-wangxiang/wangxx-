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
        			<a href="javascript:;" onclick="" class="btn btn-primary radius ml-5 mr-5"><i class="Hui-iconfont Hui-iconfont-dayinji"></i> 打印订单</a>
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
                <%--<h4>寄送地址</h4>--%>
                <%--<div class="line"></div>--%>
                <%--<div class="mt-20">--%>
                    <%--<div class="row cl">--%>
                        <%--<div class="col-xs-12 col-sm-6 col-md-6 mb-10">--%>
                            <%--<label class="form-label col-xs-4 col-sm-4">收件人：</label>--%>
                            <%--<div class="formControls col-xs-8 col-sm-8">--%>
                                <%--<input type="text" class="input-text" value="" placeholder="" id="consignee" name="consignee">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-12 col-sm-6 col-md-6 mb-10">--%>
                            <%--<label class="form-label col-xs-4 col-sm-4">联系方式：</label>--%>
                            <%--<div class="formControls col-xs-8 col-sm-8">--%>
                                <%--<input type="text" class="input-text" value="" placeholder="" id="consigneePhone" name="consigneePhone">--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="col-xs-12 col-sm-6 col-md-6 mb-10">--%>
                            <%--<label class="form-label col-xs-4 col-sm-4">详细地址：</label>--%>
                            <%--<div class="formControls col-xs-8 col-sm-8">--%>
                                <%--<textarea class="textarea" id = "address" name="address"></textarea>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="layui-form-item">
                        <div class="layui-input-block" id="address-list"></div>
                    </div>
                    <a href="javascript:;" class="btn btn-success" style="margin-left: 110px; margin-top: 10px;" onclick="layer_show('新增地址')">新增地址</a>
                    <input type="hidden" name="province" id="province" lay-verify="required"><input type="hidden" name="city" id="city" lay-verify="required"><input type="hidden" name="area" id="area" lay-verify="required"><input
                  type="hidden" name="address" id="address" lay-verify="required"><input type="hidden" name="consignee" id="consignee" lay-verify="required"><input
                  type="hidden" name="consigneePhone" id="consigneePhone" lay-verify="required">
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
	var layform;
	layui.use(['form'], function () {
      layform = layui.form;
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
    		initAddress('',json.userId);
    		$('input[name="userId"]').val(json.userId);
    	}
    });
      /**
       * 地址列表初始化
       * @param isAdd 是否是新增地址后获取列表
       * @param userId 用户id
       */
      function initAddress(isAdd,userId) {
          $.ajax({
              type:"POST",
              url: basePath + 'v1/address/getAddress',
              data:{"userid":userId},
              success: function (res){
                  var json = JSON.parse(res);
                  var html = [];
                  if(json.length>0){
                      for(var i = 0; i< json.length; i++){
                          html.push('<div style="overflow: hidden"><input type="radio" name="sex" value="" title="'+json[i].consignee+' '+json[i].consigneePhone+'         '+json[i].province+' '+json[i].city+' '+json[i].area+' '+json[i].address+'" '+(isAdd?(i==json.length-1?'checked':''):(i==0?'checked':''))+' data-id="'+json[i].id+'" data-province="'+json[i].province+'" data-city="'+json[i].city+'" data-area="'+json[i].area+'" data-address="'+json[i].address+'" data-consigneePhone="'+json[i].consigneePhone+'" data-consignee="'+json[i].consignee+'"><a href="javascript:;" class="btn btn-success" style="float:left; margin-right: 10px;"  onclick="layer_show(\'编辑地址\',\''+json[i].id+'\')">编辑</a><a href="javascript:;" class="btn btn-success" style="float:left;" onclick="delAddress(\''+json[i].id+'\')">删除</a></div>');
                      }
                      $('#address-list').html(html.join(''));
                      if(isAdd){
                          $('input[name="province"]').val(json[json.length-1].province);
                          $('input[name="city"]').val(json[json.length-1].city);
                          $('input[name="area"]').val(json[json.length-1].area);
                          $('input[name="address"]').val(json[json.length-1].address);
                          $('input[name="consignee"]').val(json[json.length-1].consignee);
                          $('input[name="consigneePhone"]').val(json[json.length-1].consigneePhone);
                      }else{
                          $('input[name="province"]').val(json[0].province);
                          $('input[name="city"]').val(json[0].city);
                          $('input[name="area"]').val(json[0].area);
                          $('input[name="address"]').val(json[0].address);
                          $('input[name="consignee"]').val(json[0].consignee);
                          $('input[name="consigneePhone"]').val(json[0].consigneePhone);
                      }
                  }
                  layform.render();
              }
          });
      }
  function layer_show(title,addressid){
      var html = [],formAddress;
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
                  html.push('<div class="layui-input-inline"><select name="quiz3" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option><option value="海淀区" '+(json.area == '海淀区'?'selected':'')+'>海淀区</option><option value="昌平区" '+(json.area == '昌平区'?'selected':'')+'>昌平区</option><option value="朝阳区" '+(json.area == '朝阳区'?'selected':'')+'>朝阳区</option></select></div>')
                  html.push('</div></div>');
                  html.push('<label class="form-label col-xs-3 col-sm-2">详细地址：</label><div class="formControls col-xs-9 col-sm-10"><input type="text" class="input-text" placeholder="" id="address" name="address" value="'+json.address+'" lay-verify="required|length100"></div>');
                  html.push('</div>');
                  html.push('<input type="hidden" name="province" id="province" value="'+json.province+'"><input type="hidden" name="city" id="city" value="'+json.city+'"><input type="hidden" name="area" id="area" value="'+json.area+'"><input type="hidden" name="id" id="id" value="'+addressid+'">');
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
                                  $('input[name="area"]').val(data.value);
                              })
                              formAddress.on('submit(address)',function (data) {
                                  $.ajax({
                                      url: basePath + 'v1/address/updateAddress',
                                      data: $('#form-address-add').serialize(),
                                      type: "POST",
                                      success: function (res) {
                                          layer.closeAll();
                                          initAddress('',$('input[name="userId"]').val());
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
          html.push('<div class="layui-input-inline"><select name="quiz3" lay-filter="area" lay-verify="required" ><option value="">请选择县/区</option><option value="海淀区">海淀区</option><option value="昌平区">昌平区</option><option value="朝阳区">朝阳区</option></select></div>')
          html.push('</div></div>');
          html.push('<label class="form-label col-xs-3 col-sm-2">详细地址：</label><div class="formControls col-xs-9 col-sm-10"><input type="text" class="input-text" placeholder="" id="address" name="address" value="" lay-verify="required|length100"></div>');
          html.push('</div>');
          html.push('<input type="hidden" name="province" id="province" value="北京"><input type="hidden" name="city" id="city" value="北京"><input type="hidden" name="area" id="area" value=""><input type="hidden" name="userid" id="userid" value="'+$('input[name="userId"]').val()+'">');
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
                          $('input[name="area"]').val(data.value);
                      })
                      formAddress.on('submit(address)',function (data) {
                          $.ajax({
                              url: basePath + 'v1/address/insertAddress',
                              data: $('#form-address-add').serialize(),
                              type: "POST",
                              success: function (res) {
                                  layer.closeAll();
                                  initAddress(true,$('input[name="userId"]').val());
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
  function delAddress(id) {
      layer.confirm('是否删除此地址?', {icon: 3, title:'提示'}, function(index){
          //do something
          $.ajax({
              type: 'POST',
              url: basePath + 'v1/address/deletAddress',
              data:{id:id},
              success: function (res) {
                  layer.close(index);
                  initAddress('',$('input[name="userId"]').val());
              }
          })

      });
  }
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
</script>
</body>
</html>