/**
 * Created by 111 on 2017/2/17.
 */
var delFaboGoods={
    /*
    * id:图片id
    * tid:删除类别id
    * */
    delImgOpera:function (id,tId) {
        $.messager.confirm({
            title: '提示信息',
            msg: '确定要删除选择的数据',
            fn: function (r) {
                if (r) {
                    Common.loading_mask();
                    $.ajax({
                        url: rootPath + "v1/product/deleteImage",
                        method:"post",
                        data: {"imageId":id},
                        success: function (data) {
                            $('#load').remove();
                            /*$.messager.alert('提示信息', data.msg, 'warn');*/
                            switch (tId){
                                case "car_list":
                                    editFobo_fn.showImgList('SHOW','car_list');
                                    break;
                                case "det_list":
                                    editFobo_fn.showImgList('DETAIL','det_list');
                                    break;
                                default:;
                            }

                        }
                    });
                }
            },
            onBeforeClose: function () {

            }
        });
        
    },
    updateSort:function (id,val,tId) {
        if(!new RegExp("^[0-9]*$").test(val)){
            $.messager.alert('提示','请输入正整数','error');
            return false;
        }
        if(val.length>2){
            $.messager.alert('提示','最大三位数','error');
            return false;
        }
        if(val!=""){
            Common.loading_mask();
                $.ajax({
                    url:rootPath+'v1/product/updateImage',
                    method:"post",
                    data:{
                        "imageId":id,
                        "imageUsedSort":val
                    },
                    success:function(json){
                        $('#load').remove();
                        switch (tId){
                            case "car_list":
                                editFobo_fn.showImgList('SHOW','car_list');
                                break;
                            case "det_list":
                                editFobo_fn.showImgList('DETAIL','det_list');
                                break;
                            default:;
                        }

                    }
                });
        }
    }
}