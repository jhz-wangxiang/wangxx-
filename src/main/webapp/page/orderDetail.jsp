<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include  file="../common/commonHead.jsp"%>
<jsp:include page="header.jsp"></jsp:include>
<!--内容-->
<div class="container0718 clearfix">
    <jsp:include page="leftNav.jsp">
    	<jsp:param name="obj" value="orderDetail"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|全部订单</h3>
            </div>
        </div>
        <div class="column-content0718">
            <form method="post" class="easyui-form order-detail0721 clearfix" data-options="novalidate:true">
                <div class="left ">
                    <table cellpadding="5">
                        <tr>
                            <td class="text_right">会员ID:</td>
                            <td><span class="text0719" id="userNo"></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">联系人:</td>
                            <td><span class="text0719" id="connectPerson"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right">联系电话:</td>
                           <td><span class="text0719" id="phoneNum"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right address0722">送货地址:</td>
                           <td class="address-info0722"><span class="text0719" id="address"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right address0722">发票开头:</td>
                           <td class="address-info0722"><span class="text0719" id="invoiceHeader"></span></td>
                        </tr>
                         <tr>
                            <td class="text_right">纳税识别号:</td>
                            <td><span class="text0719" id="invoiceNum"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right">开户银行:</td>
                           <td><span class="text0719" id="invoiceBank"></span></td>
                        </tr>
                    </table>
                </div>
                <div class="left">
                    <table cellpadding="5" >
                        <tr >
                            <td class="text_right">订单状态:</td>
                            <td><span class="text0719" id='orderStatus'></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">支付方式:</td>
                            <td><span class="text0719" id="payType"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right">订单来源:</td>
                           <td><span class="text0719" id="orderSource"></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">退换货原因:</td>
                            <td><span class="text0719" id="reason"></span></td>
                        </tr>
                         <tr>
                            <td class="text_right">优惠ID1:</td>
                            <td><span class="text0719" id="marketingId"></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">注册地址:</td>
                            <td><span class="text0719" id="invoiceAdress"></span></td>
                        </tr>
                    </table>
                </div>
                <div class="left">
                    <table cellpadding="5">
                         <tr>
                            <td class="text_right">订单号:</td>
                            <td><span class="text0719" id="orderNo"></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">下单日期:</td>
                            <td><span class="text0719" id="buyDate"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right">付款日期:</td>
                           <td><span class="text0719" id="payDate"></span></td>
                        </tr>
                        <tr>
                           <td class="text_right">交易号:</td>
                           <td><span class="text0719" id="wxTransactionNo"></span></td>
                        </tr>
                        <tr>
                            <td class="text_right">优惠ID2:</td>
                            <td><span class="text0719" id="discountId"></span></td>
                        </tr>
                         <tr>
                           <td class="text_right">注册电话:</td>
                           <td><span class="text0719" id="invoicePhone"></span></td>
                        </tr>
                    </table>
                </div>
                <div class="left">
                    <table cellpadding="5">
                        <tr>
                            <td class="text_right">银行账号:</td>
                            <td><span class="text0719" id="invoiceBankNum"></span></td>
                        </tr>
                    </table>
                </div>
                <div class="l">
                    <table cellpadding="5">
                        <tr>
                            <td class="text_right">优惠券ID:</td>
                            <td><span class="text0719" style="word-break: break-all;" id="couponDiscountID"></span></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|商品属性</h3>
            </div>
        </div>
        <div class="column-content0718 order-attr0725">
            <table id="orderAttr" style="width:100%;"></table>
            <div class="total-info0725">
                共<span id="num0725">2</span>商品，总计：<span id="total0725">0000</span>
            </div>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|商品动态</h3>
            </div>
        </div>
        <div class="column-content0718">
            <table id="orderPo" style="width:100%;"></table>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|退款动态</h3>
            </div>
        </div>
        <div class="column-content0718">
            <table id="orderRefund" style="width:100%;"></table>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718  clearfix">
                <h3 class="left">|物流信息</h3>
            </div>
        </div>
        <div class="column-content0718" id="logisticDiv">
            <div class="logistic0719">
                <form class="easyui-form logistic-item0719 clearfix" id="logisticForm" method="post" data-options="novalidate:true">
                    <div class="left margin-left0719">
                        <span class="title0719"> 配送商，快递公司：</span>
                        <input id='express'  class="textbox" data-options="prompt:'物流公司',validType:['illegalLogisc','cHLength[40]'],novalidate:true">
                    </div>
                    <div class="left margin-left0719">
                        <span class="title0719"> 物流单号：</span><input id="logisticsNum" class="textbox" data-options="prompt:'物流单号',validType:['logisNum','cHLength[30]'],novalidate:true">
                    </div>
                    <div class="left">
                        <!-- <a class="btn">上传信息</a> --><a class="btn" id="addLogistic">添加</a>
                    </div>
                </form>
            </div>
            <table id="logistic" class="easyui-datagrid" style="width:100%;"></table>
        </div>
        <div class="column-content0718" style="height: 100px;">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left" style="display: none">|其他信息</h3>
            </div>
        </div>
        <div class="column-content0718" style="display: none">
            <div class="invoice-type0719 clearfix">
                <div class="left">
                    <span class="title0719">发票类型：</span>
                </div>
                <div class="left margin-left0719">
                    <div class="invoice-item0719"><span class="radio">纸质发票</span></div>
                    <div class="invoice-item0719"><span class="radio unradio">纸质发票</span><input class="easyui-textbox" data-options="prompt:'发票链接'"><a class="btn">上传发票链接</a><a class="btn">添加</a></div>
                    <div class="invoice-item0719"><span >纸质发票</span><input class="easyui-textbox" data-options="prompt:'发票链接'"><a class="btn grey-btn0719">上传发票链接</a><a class="btn grey-btn0719">添加</a></div>
                </div>
            </div>
        </div>

    </div>

</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/orderDetail.js'></script>
<script>
var rootPath='<%=basePath%>';

$(function(){
	OrderDetail.init();
	/*$('input.textbox').validatebox().bind('blur', function(){
		console.log('ok')
		$(this).validatebox('enableValidation').validatebox('validate');
	});*/
})
</script>
</body>
</html>