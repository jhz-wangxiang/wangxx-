/**
 * Created by 111 on 2016/7/19.
 */
/*拆分地址栏,获取orderId*/
    var detailId=location.search.split("=")[1];
    var detailId = getParams('detailId');
    var orderNo = getParams('orderNo');
var OrderDetail=function(){
    var exStatusArr=['等待出库','已出库','代理商配送中','正在配送中','已签收'];//商品状态[{"value":1,"name":"等待出库"},{"value":2,"name":"正在发货"},{"value":3,"name":"到达代理商"},{"value":4,"name":"正在配送中"},{"value":5,"name":"已签收"},{"value":6,"name":"已签收"}]
    var refundStatusArr=['','没有申请退换货','申请退换货中','审核中','退换货完成','申请失败'];
    var orderSourceArr=['官网购买','微信商城','手机商城'];//{"value":1,"name":"官网购买"},{"value":2,"name":"微信商城"}
    var paymentArr=["","微信支付","金币支付","支付宝支付"];//支付方式
    var orderStatus=['','取消','未支付','已支付'];//[{"value":1,"name":"取消"},{"value":2,"name":"未支付"},{"value":3,"name":"已支付"}]
    var jyOrderNo='';//存储交易单号，新增物流信息的时候使用
    /*获取订单详情*/
    var getDetailInfo=function(){
        $.ajax({
            method:"post",
            url:rootPath+'v1/storeOrder/getOrdersInfo',
            data:{'detailId':detailId},
            success:function(res){
                var data=$.parseJSON(res).data[0];
                var i=0;//用于记录订单来源的下表
                jyOrderNo=data.orderNo;
                if(data.orderNo.substring(0,2)!='GW'){
                    i=1;
                }
                if(data.orderNo.substring(0,2)=='MW'){
                	i=2;
                }
                /*wxTransactionNo */
                $("#userNo").text(data.userNo);//userNo
                $("#connectPerson").text(data.consignee);
                $("#phoneNum").text(data.phoneNum);
                $("#address").text(data.address);//address
                $("#orderStatus").text(orderStatus[data.orderStatus]);
                $("#reason").html(data.reason);
                $("#payType").text(paymentArr[data.payment]);//payment支付方式
                $("#orderSource").text(orderSourceArr[i]);//订单来源
                $("#orderNo").text(data.orderNo);//订单号
                $("#invoiceHeader").text(data.invoiceHeader);//订单号
                $("#invoiceNum").text(data.invoiceNum);//订单号
                $("#invoiceAdress").text(data.invoiceAdress);//订单号
                $("#invoicePhone").text(data.invoicePhone);//订单号
                $("#invoiceBank").text(data.invoiceBank);//订单号
                $("#invoiceBankNum").text(data.invoiceBankNum);//订单号
                $("#buyDate").text(Common.getLocalTime(data.createDate));//createDate;付款日期
                $("#payDate").text(Common.getLocalTime(data.createDate));//createDate;付款日期
                $("#wxTransactionNo").text(data.wxTransactionNo);//交易号
                getOrderRefund($.parseJSON(res).data);
                getOrderAttr($.parseJSON(res).data);
                getOrderTends($.parseJSON(res).data);
                addLogistic($.parseJSON(res).data);
                OrderDetail.updateLogisticTable($.parseJSON(res).data);
                $("#marketingId").text((data.marketingId==null?"无":data.marketingId));
                $("#discountId").text((data.discountId==null?"无":data.discountId));
            }
        })
    };
    var getDetailDiscount = function () {
      $.ajax({
        method: "post",
        url: rootPath + 'v1/storeOrder/getCoupon',
        data: {'orderNo': orderNo},
        success: function (res) {
          res = $.parseJSON(res);
          if(res.resultCode == "SUCCESS"){
            var _discountArr = [];
            for (var i = 0; i< res.data.length; i++){
              _discountArr.push(res.data[i].couponId);
            }
            $("#couponDiscountID").text(_discountArr.join(','));
          }else{
            Common.showMessage(res.msg,'error');
          }
        }
      });
    }
    /*获取商品属性*/
    var getOrderAttr=function(data){
        $("#orderAttr").datagrid({
            /*method:"post",
            url:rootPath+"v1/ordersForm/getOrdersByOrderId?"+Math.random(),
            queryParams:{'orderId':orderId},
            tok:'list',
            tov:'total',*/
            data:data,
            fitColumns:true,
            rownumbers: true,
            singleSelect: true,
            columns:[[
                      {field:'productName',title:'商品名称',width:'200',align:'center'},
                      {field:'orderOriginalPrice',title:'单价',width:'105',align:'center',
                      	formatter:function(value,row,index){
                      		return (row.orderPayablePrice+row.disCount)/row.productAmount;
                      	}
                      },
                      {field:'productAmount',title:'数量',width:'105',align:'center'},
                      {field:'disCount',title:'优惠金额',width:'105',align:'center'},
                      {field:'orderOriginalPrice',title:'应付金额',width:'105',align:'center'},
                      {field:'orderCarriage',title:'运费',width:'105',align:'center'},
                      {field:'orderPayablePrice',title:'实付金额',width:'120',align:'center'},
                      {field:'refundMoney',title:'退款金额',width:115,align:'center'}
                  ]],
            onLoadSuccess:function(){
                var totalData=$("#orderAttr").datagrid('getData');
                $("#num0725").text(totalData.total);
                $("#total0725").text(totalData.rows[0].orderPayablePrice);
            }

        });
    };
    /*获取商品动态*/
    var getOrderTends=function(data){
        $("#orderPo").datagrid({
            /*method:"post",
            url:rootPath+"v1/ordersForm/getOrdersByOrderId?"+Math.random(),
            queryParams:{'orderId':orderId},
            tok:'list',
            tov:'total',*/
            data:data,
            fitColumns:true,
            singleSelect: true,
            rownumbers: true,
            columns:[[
                      {field:'productName',title:'商品名称',width:'200',align:'center'},
                      {field:'exStatus',title:'商品状态',width:'200',align:'center',
                          formatter:function(value,row){
                              return exStatusArr[value-1];
                          },
                          editor:{
                              type:'combobox',
                              options:{
                                  valueField:'value',
                                  textField:'name',
                                  method:'post',
                                  url:rootPath+'v1/managervar/querySysEnum?enumCode=EX_STATUS',
                                  editable:false
                                  }
                          }
                      },
                      {field:'confirmTimeDatetoStr',title:'签收时间',width:'200',align:'center',formatter:function(value,row,index){
                          return value==null ? "未签收" :value;
                      },
                          editor:{
                              type:"datetimebox",
                              options:{
                              	showSeconds: true,
                              	editable:false
                              }
                          }
                      },
                      {field:'operation',title:'编辑',width:'200',align:'center',
                          formatter:function(value,row,index){
                          	
                              return '<a class="btn detail-btn0719 orderPo-detail" onclick = "editR(\'orderPo\','+index+')">修改</a>' +
                                  '<a class="btn save-btn0719 orderPo-save" onclick = "saveR('+row.orderPayablePrice+','+index+',\'orderPo\')">保存</a>' +
                                  '<a class="btn cancel-btn0719 orderPo-cancel" onclick = "cancelR(\'orderPo\')">取消</a>';
                          }
                      }
                  ]]

        });
    };
    /*获取退款动态*/
    var getOrderRefund=function(data){
    
        $("#orderRefund").datagrid({
            data:data,
            fitColumns:true,
            singleSelect: true,
            rownumbers: true,
            columns:[[
                {field:'productName',title:'商品名称',width:'200',align:'center'},
                
                {field:'refundStatus',title:'退换货状态',width:'200',align:'center',
                    formatter:function(value,row){
                        return value==null?"无":refundStatusArr[row.refundStatus];
                    },
                    editor:{
                        type:'combobox',
                        options:{
                            valueField:'value',
                            textField:'name',
                            method:'post',
                            url:rootPath+'v1/managervar/querySysEnum?enumCode=REFUND_STATE',
                            editable:false
                        }
                    }
                },
                {field:'refundMoney',title:'退款金额',width:'200',align:'center',formatter:function(value,row){
                		return value==null?"0":value;
                	}, editor:{
                        type:"numberbox",
                        options:{
                        	//max:orderPayablePrice,
                        	validType:'maxLength[10]'
                        }
                    }
                },
                {field:'operation',title:'编辑',width:'200',align:'center',
                    formatter:function(value,row,index){
                    	var h = "";
                    	if(row.refundStatus==null){
                    		h = '<a class="btn detail-btn0719 orderRefund-detail" style="background:#ccc">修改</a>';
                    	}else{
                    		h = '<a class="btn detail-btn0719 orderRefund-detail" onclick = "editR(\'orderRefund\','+index+')">修改</a>' +
                            '<a class="btn save-btn0719 orderRefund-save" onclick = "saveR('+row.orderPayablePrice+','+index+',\'orderRefund\')">保存</a>' +
                            '<a class="btn cancel-btn0719 orderRefund-cancel" onclick = "cancelR(\'orderRefund\')">取消</a>';
                    	}
                        return h;
                    }
                }
            ]]

        });
    };
    //新增物流信息
  //新增物流信息
    var addLogistic=function(data){
    	
        $("#addLogistic").click(function(){
			if($(this).data("flag")==undefined){
				expressFn(data);
			}else{
				//更新物流表格信息
                $.ajax({
                	type:"post",
                	url:rootPath+'v1/storeOrder/getOrdersInfo',
    				data:{'detailId':detailId},
    				success:function(r){
    					expressFn($.parseJSON(r).data);
    				}
                });
				
			}
        });
        function expressFn(data){
        	var express=$("#express").val();
            var logisticsNum=$("#logisticsNum").val();
            if(express==''){
                Common.showMessage('物流公司名称不能为空','error');
                return false;
            }
            if(logisticsNum==''){
                Common.showMessage('物流单号不能为空','error');
                return false;
            }            
            /*判断是否有物流信息*/
	    	if(data[0].expressNumber!=null){
	    		Common.showMessage('物流信息只能有一条！','info');
	    		return false;
	    	}
            $('#logisticForm').form('submit', {
        		onSubmit: function(){
        			var isValid = $(this).form('validate');
        			if (!isValid){
        				Common.showMessage('添加物流信息没有通过校验','error');
        			}
        			return isValid;	// return false will stop the form submission
        		},
        		success: function(){
        			$.ajax({
                        method:"post",
                         url:rootPath+'v1/logist/insertLogis',
                         data:{'detailId':data[0].detailId,'orderNo':data[0].orderNo,'expressCompany':express,'expressNumber':logisticsNum},
                         success:function(res){
                             res= $.parseJSON(res);
                             if(res.resultCode=='SUCCESS'){
                            	//更新物流表格信息
                                 $.ajax({
                                 	type:"post",
                                 	url:rootPath+'v1/storeOrder/getOrdersInfo',
                     				data:{'detailId':detailId},
                     				success:function(r){
                     					OrderDetail.updateLogisticTable($.parseJSON(r).data);
                     					Common.showMessage(res.msg,'info');
                     				}
                                 });
                                 //$("#logisticForm").form('clear');
                             }else{
                                 Common.showMessage(res.msg,'error');
                             }

                         }
                     });
        		}
        	});
        }
    };
    return {
        init: function () {
        	Common.blur();
            getDetailInfo();
          getDetailDiscount();
          },
          //更新物流表格信息
          updateLogisticTable:function(data){
  	    		if(data[0].expressNumber==null){
  	    			$("#logisticDiv .panel").hide();
  	    			return false;
  	    		}
  	            $('#logistic').datagrid({
  	                data:data,
  	                fitColumns:true,
  	                singleSelect: true,
  	                rownumbers: true,
  	                columns:[[
  	                    {field:'expressCompany',title:'物流公司',width:'260',align:'center'},
  	                    {field:'expressNumber',title:'物流单号',width:'260',align:'center',editor:'text'},
  	                    {field:'createTime',title:'创建时间',width:'200',align:'center',
  	                        formatter:function(value,row){
  	                            return Common.getLocalTime(value);
  	                        }
  	                    },
  	                    {field:'oper',title:'编辑',width:'115',align:'center',
  	                        formatter:function(value,row,index){
  	                            return '<a class="btn del-btn0721" onclick = "deleLogisticR('+index+')">删除</a>';
  	                        }
  	                    }
  	                ]]
  	
  	            });
  	    }

    }
}();


