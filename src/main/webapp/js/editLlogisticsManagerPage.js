/**
 * Created by 111 on 2017/4/7.
 * 查看物流订单详情
 */
var EditLlogisticsManagerPage=function () {
    return {
        init:function () {
            GetEditLogisticsData.init();
        },
        submitForm:function () {
            $('#searchForm').form('submit',{
                url:rootPath+'v1/lLogisticsManagerController/updateLogisticsManager?'+ Math.random(),
                onSubmit:function(){
                	return $(this).form('validate');
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
            /*重新获取数据*/
            GetEditLogisticsData.getDetailData();
        }
    }
}();