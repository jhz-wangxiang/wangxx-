/**
 * Created by 111 on 2017/4/8.
 * 插入物流信息
 */
var InsertLlogisticsManagerPage = function () {
    var cur_time=new Date();
    function dateFormatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d);
    }
    var limateDate=function () {
        $('#orderDate').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var  d1= new Date(now.getFullYear(), now.getMonth(), now.getDate());//当前时间
                return d1<=date;
            }
        });
    }
    return {
        init: function () {
            InitLogisticsCombobox.init();
            limateDate();
        },
        submitForm:function () {
            $('#searchForm').form('submit',{
                url:rootPath+'v1/lLogisticsManagerController/insertLogisticsManager?'+ Math.random(),
                onSubmit:function(){
                    return $(this).form('enableValidation').form('validate');
                },
                success:function (res) {
                    var res=JSON.parse(res);
                    if(res.resultCode=="SUCCESS"){
                        $.messager.alert('提示信息',res.msg,'info',function () {
                            location.href=rootPath+'v1/lLogisticsManagerController/logisticsManagerPage';
                        });
                    }else{
                        $.messager.alert('提示信息',res.msg,'error');
                    }
                }
            });
            
        },
        clearForm:function () {
            $('#searchForm').form('clear');
            $("#searchForm").form("disableValidation");
            $('#orderDate').datebox('setValue',dateFormatter(cur_time));
            /*发货类型*/
            $('#sendGoodsType').combobox('setValue','发货');

            $('#orderStatus').combobox('setValue','');
            /*订单类型*/
            $('#orderType').combobox('setValue','');
            /*是否代收款*/
            $('#ynPaymentReceived').combobox('setValue','');
            /*是否理赔*/
            $('#exp10').combobox('setValue','');
            /*理赔状态*/
            $('#exp12').combobox('setValue','');
            /*发票类型*/
            $('#exp13').combobox('setValue','');
        }
    }
}();
