var flag = true;
var salePP_fn = {
	imgup:function(id){
		$("#"+id).submit();
		Common.loading_mask();
        var obj = document.getElementById(id) ;
        obj.outerHTML=obj.outerHTML;
	},
	imghtml:function(json){
		var html = [];
		for (var i = 0,len = json.length;i<len;i++) {
			html.push('<li><div class="img">');
			html.push('<img src="'+json[i].ossUrl+'" width="700" id="ossUrl'+json[i].imageId+'"/><span class="close" onclick="salePP_fn.deleteR(\''+json[i].imageId+'\')"></span></div>');
			html.push('<div class="text">');
			html.push('<span class="l">排序</span><input type="text" id="'+json[i].imageId+'" name="sort'+json[i].imageId+'" class="sort" value="'+json[i].imageUsedSort+'" onblur = "salePP_fn.fullNumberName(this)" />');
			html.push('<form name="img-one-form'+json[i].imageId+'" id="img-one-form'+json[i].imageId+'" target="img_one_iframe'+json[i].imageId+'" enctype="multipart/form-data" action="'+rootPath+'v1/product/updatePicFile" method="post">');
			html.push('<label for="img_one_input'+json[i].imageId+'" class="replace">图片替换</label><input type="file" name="picFile" id="img_one_input'+json[i].imageId+'" class="replace_file" accept="image/jpeg , image/png" onchange="salePP_fn.imgup(\'img-one-form'+json[i].imageId+'\')"/>');
			html.push('<input type="hidden" name="ImageId" value="'+json[i].imageId+'"/></form><iframe id="img_one_iframe'+json[i].imageId+'" name="img_one_iframe'+json[i].imageId+'" style="display:none;"></iframe></div></li>');
		}
		return html.join('');
	},
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
						location.reload();
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
						location.reload();
					}
				})
		    }
		});
	}
};
function uploadPic(obj){
	$('#load').remove();
	location.reload();
}
/*多图*/
function uploadPicBatch(obj){
	$('#load').remove();
	location.reload();
}
$.ajax({
	url:rootPath+'v1/product/getImageByPorduct',
	method:"post",
	data:{
		imageUsedType:"SALE"
	},
	success:function(json){
		var json = eval('('+json+')');
		$(".spp_list").html(salePP_fn.imghtml(json));
	}
});