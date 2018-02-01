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
		<jsp:param name="nav" value="swgoodsManager"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
            <div class="content-tool0718 clearfix">
                <h3 class="left">|全部订单<a href="javascript:;" class="table-requirement-btn">选择显示信息</a></h3>

                <div class="right">
                    <a class="btn search-btn0718">搜索</a>
                    <a class="btn reset-btn0718">重置</a>
                    <a class="btn excle-btn0718">导出订单</a>
                </div>
            </div>
        </div>
        <div class="column-content0718">
            <form method="post" class="easyui-form search-form0721 clearfix" id="searchForm" data-options="novalidate:true">
                <div class="left ">
                    <table cellpadding="5" class="right">
                        <tr>
                            <td class="text_right">订单号:</td>
                            <td><input class="textbox" type="text" name="orderNo" data-options="validType:['illegalCharacter','maxLength[50]'],novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">机器人ID:</td>
                            <td><input class="textbox" type="text" name="robotNum" data-options="validType:['illegalCharacter','maxLength[50]'],novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">交易单号:</td>
                            <td><input class="textbox" type="text" name="wxTransactionNo" data-options="validType:['illegalCharacter','maxLength[50]'],novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">商品名称:</td>
                            <td><select  class="easyui-combobox" id="productNo" data-options="editable:false,url:'<%=basePath %>v1/managervar/queryProductEnum',valueField:'value',textField:'name',panelHeight:'auto', value:'--请选择--'">
                            </select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="left">
                    <table cellpadding="5" class="right">
                        <tr>
                            <td class="text_right">购买人:</td>
                            <td><input class="textbox" type="text" name="consignee" data-options="validType:['illegalCharacter','cHLength[50]'],novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">收货人电话:</td>
                            <td><input class="textbox" type="text" name="phoneNum" data-options="validType:['illegalCharacter','mobile'],novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">订单状态:</td>
                            <td><select class="easyui-combobox" id="orderStatus" data-options="editable:false,url:'<%=basePath %>v1/managervar/querySysEnum?enumCode=DETAIL_INDEX_STATUS',valueField:'value',textField:'name',panelHeight:'auto', value:'--请选择--' "></select>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">退款状态:</td>
                            <td><select class="easyui-combobox" id="afterState" data-options="editable:false,url:'<%=basePath %>v1/managervar/querySysEnum?enumCode=APP_REFUND_STATE',valueField:'value',textField:'name',panelHeight:'auto', value:'--请选择--' "></select>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="left">
                    <table cellpadding="5" class="right">
                        <%-- <tr>
                            <td class="text_right">发票类型:</td>
                            <td><select class="easyui-combobox"  id="invoiceType" data-options="editable:false,url:'<%=basePath %>v1/managervar/querySysEnum?enumCode=INVOICE_TYPE',valueField:'value',textField:'name',panelHeight:'auto', value:'--请选择--' ">
                            </select>
                            </td>
                        </tr> --%>
                        <%-- <tr>
                            <td class="text_right">订单来源:</td>
                            <td><select class="easyui-combobox" id="platform" data-options="editable:false,url:'<%=basePath %>v1/managervar/querySysEnum?enumCode=ORDER_SOURCE',valueField:'value',textField:'name',panelHeight:'auto', value:'--请选择--' "></select>
                            </td>
                        </tr> --%>
                        <tr>
                            <td class="text_right">下单日期:</td>
                            <td><input class="date startDate" data-options="editable:false" >--<input class="date endDate" data-options="editable:false"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <!-- <div id="cc" class="easyui-calendar"></div> -->
        <div class="column-content0718 table-cont1216" id="table" style="margin-bottom: 10px;">
            <table id="order" style="width: 956px;height: 620px;"></table>

        </div>
    </div>
