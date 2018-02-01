/**
 * Created by 111 on 2017/4/7.
 * 查看物流订单详情
 */
var SwLlogisticsManagerPage=function () {
    /*分割地址栏*/
    var splitUrl=function () {
        var id=location.search.split("=")[1];
        if(undefined==id || 'undefined'==id || ''==id || null==id){
            location.href=rootPath+'v1/lLogisticsManagerController/logisticsManagerPage';
        }else{
            getDetailData(id);
        }
    };
    var getDetailData=function (id) {
        Common.loading_mask();
            $.ajax({
                url:rootPath+'v1/lLogisticsManagerController/getLogisticsManager?id='+id+'&'+ Math.random(),
                success:function (res) {
                    $('#load').remove();
                    var res=JSON.parse(res);
                    var item_input=$('input');
                    var data=res.data[0];
                    if(res.resultCode=='SUCCESS'){
                        for(var i=0;i<item_input.length;i++){
                        	var name=item_input.eq(i).attr('name');
                            if(name.indexOf('_')>-1){
                                if (name.split('_')[1] == 'd') {
                                    if (data[name.split('_')[0]] != '' && null != data[name.split('_')[0]] && 'null' != data[name.split('_')[0]]) {
                                        item_input.eq(i).val(Common.getLocalDateBy(data[name.split('_')[0]]));
                                    } else {
                                        item_input.eq(i).val('');
                                    }
                                }
                            }else {
                                item_input.eq(i).val(data[name]);
                            }
                        }
                        $('#addressDetail').html(data.addressDetail);
                        $('#exp2').html(data.exp2)
                    }else{
                        $.messager.alert('提示信息',res.msg,'error');
                    }

                }
            })
    };
    return {
        init:function () {
            splitUrl();
        }
    }
}();