/*启用编辑*/
var editIndex = undefined;
function endEditing(id){
    if (editIndex == undefined){return true}
    if ($('#'+id).datagrid('validateRow', editIndex)){
        var ed = $('#'+id).datagrid('getEditor', {index:editIndex,field:'productid'});
        var productname = $(ed.target).combobox('getText');
        $('#'+id).datagrid('getRows')[editIndex]['productName'] = productname;
        $('#'+id).datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}
function editR(id,index){
    if (editIndex != index){
        if (endEditing(id)){
            $('#'+id).datagrid('selectRow', index)
                .datagrid('beginEdit', index);
            editIndex = index;
            $("."+id+"-detail").css({"display":"none"});
            $("."+id+"-save").css({"display":"inline-block"});
            $("."+id+"-cancel").css({"display":"inline-block"});
        } else {
            $('#'+id).datagrid('selectRow', editIndex);
        }
    }
}
/*取消编辑*/
function cancelR(id){
	$("."+id+"-detail").css({"display":"inline-block"});
	$("."+id+"-save").css({"display":"none"});
	$("."+id+"-cancel").css({"display":"none"});
    $('#'+id).datagrid('rejectChanges');
    editIndex = undefined
}
//删除物流信息
function deleLogisticR(index){
    $.messager.confirm('提示','确认删除此条信息?', function(row){
        if (row){
            var selrow=$('#logistic').datagrid('getSelected');
            var index = $('#logistic').datagrid('getRowIndex', selrow);
            var data={"orderNo":selrow.orderNo,"logisticsId":selrow.logisticsId};
            $.ajax({
                method:"post",
                url:rootPath+'v1/logist/deleteLogis',
                data:data,
                success:function(res){
                    var resp= $.parseJSON(res);
                    if(resp.resultCode=='SUCCESS'){
                        $('#logistic').datagrid('deleteRow',index);
                        $.ajax({
                         	type:"post",
                         	url:rootPath+'v1/storeOrder/getOrdersInfo',
    						data:{'detailId':detailId},
    						success:function(r){
    							OrderDetail.updateLogisticTable($.parseJSON(r).data);
        						Common.showMessage('删除成功！','info');
        						$("#addLogistic").data("flag","0")
    						}
                         });
                    }else{
                        Common.showMessage('删除失败！','error');
                    }

                }
            })
        }
    });
}
/*保存数据修改
 * payMoney:实付金额
 * index:编辑行序号
 * */
function saveR(payMoney,index,id){
    $('#'+id).datagrid('endEdit',index);//结束编辑
    //如果调用acceptChanges(),使用getChanges()则获取不到编辑和新增的数据。
    var rowData=$('#'+id).datagrid('getChanges');
    var url,data;
    if(id=="orderPo"){
    	url = rootPath+'v1/storeOrder/updateProductStatus';
    	data = {'detailId':rowData[0].detailId,'exStatus':rowData[0].exStatus,'confirmTimeStr':rowData[0].confirmTimeDatetoStr}
    }else if(id=="orderRefund"){
    	if(rowData[0]==undefined){
	    	Common.showMessage('退款金额的长度最大为10位','error');
	    	return false;
	    }
	    if(payMoney<rowData[0].refundMoney){
	    	$('#orderPo').datagrid('rejectChanges');
	    	Common.showMessage('退款金额应小于实付金额！','error');
	    	editIndex = undefined
	    	return false;
	    }
	    url = rootPath+'v1/sale/updateSale';
    	data = {'saleId':rowData[0].saleId,'refundMoney':rowData[0].refundMoney,'refundStatus':rowData[0].refundStatus,'orderDetailId':rowData[0].detailId}
    }
    $.ajax({
        method:"post",
        url:url,
        data:data,
        success:function(res){
            var res= $.parseJSON(res);
            $('#'+id).datagrid('reload');
            if(res.resultCode=='SUCCESS'){
            	$('#orderAttr').datagrid('reload');
                Common.showMessage(res.msg,'info');
            }else{
                $('#'+id).datagrid('rejectChanges');
                Common.showMessage(res.msg,'error');
            }

        }
    })
    editIndex = undefined;
}
function getParams(name) {
  var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
  var r = window.location.search.substr(1).match(reg);
  if(r!=null)return  decodeURI(r[2]); return null;
}
