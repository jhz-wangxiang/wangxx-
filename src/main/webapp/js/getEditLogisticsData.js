/**
 * Created by 111 on 2017/5/17.
 */
var GetEditLogisticsData=function () {
    var id='';
    /*分割地址栏*/
    var splitUrl=function () {
        var url=location.search.split("=");
        id=url[1];
        GetEditLogisticsData.constantVar=url[2]==undefined ? '' : url[2];
        if(undefined==id || 'undefined'==id || ''==id || null==id){
            location.href=rootPath+'v1/lLogisticsManagerController/logisticsManagerPage';
        }else{
            if(id.indexOf('&')<0){
                GetEditLogisticsData.getDetailData();
                $('#id0408').attr('name','id');
                $('#id0408').val(id);
            }else{
            	$('#id0408').attr('name','ids');
                $('#id0408').val(id.split('&')[0]);
            }

        }
    };

    function  intiDate(key,data) {
        if('null'!=data[key]&&''!=data[key]&&null!=data[key]){
            $('#'+key).datebox('setValue',Common.getLocalDateBy(data[key]));
        }else{
            $('#'+key).datebox('setValue','');
        }
    }
    return {
        init:function () {
            splitUrl();
            InitLogisticsCombobox.init();
        },
        constantVar:'',
        getDetailData:function () {
            Common.loading_mask();
            $.ajax({
                url:rootPath+'v1/lLogisticsManagerController/getLogisticsManager?id='+id+'&'+ Math.random(),
                success:function (res) {
                    $('#load').remove();
                    var res=JSON.parse(res);
                    var data=res.data[0];

                    if(res.resultCode=='SUCCESS'){
                    	//$('#searchForm').form('load',data);
                        $('#searchForm').form({
                        	onLoadSuccess:function(data){
                        		intiDate('orderDate',data);
                                intiDate('collectionDate',data);
                                intiDate('costCalculationDate',data);
                                intiDate('exp6',data);
                                intiDate('exp5',data);
                                intiDate('exp14',data);
                                intiDate('exp1',data);
                                intiDate('exp17',data);
                        	}
                        }).form('load',data);
                    }else{
                        $.messager.alert('提示信息',res.msg,'error');
                    }

                }
            })
        }
    }
}();