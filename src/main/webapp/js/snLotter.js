var snLotter=function(){
     /*列数据*/
     var columnArr=[
                    {field:'snCode',title:'抽奖码',width:'220',align:'center'},
                    {field:'consignee',title:'姓名',width:'120',align:'center'},
                    {field:'telephone',title:'电话',width:'220',align:'center'},
                    {field:'prize',title:'中奖金额',width:'100',align:'center'},
                    {field:'updateDate',title:'中奖时间',width:'200',align:'center',
                        formatter:function(value,row,index){
                            return Common.getLocalTime(value);
                        }
                    }
                ];
    /*获取数据
     * flag->标识是否显示行号，true显示，false不现实
     * columnArr->列数据
     * */
    var getData=function(flag,columnArr){
        $("#order").datagrid({
            url:rootPath+'v1/snLotter/getSnLotterList?'+Math.random(),
            pagination:true,
            method:'post',
            tok:'list',
			tov:'total',
            checkOnSelect:true,
            fitColumns:false,
            pageSize:10,
            rownumbers:flag,
            //frozenColumns:[[{field:'ck',checkbox:true}]],//固定列
            columns:[columnArr]
        });
    };
    /*查询数据*/
    var searchDataByForm=function(){
        $(".search-btn0718").click(function(){
        	$('#searchForm').form('submit', {
        		onSubmit: function(){
        			var isValid = $(this).form('validate');
        			if (!isValid){
        				Common.showMessage('有查询信息没有通过校验','error');
        			}
        			return isValid;	// return false will stop the form submission
        		},
        		success: function(){
        			$('#order').datagrid('load',{
                        startTime :$('.startDate').datebox('getValue'),
                        endTime   :$('.endDate').datebox('getValue'),
        			});
        		}
        	});
            
        });

    };
    /*查询信息重置*/
    var resetForm=function(){
        $(".reset-btn0718").click(function(){
            $("#searchForm").form('clear');
            $('#order').datagrid('load',{
                startTime :'',
                endTime   :''
            });
        });
    }
    /*限制日期选择日期不可以超过当前选择的日期*/
    var limitDate=function(){
        $('.startDate').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());//当前时间
                return d1>=date;
            }
        });
        $('.endDate').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());//当前时间
                return d1>=date;
            }
        });
    };
    /*到处表格*/
    var exportExcle=function(){
        $(".excle-btn0718").click(function(){
        	$(".excle-btn0718").attr('href',rootPath+'v1/snLotter/exportSnLottery');
        });
    }
    return {
        init:function(){
        	getData(false,columnArr);//获取表格数据
            limitDate();/*显示选择日期 */
            searchDataByForm();/*查询数据*/
            resetForm();//重置查询表单
            exportExcle();
        },
    }
}();
