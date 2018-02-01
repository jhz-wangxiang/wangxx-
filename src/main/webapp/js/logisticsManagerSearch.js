/**
 * Created by 111 on 2017/5/16.
 */
var LogisticsManagerSearch=function () {
    /*初始化下来查询数据*/
    var initCombobox = function () {
    	/*发货类型*/
    	var sendGoodsTypeArr=[{"id":"","value":"---请选择---"},{"id":"发货","value":"发货"},{"id":"返货","value":"返货"}];
    	comboboxFun($('#sendGoodsType_0621'),sendGoodsTypeArr,'');
    	/*订单类型*/
    	var orderTypeArr = [{"id": "", "value": "---请选择---"}, {"id": "销售", "value": "销售"}, {
            "id": "赠送",
            "value": "赠送"
        }, {"id": "样品", "value": "样品"}, {"id": "调拨", "value": "调拨"}, {"id": "退货", "value": "退货"}, {
            "id": "退货补发",
            "value": "退货补发"
        }];
        comboboxFun($('#orderType_0621'), orderTypeArr, '120px');
        /*是否代收款*/
        var daiShouKuan = [{"id": "", "value": "---请选择---"}, {"id": "是", "value": "是"}, {"id": "否", "value": "否"}];
        comboboxFun($('#ynPaymentReceived_0621'), daiShouKuan);//代收款
        comboboxFun($('#ynPayment_0621'), daiShouKuan);//回款
        comboboxFun($('#ynSettlement_0621'), daiShouKuan);//结算
        comboboxFun($('#exp10_0621'),daiShouKuan);//是否理赔
        var orderStatusArr = [{"id": "", "value": "---请选择---"}, {"id": "待收", "value": "待收"}, {
            "id": "签收",
            "value": "签收"
        }, {"id": "拒收", "value": "拒收"}, {"id": "退货", "value": "退货"}, {"id": "取消订单", "value": "取消订单"}];
        comboboxFun($('#dingDanStatus_0621'), orderStatusArr, '120px');//订单状态
        
        var logisticsStatusArr = [{"id": "", "value": "---请选择---"}, {"id": "未发货", "value": "未发货"}, {
            "id": "已发货",
            "value": "已发货"
        }];
        comboboxFun($('#logisticsStatus_0621'), logisticsStatusArr);//物流状态
        /*拒收（退货）签收*/
        var exp16Arr=[{"id":"","value":"---请选择---"},{"id":"签收","value":"签收"},{"id":"待签收","value":"待签收"}];
        comboboxFun($('#exp16C_0621'),exp16Arr,'');
        /*理赔状态*/
        var exp12Arr=[{"id":"","value":"---请选择---"},{"id":"已理赔","value":"已理赔"},{"id":"未理赔","value":"未理赔"}];
        comboboxFun($('#exp12_0621'),exp12Arr,'');
        /*发票类型*/
        var exp13Arr=[{"id":"","value":"---请选择---"},{"id":"专票","value":"专票"},{"id":"普票","value":"普票"},{"id":"电子发票","value":"电子发票"}];
        comboboxFun($('#exp13_0621'),exp13Arr,'');
        function comboboxFun(elem, data, height) {
            elem.combobox({
                editable: false,
                data: data,
                panelHeight: (height == 'undefined' || undefined == height ? 'auto' : height),
                valueField: 'id',
                textField: 'value'
            });
        }
    };
    /*限制日期选择日期不可以超过当前选择的日期*/
    var initDate = function () {
        /*-------------------------*/
        /**
         * 订单日期
         */
        initDateBox($('#orderDateStartTime_0621'));
        initDateBox($('#orderDateEndTime_0621'));
        /**
         * 出货时间
         */
        initDateBox($('#exp6StartTime_0621'));
        initDateBox($('#exp6EndTime_0621'));
        /**
         * 签收时间
         */
        initDateBox($('#exp14StartTime_0621'));
        initDateBox($('#exp14EndTime_0621'));
        /**
         * 拒收签收时间
         */
        initDateBox($('#exp17StartTime_0621'));
        initDateBox($('#exp17EndTime_0621'));
    
        /***
         * 跟单时间
         */
        initDateBox($('#exp1StartTime_0621'));
        initDateBox($('#exp1EndTime_0621'));
    
        /**
         * 回款日期
         */
        initDateBox($('#collectionDateStartTime_0621'));
        initDateBox($('#collectionDateEndTime_0621'));
    
        /**
         * 费用结算日期
         */
        initDateBox($('#costCalculationDateStartTime_0621'));
        initDateBox($('#costCalculationDateEndTime_0621'));
        /**
         * 发票发送日期
         */
        initDateBox($('#exp5StartTime_0621'));
        initDateBox($('#exp5EndTime_0621'));
        function initDateBox(elem) {
            elem.datebox({
                editable: false,
                formatter: formatterDate,
                parser: parserDate,
                onSelect: onSelectDateFun
            });
        }

        /*格式化时间*/
        function formatterDate(date) {
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            return y + '/' + (m < 10 ? ('0' + m) : m) + '/' + (d < 10 ? ('0' + d) : d);
        };
        /*解析时间*/
        function parserDate(s) {
            if (!s) return new Date();
            var ss = (s.split('/'));
            var y = parseInt(ss[0], 10);
            var m = parseInt(ss[1], 10);
            var d = parseInt(ss[2], 10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
                return new Date(y, m - 1, d);
            } else {
                return new Date();
            }
        };
        /*时间显示*/
        function onSelectDateFun(d) {
            var start_id='',end_id='',sDate='',endDate='',msg='';
            if(this.id.indexOf('Start')>-1){//开始时间
                start_id=this.id;//开始时间
                end_id=getDateId(start_id);//结束时间
                msg='开始日期不大于结束日期!';
            }else{//结束时间
                end_id=this.id;//开始时间
                start_id=getDateId(end_id);//结束时间
                msg='结束日期不小于开始日期!';
            }
            sDate=new Date($('#'+start_id).datebox('getValue'));
            endDate=new Date($('#'+end_id).datebox('getValue'));
            if (sDate > endDate) {
                $.messager.alert("提示", msg,'info');
                //只要选择了日期，不管是开始或者结束都对比一下，如果结束小于开始，则清空结束日期的值并弹出日历选择框
                $('#'+end_id).datebox('setValue', '');
            }


        }
    };
    function getDateId(startId) {
        var $ele_id='';
        switch (startId){
            case 'orderDateStartTime_0621':
                $ele_id= 'orderDateEndTime_0621';
                break;
            case 'orderDateEndTime_0621':
                $ele_id='orderDateStartTime_0621';
                break;
            case 'exp6StartTime_0621':
                $ele_id='exp6EndTime_0621';
                break;
            case 'exp6EndTime_0621':
                $ele_id='exp6StartTime_0621';
                break;
            case 'exp14StartTime_0621':
                $ele_id='exp14EndTime_0621';
                break;
            case 'exp14EndTime_0621':
                $ele_id='exp14StartTime_0621';
                break;
            case 'exp17StartTime_0621':
                $ele_id='exp17EndTime_0621';
                break;
            case 'exp17EndTime_0621':
                $ele_id='exp17StartTime_0621';
                break;
            case 'exp1StartTime_0621':
                $ele_id='exp1EndTime_0621';
                break;
            case 'exp1EndTime_0621':
                $ele_id='exp1StartTime_0621';
                break;
            case 'collectionDateStartTime_0621':
                $ele_id='collectionDateEndTime_0621';
                break;
            case 'collectionDateEndTime_0621':
                $ele_id='collectionDateStartTime_0621';
                break;
            case 'costCalculationDateStartTime_0621':
                $ele_id='costCalculationDateEndTime_0621';
                break;
            case 'costCalculationDateEndTime_0621':
                $ele_id='costCalculationDateStartTime_0621';
                break;
            case 'exp5StartTime_0621':
                $ele_id='exp5EndTime_0621';
                break;
            case 'exp5EndTime_0621':
                $ele_id='exp5StartTime_0621';
                break;
            default:
                $ele_id='orderDateEndTime_0621';
        }
        return $ele_id;
    };
    /*全选与反选*/
    var checkClickFun = function () {
        $('#orderCk').change(function () {
            checkFun(this);
        });
        $('#moneyCk').change(function () {
            checkFun(this);
        });
        $('#addressCk').change(function () {
            checkFun(this);
        });
        $('#wuLiuCk').change(function () {
            checkFun(this);
        });
        $('#definedCk').change(function () {
            checkFun(this);
        });
        function checkFun(obj) {
            var ck_flag = $(obj).prop('checked');
            var name = $(obj).attr('name');
            if (ck_flag) {
                $('#' + name + ' .check').prop('checked', true);
                $('#' + name + ' input[type="hidden"]').val($('#' + name + ' li').length);
            } else {
                $('#' + name + ' .check').prop('checked', false);
                $('#' + name + ' input[type="hidden"]').val(0);
                /*if(name!='orderCkUl'){
                    $('#' + name + ' input[type="hidden"]').val(0);
                }else{
                    $('#systemManageOrder1').prop('checked', true);
                    $('#' + name + ' input[type="hidden"]').val(1);
                }*/

            }
        }

        /*单个操作*/
        $('input[name="check0407"]').change(function () {
            var f = $(this).prop('checked');
            var p = $('#' + $(this).parent().parent('ul').attr('id'));
            var len = p.children('li').length;
            var selLen = p.children('input[type="hidden"]').val();
            if (f) {
                $(this).prop('checked', true);
                p.children('input[type="hidden"]').val(parseInt(selLen) + 1);
                if (len == p.children('input[type="hidden"]').val()) {
                    p.prev('p').find('input[type="checkbox"]').prop('checked', true);
                }
            } else {
                $(this).prop('checked', false);
                p.children('input[type="hidden"]').val(parseInt(selLen) - 1);
                p.prev('p').find('input[type="checkbox"]').prop('checked', false);
            }

        });
    };
    /*查询信息重置*/
    var resetForm = function () {
        $("#resetBtn").click(function () {
            $("#searchForm").form('clear');
            /*combobox赋值*/
            $('#sendGoodsType_0621').combobox('setValue', '');
            $('#orderType_0621').combobox('setValue', '');
            $('#ynPaymentReceived_0621').combobox('setValue', '');
            $('#ynPayment_0621').combobox('setValue', '');
            $('#ynSettlement_0621').combobox('setValue', '');
            $('#exp10_0621').combobox('setValue', '');
            $('#dingDanStatus_0621').combobox('setValue', '');
            $('#logisticsStatus_0621').combobox('setValue', '');
            $('#exp16C_0621').combobox('setValue', '');
            $('#exp12_0621').combobox('setValue', '');
            $('#exp13_0621').combobox('setValue', '');
        });
    };
    var intiDate = function (key,data) {
        if('null'!=data[key]&&''!=data[key]&&null!=data[key]){
            $('#'+key).datebox('setValue',Common.getLocalDateBy(data[key]));
        }else{
            $('#'+key).datebox('setValue','');
        }
    }
    return {
        init:function () {
            initCombobox();
            initDate();
            checkClickFun();
            resetForm();
        },
        /*获取数据刷新表格
        * columnArr：初始化列
        * param:查询参数
        * */
        getTableData:function (columnsArr,param) {
            var IsCheckFlag = true;
            $("#order").datagrid({
                url: rootPath + 'v1/lLogisticsManagerController/getLLogisticsManagerPage?' + Math.random(),
                queryParams: param,
                pagination: true,
                method: 'post',
                tok: 'orderlist',
                tov: 'total',
                checkOnSelect: true,
                fitColumns: false,
                pageSize: 50,
                pageList: [50, 100, 150],
                showFooter: true,
                rownumbers: true,
                frozenColumns: [[{field: 'ck', checkbox: true}]],//固定列
                columns: [columnsArr],
                onClickCell: function (rowIndex, field, value) {
                    IsCheckFlag = false;
                },
                onSelect: function (rowIndex, rowData) {
                    if (!IsCheckFlag) {
                        IsCheckFlag = true;
                        $("#order").datagrid("unselectRow", rowIndex);
                    }
                },
                onUnselect: function (rowIndex, rowData) {
                    if (!IsCheckFlag) {
                        IsCheckFlag = true;
                        $("#order").datagrid("selectRow", rowIndex);
                    }
                },
                onLoadError: function (data) {
                }

            });
            
        },
        /*复制物流信息
        * type:操作的类型，
        * id:操作的信息id
        *
        * */
        copyLogisticsWindow:function(id,type){
            $('#copyLogisticsWin').dialog({
                closed:false,
                buttons:[{
                    text: '确定',
                    width: '80px',
                    handler:function(){
                        Common.loading_mask();
                        $.ajax({
                            url:rootPath+'v1/lLogisticsManagerController/copyLogisticsManager?id='+id,
                            success:function (res) {
                                var res = JSON.parse(res);
                                $('#load').remove();
                                $('#copyLogisticsWin').dialog('close');
                                $.messager.alert('提示信息',res.msg,'warn',function () {
                                    if(res.resultCode=="SUCCESS"){
                                        var columnsArr=[];
                                        if(type=='order'){
                                            columnsArr=LogisticsOrderManagerPage.getCookieFun();
                                        }else if (type == 'msg'){
                                            columnsArr=LogisticsMsgManagerPage.getCookieFun();
                                        }else if(type == 'doc'){
                                            columnsArr=LogisticsDocManagerPage.getCookieFun();
                                        }else if(type =='invoice'){
                                            columnsArr=LogisticsInvoiceManagerPage.getCookieFun();
                                        }else if(type == 'settle'){
                                            columnsArr=LogisticsSettlementManagerPage.getCookieFun();
                                        }else  if(type == 'pay'){
                                            columnsArr=LogisticsPaymentManagerPage.getCookieFun();
                                        }else if(type == 'total'){
                                            columnsArr=LogisticsManagerPage.getCookieFun();
                                        }
                                        LogisticsManagerSearch.getTableData(columnsArr);
                                    }
                                });
                            }
                        })
                    }
                },
                    {
                        text:"取消",
                        width:'80px',
                        handler:function(){
                            $('#copyLogisticsWin').dialog('close');
                        }
                    }]
            });

        },
        /*删除物流数据*/
        delLogistics: function (id, date, order) {
            $('#time0408').html(date);
            $('#order0408').html(order);
            $('#dialogWindow').dialog({
                title: '提示信息',
                width: 300,
                height: 200,
                closed: false,
                cache: false,
                modal: true,
                buttons: [{
                    id: 'btnAdd',
                    text: '确定',
                    width: 60,
                    handler: function () {
                        $('#dialogWindow').dialog('close');
                        $.ajax({
                            type: "post",
                            url: rootPath + 'v1/lLogisticsManagerController/deletLogisticsManager?'+ Math.random() ,
                            data: {"id": id},
                            success: function (res) {
                                var res = JSON.parse(res);
                                $.messager.alert('提示信息', res.msg, 'info');
                                if (res.resultCode == "SUCCESS") {
                                    $('#order').datagrid('reload');
                                }
                            }
                        })

                    }
                }, {
                    id: 'btnCancelAdd',
                    text: '取消',
                    width: 60,
                    handler: function () {
                        $('#dialogWindow').dialog('close');
                    }
                }]
            });
        },
        /***
         * 上传上次搜索条件的值
         */
        setDetailData:function(param){
        	$.ajax({
        		url:rootPath+'v1/lLogisticsManagerController/setLLogisticsManager?'+ Math.random(),
        		data:param,
        		success:function(res){
        			if(res!=""){
        				var res=JSON.parse(res);
        			}
        		}
        	});
        },
        /***
         * 获取上次搜索条件的值
         */
        getDetailData:function () {
            Common.loading_mask();
            $.ajax({
                url:rootPath+'v1/lLogisticsManagerController/getLLogisticsManager?'+ Math.random(),
                success:function (res) {
                    $('#load').remove();
                    if(res!=""){
                    	var res=JSON.parse(res);
                        $('#searchForm').form({
                        	onLoadSuccess:function(res){
                        		intiDate('orderDateStartTime',res);
                        		intiDate('orderDateEndTime',res);
                        		intiDate('exp6StartTime',res);
                        		intiDate('exp6EndTime',res);
                        		intiDate('exp14StartTime',res);
                        		intiDate('exp14EndTime',res);
                        		intiDate('exp17StartTime',res);
                        		intiDate('exp17EndTime',res);
                        		intiDate('exp1StartTime',res);
                        		intiDate('exp1EndTime',res);
                        		intiDate('collectionDateStartTime',res);
                        		intiDate('collectionDateEndTime',res);
                        		intiDate('costCalculationDateStartTime',res);
                        		intiDate('costCalculationDateEndTime',res);
                        		intiDate('exp5StartTime',res);
                        		intiDate('exp5EndTime',res);
                        	}
                        }).form('load',res);
                    }
                    
                }
            })
        },
        /*查询数据*/
        searchDataByForm : function (columnsArr) {
        	var self = this;
            $("#searchBtn").click(function () {
            	var param = {
                        "orderDateStartTime": $('#orderDateStartTime_0621').datebox('getValue'),
                        "orderDateEndTime": $('#orderDateEndTime_0621').datebox('getValue'),
                        "sendGoodsType": $('#sendGoodsType_0621').combobox('getValue'),
                        "customerName": $('#customerName_0621').textbox('getValue'),
                        "systemManageOrder": $('#systemManageOrder_0621').textbox('getValue'),
                        "systemOrder": $('#systemOrder_0621').textbox('getValue'),
                        "platformOrder": $('#platformOrder_0621').textbox('getValue'),
                        "clientProperty": $('#clientProperty_0621').textbox('getValue'),
                        "orderType": $('#orderType_0621').combobox('getValue'),
                        "productCode": $('#productCode_0621').textbox('getValue'),
                        "producutName": $('#producutName_0621').textbox('getValue'),
                        "accountingUnit": $('#accountingUnit_0621').textbox('getValue'),
                        "exp7": $('#exp7_0621').textbox('getValue'),
                        "exp15": $('#exp15_0621').textbox('getValue'),
                        "consigneeName1": $('#consigneeName1_0621').textbox('getValue'),
                        "consigneeName2": $('#consigneeName2_0621').textbox('getValue'),
                        "consigneephone1": $('#consigneephone1_0621').textbox('getValue'),
                        "consigneephone2": $('#consigneephone2_0621').textbox('getValue'),
                        "receivingProvince": $('#receivingProvince_0621').textbox('getValue'),
                        "receivingCityCounty": $('#receivingCityCounty_0621').textbox('getValue'),
                        "cityLevel": $('#cityLevel_0621').textbox('getValue'),
                        "deposit": $('#deposit_0621').textbox('getValue'),
        				"ynPaymentReceived": $('#ynPaymentReceived_0621').combobox('getValue'),
        				"returnGoodsNosentOrder": $('#returnGoodsNosentOrder_0621').textbox('getValue'),
        				"orderDecision": $('#orderDecision_0621').textbox('getValue'),
        				"exp6StartTime": $('#exp6StartTime_0621').datebox('getValue'),
        				"exp6EndTime": $('#exp6EndTime_0621').datebox('getValue'),
        				"sendGoodsOrder": $('#sendGoodsOrder_0621').textbox('getValue'),
        				"entrustOrder": $('#entrustOrder_0621').textbox('getValue'),
        				"logisticsStatus": $('#logisticsStatus_0621').combobox('getValue'),
        				"warehouseLocation": $('#warehouseLocation_0621').textbox('getValue'),
        				"logisticsCompany": $('#logisticsCompany_0621').textbox('getValue'),
        				"logisticsNumber": $('#logisticsNumber_0621').textbox('getValue'),
        				"logisticeFee": $('#logisticeFee_0621').textbox('getValue'),
        				"freightFee": $('#freightFee_0621').textbox('getValue'),
        				"upstairsFee": $('#upstairsFee_0621').textbox('getValue'),
        				"collectMoney": $('#collectMoney_0621').textbox('getValue'),
        				"superChargeFee": $('#superChargeFee_0621').textbox('getValue'),
        				"rejectionFee": $('#rejectionFee_0621').textbox('getValue'),
        				"exp8": $('#exp8_0621').textbox('getValue'),
        				"exp9": $('#exp9_0621').textbox('getValue'),
        				"exp19": $('#exp19_0621').textbox('getValue'),
        				"exp18": $('#exp18_0621').textbox('getValue'),
        				"orderStatus": $('#dingDanStatus_0621').combobox('getValue'),
        				"exp14StartTime": $('#exp14StartTime_0621').datebox('getValue'),
        				"exp14EndTime": $('#exp14EndTime_0621').datebox('getValue'),
        				"exp16": $('#exp16C_0621').combobox('getValue'),
        				"exp17StartTime": $('#exp17StartTime_0621').datebox('getValue'),
        				"exp17EndTime": $('#exp17EndTime_0621').datebox('getValue'),
        				"exp1StartTime": $('#exp1StartTime_0621').datebox('getValue'),
        				"exp1EndTime": $('#exp1EndTime_0621').datebox('getValue'),
        				"ynPayment": $('#ynPayment_0621').combobox('getValue'),
        				"collectionDateStartTime": $('#collectionDateStartTime_0621').datebox('getValue'),
        				"collectionDateEndTime": $('#collectionDateEndTime_0621').datebox('getValue'),
        				"ynSettlement": $('#ynSettlement_0621').combobox('getValue'),
        				"costCalculationDateStartTime": $('#costCalculationDateStartTime_0621').datebox('getValue'),
        				"costCalculationDateEndTime": $('#costCalculationDateEndTime_0621').datebox('getValue'),
        				"exp10": $('#exp10_0621').combobox('getValue'),
        				"exp11": $('#exp11_0621').textbox('getValue'),
        				"exp12": $('#exp12_0621').combobox('getValue'),
        				"exp13": $('#exp13_0621').combobox('getValue'),
        				"exp3": $('#exp3_0621').textbox('getValue'),
        				"exp5StartTime": $('#exp5StartTime_0621').datebox('getValue'),
        				"exp5EndTime": $('#exp5EndTime_0621').datebox('getValue'),
        				"exp31": $('#exp31_0621').textbox('getValue')
                    };
            	self.setDetailData(param);
            	self.getTableData(columnsArr, param);
                $('#search_condition').window('close');
            });
        }
    }
}();