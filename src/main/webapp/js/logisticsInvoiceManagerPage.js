/**
 * Created by 111 on 2017/04/05.
 */
var LogisticsInvoiceManagerPage = function () {
    var columnsArr = [
{
    field: 'opera', title: '操作', width: '150', align: 'center',
    formatter: function (value, row, index) {
        var val='';
        if(value==1){
            val='总计：';
        }else{
            /*<a class="btn detail-btn0719 marRig10" href="javascript:;" onclick="LogisticsManagerSearch.copyLogisticsWindow(' + row.id + ',\'invoice\')">拷贝</a>*/
            val = '<a class="btn detail-btn0719 marRig10" href="' + rootPath + 'v1/lLogisticsManagerController/swLlogisticsManagerPage?id=' + row.id + '">查看</a>';
            if(userName!='15321792627' && userName!='dingdanzhuanyuan'){
                val=val+'<a class="btn detail-btn0719 marRig10" href="' + rootPath + 'v1/lLogisticsManagerController/editlogisticsInvoiceManagerPage?detailId=' + row.id + '">编辑</a>';
            }
            if(userName=='15201596856'){
                val = val+'<a class="btn detail-btn0719" href="javascript:;" onclick="LogisticsManagerSearch.delLogistics(' + row.id + ',\'' + Common.getLocalDateBy(row.orderDate) + '\',\'' + row.systemManageOrder + '\')">删除</a>';
            }

        }
        return val;
    }
},
        {
            field: 'orderDate', title: '订单日期', align: 'center',
            formatter: function (value) {
                var val = '';
                if (null == value || 'null' == value || '' == value) {
                    val = '';
                } else {
                    val = Common.getLocalDateBy(value)
                }
                return val;
            }
        },
        {field:'sendGoodsType',title:'发货类型',align:'center'},
        {field:'customerName',title:'客户名称',align:'center'},
        {field:'systemManageOrder',title:'系统管理订单号',align:'center'},
        {field:'productCode',title:'产品编码',align:'center'},
        {field:'producutName',title:'产品名称',align:'center'},
        {field: 'sendGoodsNum', title: '发货数量',  align: 'center'},
        {field:'unitPrice',title:'单价',align:'center'},
        {field:'price',title:'金额',align:'center'},
        {field: 'consigneeName1', title: '收货人姓名（一）', align: 'center'},
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
            }
        },
        {field:'exp31',title:'发票号',align:'center'},
        {field:'exp31',title:'自定义12',align:'center'},
        {field:'exp33',title:'自定义13',align:'center'},
        {field:'exp34',title:'自定义14',align:'center'}

    ];
    //批量修改
    var lotUpdateInit=function () {
        $('#lotUpdateBtn').click(function () {
            var selRows=$('#order').datagrid('getSelections');
            if(selRows.length==0){
                $.messager.alert('提示信息','请选择需要批量修改的数据','warn');
            }else{
                var ids=[];
                for (var i=0;i<selRows.length;i++){
                    ids.push(selRows[i].id);
                }
                $(this).attr('href',rootPath+'v1/lLogisticsManagerController/editlogisticsInvoiceManagerPage?detailId='+ids+'&f=l');
            }
        });
    };
    /*根据检索条件导出文件*/
    var exportFileByForm=function () {
        $('#formBtn0424').click(function () {
           $(this).attr('href','javascript:;');
            /*var param = {
                "systemOrder": $('#xiTongOrder').textbox('getValue'),
                "platformOrder": $('#pingTaiOrder').textbox('getValue'),
                "logisticsNumber": $('#wuLiuOrder').textbox('getValue'),
                "logisticsStatus": $('#wuLiuStatus').combobox('getValue'),
                "consigneeName1": $('#nameCon').textbox('getValue'),
                "consigneephone1": $('#telNum').textbox('getValue'),
                "orderStatus": $('#dingDanStatus').combobox('getValue'),
                "orderType": $('#dingDanType').combobox('getValue'),
                "ynPaymentReceived": $('#daiShouKuan').combobox('getValue'),
                "ynPayment": $('#huiKuan').combobox('getValue'),
                "ynSettlement": $('#jieSuan').combobox('getValue'),
                "orderDateStartTime": $('#orderDateStartTime').datebox('getValue'),
                "orderDateEndTime": $('#orderDateEndTime').datebox('getValue'),
                "exp16": $('#exp16C').combobox('getValue'),
                "exp14StartTime": $('#exp14StartTime').datebox('getValue'),
                "exp14EndTime": $('#exp14EndTime').datebox('getValue'),
                "collectionDateStartTime": $('#collectionDateStartTime').datebox('getValue'),
                "collectionDateEndTime": $('#collectionDateEndTime').datebox('getValue'),
                "exp6StartTime": $('#exp6StartTime').datebox('getValue'),
                "exp6EndTime": $('#exp6EndTime').datebox('getValue')

            };*/
           
            $(this).attr('href',rootPath+'v1/exportLLogis/exportInvoiceLLogisAll?'+$('#searchForm').serialize());
        });

    };
    /*到处表格*/
    var exportExcle = function () {
        $("#excelBtn0407").click(function () {
            var selRows = $("#order").datagrid("getSelections");
            if (selRows.length == 0) {
                Common.showMessage("请选择需要导出的数据！", 'warn');
            } else {
                $('#exportExcelWin').dialog('open');
                var arr = [];
                for (var i = 0; i < selRows.length; i++) {
                    arr.push(selRows[i].id);
                }
                $('#num0410').text(arr.length);
                $('#exportExcelWin').dialog({
                    closed: false,
                    buttons: [{
                        text: '取消',
                        width: '80px',
                        handler: function () {
                            $('#exportExcelWin').dialog('close');
                            /*$('#order').datagrid('uncheckAll');*/
                        }
                    }, {
                        text: '确定导出',
                        width: '80px',
                        handler: function () {
                            $(this).attr('href', rootPath + 'v1/exportLLogis/exportInvoiceLLogis?ids=' + arr);
                            $('#exportExcelWin').dialog('close');
                            $('#order').datagrid('uncheckAll');
                        }
                    }]
                });


            }
            return false;
        });
    };
    /*选择显示列*/
    var openHeaderWin=function () {
        $(".table-requirement-btn").click(function(){
            $('#table-show-condition-window').window({
                width:640,
                height:810,
                minimizable:false,
                maximizable:false,
                collapsible:false,
                modal:true
            });
            if(Common.getCookie('invoice_header')!=null){
                var orderLen=Common.getCookie('invoice_order');
                var wuliuLen=Common.getCookie('invoice_wuliu'),moneyLen=Common.getCookie('invoice_money'),addressLen=Common.getCookie('invoice_address'),definedLen=Common.getCookie('invoice_defined');
                if(orderLen==$('#orderCkUl li').length){
                    $('#orderCk').prop('checked',true);
                }
                if(wuliuLen==$('#wuLiuCkUl li').length){
                    $('#wuLiuCk').prop('checked',true);
                }
                if(moneyLen==$('#moneyCkUl li').length){
                    $('#moneyCk').prop('checked',true);
                }
                if(addressLen==$('#addressCkUl li').length){
                    $('#addressCk').prop('checked',true);
                }
                if(definedLen==$('#definedCkUl li').length){
                    $('#definedCk').prop('checked',true);
                }
                $('input[name="order0407"]').val(orderLen);
                $('input[name="wuLiu0407"]').val(wuliuLen);
                $('input[name="money0407"]').val(moneyLen);
                $('input[name="address0407"]').val(addressLen);
                $('input[name="defined0407"]').val(definedLen);
                var headerArr=Common.getCookie('invoice_header').split('_');
                for (var i=0;i<headerArr.length;i++){
                    $('#'+headerArr[i]+'').prop('checked',true);
                }
            }

        });
    }
    return {
        init: function () {
            if(userName=='15321792627' || userName == 'dingdanzhuanyuan'){
                $('#opera0710').css({"display":"none"});
                $('#operaDiv0710').css({"display":"none"});
            }
            LogisticsManagerSearch.init();
            openHeaderWin();//打开表头
            exportFileByForm();//根据选择文件导出
            LogisticsInvoiceManagerPage.getCookieFun();
            LogisticsManagerSearch.getTableData(columnsArr);
            /*显示选择日期 */
            LogisticsManagerSearch.searchDataByForm(columnsArr);
            /*查询数据*/
            exportExcle();
            lotUpdateInit();
            $(".openSearche_btn").click(function(){
            	LogisticsManagerSearch.getDetailData();
            	$('#search_condition').window({
                    width:1200,
                    height:810,
                    minimizable:false,
                    maximizable:false,
                    collapsible:false,
                    modal:true
                });
            });
        },
        /*订单号搜索*/
        searchDataBySystemManageOrder:function(){
        	var sfarr = $("#searchForm").serializeArray();
        	var newp = {};
        	$.each( sfarr, function(key, val){
    		  newp[val.name] = "";
    		});
        	newp["systemManageOrder"] = $('#smo').textbox('getValue')
        	LogisticsManagerSearch.setDetailData(newp);
        	LogisticsManagerSearch.getTableData(columnsArr, newp);
        },
        getCookieFun:function () {
            if(Common.getCookie("invoice_header")!=null){
                var getCookie = Common.getCookie("invoice_header").split("_");
                $('input[name="order0407"]').val(Common.getCookie('invoice_order'));
                $('input[name="wuLiu0407"]').val(Common.getCookie('invoice_wuliu'));
                $('input[name="money0407"]').val(Common.getCookie('invoice_money'));
                $('input[name="address0407"]').val(Common.getCookie('invoice_address'));
                $('input[name="defined0407"]').val(Common.getCookie('invoice_defined'));
                var selColumnsArr = [];
                selColumnsArr.push(columnsArr[0]);
                for(var i = 0;i<getCookie.length;i++){
                    for(var k=0;k<columnsJSON.length;k++){
                        if (getCookie[i]==columnsJSON[k].field){
                            selColumnsArr.push(columnsJSON[k]);
                        }
                    }
                }
                columnsArr=selColumnsArr;
            }
            return columnsArr;
        },
        /*
         * 上传文件
         * */
        importExcel: function (obj) {
            Common.loading_mask();
            $.ajaxFileUpload({
                url: rootPath + 'v1/exportLLogis/importInvoiceLLogistManaExcel?'+ Math.random(),
                secureuri: false,
                fileElementId: 'file',
                dataType: 'string',
                success: function (res) {
                    $('#load').remove();
                    $('#file').val('');
                    if (res.resultCode == 'FAIL') {
                        $.messager.alert('提示信息', res.msg, 'error');
                    } else {
                        var html = [];
                        html.push('<h2 >文件上传成功</h2>');
                        html.push('<h3>成功导入' + res.succNum + '条</h3>');
                        if (res.illegalList.length != 0) {
                            html.push('<p style="line-height: 22px;font-size:14px; color: red;">非法订单' + res.illegalNum + '条数：<a href="javascript:;" class="easyui-linkbutton0410" onclick="LogisticsInvoiceManagerPage.searchIllegalOrder(\'' + res.illegalListOrder.join(',') + '\')">查看非法订单</a></p>');
                            html.push('<ol>');
                            for (var i = 0; i < res.illegalList.length; i++) {
                                html.push('<li>' + res.illegalList[i] + '</li>')
                            }
                            html.push('</ol>');
                        }
                        if (res.failList.length != 0) {
                            html.push('<p style="line-height: 22px;font-size:14px; color: red;">原因：</p>');
                            html.push('<ol>');
                            for (var i = 0; i < res.failList.length; i++) {
                                html.push('<li>' + res.failList[i] + '</li>')
                            }
                            html.push('</ol>');
                        }
                        $('#html0410').html(html.join(''));
                        $('#importExcelWin').dialog('open');
                        $('#importExcelWin').dialog({
                            closed: false,
                            buttons: [{
                                text: '确定',
                                width: '80px',
                                handler: function () {
                                    $('#importExcelWin').dialog('close');
                                    LogisticsManagerSearch.getTableData(columnsArr);
                                }
                            }],
                            onClose: function () {
                                LogisticsManagerSearch.getTableData(columnsArr);
                            }
                        });
                    }
                }

            });
        },
        /*
         *非法订单id
         **/
        searchIllegalOrder: function (orderList) {
            $('#importExcelWin').dialog('close');
            LogisticsManagerSearch.getTableData(columnsArr, {"systemManageOrders": orderList});

        },
        /*清空选择的表头*/
        clearSelTabHeader: function () {
            $('input[type="checkbox"]').prop('checked', false);
            $('#table-show-condition-window').window('close');
        },
        submitTableHeader: function () {
            var items = $('.check');
            var selColumnsArr = [];
            selColumnsArr.push(columnsArr[0]);
            var headerArr=[];
            for (var i = 0; i < items.length; i++) {
                if (items.eq(i).prop("checked")) {
                    for (var k = 0; k < columnsJSON.length; k++) {
                        if (items.eq(i).attr("value") == columnsJSON[k].field) {
                            headerArr.push(columnsJSON[k].field);
                            selColumnsArr.push(columnsJSON[k]);
                        }
                    }
                }
            }
            $(".check").prop("checked", false);
            $('#table-show-invoice-window').window('close');
            Common.setCookie('invoice_header',headerArr.join('_'));
            Common.setCookie('invoice_order',$('input[name="order0407"]').val());
            Common.setCookie('invoice_wuliu',$('input[name="wuLiu0407"]').val());
            Common.setCookie('invoice_money',$('input[name="money0407"]').val());
            Common.setCookie('invoice_address',$('input[name="address0407"]').val());
            Common.setCookie('invoice_defined',$('input[name="defined0407"]').val());
            LogisticsManagerSearch.getTableData(selColumnsArr);
        }
    }
}();