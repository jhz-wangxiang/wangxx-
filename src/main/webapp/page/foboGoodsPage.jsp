<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>
<div class="container0718 clearfix">
	<jsp:include page="leftNav.jsp">
		<jsp:param name="nav" value="focusPicturePage"/>
    </jsp:include>
    <div class="left content0718">
    	<div class="column-content0718 goods-manager0719">
    		<a href="<%=basePath %>v1/product/insertFoboGoodsPage" class="btn_bg_common r">新增</a>
    		<div class="vspace"></div>
    		<span class="btn_common l">商品数量：<i id="znum"></i></span>
    		<span class="btn_common l">上架中：<i id="unum"></i></span>
    		<span class="btn_common l">已下架：<i id="dnum"></i></span>
    	</div>
    	<div class="clear"></div>
    	<div class="column-content0718 goods-manager0719 table-cont1216" >
            <table id="fgp" style="width: 956px;"></table>
        </div>
    </div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script>
var rootPath='<%=basePath%>';

var IsCheckFlag = true; //标示是否是勾选复选框选中行的，true - 是 , false - 否
var flag = true;
$("#fgp").datagrid({
    url:rootPath+'v1/product/getAllfoboBalance?'+Math.random(),
    method:'post',
    queryParams:{
    	productTo:"APP"
    },
    tok:'list',
	tov:'total',
	pagination:true,
	rownumbers:true,
    columns:[[
		{field:'productName',title:'商品名称',width:'200',align:'center'},
		{field:'productNo',title:'商品编号',width:'150',align:'center'},
		{field:'productPrice',title:'单价',width:'100',align:'center'},
		{field:'sort',title:'权重',width:'50',align:'center',formatter:function(value,row,index){
            return '<input id="'+row.productId+'" class="textbox" type="text" value="'+value+'" style="width:40px;text-align:center" onblur = "fn_product_control.sort_fn(this)"/>';
        }},
        {field:'status',title:'状态',width:'100',align:'center',formatter:function(value,row,index){
        	//1上架
        	if(value==1){
        		return "上架";
        	}else if(value==2){
        		return "上架中";
        	}else{
        		return "下架";
        	}
            /* return (value==1?"上架":"下架"); */
        }},
        {field:'issuedDate',title:'时间',width:'100',align:'center',formatter:function(value,row,index){
            return Common.getLocalDate(value);
        }},
        {field:'balance',title:'库存',width:'100',align:'center',formatter:function(value,row,index){
            return '<input id="'+row.productId+'" class="textbox" type="text" value="'+value+'" style="width:80px;text-align:center" onblur = "fn_product_control.balance_fn(this)"/>';
        }},
        {field:'operation',title:'操作',width:'100',align:'center',formatter:function(value,row,index){
        	var html = "";
        	if(row.status==1){
        		html = '<a class="btn detail-btn0719" href="'+rootPath+'v1/product/findFoboGoodsPage?productId='+row.productId+'">查看</a><a class="btn cancel-btn0719" style="display:inline-block" onclick = "fn_product_control.status_fn(\''+row.productId+'\',\'0\')">下架</a>';
        	}else{
        		html = '<a class="btn detail-btn0719" href="'+rootPath+'v1/product/editFoboGoodsPage?productId='+row.productId+'">修改</a><a class="btn cancel-btn0719" style="display:inline-block" onclick = "fn_product_control.status_fn(\''+row.productId+'\',\'1\')">上架</a>';
        	}
            return html;
        }}
    ]],
    onClickCell: function (rowIndex, field, value) {
        IsCheckFlag = false;
    },
    onSelect: function (rowIndex, rowData) {
        if (!IsCheckFlag) {
            IsCheckFlag = true;
            $("#fgp").datagrid("unselectRow", rowIndex);
        }
    },
    onUnselect: function (rowIndex, rowData) {
        if (!IsCheckFlag) {
            IsCheckFlag = true;
            $("#fgp").datagrid("selectRow", rowIndex);
        }
    }
});
var fn_product_control = {
	product_num:function(){
		$.ajax({
			url:rootPath+'v1/product/getProductStatusNum',
			success:function(json){
				var msg = eval('('+json+')');
				$("#znum").html(msg.znum);
				$("#dnum").html(msg.dnum);
				$("#unum").html(msg.unum);
			}
		});
	},
	product_update_ajax:function(data){
		if(flag){
			flag = false;
			$.ajax({
				url:rootPath+'v1/product/updateProduct',
				method:"post",
				data:data,
				success:function(json){
					flag = true;
					$("#fgp").datagrid('reload');
					fn_product_control.product_num();
				}
			});
		}
	},
	sort_fn:function(obj){
		if(!new RegExp("^[0-9]*$").test(obj.value)){
			$.messager.alert('提示','请输入正整数','error');
			return false;
		}
		if(obj.value.length>3){
			$.messager.alert('提示','最大三位数','error');
			return false;
		}
		if(obj.value!=""){
			var data = {
				productId:obj.id,
				sort:obj.value
			}
			fn_product_control.product_update_ajax(data);
		}
	},
	balance_fn:function(obj){
		if(!new RegExp("^[0-9]*$").test(obj.value)){
			$.messager.alert('提示','请输入正整数','error');
			return false;
		}
		if(obj.value!=""){
			var data = {
				productId:obj.id,
				balance:obj.value
			}
			fn_product_control.product_update_ajax(data);
		}
	},
	status_fn:function(productId,status){
		var data = {
			productId:productId,
			status:status
		}
		fn_product_control.product_update_ajax(data);
	}
}
fn_product_control.product_num();
</script>
</body>
</html>