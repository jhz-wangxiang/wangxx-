<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>
<!--内容-->
<div class="container0718 clearfix">
    <jsp:include page="leftNav.jsp">
		<jsp:param name="nav" value="logisticsManagerPage"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
       		<p class="insertTit">编辑数据</p>
			<form method="post" class="easyui-form search-form0721 clearfix easyui-form2" id="searchForm"
				  data-options="novalidate:true">
				  <input type="hidden" name="id" id="id0408" />
				<div class="left">
					<div class="leftList">
						<div class="LListTit">结算信息</div>
						<table cellpadding="5" class="right0407">
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">订单日期</td>
								<td><input class="easyui-datebox" type="text" name="orderDateStr" id="orderDate" data-options="novalidate:true" style="width: 200px" readonly/>
								</td>
								<td class="text_left width0407 redColor">发货类型</td>
								<td><input class="easyui-combobox" type="text" name="sendGoodsType" id="sendGoodsType"
										   data-options="novalidate:true"	   readonly style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">客户名称</td>
								<td><input class="easyui-textbox" type="text" name="customerName" readonly
										   data-options="novalidate:true"	   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">系统管理订单号</td>
								<td><input class="easyui-textbox" type="text" name="systemManageOrder" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">产品编码</td>
								<td><input class="easyui-textbox" type="text" name="productCode" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">产品名称</td>
								<td><input class="easyui-textbox" type="text" name="producutName" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">发货数量</td>
								<td><input class="easyui-numberbox" type="text" name="sendGoodsNum" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">收货人姓名（一）</td>
								<td><input class="easyui-textbox" type="text" name="consigneeName1" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">出货时间</td>
								<td><input class="easyui-datebox" type="text" name="exp6Str" id="exp6" data-options="novalidate:true" readonly style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor" >物流公司</td>
								<td><input class="easyui-textbox" type="text" name="logisticsCompany" data-options="novalidate:true" readonly style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">物流单号</td>
								<td><input class="easyui-textbox" type="text" name="logisticsNumber" data-options="novalidate:true" readonly style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">物流费用</td>
								<td><input class="easyui-textbox" type="text" name="logisticeFee" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">运费</td>
								<td><input class="easyui-numberbox" type="text" name="freightFee" readonly data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">中转费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="transitFee" data-options="novalidate:true" readonly style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">保险</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="insurance" readonly data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">包装费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="packingChargesFee" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">送货上门</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="provideHomeFee" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">上楼费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="upstairsFee" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">代收货款</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="collectMoney" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
							</tr>

							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">拒收退回费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="rejectionFee" data-options="novalidate:true" readonly
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">操作费</td>
								<td><input class="easyui-textbox" type="text" name="operationCostFee" data-options="novalidate:true" readonly style="width: 200px" />
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">其他</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="otherFee" readonly data-options="novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">物流备注</td>
								<td><input class="easyui-textbox" type="text" name="logisticeRemarks" data-options="novalidate:true" readonly style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">费用承担</td>
								<td><input class="easyui-textbox" type="text" name="exp8" readonly data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407 redColor">付款方式</td>
								<td><input class="easyui-textbox" type="text" name="exp9" readonly data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr class="lot-tr0606">
								<td class="text_left width0407 redColor">超派费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="superChargeFee" readonly data-options="novalidate:true"
										   style="width: 200px"/>
								</td>

							</tr>
							<tr>
								<td class="text_left width0407">提货费</td>
								<td><input class="easyui-numberbox" precision="2" type="text" name="deliveryFee" data-options="novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">是否结算</td>
								<td><input class="easyui-combobox" type="text" name="ynSettlement"  id="jiesuan" data-options="novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">费用结算日期</td>
								<td><input class="easyui-datebox" type="text" name="costCalculationDateStr"
										   id="costCalculationDate" data-options="editable:false,novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">是否理赔</td>
								<td><input class="easyui-combobox" type="text" name="exp10" id="exp10"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">理赔原因</td>
								<td><input class="easyui-textbox" type="text" name="exp11"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">理赔状态</td>
								<td><input class="easyui-combobox" type="text" name="exp12" id="exp12"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>


							<tr>
								<td class="text_left width0407">自定义9</td>
								<td><input class="easyui-textbox" type="text" name="exp29"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">自定义10</td>
								<td><input class="easyui-textbox" type="text" name="exp30"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="leftList" style="display: none">
						<div class="LListTit">跟单信息</div>
						<table cellpadding="5" class="right0407">

							<tr>
								<td class="text_left width0407">订单状态</td>
								<td><input class="easyui-combobox" type="text" name="orderStatus" id="orderStatus"
										   data-options="novalidate:true"	   style="width: 200px"/>
								</td>
								<td class="text_left width0407">签收时间</td>
								<td><input class="easyui-datebox" type="text" name="exp14Str" id="exp14"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">拒收（退货）签收情况</td>
								<td><input class="easyui-combobox" type="text" name="exp16" id="exp16"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">拒收（返货）签收时间</td>
								<td><input class="easyui-datebox" type="text" name="exp17Str" id="exp17"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">跟单内容</td>
								<td>
									<input class="easyui-textbox" type="text" name="exp2" multiline="true"
										   data-options="novalidate:true"
										   style="width: 200px;height:120px"/>
								</td>
								<td class="text_left width0407">跟单时间</td>
								<td><input class="easyui-datebox" type="text" name="exp1Str" id="exp1"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义5</td>
								<td><input class="easyui-textbox" type="text" name="exp25"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">自定义6</td>
								<td><input class="easyui-textbox" type="text" name="exp26"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="leftList" style="display: none">
						<div class="LListTit">物流费用</div>
						<table cellpadding="5" class="right0407">
							<tr>
								<td class="text_left width0407">发货通知单号</td>
								<td><input class="easyui-textbox" type="text" name="sendGoodsOrder"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">委托提货通知单号</td>
								<td><input class="easyui-textbox" type="text" name="entrustOrder"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">物流状态</td>
								<td><input class="easyui-textbox" type="text" name="logisticsStatus" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
								<td class="text_left width0407">出库库位</td>
								<td><input class="easyui-textbox" type="text" name="warehouseLocation"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>


							<tr>
								<td class="text_left width0407">机器人SN</td>
								<td><input class="easyui-textbox" type="text" name="exp19"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">充电桩SN</td>
								<td><input class="easyui-textbox" type="text" name="exp18"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义3</td>
								<td><input class="easyui-textbox" type="text" name="exp23"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">自定义4</td>
								<td><input class="easyui-textbox" type="text" name="exp24"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>



						</table>
					</div>
					<div class="leftList" style="display: none">
						<div class="LListTit">订单信息</div>
						<table cellpadding="5" class="right0407" >
							<tr>
								<td class="text_left width0407">系统订单号</td>
								<td><input class="easyui-textbox" type="text" name="systemOrder"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">系统平台编号</td>
								<td><input class="easyui-textbox" type="text" name="platformOrder"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">客户属性</td>
								<td><input class="easyui-textbox" type="text" name="clientProperty"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">订单类型</td>
								<td><input class="easyui-combobox" type="text" name="orderType" id="orderType"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>

							<tr>
								<td class="text_left width0407">核算单位</td>
								<td><input class="easyui-textbox" type="text" name="accountingUnit"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">产品分类</td>
								<td><input class="easyui-textbox" type="text" name="exp7"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">礼品情况</td>
								<td><input class="easyui-textbox" type="text" name="exp15"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>

							</tr>
							<tr>
								<td class="text_left width0407">单价</td>
								<td><input class="easyui-numberbox" type="text" name="unitPrice" id="unitPrice"
										   data-options="max:999999999.99,validType:['maxNumLength[12]'],novalidate:true"
										   precision="2" style="width: 200px"/>
								</td>
								<td class="text_left width0407">金额</td>
								<td><input class="easyui-numberbox" type="text" name="price" precision="2"
										   data-options="max:999999999.99,validType:['maxNumLength[12]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>

								<td class="text_left width0407 redColor">收货人电话（一）</td>
								<td><input class="easyui-textbox" type="text" name="consigneephone1"
										   data-options="novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">收货人姓名（二）</td>
								<td><input class="easyui-textbox" type="text" name="consigneeName2"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">收货人电话（二）</td>
								<td><input class="easyui-textbox" type="text" name="consigneephone2"
										   data-options="novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">收货省</td>
								<td><input class="easyui-textbox" type="text" name="receivingProvince"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">收货地级市/县</td>
								<td><input class="easyui-textbox" type="text" name="receivingCityCounty"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">城市级别</td>
								<td><input class="easyui-textbox" type="text" name="cityLevel"
										   data-options="validType:['maxLength[50]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">收货人详细地址</td>
								<td><input class="easyui-textbox" type="text" name="addressDetail" multiline="true"
										   data-options="validType:['maxLength[300]'],novalidate:true"
										   style="width: 200px;height:120px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">备注</td>
								<td><input class="easyui-textbox" type="text" name="remarks"
										   ddata-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
								<td class="text_left width0407">定金</td>
								<td><input class="easyui-numberbox" type="text" name="deposit" precision="2"
										   data-options="max:999999999.99,validType:['maxNumLength[12]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">是否代收款</td>
								<td><input class="easyui-combobox" type="text" name="ynPaymentReceived"
										   id="ynPaymentReceived" data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">退货补发订单号</td>
								<td><input class="easyui-textbox" type="text" name="returnGoodsNosentOrder"
										   data-options="validType:['maxLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">订单判定</td>
								<td><input class="easyui-textbox" type="text" name="orderDecision" readonly
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>

							</tr>
							<tr>
								<td class="text_left width0407">自定义1</td>
								<td><input class="easyui-textbox" type="text" name="exp21"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
								<td class="text_left width0407">自定义2</td>
								<td><input class="easyui-textbox" type="text" name="exp22"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>
					<div class="leftList marTop20" style="display: none">
						<div class="LListTit">回款信息</div>
						<table cellpadding="5" class="right0407">
							<tr>
								<td class="text_left width0407">是否回款</td>
								<td><input class="easyui-combobox" type="text" name="ynPayment" id="huikuan"
										   data-options="novalidate:true"	   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">回款金额</td>
								<td><input class="easyui-numberbox" type="text" name="collectionPrice" precision="2"
										   data-options="novalidate:true"   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">回款日期</td>
								<td><input class="easyui-datebox" type="text" name="collectionDateStr"
										   id="collectionDate" data-options="editable:false,novalidate:true" style="width: 200px"/>
								</td>
							</tr>

							<tr>
								<td class="text_left width0407">发票类型</td>
								<td><input class="easyui-combobox" type="text" name="exp13" id="exp13"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">发票抬头</td>
								<td><input class="easyui-textbox" type="text" name="exp3"
										   data-options="validType:['maxNumLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">发票快递单号</td>
								<td><input class="easyui-textbox" type="text" name="exp4"
										   data-options="validType:['maxNumLength[100]'],novalidate:true"
										   style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">发票发送日期</td>
								<td><input class="easyui-datebox" type="text" name="exp5Str" id="exp5"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>

				</div>
				<div class="left marLeft" style="display: none">


					<div class="leftList marTop20">
						<div class="LListTit">自定义</div>
						<table cellpadding="5" class="right0407">


							<tr>
								<td class="text_left width0407">自定义7</td>
								<td><input class="easyui-textbox" type="text" name="exp27"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义8</td>
								<td><input class="easyui-textbox" type="text" name="exp28"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>

							<tr>
								<td class="text_left width0407">发票号</td>
								<td><input class="easyui-textbox" type="text" name="exp31"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义12</td>
								<td><input class="easyui-textbox" type="text" name="exp32"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义13</td>
								<td><input class="easyui-textbox" type="text" name="exp33"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
							<tr>
								<td class="text_left width0407">自定义14</td>
								<td><input class="easyui-textbox" type="text" name="exp34"
										   data-options="novalidate:true" style="width: 200px"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</form>
           <div style="text-align:center;padding:5px 0;margin-bottom:40px;">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="EditlogisticsSettlementManagerPage.submitForm()" style="width:80px">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="EditlogisticsSettlementManagerPage.clearForm()" style="width:80px">清空</a>
		   </div>
        </div>
    </div>
</div>

<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/InitLogisticsCombobox.js'></script>
<script src='<%=basePath %>js/getEditLogisticsData.js'></script>
<script src='<%=basePath %>js/editlogisticsSettlementManagerPage.js'></script>
<script>
var rootPath='<%=basePath%>';
EditlogisticsSettlementManagerPage.init();
</script>
</body>
</html>