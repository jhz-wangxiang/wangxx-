var swMerchants = function(){    /*查询*/    var initSearchCondi=function () {        dateBoxInit($('#startTime'));        dateBoxInit($('#endTime'));        function dateBoxInit(ele,date) {            ele.datebox({                formatter:dateFormatter,                parser:dateParser,                value:date,                onSelect:onSelectDateFun            });        }    };    function dateFormatter(date) {        var y = date.getFullYear();        var m = date.getMonth()+1;        var d = date.getDate();        return y+'/'+(m<10?('0'+m):m)+'/'+(d<10?('0'+d):d)//+' '+(date.getHours() < 10 ? '0'+date.getHours() :date.getHours())+':'+(date.getMinutes() < 10 ? '0'+date.getMinutes() : date.getMinutes())+":"+(date.getSeconds() <10 ? '0'+date.getSeconds() : date.getSeconds());    }    function dateParser(s){        if (!s) return new Date();        var ss = (s.split('/'));        var se=ss[2].split(' ');        var y = parseInt(ss[0],10);        var m = parseInt(ss[1],10);        var d = parseInt(se[0],10);//        var h0 = se[1].split(':');//        var h=parseInt(h0[0],10);//        var mu=parseInt(h0[1],10);//        var sec=parseInt(h0[2],10);        if (!isNaN(y) && !isNaN(m) && !isNaN(d)){            return new Date(y,m-1,d);        } else {            return new Date();        }    }    /*时间显示*/    function onSelectDateFun(d) {        var start_id='',end_id='',sDate='',endDate='',msg='';        if(this.id.indexOf('start')>-1){//开始时间            start_id=this.id;//开始时间            end_id=getDateId(start_id);//结束时间            msg='开始日期不大于结束日期!';        }else{//结束时间            end_id=this.id;//开始时间            start_id=getDateId(end_id);//结束时间            msg='结束日期不小于开始日期!';        }        sDate=new Date($('#'+start_id).datetimebox('getValue'));        endDate=new Date($('#'+end_id).datetimebox('getValue'));        if (sDate > endDate) {            $.messager.alert("提示", msg,'info');            //只要选择了日期，不管是开始或者结束都对比一下，如果结束小于开始，则清空结束日期的值并弹出日历选择框            $('#'+end_id).datebox('setValue', '');        }    }    function getDateId(startId) {        var $ele_id='';        switch (startId){            case 'startTime':                $ele_id= 'endTime';                break;            case 'endTime':                $ele_id='startTime';                break;            default:                $ele_id='endTime';        }        return $ele_id;    };    var searchFn=function () {        $('#searchBtn').click(function () {            var param={                "companyName":$('#companyName').textbox('getValue'),                "address":$('#address').textbox('getValue'),                "industry":$('#industry').textbox('getValue'),                "name":$('#name').textbox('getValue'),                "phone":$('#phone').textbox('getValue'),                "email":$('#email').textbox('getValue'),                "createDateStart":$('#startTime').datetimebox('getValue'),                "createDateEnd":$('#endTime').datetimebox('getValue')            }            getOrderData(param);            var str = [];    			for (var s in param) {    			  str.push(encodeURIComponent(s) + "=" + encodeURIComponent(param[s]));    			}			$("#daochu").attr("href",rootPath+"v1/merchants/exportMerchants?"+str.join("&"))			        });    };    /*获取商品动态*/    var getOrderData=function(param){        $("#operationLog").datagrid({        	url:rootPath+'v1/merchants/getMerchantsPage',            queryParams:param,            tok:'list',            tov:'total',            singleSelect: true,            rownumbers: true,            pagination:true,            striped:true,			pageSize:20,            columns:[[                {field:'createDate',title:'提交时间',width:'130',align:'center',formatter:function(value,row,index){                	return Common.getLocalTime(value);                }},                {field:'companyName',title:'公司名称',width:'150',align:'center'},                {field:'address',title:'所在城市',width:'100',align:'center'},                {field:'industry',title:'所属行业',width:'100',align:'center'},                {field:'name',title:'联系人姓名',width:'90',align:'center'},                {field:'phone',title:'联系人电话',width:'120',align:'center'},                {field:'email',title:'联系人邮箱',width:'150',align:'center'},            ]]        });    };    return {        init: function () {            initSearchCondi();//初始化查询条件            searchFn();            getOrderData('');        },        daochu:function(){        	        }    }}();