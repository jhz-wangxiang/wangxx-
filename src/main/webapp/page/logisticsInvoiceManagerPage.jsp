<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>
<!--内容-->
<style>
    ul{list-style: none;}ol{list-style-type: decimal;font-size: 14px;color: red;margin-left: 35px;}
    .easyui-linkbutton0410{background-color: #b7d2ff;padding: 2px 6px;border-radius: 7px;color: #3c3f42;}
</style>
<div class="container0718 clearfix">
    <jsp:include page="leftNav.jsp">
        <jsp:param name="nav" value="logisticsManagerPage"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
            <div class="content-tool0718 clearfix">
                <div class="left">
                    <a class="btn search-btn0718" href="<%=basePath %>v1/lLogisticsManagerController/logisticsManagerPage">汇总订单</a>
                    <a class="btn search-btn0718 " href="<%=basePath %>v1/lLogisticsManagerController/logisticsOrderManagerPage">订单信息</a>
                    <a class="btn search-btn0718 " href="<%=basePath %>v1/lLogisticsManagerController/logisticsMsgManagerPage">物流信息</a>
                    <a class="btn search-btn0718 " href="<%=basePath %>v1/lLogisticsManagerController/logisticsDocManagerPage">跟单信息</a>
                    <a class="btn search-btn0718 " href="<%=basePath %>v1/lLogisticsManagerController/logisticsPaymentManagerPage">回款信息</a>
                    <a class="btn search-btn0718 "  href="<%=basePath %>/v1/lLogisticsManagerController/logisticsSettlementManagerPage">结算信息</a>
                    <a class="btn reset-btn0718 " href="<%=basePath %>v1/lLogisticsManagerController/logisticsInvoiceManagerPage">发票信息</a>
                </div>
            </div>
            <div class="content-tool0718 clearfix">
                <h3 class="left">|全部订单<a href="javascript:;" class="table-requirement-btn">选择显示信息</a></h3>

                <div class="right" id="opera0710">
                    <a class="btn reset-btn0718 new-btn0405" href="<%=basePath%>v1/lLogisticsManagerController/insertLlogisticsManagerPage">新增</a>
                    <!--<a class="btn search-btn0718 setUp-btn0405">设置</a>-->
                    <label class="btn reset-btn0718 import-btn0405" id="importBtn" for="file">导入</label>
                    <input type="file" id="file" name="file" onchange="LogisticsInvoiceManagerPage.importExcel(this)"/>
                    <a class="btn search-btn0718 excle-btn0405" id="excelBtn0407">导出</a>
                </div>
            </div>
        </div>
        <div class="column-content0718">
        	<div class=" content-tool0718 clearfix">
        		<div class="left" style="margin-right:10px;">
        			<span style="vertical-align:middle">系统管理订单号</span>
        			<input class="easyui-textbox" type="text" name="systemManageOrder" id="smo" data-options="validType:['maxLength[50]'],novalidate:true" />
        		</div>
        		<a href="javascript:LogisticsManagerPage.searchDataBySystemManageOrder();" class="btn search-btn0718 excle-btn0405 left">搜索</a>
        		<a href="javascript:;" class="openSearche_btn btn search-btn0718 excle-btn0405 left">详细搜索</a>
        	</div>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718 clearfix">
                <div class="right" id="operaDiv0710">
                    <a class="btn search-btn0718 import-btn0405" id="lotUpdateBtn">批量修改</a>
                    <a class="btn reset-btn0718 excle-btn0405" id="formBtn0424">导出全部</a>
                </div>
            </div>
        </div>
        <!-- <div id="cc" class="easyui-calendar"></div> -->
        <div class="column-content0718 table-cont1216" id="table" style="margin-bottom: 10px;">
            <table id="order" style="width: 956px;height: 620px;"></table>
        </div>
    </div>
</div>
<div id="table-show-condition-window"  title="选择显示信息">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'center'">
            <p style="padding: 20px; font-size:18px;font-weight:bold;"><label>筛选显示项</label></p>
            <div class="displayBox selBox0516">
                <div class="displayTit">订单信息</div>
                <p style="margin-top:10px;"><input type="checkbox" id="orderCk" name="orderCkUl" class="check"/>全选</p>
                <ul id="orderCkUl">
                    <li><input type="checkbox" id="orderDate" value="orderDate" name="check0407" class="check" checked/>订单日期</li>
                    <li><input type="checkbox" id="sendGoodsType" value="sendGoodsType" name="check0407" class="check" checked/>发货类型</li>
                    <li><input type="checkbox" id="customerName" value="customerName" name="check0407" class="check" checked/>客户名称</li>
                    <li><input type="checkbox" id="systemManageOrder" value="systemManageOrder" name="check0407" class="check" checked/>系统管理订单号</li>
                    <li><input type="checkbox" id="systemOrder" value="systemOrder" name="check0407" class="check"/>系统订单号</li>
                    <li><input type="checkbox" id="platformOrder" value="platformOrder" name="check0407" class="check"/>平台订单编号</li>
                    <li><input type="checkbox" id="clientProperty" value="clientProperty" name="check0407" class="check"/>客户属性</li>
                    <li><input type="checkbox" id="orderType" value="orderType" name="check0407" class="check"/>订单类型</li>
                    <li><input type="checkbox" id="productCode" value="productCode" name="check0407" class="check" checked/>产品编码</li>
                    <li><input type="checkbox" id="producutName" value="producutName" name="check0407" class="check" checked/>产品名称</li>
                    <li><input type="checkbox" id="accountingUnit" value="accountingUnit" name="check0407" class="check"/>核算单位</li>
                    <li><input type="checkbox" id="exp7" value="exp7" name="check0407" class="check"/>产品分类</li>
                    <li><input type="checkbox" id="exp15" value="exp15" name="check0407" class="check"/>礼品情况</li>
                    <li><input type="checkbox" id="sendGoodsNum" value="sendGoodsNum" name="check0407" class="check" checked/>发货数量</li>
                    <li><input type="checkbox" id="unitPrice" value="unitPrice" name="check0407" class="check" checked/>单价</li>
                    <li><input type="checkbox" id="price" value="price" name="check0407" class="check" checked/>金额</li>
                    <li><input type="checkbox" id="remarks" value="remarks" name="check0407" class="check"/>备注</li>
                    <li><input type="checkbox" id="deposit" value="deposit" name="check0407" class="check"/>定金</li>
                    <li><input type="checkbox" id="ynPaymentReceived" value="ynPaymentReceived" name="check0407" class="check"/>是否代收货款</li>
                    <li><input type="checkbox" id="returnGoodsNosentOrder" value="returnGoodsNosentOrder" name="check0407" class="check"/>退货补发对应订单号</li>
                    <li><input type="checkbox" id="orderDecision" value="orderDecision" name="check0407" class="check"/>订单判定</li>
                    <li><input type="checkbox" id="exp6" value="exp6" name="check0407" class="check"/>出货时间</li>
                    <input type="hidden" name="order0407" value="9">
                </ul>
            </div>
            <div class="displayBox selBox0516">
                <div class="displayTit">物流费用</div>
                <p style="margin-top:10px;"><input type="checkbox" id="wuLiuCk" name="wuLiuCkUl" class="check"/>全选</p>
                <ul id="wuLiuCkUl">
                    <li><input type="checkbox" id="sendGoodsOrder" value="sendGoodsOrder" name="check0407" class="check"/>发货通知单号</li>
                    <li><input type="checkbox" id="entrustOrder" value="entrustOrder" name="check0407" class="check"/>委托提货通知单号</li>
                    <li><input type="checkbox" id="logisticsStatus" value="logisticsStatus" name="check0407" class="check"/>物流状态</li>
                    <li><input type="checkbox" id="warehouseLocation" value="warehouseLocation" name="check0407" class="check"/>出库库位</li>
                    <li><input type="checkbox" id="logisticsCompany" value="logisticsCompany" name="check0407" class="check"/>物流公司</li>
                    <li><input type="checkbox" id="logisticsNumber" value="logisticsNumber" name="check0407" class="check"/>物流单号</li>
                    <li><input type="checkbox" id="logisticeFee" value="logisticeFee" name="check0407" class="check"/>物流费用</li>
                    <li><input type="checkbox" id="freightFee" value="freightFee" name="check0407" class="check"/>运费</li>
                    <li><input type="checkbox" id="insurance" value="insurance" name="check0407" class="check"/>保险</li>
                    <li><input type="checkbox" id="transitFee" value="transitFee" name="check0407" class="check"/>中转费</li>
                    <li><input type="checkbox" id="provideHomeFee" value="provideHomeFee" name="check0407" class="check"/>送货上门</li>
                    <li><input type="checkbox" id="packingChargesFee" value="packingChargesFee" name="check0407" class="check"/>包装费</li>
                    <li><input type="checkbox" id="collectMoney" value="collectMoney" name="check0407" class="check"/>代收货款</li>
                    <li><input type="checkbox" id="upstairsFee" value="upstairsFee" name="check0407" class="check"/>上楼费</li>
                    <li><input type="checkbox" id="superChargeFee" value="superChargeFee" name="check0407" class="check"/>超派费</li>
                    <li><input type="checkbox" id="deliveryFee" value="deliveryFee" name="check0407" class="check"/>提货费</li>
                    <li><input type="checkbox" id="rejectionFee" value="rejectionFee" name="check0407" class="check"/>拒收退回费</li>
                    <li><input type="checkbox" id="operationCostFee" value="operationCostFee" name="check0407" class="check"/>操作费</li>
                    <li><input type="checkbox" id="otherFee" value="otherFee" name="check0407" class="check"/>其他</li>
                    <li><input type="checkbox" id="logisticeRemarks" value="logisticeRemarks" name="check0407" class="check"/>物流备注</li>
                    <li><input type="checkbox" id="exp8" value="exp8" name="check0407" class="check"/>费用分类</li>
                    <li><input type="checkbox" id="exp9" value="exp9" name="check0407" class="check"/>付款方式</li>
                    <li><input type="checkbox" id="exp19" value="exp19" name="check0407" class="check"/>机器人SN</li>
                    <li><input type="checkbox" id="exp18" value="exp18" name="check0407" class="check"/>充电桩SN</li>
                    <input type="hidden" name="wuLiu0407" value="0">
                </ul>
            </div>
            <div class="displayBox selBox0516">
                <div class="displayTit">跟单/回款信息</div>
                <p style="margin-top:10px;"><input type="checkbox" id="moneyCk" name="moneyCkUl" class="check"/>全选</p>
                <ul id="moneyCkUl">
                    <li><input type="checkbox" id="orderStatus" value="orderStatus" name="check0407" class="check"/>订单状态</li>
                    <li><input type="checkbox" id="exp14" value="exp14" name="check0407" class="check"/>签收时间</li>
                    <li><input type="checkbox" id="exp16" value="exp16" name="check0407" class="check"/>拒收（退货）签收</li>
                    <li><input type="checkbox" id="exp17" value="exp17" name="check0407" class="check"/>拒收（返货）签收时间</li>
                    <li><input type="checkbox" id="exp2" value="exp2" name="check0407" class="check"/>跟单内容</li>
                    <li><input type="checkbox" id="exp1" value="exp1" name="check0407" class="check"/>跟单时间</li>
                    <li><input type="checkbox" id="ynPayment" value="ynPayment" name="check0407" class="check"/>是否回款</li>
                    <li><input type="checkbox" id="collectionPrice" value="collectionPrice" name="check0407" class="check"/>回款金额</li>
                    <li><input type="checkbox" id="collectionDate" value="collectionDate" name="check0407" class="check"/>回款日期</li>
                    <li><input type="checkbox" id="ynSettlement" value="ynSettlement" name="check0407" class="check"/>是否结算</li>
                    <li><input type="checkbox" id="costCalculationDate" value="costCalculationDate" name="check0407" class="check"/>费用计算日期</li>
                    <li><input type="checkbox" id="exp10" value="exp10" name="check0407" class="check"/>是否理赔</li>
                    <li><input type="checkbox" id="exp11" value="exp11" name="check0407" class="check"/>理赔原因</li>
                    <li><input type="checkbox" id="exp12" value="exp12" name="check0407" class="check"/>理赔状态</li>
                    <li><input type="checkbox" id="exp13" value="exp13" name="check0407" class="check" checked/>发票类型</li>
                    <li><input type="checkbox" id="exp3" value="exp3" name="check0407" class="check" checked/>发票抬头</li>
                    <li><input type="checkbox" id="exp4" value="exp4" name="check0407" class="check" checked/>发票快递单号</li>
                    <li><input type="checkbox" id="exp5" value="exp5" name="check0407" class="check" checked/>发票发送日期</li>
                    <input type="hidden" name="money0407" value="4">
                </ul>
            </div>
            <div class="displayBox selBox0516">
                <div class="displayTit">收货信息</div>
                <p style="margin-top:10px;"><input type="checkbox" id="addressCk" name="addressCkUl" class="check"/>全选</p>
                <ul id="addressCkUl">
                    <li><input type="checkbox" id="consigneeName1" value="consigneeName1" name="check0407" class="check" checked/>收货人姓名（一）</li>
                    <li><input type="checkbox" id="consigneephone1" value="consigneephone1" name="check0407" class="check"/>收货人电话（一）</li>
                    <li><input type="checkbox" id="consigneeName2" value="consigneeName2" name="check0407" class="check"/>收货人姓名（二）</li>
                    <li><input type="checkbox" id="consigneephone2" value="consigneephone2" name="check0407" class="check"/>收货人电话（二）</li>
                    <li><input type="checkbox" id="receivingProvince" value="receivingProvince" name="check0407" class="check"/>收货省</li>
                    <li><input type="checkbox" id="receivingCityCounty" value="receivingCityCounty" name="check0407" class="check"/>收货地级市/县</li>
                    <li><input type="checkbox" id="cityLevel" value="cityLevel" name="check0407" class="check"/>城市级别</li>
                    <li><input type="checkbox" id="addressDetail" value="addressDetail" name="check0407" class="check"/>收货详细地址</li>
                    <input type="hidden" name="address0407" value="1"/>
                </ul>
            </div>
            <div class="displayBox selBox0516">
                <div class="displayTit">自定义表头</div>
                <p style="margin-top:10px;"><input type="checkbox" id="definedCk" name="definedCkUl" class="check"/>全选</p>
                <ul id="definedCkUl" class="defineUl0414">
                    <li><input type="checkbox" id="exp21" value="exp21" name="check0407" class="check"/>自定义1</li>
                    <li><input type="checkbox" id="exp22" value="exp22" name="check0407" class="check"/>自定义2</li>
                    <li><input type="checkbox" id="exp23" value="exp23" name="check0407" class="check"/>自定义3</li>
                    <li><input type="checkbox" id="exp24" value="exp24" name="check0407" class="check"/>自定义4</li>
                    <li><input type="checkbox" id="exp25" value="exp25" name="check0407" class="check"/>自定义5</li>
                    <li><input type="checkbox" id="exp26" value="exp26" name="check0407" class="check"/>自定义6</li>
                    <li><input type="checkbox" id="exp27" value="exp27" name="check0407" class="check"/>自定义7</li>
                    <li><input type="checkbox" id="exp28" value="exp28" name="check0407" class="check"/>自定义8</li>
                    <li><input type="checkbox" id="exp29" value="exp29" name="check0407" class="check"/>自定义9</li>
                    <li><input type="checkbox" id="exp30" value="exp30" name="check0407" class="check"/>自定义10</li>
                    <li><input type="checkbox" id="exp31" value="exp31" name="check0407" class="check" checked/>发票号</li>
                    <li><input type="checkbox" id="ex32" value="ex32" name="check0407" class="check" checked/>自定义12</li>
                    <li><input type="checkbox" id="exp33" value="exp33" name="check0407" class="check" checked/>自定义13</li>
                    <li><input type="checkbox" id="exp34" value="exp34" name="check0407" class="check" checked/>自定义14</li>
                    <input type="hidden" name="defined0407" value="4">
                </ul>
            </div>
        </div>
        <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;height: 35px;">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="LogisticsInvoiceManagerPage.clearSelTabHeader()">清空</a>
            <a class="easyui-linkbutton " data-options="iconCls:'icon-ok'" style="margin-left: 10px;" href="javascript:void(0)" onclick="LogisticsInvoiceManagerPage.submitTableHeader()">提交</a>
        </div>
    </div>

</div>
<!--复制物流信息-->
<div id="copyLogisticsWin"  class="easyui-dialog" title="复制物流信息" data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false" style="width: 300px;height: 200px;">
    <div style="margin-top: 50px;">
        <h2 style="text-align: center">确定复制此条数据吗？</h2>
    </div>
</div>
<div id="dialogWindow" style="display: none">
    <p style="font-size:14px;margin-left: 20px;margin-top: 20px;">订单日期：<span id="time0408"></span></p>
    <p style="font-size:14px;margin-left: 20px;margin-top: 10px;">系统管理订单号：<span id="order0408"></span></p>
    <p style="font-size:20px;margin-left: 20px;margin-top: 10px;text-align:center;">确定删除该条数据?</p>
</div>
<!--导出-->
<div id="exportExcelWin" class="easyui-dialog" title="导出" data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false," style="width: 300px;height: 200px;">
    <div style="padding-left:10px;">
        <h2>导出</h2>
        <p style="line-height:20px;font-size:14px;">共导出<span id="num0410"></span>条，再次确定导出页面数据</p>
    </div>
</div>
<!--导入信息提示-->
<div id="importExcelWin" class="easyui-dialog" title="导入信息提示" data-options="modal:true,closed:true,minimizable:false,maximizable:false,collapsible:false," style="width: 500px;height: 300px;">
    <div style="padding-left:10px;" id="html0410">
        <h2 >文件上传成功</h2>
        <h3>成功导入多少条</h3>
        <p style="line-height: 22px;font-size:14px; color: red;">非法订单条数：<a href="javascript:;" class="easyui-linkbutton">查看非法订单</a></p>
        <p style="line-height: 22px;font-size:14px; color: red;">原因：</p>
        <ol type="1">
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
            <li>非法订单</li>
        </ol>

    </div>
</div>
<div id="search_condition" title="搜索条件" style="position:relative; display:none;">
<style>
	.search_condition_0621{width:1000px;margin:0 auto;}
	.search_condition_0621 td{ height:40px;}
	.search_condition_0621 td span.text_right{ display:inline-block; width:110px;}
	.search_condition_0621 td .easyui-textbox{ width:150px;}
</style>
<form method="post" enctype="multipart/form-data" class="easyui-form search-form0721 clearfix" id="searchForm" data-options="novalidate:true"  style="margin-left: 0;">
    <table style="" class="search_condition_0621">
  <tbody>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">订单日期:</span>
        <input class="date startDate" id="orderDateStartTime_0621" name="orderDateStartTime" data-options="editable:false" />--
        <input class="date endDate" id="orderDateEndTime_0621" name="orderDateEndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发货类型:</span>
        <input class="easyui-combobox" id="sendGoodsType_0621" name="sendGoodsType" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">客户名称:</span>
        <input class="easyui-textbox" type="text" id="customerName_0621" name="customerName" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">系统管理订单号:</span>
        <input class="easyui-textbox" type="text" id="systemManageOrder_0621" name="systemManageOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">系统订单号:</span>
        <input class="easyui-textbox" type="text" id="systemOrder_0621" name="systemOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">平台订单编号:</span>
        <input class="easyui-textbox" type="text" id="platformOrder_0621" name="platformOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">客户属性:</span>
        <input class="easyui-textbox" type="text" name="clientProperty" id="clientProperty_0621" data-options="novalidate:true"/>
      </td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">订单类型:</span>
        <input class="easyui-combobox" id="orderType_0621" name="orderType" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">产品编码:</span>
        <input class="easyui-textbox" type="text" id="productCode_0621" name="productCode" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">产品名称:</span>
        <input class="easyui-textbox" type="text" id="producutName_0621" name="producutName" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">核算单位:</span>
        <input class="easyui-textbox" type="text" id="accountingUnit_0621" name="accountingUnit" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">产品分类:</span>
        <input class="easyui-textbox" type="text" id="exp7_0621" name="exp7" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      </td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">礼包:</span>
        <input class="easyui-textbox" type="text" id="exp15_0621" name="exp15" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货人姓名（一）:</span>
        <input class="easyui-textbox" type="text" id="consigneeName1_0621" name="consigneeName1" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货人姓名（二）:</span>
        <input class="easyui-textbox" type="text" id="consigneeName2_0621" name="consigneeName2" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货人电话（一）:</span>
        <input class="easyui-textbox" type="number" id="consigneephone1_0621" name="consigneephone1" data-options="validType:['mobile'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货人电话（二）:</span>
        <input class="easyui-textbox" type="number" id="consigneephone2_0621" name="consigneephone2" data-options="validType:['mobile'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货省:</span>
        <input class="easyui-textbox" type="text" id="receivingProvince_0621" name="receivingProvince" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">收货地级市/县:</span>
        <input class="easyui-textbox" type="text" id="receivingCityCounty_0621" name="receivingCityCounty" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">城市级别:</span>
        <input class="easyui-textbox" type="text" id="cityLevel_0621" name="cityLevel" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">定金:</span>
        <input class="easyui-textbox" type="text" id="deposit_0621" name="deposit" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">是否代收货款:</span>
        <input class="easyui-combobox" id="ynPaymentReceived_0621" name="ynPaymentReceived" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">退货补发对应订单号:</span>
        <input class="easyui-textbox" type="text" id="returnGoodsNosentOrder_0621" name="returnGoodsNosentOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">订单判定:</span>
        <input class="easyui-textbox" type="text" id="orderDecision_0621" name="orderDecision" data-options="validType:['maxLength[50]'],novalidate:true" />
      </td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">出货时间:</span>
        <input class="date startDate" id="exp6StartTime_0621" name="exp6StartTime" data-options="editable:false" />--
        <input class="date endDate" id="exp6EndTime_0621" name="exp6EndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发货通知单号:</span>
        <input class="easyui-textbox" type="text" id="sendGoodsOrder_0621" name="sendGoodsOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">委托提货通知单号:</span>
        <input class="easyui-textbox" type="text" id="entrustOrder_0621" name="entrustOrder" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">物流状态:</span>
        <input class="easyui-combobox" name="logisticsStatus" id="logisticsStatus_0621" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">出库库位:</span>
        <input class="easyui-textbox" type="text" id="warehouseLocation_0621" name="warehouseLocation" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">物流公司:</span>
        <input class="easyui-textbox" type="text" id="logisticsCompany_0621" name="logisticsCompany" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">物流单号:</span>
        <input class="easyui-textbox" type="text" id="logisticsNumber_0621" name="logisticsNumber" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">物流费用:</span>
        <input class="easyui-textbox" type="text" id="logisticeFee_0621" name="logisticeFee" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">运费:</span>
        <input class="easyui-textbox" type="text" id="freightFee_0621" name="freightFee" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">上楼费:</span>
        <input class="easyui-textbox" type="text" id="upstairsFee_0621" name="upstairsFee" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">代收货款:</span>
        <input class="easyui-textbox" type="text" id="collectMoney_0621" name="collectMoney" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">超派费:</span>
        <input class="easyui-textbox" type="text" id="superChargeFee_0621" name="superChargeFee" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">拒收退回费:</span>
        <input class="easyui-textbox" type="text" id="rejectionFee_0621" name="rejectionFee" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">费用承担:</span>
        <input class="easyui-textbox" type="text" name="exp8" id="exp8_0621" data-options="validType:['maxLength[50]'],novalidate:true"/>
      </td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">付款方式:</span>
        <input class="easyui-textbox" type="text" name="exp9" id="exp9_0621" data-options="validType:['maxLength[50]'],novalidate:true"/>
      </td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">机器人SN:</span>
        <input class="easyui-textbox" type="text" id="exp19_0621" name="exp19" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">充电桩SN:</span>
        <input class="easyui-textbox" type="text" id="exp18_0621" name="exp18" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">订单状态:</span>
        <input class="easyui-combobox" id="dingDanStatus_0621" name="orderStatus" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">签收时间:</span>
        <input class="date startDate" id="exp14StartTime_0621" name="exp14StartTime" data-options="editable:false" />--
        <input class="date endDate" id="exp14EndTime_0621" name="exp14EndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">拒收（退货）签收:</span>
        <input class="easyui-combobox" name="exp16" id="exp16C_0621" data-options="novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">拒收（返货）签收时间:</span>
        <input class="date startDate" id="exp17StartTime_0621" name="exp17StartTime" data-options="editable:false" />--
        <input class="date endDate" id="exp17EndTime_0621" name="exp17EndTime" data-options="editable:false" /></td></tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">跟单时间:</span>
        <input class="date startDate" id="exp1StartTime_0621" name="exp1StartTime" data-options="editable:false" />--
        <input class="date endDate" id="exp1EndTime_0621" name="exp1EndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">是否回款:</span>
        <input class="easyui-combobox" id="ynPayment_0621" name="ynPayment" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">回款日期:</span>
        <input class="date startDate" id="collectionDateStartTime_0621" name="collectionDateStartTime" data-options="editable:false" />--
        <input class="date endDate" id="collectionDateEndTime_0621" name="collectionDateEndTime" data-options="editable:false" /></td></tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">是否结算:</span>
        <input class="easyui-combobox" id="ynSettlement_0621" name="ynSettlement" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">费用结算日期:</span>
        <input class="date startDate" id="costCalculationDateStartTime_0621" name="costCalculationDateStartTime" data-options="editable:false" />--
        <input class="date endDate" id="costCalculationDateEndTime_0621" name="costCalculationDateEndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">是否理赔:</span>
        <input class="easyui-combobox" id="exp10_0621" name="exp10" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">理赔原因:</span>
        <input class="easyui-textbox" type="text" id="exp11_0621" name="exp11" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">理赔状态:</span>
        <input class="easyui-combobox" id="exp12_0621" name="exp12" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发票类型:</span>
        <input class="easyui-combobox" id="exp13_0621" name="exp13" /></td>
    </tr>
    <tr>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发票抬头:</span>
        <input class="easyui-textbox" type="text" id="exp3_0621" name="exp3" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发票发送日期:</span>
        <input class="date startDate" id="exp5StartTime_0621" name="exp5StartTime" data-options="editable:false" />--
        <input class="date endDate" id="exp5EndTime_0621" name="exp5EndTime" data-options="editable:false" /></td>
      <td width="30%" class="">
        <span class="text_right" style="vertical-align:middle">发票号:</span>
        <input class="easyui-textbox" type="text" id="exp31_0621" name="exp31" data-options="validType:['maxLength[50]'],novalidate:true" /></td>
    </tr>
  </tbody>
</table>
</form>
<div class="column-content0718">
    <div class="content-tool0718 clearfix">
        <div class="text_center">
        	<div class="vspace" style="height:20px;"></div>
            <a class="btn search-btn0718 import-btn0405" id="searchBtn">搜索</a>
            <a class="btn reset-btn0718 excle-btn0405" id="resetBtn">清空</a>
            <div class="vspace" style="height:20px;"></div>
        </div>
    </div>
</div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/plugin/uploadFiles.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/columnsJSON.js'></script>
<script src='<%=basePath %>js/logisticsManagerSearch.js'></script>
<script src='<%=basePath %>js/logisticsInvoiceManagerPage.js'></script>
<script>
    var rootPath='<%=basePath%>';
    LogisticsInvoiceManagerPage.init();

</script>
</body>
</html>