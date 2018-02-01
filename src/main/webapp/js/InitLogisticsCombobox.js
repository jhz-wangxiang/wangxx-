/**
 * Created by 111 on 2017/4/8.
 * 初始化新增物流页面和编辑物流页面下拉框和时间
 */
var InitLogisticsCombobox=function () {
    var cur_time=new Date();
    /*初始化下拉框*/
    var initCombobox=function () {
        var sendGoodsTypeArr=[{"id":"","value":"---请选择---"},{"id":"发货","value":"发货"},{"id":"返货","value":"返货"}];
        /*发货类型*/
        comboboxInit($('#sendGoodsType'),sendGoodsTypeArr,'');
        /*订单状态*/
        var orderStatusTypeArr=[{"id":"","value":"---请选择---"},{"id":"待收","value":"待收"},{"id":"签收","value":"签收"},{"id":"拒收","value":"拒收"},{"id":"退货","value":"退货"},{"id":"取消订单","value":"取消订单"}];
        comboboxInit($('#orderStatus'),orderStatusTypeArr,'');
        /*订单类型*/
        var orderTypeArr=[{"id":"","value":"---请选择---"},{"id":"销售","value":"销售"},{"id":"赠送","value":"赠送"},{"id":"样品","value":"样品"},{"id":"调拨","value":"调拨"},{"id":"退货","value":"退货"},{"id":"退货补发","value":"退货补发"}];
        comboboxInit($('#orderType'),orderTypeArr,'');
        /*是否代收款*/
        var ynPaymentReceivedArr=[{"id":"","value":"---请选择---"},{"id":"是","value":"是"},{"id":"否","value":"否"}];
        comboboxInit($('#ynPaymentReceived'),ynPaymentReceivedArr,'');

        /*是否理赔*/
        comboboxInit($('#exp10'),ynPaymentReceivedArr,'');
        /*理赔状态*/
        var exp12Arr=[{"id":"","value":"---请选择---"},{"id":"已理赔","value":"已理赔"},{"id":"未理赔","value":"未理赔"}];
        comboboxInit($('#exp12'),exp12Arr,'');
        var exp13Arr=[{"id":"","value":"---请选择---"},{"id":"专票","value":"专票"},{"id":"普票","value":"普票"},{"id":"电子发票","value":"电子发票"}];
        /*发票类型*/
        comboboxInit($('#exp13'),exp13Arr,'')
        /*拒收（退货）签收*/
        var exp16Arr=[{"id":"","value":"---请选择---"},{"id":"签收","value":"签收"},{"id":"待签收","value":"待签收"}];
        comboboxInit($('#exp16'),exp16Arr,'');
        /*是否回款*/
        comboboxInit($('#huikuan'),ynPaymentReceivedArr,'');
        /*是否结算*/
        comboboxInit($('#jiesuan'),ynPaymentReceivedArr,'');
        /*物流状态*/
        var logisticsStatusArr=[{"id":"","value":"---请选择---"},{"id":"已发货","value":"已发货"},{"id":"未发货","value":"未发货"}];
        comboboxInit($('#logisticsStatus'),logisticsStatusArr,'');
        function comboboxInit(elem,data,val) {
            elem.combobox({
                data:data,
                editable:false,
                panelHeight:'auto',
                valueField:'id',
                textField:'value',
                value:val
            });
        };
    };
    /*初始化时间*/
    var intiDateBox=function () {

        /*订单日期*/
        dateBoxInit($('#orderDate'));

        /*回款日期*/
        dateBoxInit($('#collectionDate'));

        /*费用计算日期*/
        dateBoxInit($('#costCalculationDate'));
        /*出货时间计算日期*/
        dateBoxInit($('#exp6'));
        /*发票发送日期*/
        dateBoxInit($('#exp5'));
        /*跟单时间*/
        dateBoxInit($('#exp1'));
        /*拒收（返货）签收时间*/
        dateBoxInit($('#exp17'));

        /*签收时间*/
        dateBoxInit($('#exp14'));
        function dateBoxInit(ele,date) {
            ele.datebox({
                formatter:dateFormatter,
                parser:dateParser,
                value:date
            });
        }
    };
    function dateFormatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth()+1;
        var d = date.getDate();
        return y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d);
    }
    function dateParser(s){
        if (!s) return new Date();
        var ss = (s.split('/'));
        var y = parseInt(ss[0],10);
        var m = parseInt(ss[1],10);
        var d = parseInt(ss[2],10);
        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
            return new Date(y,m-1,d);
        } else {
            return new Date();
        }
    }
    return {
        init: function () {
            initCombobox();
            intiDateBox();
        }
    }
}();
