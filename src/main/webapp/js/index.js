/**
 * Created by 111 on 2016/7/19.
 */
var Index=function(){
    var paymentArr=["微信支付","金币支付","支付宝支付"];
    var invoiceTypeArr=['','纸质发票','电子发票'];
    var orderStatusArr=['','','未支付','已支付'];
    var refundStatusArr=['','没有申请退换货','申请退换货中','审核中','退换货完成','申请失败'];
    var productStatusArr=['','等待出库','已出库','代理商配送中','正在配送中','已完成','已关闭'];
    var data=[];
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
     };
     /*列数据*/
     var columnArr=[
                    {field:'orderNo',title:'订单号',width:'220',align:'center',formatter:function(value,row,index){
                        return '<a href="' + rootPath + '/v1/ordersForm/orderDetailPage?detailId='+row.detailId+'&orderNo='+row.orderNo+'" target="_blank">'+value+'</a>';
                    }},
                    {field:'userNo',title:'会员ID',width:'120',align:'center'},
                    
                    {field:'productName',title:'商品名称',width:'220',align:'center'},
                    {field:'productNo',title:'商品编码',width:'220',align:'center'},
                    {field:'productAmount',title:'数量',width:'100',align:'center'},
                    {field:'pice',title:'单价',width:'80',align:'center',
                    	formatter:function(value,row,index){
                    		return (row.orderOriginalPrice)/row.productAmount;
                    	}
                    },
                    {field:'orderCarriage',title:'运费',width:'80',align:'center'},
                    {field:'disCount',title:'优惠单价',width:'100',align:'center'},
                    {field:'orderOriginalPrice',title:'应付金额（总）',width:'80',align:'center'},
                    {field:'orderPayablePrice',title:'实付金额（总）',width:'150',align:'center'},
                    {field:'payment',title:'支付方式',width:'100',align:'center',formatter:function(value,row,index){
                        return paymentArr[value-1];
                    }},
                    {field:'wxTransactionNo',title:'交易单号',width:'220',align:'center'},
                    {field:'invoiceType',title:'发票类型',width:'100',align:'center',formatter:function(value,row,index){
                        return invoiceTypeArr[value];
                    }},
                    {field:'invoiceHeader',title:'发票头',width:'200',align:'center'},
                    {field:'consignee',title:'收货人',width:'100',align:'center'},
                    {field:'phoneNum',title:'收货人电话',width:'120',align:'center'},
                    {field:'address',title:'收货地址',width:'220',align:'center'},
                    {field:'orderStatus',title:'订单状态',width:'100',align:'center',formatter:function(value,row,index){
                        return orderStatusArr[value];
                    }},
                   
                    {field:'exStatus',title:'商品状态',width:'120',align:'center',formatter:function(value,row,index){
                    	//判断已签收
                    	return productStatusArr[value];
                    }},
                    {field:'confirmTimeDatetoStr',title:'签收时间',width:'220',align:'center'},
                    {field:'createDate',title:'交易时间',width:'150',align:'center',
                        formatter:function(value,row,index){
                            return Common.getLocalTime(value);
                        }
                    },
                    {field:'refundStatus',title:'退换货状态',width:'120',align:'center',formatter:function(value,row,index){
	                	return refundStatusArr[value];
	                }},
                    {field:'refamount',title:'退货数量',width:'100',align:'center'},
                    {field:'refundMoney',title:'退款金额',width:'100',align:'center'},
                    {field:'marketingId',title:'优惠ID1',width:'100',align:'center'},
                    {field:'discountId',title:'优惠ID2',width:'100',align:'center'},
                    {field:'discountType',title:'优惠方式',width:'100',align:'center'},
                    {field:'operation',title:'操作',width:'80',align:'center',
                        formatter:function(value,row,index){
                            return '<a class="btn detail-btn0719" href="' + rootPath + '/v1/ordersForm/orderDetailPage?detailId='+row.detailId+'&orderNo='+row.orderNo+'"target="_blank">查看</a>';
                        }
                    }
                ];
    /*获取数据
     * flag->标识是否显示行号，true显示，false不现实
     * columnArr->列数据
     * */
    var getData=function(flag,columnArr){
        $("#order").datagrid({
            url:rootPath+'v1/ordersForm/getAllOrdersPages?'+Math.random(),
            pagination:true,
            method:'post',
            tok:'list',
			tov:'total',
            checkOnSelect:true,
            fitColumns:false,
            pageSize:10,
            rownumbers:flag,
            frozenColumns:[[{field:'ck',checkbox:true}]],//固定列
            columns:[columnArr],
            rowStyler:function(index,row){
            	//var productStatusArr=['','等待出库','已出库','代理商配送中','正在配送中','已完成','已关闭'];
            	//var refundStatusArr=['','没有申请退换货','申请退换货中','审核中','退换货完成','申请失败'];
            	
            	if(row.refundStatus==0){
            		switch (row.exStatus) {
                	case 1:
                		return 'background-color:#ccffcc;';
                		break;
                	case 2:
                		return 'background-color:#ccffcc;';
                		break;
                	case 3:
    					return 'background-color:#ccffcc;';
    					break;
    				case 4:
    					return 'background-color:#ccffcc;';
    					break;
    				case 5:
    					return 'background-color:#d2d2d2;';
    					break;
    				case 6:
    					return 'background-color:#d2d2d2;';
    					break;
    				default:
    					break;
    				}
            	}else{
            		switch (row.refundStatus) {
                	case 1:
                		break;
                	case 2:
                		return 'background-color:#FF0000;color:#fff;';
                		break;
                	case 3:
    					return 'background-color:#FF0000;color:#fff;';
    					break;
    				case 4:
    					return 'background-color:#d2d2d2;';
    					break;
    				case 5:
    					return 'background-color:#d2d2d2;';
    					break;
    				default:
    					break;
    				}
            		
            	}
            	
            }

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
                        userNo: $('input[name="userNo"]').val(),
                        wxTransactionNo: $('input[name="wxTransactionNo"]').val(),
                        productNo:$('#productNo').combobox('getValue')=='--请选择--' ? "" : $('#productNo').combobox('getValue'),
                        consignee: $('input[name="consignee"]').val(),
                        phoneNum: $('input[name="phoneNum"]').val(),
                        orderStatus:$('#orderStatus').combobox('getValue')=='--请选择--' ? "" : $('#orderStatus').combobox('getValue'),
                        afterState: $('#afterState').combobox('getValue')=='--请选择--' ? "" : $('#afterState').combobox('getValue'),
                        invoiceType:$('#invoiceType').combobox('getValue')=='--请选择--' ? "" : $('#invoiceType').combobox('getValue'),
                        platform: $('#platform').combobox('getValue')=='--请选择--' ? "" : $('#platform').combobox('getValue'),
                        startTime :$('.startDate').datebox('getValue'),
                        endTime   :$('.endDate').datebox('getValue'),
                        exStatus:$('#exStatus').combobox('getValue')=='--请选择--' ? "" : $('#exStatus').combobox('getValue')
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
                userNo: '',
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
                $(".excle-btn0718").attr('href',rootPath+'v1/export/exportOrderReport?ids='+arr);
            }


        });
    }
    return {
        init:function(){
        	Common.blur();
        	if(Common.getCookie("condition_show")==null && Common.getCookie("rowNum")==null){
        		getData(false,columnArr);//获取表格数据
        	}else{
        		var getCookie = Common.getCookie("condition_show").split("_|_");
        		var flag=Common.getCookie('rowNum');
        		var newArr = [];
        		for(var i = 0;i<getCookie.length;i++){
        			newArr.push(columnArr[getCookie[i]]);
        		}
        		getData(flag,newArr);
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
            var flag=false;//标识是否显示序号
            for (var i = 0; i < items.length; i++) {
                if (items.eq(i).prop("checked")) {
                    for(var k=0;k<columnArr.length;k++){
                    	/*console.log(items.eq(i).attr("value"))*/
                    	if(items.eq(i).attr("value")!='No'){
                    		if(items.eq(i).attr("value")==columnArr[k].field){
                                arr.push(columnArr[k]);
                                cookie_arr.push(k)
                            }
                    	}
                    	if(items.eq(i).attr("value")=='No'){
                    		flag=true;
                    	}
                        
                    }
                }
            }
            arr.push(columnArr[columnArr.length-1]);
            cookie_arr.push(columnArr.length-1);
            $(".check").prop("checked",false);
            $('#table-show-condition-window').window('close');
            Common.setCookie("condition_show",cookie_arr.join("_|_"));
            Common.setCookie("rowNum",flag);
            getData(flag,arr);
        }
    }
}();