</div>
<div id="table-show-condition-window" class="" title="选择显示信息">
	<p style="margin-left:20px; margin-top:20px; font-size:16px"><label for="checkall"><input type="checkbox" id="checkall" name="" class="check"/>全选</label></p>
    <ul class="table-condition-list">
    	<li><label for="condition_orderNo"><input type="checkbox" id="condition_orderNo" value="orderNo" name="" class="check"/>订单号</label></li>
    	<!-- <li><label for="condition_userNo"><input type="checkbox" id="condition_userNo" value="robotNum" name="" class="check"/>会员ID</label></li> -->
    	<li><label for="condition_createDate"><input type="checkbox" id="condition_createDate" value="createDate" name="" class="check"/>交易时间</label></li>
    	<li><label for="condition_orderOriginalPrice"><input type="checkbox" id="condition_orderOriginalPrice" value="orderOriginalPrice" name="" class="check"/>订单总额</label></li>
    	<li><label for="condition_payment"><input type="checkbox" id="condition_payment" value="payment" name="" class="check"/>支付方式</label></li>
    	<!-- <li><label for="condition_invoiceType"><input type="checkbox" id="condition_invoiceType" value="invoiceType" name="" class="check"/>发票类型</label></li>
    	<li><label for="condition_invoiceHeader"><input type="checkbox" id="condition_invoiceHeader" value="invoiceHeader" name="" class="check"/>发票头</label></li> -->
    	<li><label for="condition_consignee"><input type="checkbox" id="condition_consignee" value="consignee" name="" class="check"/>收货人</label></li>
    	<li><label for="condition_phoneNum"><input type="checkbox" id="condition_phoneNum" value="phoneNum" name="" class="check"/>收货人电话</label></li>
    	<li><label for="condition_orderStatus"><input type="checkbox" id="condition_orderStatus" value="orderStatus" name="" class="check"/>订单状态</label></li>
    	<li><label for="condition_refundMoney"><input type="checkbox" id="condition_refundMoney" value="refundMoney" name="" class="check"/>退款金额</label></li>
    	<li><label for="condition_orderCarriage"><input type="checkbox" id="condition_orderCarriage" value="orderCarriage" name="" class="check"/>运费</label></li>
    	<li><label for="condition_productName"><input type="checkbox" id="condition_productName" value="productName" name="" class="check"/>商品名称</label></li>
    	<!-- <li><label for="condition_productNo"><input type="checkbox" id="condition_productNo" value="productNo" name="" class="check"/>商品编码</label></li> -->
    	<li><label for="condition_confirmTimeDatetoStr"><input type="checkbox" id="condition_confirmTimeDatetoStr" value="confirmTimeDatetoStr" name="" class="check"/>签收时间</label></li>
    	<!-- <li><label for="condition_productPrice"><input type="checkbox" id="condition_productPrice" value="productPrice" name="" class="check"/>单价</label></li> -->
    	<li><label for="condition_productAmount"><input type="checkbox" id="condition_productAmount" value="productAmount" name="" class="check"/>数量</label></li>
    	<li><label for="condition_disCount"><input type="checkbox" id="condition_disCount" value="disCount" name="" class="check"/>优惠单价</label></li>
    	<li><label for="condition_orderPayablePrice"><input type="checkbox" id="condition_orderPayablePrice" value="orderPayablePrice" name="" class="check"/>应付金额（总）</label></li>
    	<li><label for="condition_address"><input type="checkbox" id="condition_address" value="address" name="" class="check"/>收货地址</label></li>
    	<li><label for="condition_exStatus"><input type="checkbox" id="condition_exStatus" value="exStatus" name="" class="check"/>商品状态</label></li>
    	<li><label for="condition_robotNum"><input type="checkbox" id="condition_robotNum" value="robotNum" name="" class="check"/>机器人id</label></li>
    	<li><label for="condition_refamount"><input type="checkbox" id="condition_refamount" value="refamount" name="" class="check"/>退货数量</label></li>
    	<li><label for="condition_afterSaleState"><input type="checkbox" id="condition_afterSaleState" value="afterSaleState" name="" class="check"/>退款状态</label></li>
    </ul>
    <div data-options="region:'south',border:false" style="text-align:center;padding:5px 0;">
		<a class="easyui-linkbutton " data-options="iconCls:'icon-ok'" href="javascript:void(0)" onclick="SWgoodsManager.table_condition()">提交</a>
		<a class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" href="javascript:void(0)" onclick="$('#table-show-condition-window').window('close');">取消</a>
	</div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/SWgoodsManager.js'></script>
<script>
var rootPath='<%=basePath%>';
SWgoodsManager.init();
$(".table-requirement-btn").click(function(){
	$('#table-show-condition-window').window({
	    width:600,
	    height:450,
	    minimizable:false,
	    maximizable:false,
	    collapsible:false,
	    modal:true
	});
});
$("#checkall").change(function(){
	if($(this).prop("checked")==true){
		$(".check").prop("checked",true);
	}else{
		$(".check").prop("checked",false);
	}
});

</script>
</body>
</html>