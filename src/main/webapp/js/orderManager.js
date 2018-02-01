/**
 * Created by 111 on 2016/7/19.
 */
var OrderManager=function(){
    /*获取商品动态*/
    var isShowStorageArr=['不显示','显示'];
    var storageJson=[{'value':'0','textFiled':"不显示"},{'value':'1','textFiled':"显示"}];
    
    return {
        init: function () {
        	OrderManager.getOrderData();//获取商品数据
            Common.blur();
        },
        getOrderData:function(){
            $("#orderManager").datagrid({
                url:rootPath+'v1/product/getAllBalance?'+Math.random()*10,
                method:'get',
                tok:'list',
                tov:'total',
                singleSelect: true,
                rownumbers: true,
                columns:[[
                    {field:'productName',title:'商品名称',width:'120',align:'center'},
                    {field:'productNo',title:'产品编码',width:'250',align:'center'},
                    {field:'productPrice',title:'单价',width:'100',align:'center'},
                    {field:'tplusBalance',title:'T+库存数量',width:'110',align:'center',
                        editor:{
                            type:"numberbox",
                            options:{
                            	min:0,
                                validType:'maxLength[10]'
                            }
                        }
                    },
                    {field:'balance',title:'官网库存信息',width:'110',align:'center',
                        editor:{
                            type:"numberbox",
                            options:{
                                min:0,
                                validType:'maxLength[10]'
                            }
                        }
                    },
                    {field:'showBalance',title:'显示库存',width:'112',align:'center',
                        editor:{
                            type:'combobox',
                            options:{
                                valueField:'value',
                                textField:'textFiled',
                                data:storageJson,
                                editable:false,
                                required:true
                            }
                        },
                        formatter:function(value,row,index){
                        return isShowStorageArr[value];
                    }},
                    {field:'operation',title:'编辑',width:'120',align:'center',
                        formatter:function(value,row,index){
                            return '<a class="btn detail-btn0719" onclick = "editR('+index+')">修改</a><a class="btn save-btn0719" onclick = "saveR('+index+')">保存</a><a class="btn cancel-btn0719" onclick = "cancelR('+index+')">取消</a>';
                        }
                    }
                ]]

            });
        }
    }
}();
/*启用编辑*/
var editIndex = undefined;
function endEditing(){
    if (editIndex == undefined){return true}
    if ($('#orderManager').datagrid('validateRow', editIndex)){
        var ed = $('#orderManager').datagrid('getEditor', {index:editIndex,field:'productid'});
        var productname = $(ed.target).combobox('getText');
        $('#orderManager').datagrid('getRows')[editIndex]['productId'] = productId;
        $('#orderManager').datagrid('endEdit', editIndex);
        editIndex = undefined;
        return true;
    } else {
        return false;
    }
}
function editR(index){
    if (editIndex != index){
        if (endEditing()){
            $('#orderManager').datagrid('selectRow', index)
                .datagrid('beginEdit', index);
            editIndex = index;
            $(".detail-btn0719").eq(index).css({"display":"none"});
            $(".save-btn0719").eq(index).css({"display":"inline-block"});
            $(".cancel-btn0719").eq(index).css({"display":"inline-block"});
        } else {
            $('#orderManager').datagrid('selectRow', editIndex);
        }
    }
}
/*取消编辑*/
function cancelR(index){
    $(".detail-btn0719").eq(index).css({"display":"inline-block"});
    $(".save-btn0719").eq(index).css({"display":"none"});
    $(".cancel-btn0719").eq(index).css({"display":"none"});
    $('#orderManager').datagrid('rejectChanges');
    editIndex = undefined
}
/*保存数据修改*/
function saveR(index){
    $('#orderManager').datagrid('endEdit',index);//结束编辑
    //如果调用acceptChanges(),使用getChanges()则获取不到编辑和新增的数据。
    var rowData=$('#orderManager').datagrid('getChanges');
    if(rowData[0]==undefined){
        Common.showMessage('库存量长度最大为10位','error');
        return false;
    }
    $.ajax({
        method:"post",
        url:rootPath+'v1/product/editProductBalance?'+Math.random()*10,
        data:{'productId':rowData[0].productId,'balance':rowData[0].balance,
            'tplusBalance':rowData[0].tplusBalance,
            'showBalance':rowData[0].showBalance},
        success:function(res){
            var res= $.parseJSON(res);
            if(res.resultCode=='SUCCESS'){
            	OrderManager.getOrderData();
            	/*$('#orderManager').datagrid('acceptChanges');
            	$('#orderManager').datagrid('reload');*/
                Common.showMessage(res.msg,'info');
            }else{
                $('#orderManager').datagrid('rejectChanges');
                Common.showMessage(res.msg,'error');
            }

        }
    });
    editIndex = undefined;
}