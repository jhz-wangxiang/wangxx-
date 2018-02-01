var IsCheckFlag = true; //标示是否是勾选复选框选中行的，true - 是 , false - 否
var flag = true;
$("#fpp").datagrid({
    url:rootPath+'v1/product/getImageByPorduct?'+Math.random(),
    method:'post',
    queryParams: {
    	imageUsedType: 'AD'
	},
	rownumbers:true,
    columns:[[
		{field:'ossUrl',title:'标题图片',width:'500',align:'center',formatter:function(value,row,index){
            return '<img src="'+value+'" width="500" height="150"/>';
        }},
		{field:'imageUsedSort',title:'排序',width:'100',align:'center',formatter:function(value,row,index){
			return '<input id="'+row.imageId+'" class="textbox" type="text" value="'+value+'" style="width:50px;text-align:center" onblur = "function_all.fullNumberName(this)"/>'
		}},
		{field:'productName',title:'对应商品',width:'170',align:'center'},
		{field:'op',title:'操作',width:'130',align:'center',formatter:function(value,row,index){
            return '<a class="btn detail-btn0719" href="javascript:function_all.img_edit(\''+row.ossUrl+'\',\''+row.productId+'\',\''+row.imageId+'\');">编辑</a><a class="btn cancel-btn0719" style="display:inline-block" onclick = "function_all.deleteR('+row.imageId+')">删除</a>';
        }}
    ]],
    onClickCell: function (rowIndex, field, value) {
        IsCheckFlag = false;
    },
    onSelect: function (rowIndex, rowData) {
        if (!IsCheckFlag) {
            IsCheckFlag = true;
            $("#fpp").datagrid("unselectRow", rowIndex);
        }
    },
    onUnselect: function (rowIndex, rowData) {
        if (!IsCheckFlag) {
            IsCheckFlag = true;
            $("#fpp").datagrid("selectRow", rowIndex);
        }
    }
});
$("#w").window({
	onBeforeOpen:function(){
		$("#sel").combobox({
			url:rootPath+"v1/product/getFoboProduct",
			method:"get",
			editable:false,
			valueField:'productId',
		    textField:'productName'
		});
	}
});
var function_all = {
	fullNumberName:function(obj){
		if(!new RegExp("^[0-9]*$").test(obj.value)){
			$.messager.alert('提示','请输入正整数','error');
			return false;
		}
		if(obj.value.length>3){
			$.messager.alert('提示','最大三位数','error');
			return false;
		}
		if(obj.value!=""){
			if(flag){
				flag = false;
				$.ajax({
					url:rootPath+'v1/product/updateImage',
					method:"post",
					data:{
						"imageId":obj.id,
						"imageUsedSort":obj.value
					},
					success:function(json){
						flag = true;
						$("#fpp").datagrid('reload');
					}
				});
			}
		}
	},
	deleteR:function(id){
		$.messager.confirm('提示','确定删除么？',function(r){
		    if (r){
				$.ajax({
					url:rootPath+'v1/product/deleteImage',
					data:{"imageId":id},
					method:"post",
					success:function(json){
						$("#fpp").datagrid('reload');
					}
				})
		    }
		});
	},
	imgup:function(id){
		$("#"+id).submit();
		Common.loading_mask();
        var obj = document.getElementById(id) ;
        obj.outerHTML=obj.outerHTML;
	},
	img_fn:function(imgId){
		var productId = $("#sel").combobox("getValue");
		var ossUrl = $("input[name='ossUrl']").val();
		var url,data;
		if(arguments.length>0){
			url = rootPath+'v1/product/updateImage';
			data = {
				productId:productId,
				ossUrl:ossUrl,
				imageId:imgId
			}
		}else{
			url = rootPath+'v1/product/insertImage';
			data = {
				productId:productId,
				imageUsedSort:"1",
				imageUsedType:"AD",
				ossUrl:ossUrl
			}
		}
		
		if(productId==""&&ossUrl==""){
			$.messager.alert('提示','提交失败','error');
			return false;
		}
		this.imgAjax(url,data);
		
	},
	imgAjax:function(url,data){
		if(flag){
			flag = false;
			$.ajax({
				url:url,
				method:"post",
				data:data,
				success:function(json){
					flag = true;
					$("#fpp").datagrid('reload');
					$('#w').window('close');
					$("#show_img").remove();
					$("input[name='ossUrl']").val("");
				}
			});
		}
	},
	img_edit:function(imgUrl,pId,imgId){
		$("#show_img").remove();
		$("#w").prepend('<img src="'+imgUrl+'" id="show_img" width="640" height="200"/>');
		$("input[name='ossUrl']").val(imgUrl);
		$('#w').window('open');
		$("#sel").combobox("setValue",pId);
		$("#img_edit_btn").unbind("click");
		$("#img_edit_btn").bind("click",function(){
			function_all.img_fn(imgId);
		});
	},
	img_add:function(){
		$("#show_img").remove();
		$("input[name='ossUrl']").val("");
		$('#w').window('open');
		$("#img_edit_btn").unbind("click");
		$("#img_edit_btn").bind("click",function(){
			function_all.img_fn();
		});
	},	getbannertime:function(){		if(flag){			flag = false;			$.ajax({				url:rootPath+"v1/product/getBannerTime",				success:function(json){					flag = true;					$("#bannertime").val(json)				}			});		}	},	setbannertime:function(){		if($("#bannertime").val()==""){			return false;		}		if(flag){			flag = false;			$.ajax({				url:rootPath+"v1/product/setBannerTime",				method:"post",				data:{bannerTime:$("#bannertime").val()},				success:function(json){					flag = true;					//$("#bannertime").val(json)					$.messager.alert('提示','提交成功','info');				}			});		}	}
}
function uploadPic(obj){
	$('#load').remove();
	$("#show_img").remove();
	$("#w").prepend('<img src="'+obj.urlPic+'" id="show_img" width="640" height="200"/>');
	$("input[name='ossUrl']").val(obj.urlPic);
}/**/function_all.getbannertime();