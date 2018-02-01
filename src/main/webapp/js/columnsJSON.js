 var columnsJSON=[
    {field:'orderDate',title:'订单日期',align:'center',
        formatter:function (value) {
            var val='';
            if(null==value ||'null'==value||''==value){
                val='';
            }else{
                val=Common.getLocalDateBy(value)
            }
            return val;
        }
    },
    {field:'sendGoodsType',title:'发货类型',align:'center'},
    {field:'customerName',title:'客户名称',align:'center'},
    {field:'systemManageOrder',title:'系统管理订单号',align:'center'},
     {field:'systemOrder',title:'系统订单号',align:'center'},
    {field:'platformOrder',title:'平台订单编号',align:'center'},
     {field:'clientProperty',title:'客户属性',align:'center'},
     {field:'orderType',title:'订单类型',align:'center'},
     {field:'productCode',title:'产品编码',align:'center'},
     {field:'producutName',title:'产品名称',align:'center'},
     {field:'accountingUnit',title:'核算单位',align:'center'},
     {field:'exp7',title:'产品分类',align:'center'},
     /*礼包*/
     {field:'exp15',title:'礼品情况',align:'center'},
     {field:'sendGoodsNum',title:'发货数量',align:'center'},
     {field:'unitPrice',title:'单价',align:'center'},
     {field:'price',title:'金额',align:'center'},
     {field:'consigneeName1',title:'收货人姓名（一）',align:'center'},
     {field:'consigneeName2',title:'收货人姓名（二）',align:'center'},
     {field:'consigneephone1',title:'收货人电话（一）',align:'center'},
     {field:'consigneephone2',title:'收货人电话（二）',align:'center'},
     {field:'receivingProvince',title:'收货省',align:'center'},
     {field:'receivingCityCounty',title:'收货地级市/县',align:'center'},
     {field:'cityLevel',title:'城市级别',align:'center'},
     {field:'addressDetail',title:'收货地址',align:'center'},
     {field:'remarks',title:'备注',align:'center'},
     {field:'deposit',title:'定金',align:'center'},
     {field:'ynPaymentReceived',title:'是否代收款',align:'center'},
     {field:'returnGoodsNosentOrder',title:'退货补发订单号',align:'center'},
     {field:'orderDecision',title:'订单判定',align:'center'},
     {field:'exp6',title:'出货时间',align:'center',
         formatter:function (value) {
             var val='';
             if(null==value ||'null'==value||''==value){
                 val='';
             }else{
                 val=Common.getLocalDateBy(value)
             }
             return val;
         }
     },
     {field:'sendGoodsOrder',title:'发货通知单号',align:'center'},
     {field:'entrustOrder',title:'委托提货通知单号',align:'center'},
     {field:'logisticsStatus',title:'物流状态',align:'center'},
     {field:'warehouseLocation',title:'出库库位',align:'center'},
     {field:'logisticsCompany',title:'物流公司',align:'center'},
     {field:'logisticsNumber',title:'物流单号',align:'center'},
     {field:'logisticeFee',title:'物流费用',align:'center'},
     {field:'freightFee',title:'运费',align:'center'},
     {field:'transitFee',title:'中转费',align:'center'},
     {field:'insurance',title:'保险',align:'center'},
     {field:'packingChargesFee',title:'包装费',align:'center'},
     {field:'provideHomeFee',title:'送货上门',align:'center'},
     {field:'upstairsFee',title:'上楼费',align:'center'},
     {field:'collectMoney',title:'代收货款',align:'center'},
     {field:'superChargeFee',title:'超派费',align:'center'},
     {field:'deliveryFee',title:'提货费',align:'center'},
     {field:'rejectionFee',title:'拒收退回费',align:'center'},
     {field:'operationCostFee',title:'操作费',align:'center'},
     {field:'otherFee',title:'其他费用',align:'center'},
     {field:'logisticeRemarks',title:'物流备注',align:'center'},
     {field:'exp8',title:'费用分类',align:'center'},
     {field:'exp9',title:'付款方式',align:'center'},
     {field:'exp18',title:'充电桩SN',align:'center'},
     {field:'exp19',title:'机器人SN',align:'center'},
    {field:'orderStatus',title:'订单状态',align:'center'},
     {field:'exp14',title:'签收时间',align:'center',formatter:function (value) {
         if(null==value ||'null'==value||''==value){
             return '';
         }else{
             return Common.getLocalDateBy(value)
         }
     }},
     {field:'exp16',title:'拒收（退货）签收',align:'center'},
     {field:'exp17',title:'拒收（返货）签收时间',align:'center',formatter:function (value) {
         if(null==value ||'null'==value||''==value){
             return '';
         }else{
             return Common.getLocalDateBy(value)
         }
     }},
     {field:'exp2',title:'跟单内容',align:'center'},
     {field:'exp1',title:'跟单时间',align:'center',formatter:function (value) {
         if(null==value ||'null'==value||''==value){
             return '';
         }else{
             return Common.getLocalDateBy(value)
         }
     }},
     {field:'ynPayment',title:'是否回款',align:'center'},
     {field:'collectionPrice',title:'回款金额',align:'center'},
     {field:'collectionDate',title:'回款日期',align:'center',
         formatter:function (value) {
             var val='';
             if(null==value ||'null'==value||''==value){
                 val='';
             }else{
                 val=Common.getLocalDateBy(value)
             }
             return val;
         }},
     {field:'ynSettlement',title:'是否结算',align:'center'},
     {field:'costCalculationDate',title:'费用计算日期',align:'center',
         formatter:function (value) {
             var val='';
             if(null==value ||'null'==value||''==value){
                 val='';
             }else{
                 val=Common.getLocalDateBy(value)
             }
             return val;
         }},
     {field:'exp10',title:'是否理赔',align:'center'},
     {field:'exp11',title:'理赔原因',align:'center'},
     {field:'exp12',title:'理赔状态',align:'center'},
     {field:'exp13',title:'发票类型',align:'center'},
     {field:'exp3',title:'发票抬头',align:'center'},
     {field:'exp4',title:'发票快递单号',align:'center'},
     {field:'exp5',title:'发票发送日期',align:'center',
         formatter:function (value) {
             var val='';
             if(null==value ||'null'==value||''==value){
                 val='';
             }else{
                 val=Common.getLocalDateBy(value)
             }
             return val;
         }},
     {field:'exp21',title:'自定义1',align:'center'},
     {field:'exp22',title:'自定义2',align:'center'},
     {field:'exp23',title:'自定义3',align:'center'},
     {field:'exp24',title:'自定义4',align:'center'},
     {field:'exp25',title:'自定义5',align:'center'},
     {field:'exp26',title:'自定义6',align:'center'},
     {field:'exp27',title:'自定义7',align:'center'},
     {field:'exp28',title:'自定义8',align:'center'},
     {field:'exp29',title:'自定义9',align:'center'},
     {field:'exp30',title:'自定义10',align:'center'},
     {field:'exp31',title:'发票号',align:'center'},
     {field:'exp31',title:'自定义12',align:'center'},
     {field:'exp33',title:'自定义13',align:'center'},
     {field:'exp34',title:'自定义14',align:'center'},
     {field:'exp39',title:'部门',align:'center'},
     {field:'exp40',title:'业务员',align:'center'}
    /*
    {field:'userId',title:'用户Id',align:'center'},
    {field:'status',title:'逻辑状态',align:'center'},
    {field:'lockStatus',title:'锁定状态',align:'center'},
    {field:'modifyDate',title:'修改日期',align:'center',
     formatter:function (value) {
         var val='';
         if(null==value ||'null'==value||''==value){
             val='';
         }else{
             val=Common.getLocalDateBy(value)
         }
         return val;
     }
    },
    {field:'createDate',title:'创建时间',align:'center',
        formatter:function (value) {
            var val='';
            if(null==value ||'null'==value||''==value){
                val='';
            }else{
                val=Common.getLocalDateBy(value)
            }
            return val;
        }
    },*/

];