/**
 * Created by 111 on 2017/4/7.
 * 查看物流订单详情
 */
var EditlogisticsPaymentManagerPage=function () {
    /*批量修改隐藏不可以修改的列*/
    var hideLotTrFn=function () {
        if(GetEditLogisticsData.constantVar=='l'){
            $('.lot-tr0606').css('display','none');
        }
    };
    return {
        init:function () {
            GetEditLogisticsData.init();
            hideLotTrFn();
        },
        submitForm:function () {
            var url='v1/lLogisticsManagerController/updateLogisticsPaymentManager?';
            if(GetEditLogisticsData.constantVar=='l'){
                url='v1/lLogisticsManagerController/updateLogisticsbatchManager?'
            }
            $('#searchForm').form('submit',{
                url:rootPath+url+ Math.random(),
                onSubmit:function(){
                	return $(this).form('validate');
                },
                success:function (res) {
                    var res=JSON.parse(res);
                    if(res.resultCode=="SUCCESS"){
                        $.messager.alert('提示信息',res.msg,'info',function () {
                            location.href=rootPath+'v1/lLogisticsManagerController/logisticsPaymentManagerPage';
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
            if(GetEditLogisticsData.constantVar!='l'){
                GetEditLogisticsData.getDetailData();
            }
        }
    }
}();