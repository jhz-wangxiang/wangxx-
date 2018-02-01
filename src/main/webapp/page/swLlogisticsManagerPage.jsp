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
            <p class="insertTit">查看数据</p>
            <form method="post" class="easyui-form search-form0721 clearfix easyui-form2" id="searchForm"
                  data-options="novalidate:true">
                <div class="left">
                    <div class="leftList" style="width: 450px">
                        <div class="LListTit">订单信息</div>
                        <table cellpadding="5" class="right0407" style="width:400px;">
                            <tr>
                                <td class="text_left width0407 redColor">订单日期</td>
                                <td><input class="textbox" type="text" name="orderDate_d" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">发货类型</td>
                                <td><input class="textbox" type="text" name="sendGoodsType" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">客户名称</td>
                                <td><input class="textbox" type="text" name="customerName" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">系统管理订单号</td>
                                <td><input class="textbox" type="text" name="systemManageOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">系统订单号</td>
                                <td><input class="textbox" type="text" name="systemOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">系统平台编号</td>
                                <td><input class="textbox" type="text" name="platformOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">客户属性</td>
                                <td><input class="textbox" type="text" name="clientProperty" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">订单类型</td>
                                <td><input class="textbox" type="text" name="orderType" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">产品编码</td>
                                <td><input class="textbox" type="text" name="productCode" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">产品名称</td>
                                <td><input class="textbox" type="text" name="producutName" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">核算单位</td>
                                <td><input class="textbox" type="text" name="accountingUnit" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">产品分类</td>
                                <td><input class="textbox" type="text" name="exp7" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">礼品情况</td>
                                <td><input class="textbox" type="text" name="exp15" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">发货数量</td>
                                <td><input class="textbox" type="text" name="sendGoodsNum" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">单价</td>
                                <td><input class="textbox" type="text" name="unitPrice" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">金额</td>
                                <td><input class="textbox" type="text" name="price" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">备注</td>
                                <td><input class="textbox" type="text" name="remarks" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">定金</td>
                                <td><input class="textbox" type="text" name="deposit" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">是否代收款</td>
                                <td><input class="textbox" type="text" name="ynPaymentReceived" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">退货补发订单号</td>
                                <td><input class="textbox" type="text" name="returnGoodsNosentOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">订单判定</td>
                                <td><input class="textbox" type="text" name="orderDecision" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">出货时间</td>
                                <td><input class="textbox" type="text" name="exp6_d" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">部门</td>
                                <td><input class="textbox" type="text" name="exp39" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">业务员</td>
                                <td><input class="textbox" type="text" name="exp40" readonly style="width: 200px"/>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <div class="leftList marTop20">
                        <div class="LListTit">跟单/回款信息</div>
                        <table cellpadding="5" class="right0407">
                            <tr>
                                <td class="text_left width0407">订单状态</td>
                                <td><input class="textbox" type="text" name="orderStatus" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">签收时间</td>
                                <td><input class="textbox" type="text" name="exp14_d" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">拒收（退货）签收情况</td>
                                <td><input class="textbox" type="text" name="exp16" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">拒收（返货）签收时间</td>
                                <td><input class="textbox" type="text" name="exp17_d" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">跟单内容</td>
                                <td>
                                    <div class="textbox" name="exp2" id="exp2" readonly
                                         style="width: 200px;height:120px;white-space: normal"></div>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">跟单时间</td>
                                <td><input class="textbox" type="text" name="exp1_d" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">是否回款</td>
                                <td><input class="textbox" type="text" name="ynPayment" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">回款金额</td>
                                <td><input class="textbox" type="text" name="collectionPrice" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">回款日期</td>
                                <td><input class="textbox" type="text" name="collectionDate_d" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">是否结算</td>
                                <td><input class="textbox" type="text" name="ynSettlement" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">费用计算日期</td>
                                <td><input class="textbox" type="text" name="costCalculationDate_d" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">是否理赔</td>
                                <td><input class="textbox" type="text" name="exp10" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">理赔原因</td>
                                <td><input class="textbox" type="text" name="exp11" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">理赔状态</td>
                                <td><input class="textbox" type="text" name="exp12" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">发票类型</td>
                                <td><input class="textbox" type="text" name="exp13" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">发票抬头</td>
                                <td><input class="textbox" type="text" name="exp3" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">发票快递单号</td>
                                <td><input class="textbox" type="text" name="exp4" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">发票发送日期</td>
                                <td><input class="textbox" type="text" name="exp5_d" readonly style="width: 200px"/>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
                <div class="left marLeft">
                    <div class="leftList marTop20">
                        <div class="LListTit">物流费用</div>
                        <table cellpadding="5" class="right0407">
                            <tr>
                                <td class="text_left width0407">发货通知单号</td>
                                <td><input class="textbox" type="text" name="sendGoodsOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">委托提货通知单号</td>
                                <td><input class="textbox" type="text" name="entrustOrder" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">物流状态</td>
                                <td><input class="textbox" type="text" name="logisticsStatus" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">出库库位</td>
                                <td><input class="textbox" type="text" name="warehouseLocation" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">物流公司</td>
                                <td><input class="textbox" type="text" name="logisticsCompany" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">物流单号</td>
                                <td><input class="textbox" type="text" name="logisticsNumber" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">物流费用</td>
                                <td><input class="textbox" type="text" name="logisticeFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">运费</td>
                                <td><input class="textbox" type="text" name="freightFee" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">中转费</td>
                                <td><input class="textbox" type="text" name="transitFee" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">保险</td>
                                <td><input class="textbox" type="text" name="insurance" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">包装费</td>
                                <td><input class="textbox" type="text" name="packingChargesFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">送货上门</td>
                                <td><input class="textbox" type="text" name="provideHomeFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">上楼费</td>
                                <td><input class="textbox" type="text" name="upstairsFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">代收货款</td>
                                <td><input class="textbox" type="text" name="collectMoney" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">超派费</td>
                                <td><input class="textbox" type="text" name="superChargeFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">提货费</td>
                                <td><input class="textbox" type="text" name="deliveryFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">拒收退回费</td>
                                <td><input class="textbox" type="text" name="rejectionFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">操作费</td>
                                <td><input class="textbox" type="text" name="operationCostFee" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">其他</td>
                                <td><input class="textbox" type="text" name="otherFee" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">物流备注</td>
                                <td><input class="textbox" type="text" name="logisticeRemarks" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">费用分类</td>
                                <td><input class="textbox" type="text" name="exp8" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">付款方式</td>
                                <td><input class="textbox" type="text" name="exp9" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">机器人SN</td>
                                <td><input class="textbox" type="text" name="exp19" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">充电桩SN</td>
                                <td><input class="textbox" type="text" name="exp18" readonly style="width: 200px"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="leftList marTop20">
                        <div class="LListTit">收货信息</div>
                        <table cellpadding="5" class="right0407">
                            <tr>
                                <td class="text_left width0407 redColor">收货人姓名（一）</td>
                                <td><input class="textbox" type="text" name="consigneeName1" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407 redColor">收货人电话（一）</td>
                                <td><input class="textbox" type="text" name="consigneephone1" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">收货人姓名（二）</td>
                                <td><input class="textbox" type="text" name="consigneeName2" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">收货人电话（二）</td>
                                <td><input class="textbox" type="text" name="consigneephone2" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">收货省</td>
                                <td><input class="textbox" type="text" name="receivingProvince" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">收货地级市/县</td>
                                <td><input class="textbox" type="text" name="receivingCityCounty" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">城市级别</td>
                                <td><input class="textbox" type="text" name="cityLevel" readonly
                                           style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">收货人详细地址</td>
                                <td>
                                    <div class="textbox" id="addressDetail"
                                         style="width: 200px;height:120px;white-space: normal"></div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="leftList marTop20">
                        <div class="LListTit">自定义</div>
                        <table cellpadding="5" class="right0407">
                            <tr>
                                <td class="text_left width0407">自定义1</td>
                                <td><input class="textbox" type="text" name="exp21" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义2</td>
                                <td><input class="textbox" type="text" name="exp22" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义3</td>
                                <td><input class="textbox" type="text" name="exp23" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义4</td>
                                <td><input class="textbox" type="text" name="exp24" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义5</td>
                                <td><input class="textbox" type="text" name="exp25" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义6</td>
                                <td><input class="textbox" type="text" name="exp26" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义7</td>
                                <td><input class="textbox" type="text" name="exp27" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义8</td>
                                <td><input class="textbox" type="text" name="exp28" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义9</td>
                                <td><input class="textbox" type="text" name="exp29" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义10</td>
                                <td><input class="textbox" type="text" name="exp30" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">发票号</td>
                                <td><input class="textbox" type="text" name="exp31" readonly style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义12</td>
                                <td><input class="textbox" type="text" name="exp32" readonly
                                           data-options="novalidate:true" style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="text_left width0407">自定义13</td>
                                <td><input class="textbox" type="text" name="exp33" readonly
                                           data-options="novalidate:true" style="width: 200px"/>
                                </td>
                            </tr>
                            <tr>

                                <td class="text_left width0407">自定义14</td>
                                <td><input class="textbox" type="text" name="exp34" readonly
                                           data-options="novalidate:true" style="width: 200px"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src="<%=basePath %>js/swLlogisticsManagerPage.js"></script>
<script>
    var rootPath = '<%=basePath%>';
    SwLlogisticsManagerPage.init();
</script>
</body>
</html>