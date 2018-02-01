/**
 * Created by 111 on 2016/7/19.
 */
var SWgoodsManager=function(){
  var paymentArr=["微信支付","金币支付","支付宝支付"];
  var invoiceTypeArr=['纸质发票','纸质发票','纸质发票'];
  var orderStatusArr=['取消','未支付','已支付'];
  var productStatusArr=['等待出库','已出库','代理商配送中','正在配送中','已完成','已关闭'];
  var refundStatusArr=['没有申请退换货','审核中','审核通过','审核未通过','退/换货成功','退/换货失败'];
    var data=[];
    var color=['','yellow','blue','red'];
    var columnsArr=[
//                    {field:'orderNo',title:'订单号',width:'220',align:'center',formatter:function(value,row,index){
//                        return '<a target="_blank" href="' + rootPath + 'v1/storeOrder/swOrderDetailPage?detailId='+row.detailId+'">'+value+'</a>';
//                    }},
//                    {field:'robotNum',title:'机器人id',width:'150',align:'center'},
                    {field:'productName',title:'商品名称',width:'220',align:'center'},
//                    {field:'payment',title:'支付方式',width:'100',align:'center',formatter:function(value,row,index){
//                        return paymentArr[value-1];
//                    }},
                    {field:'productAmount',title:'数量',width:'100',align:'center'},
//                    {field:'pice',title:'单价',width:'80',align:'center',
//                    	formatter:function(value,row,index){
//                    		return (row.orderPayablePrice-row.orderCarriage)/row.productAmount;
//                    	}
//                    },
//                    {field:'orderCarriage',title:'运费',width:'80',align:'center'},
//                    {field:'orderOriginalPrice',title:'订单总额',width:'80',align:'center'},
//                    {field:'orderPayablePrice',title:'应付金额（总）',width:'150',align:'center'},
//                    {field:'disCount',title:'优惠单价',width:'100',align:'center'},
                    {field:'orderStatus',title:'订单状态',width:'100',align:'center',formatter:function(value,row,index){
                        return orderStatusArr[value-1];
                    }},
//                    {field:'robotNum',title:'会员ID',width:'120',align:'center'},
                    {field:'createDate',title:'交易时间',width:'150',align:'center',
                        formatter:function(value,row,index){
                            return Common.getLocalTime(value);
                        }
                    },
//                    {field:'wxTransactionNo',title:'交易单号',width:'220',align:'center'},
//                    {field:'invoiceType',title:'发票类型',width:'100',align:'center',formatter:function(value,row,index){
//                        return invoiceTypeArr[value-1];
//                    }},
//                    {field:'invoiceHeader',title:'发票头',width:'200',align:'center'},
                    {field:'consignee',title:'收货人',width:'100',align:'center'},
//                    {field:'phoneNum',title:'收货人电话',width:'120',align:'center'},
//                    {field:'productNo',title:'商品编码',width:'220',align:'center'},
//                    {field:'productPrice',title:'单价',width:'100',align:'center'},
                    {field:'address',title:'收货地址',width:'220',align:'center'},
                    {field:'exStatus',title:'商品状态',width:'120',align:'center',formatter:function(value,row,index){
                    	return productStatusArr[value-1];
                    }},
                    {field:'confirmTimeDatetoStr',title:'签收时间',width:'220',align:'center'},
	                {field:'refundStatus',title:'退换货状态',width:'120',align:'center',formatter:function(value,row,index){
	                	return refundStatusArr[value-1];
	                }},
//                    {field:'refamount',title:'退货数量',width:'100',align:'center'},
//                    {field:'refundMoney',title:'退款金额',width:'100',align:'center'},
//                    {field:'afterSaleState',title:'退款状态',width:'100',align:'center'},
                    {field:'operation',title:'操作',width:'80',align:'center',
                        formatter:function(value,row,index){
                            return '<a target="_blank" class="btn detail-btn0719" href="' + rootPath + '/v1/storeOrder/swOrderDetailPage?detailId='+row.detailId+'">查看</a>';
                        }
                    }
                ];
    
    var clickFun=function(){
        $("#productNo").click(function(){
            getSelectData('v1/managervar/querySysEnum?'+Math.random());
        })
    }

    /*下拉获取数据*/
     function getSelectData(url){
         $.ajax({
             url:rootPath+url,
             success:function(res){
                 data= res.unshift({name:'--请选择--',value:0});
             }
         });
         $('#productNo').combobox({
             editable:false,
             data:data,
             valueField:'value',
             textField:'name',
             panelHeight:'auto',
             value:'--请选择--'
         });
     }
    /*获取数据*/
    var getData=function(columnsArr){
        $("#order").datagrid({
            url:rootPath+'v1/storeOrder/getAllOrdersPage?'+Math.random(),
            pagination:true,
            method:'post',
            tok:'list',
			tov:'total',
            checkOnSelect:true,
            fitColumns:false,
            pageSize:50,
            pageList:[50,100,150],
            rownumbers:true,
            frozenColumns:[[{field:'ck',checkbox:true}]],//固定列
            columns:[columnsArr]

        });
    };
    /*查询数据*/
    var searchDataByForm=function(){
        $(".search-btn0718").click(function(){
        	$('#searchForm').form('submit', {
        		onSubmit: function(){
        			var isValid = $(this).form('validate');
        			if (!isValid){
        				Common.showMessage('有查询信息没有通过校验','error');
        			}
        			return isValid;	// return false will stop the form submission
        		},
        		success: function(){
        			$('#order').datagrid('load',{
                        orderNo: $('input[name="orderNo"]').val(),
                        robotNum: $('input[name="robotNum"]').val(),
                        wxTransactionNo: $('input[name="wxTransactionNo"]').val(),
                        productNo:$('#productNo').combobox('getValue')=='--请选择--' ? "" : $('#productNo').combobox('getValue'),
                        consignee: $('input[name="consignee"]').val(),
                        phoneNum: $('input[name="phoneNum"]').val(),
                        orderStatus:$('#orderStatus').combobox('getValue')=='--请选择--' ? "" : $('#orderStatus').combobox('getValue'),
                        afterState: $('#afterState').combobox('getValue')=='--请选择--' ? "" : $('#afterState').combobox('getValue'),
//                        invoiceType:$('#invoiceType').combobox('getValue')=='--请选择--' ? "" : $('#invoiceType').combobox('getValue'),
//                        platform: $('#platform').combobox('getValue')=='--请选择--' ? "" : $('#platform').combobox('getValue'),
                        startTime :$('.startDate').datebox('getValue'),
                        endTime   :$('.endDate').datebox('getValue')
                });
        		}
        	});
            
        });

    };
    /*查询信息重置*/
    var resetForm=function(){
        $(".reset-btn0718").click(function(){
            $("#searchForm").form('clear');
            $('#productNo').combobox('setValue','--请选择--');
            $('#orderStatus').combobox('setValue','--请选择--');
            $('#afterState').combobox('setValue','--请选择--');
            $('#invoiceType').combobox('setValue','--请选择--');
            $('#platform').combobox('setValue','--请选择--');
            $('#order').datagrid('load',{
                orderNo: '',
                robotNum: '',
                wxTransactionNo: '',
                productNo:'',
                consignee: '',
                phoneNum: '',
                orderStatus:'',
                afterState: '',
                invoiceType:'',
                platform: '',
                startTime :'',
                endTime   :''
            });
        });
    }
    /*限制日期选择日期不可以超过当前选择的日期*/
    var limitDate=function(){
        $('.startDate').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());//当前时间
                return d1>=date;
            }
        });
        $('.endDate').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());//当前时间
                return d1>=date;
            }
        });
    };
    /*到处表格*/
    var exportExcle=function(){
        $(".excle-btn0718").click(function(){
            var arr=[];
            var selRows=$("#order").datagrid("getSelections");
            if(selRows.length==0){
                Common.showMessage("请选择需要导出的数据！",'warn');
            }else{
                for(var i=0;i<selRows.length;i++){
                    arr.push(selRows[i].orderId);
                }
                $(".excle-btn0718").attr('href',rootPath+'v1/export/exportStoreOrderReport?ids='+arr);
            }


        });
    }
    return {
        init:function(){
        	Common.blur();
        	if(Common.getCookie("condition_show")==null){
        		getData(columnsArr);/*获取表格数据*/
        	}else{
        		var getCookie = Common.getCookie("condition_show").split("_|_");
        		var newArr = [];
        		for(var i = 0;i<getCookie.length;i++){
        			newArr.push(columnsArr[getCookie[i]]);
        		}
        		getData(newArr);
        	}
            limitDate();/*显示选择日期 */
            searchDataByForm();/*查询数据*/
            resetForm();//重置查询表单
            exportExcle();
            clickFun();
        },
        table_condition:function () {
            var arr = new Array();
            var cookie_arr = [];
            var items = $(".check");
            for (var i = 0; i < items.length; i++) {
                if (items.eq(i).prop("checked")) {
                    for(var k=0;k<columnsArr.length;k++){
                        if(items.eq(i).attr("value")==columnsArr[k].field){
                            arr.push(columnsArr[k]);
                            cookie_arr.push(k)
                        }
                    }
                }
            }
            arr.push(columnsArr[columnsArr.length-1]);
            cookie_arr.push(columnsArr.length-1);
            $(".check").prop("checked",false);
            $('#table-show-condition-window').window('close');
            Common.setCookie("condition_show",cookie_arr.join("_|_"));
            getData(arr);
        }
    }
}();
