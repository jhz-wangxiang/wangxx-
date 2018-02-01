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
    	<div class="column-content0718 goods-manager0719" id="baseInfor">
    		<h3 class="basetitle">1.商品基本信息</h3>
    		<form method="post" class="clearfix" id="baseForm" data-options="novalidate:true">
	    		<div class="baseinput"><p class="text_right l">商品标题：</p><input type="text" name="productName" class="editinput_0216 l easyui-validatebox" data-options="validType:['illegalCharacter','cHLength[30]'],required:true"/><p class="l">编号：自动生成</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">商品描述：</p><textarea class="describe editinput_0216 edittextarea_0216 l easyui-validatebox" name="describe" id="describe" data-options = "validType:'cHLength[200]',required:true"></textarea><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">重量：</p><input name="weight" type="text" class="editinput_0216 l easyui-validatebox" data-options = "validType:'betweenLength[0,10]',required:true"/><p class="l">kg</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">价格：</p><input name="productPrice" type="text" class="editinput_0216 l easyui-validatebox" data-options="validType:['positivenumber','betweenLength[0,6]'],required:true" /><p class="l">金币</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">库存：</p><input name="balance" type="text" class="editinput_0216 l easyui-validatebox" data-options="validType:['positivenumber','betweenLength[0,10]'],required:true" /><p class="l">件</p><div class="vspace"></div></div>
	    		<a class="btn_bg_common l" onclick="editFobo_fn.base_next_fn()">下一步</a>
    		</form>
    	</div>
    	<div id="nextbox" class="column-content0718 goods-manager0719" style="display:none">
    		<div class="cont-item0216">
			    <h3>2.图片上传</h3>
			    <h4>商品图片</h4>
			    <div class="upload-item0216">
			        <form name="plot-form" id="plotform" target="plotform_iframe" enctype="multipart/form-data" action="<%=basePath %>v1/product/insertBatchImage" method="post">
			        	<p class="title0216">
			        		<span>展示图</span><span>选择本地图片：</span>
							<label for="plot_id" class="upload-btn0216">图片上传</label><input type="file" name="picFile" id="plot_id" accept="image/jpeg , image/png" onchange="editFobo_fn.imgsubmit('plotform')"/>
							<input type="hidden" name="productId"/>
							<input type="hidden" name="imageUsedType" value="PLOT"/>
							<input type="hidden" name="keyId" value="plot_list"/>
						</p>
					</form><iframe id="plotform_iframe" name="plotform_iframe" style="display:none;"></iframe>
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传1张图片。</p>
			        <div class="img0216" ><img src="<%=basePath %>image/defaultImg.png" width="160px" id="plot_list" height="147"/></div>
			    </div>
			    <div class="upload-item0216">
			        <form name="order-form" id="orderform" target="orderform_iframe" enctype="multipart/form-data" action="<%=basePath %>v1/product/insertBatchImage" method="post">
			        	<p class="title0216">
			        		<span>展示图</span><span>选择本地图片：</span>
							<label for="order_id" class="upload-btn0216">图片上传</label><input type="file" name="picFile" id="order_id" accept="image/jpeg , image/png" onchange="editFobo_fn.imgsubmit('orderform')"/>
							<input type="hidden" name="productId"/>
							<input type="hidden" name="imageUsedType" value="ORDER"/>
							<input type="hidden" name="keyId" value="order_list"/>
						</p>
					</form><iframe id="orderform_iframe" name="orderform_iframe" style="display:none;"></iframe>
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传1张图片。</p>
			        <div class="img0216"><img src="<%=basePath %>image/defaultImg.png" width="160px" id="order_list" height="147"/></div>
			    </div>
			    <div style="height: 20px;"></div>
			</div>
			<div class="cont-item0216">
			    <div class="upload-item0216 upload-lb0216" style="width: 100%;">
			    <form name="car-form" id="carform" target="carform_iframe" enctype="multipart/form-data" action="<%=basePath %>v1/product/insertBatchImage" method="post">
			        <p class="title0216">
			        	<span>展示轮播图</span><span>选择本地图片：</span>
			        	<label for="pFile" class="upload-btn0216">文件上传</label><input type="file" id="pFile" name="picFile" accept="image/jpeg , image/png" multiple onchange="editFobo_fn.imgsubmit('carform')"/>
			        	<input type="hidden" name="productId"/>
						<input type="hidden" name="imageUsedType" value="SHOW"/>
						<input type="hidden" name="keyId" value="car_list"/>
			        </p>
			    </form><iframe id="carform_iframe" name="carform_iframe" style="display:none;"></iframe>
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传5张图片。</p>
			       <div class="lb-list0216" id="car_list"></div>
			        <div style="height: 20px;"></div>
			    </div>
			</div>
			<div class="cont-item0216">
			    <div class="upload-item0216 upload-lb0216" style="width: 100%;">
			    	<form name="det-form" id="detform" target="detform_iframe" enctype="multipart/form-data" action="<%=basePath %>v1/product/insertBatchImage" method="post">
				        <p class="title0216">
				        	<span>详情图</span><span>选择本地图片：</span>
				        	<label for="dFile" class="upload-btn0216">文件上传</label><input type="file" id="dFile" name="picFile" multiple accept="image/jpeg , image/png" multiple onchange="editFobo_fn.imgsubmit('detform')"/>
				        	<input type="hidden" name="productId"/>
							<input type="hidden" name="imageUsedType" value="DETAIL"/>
							<input type="hidden" name="keyId" value="det_list"/>
				        </p>
				    </form><iframe id="detform_iframe" name="detform_iframe" style="display:none;"></iframe>			    			    			    			    			        
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：1280x700</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传5张图片。</p>
			        <div id="det_list"></div>
			        <div style="height: 20px;"></div>
			    </div>
			</div>
			<div class="cont-item0216">
			    <h3>3.其他信息</h3>
			    <div class="info0216">
			        <div style="overflow: hidden;clear: both">
			            <div>库存记数：</div><div><input type="checkbox" checked />立减库存</div>
			        </div>
			        <div style="overflow: hidden;clear: both">
			            <div>开始时间：</div>
			            <div>
			               <div style="overflow: hidden;clear: both">
			                   <div><input type="radio" name="status" id="s1" value="1" checked />立刻上架</div>
			               </div>
			                <div style="overflow: hidden;clear: both">
			                    <div><input type="radio" name="status" id="s2" value="2" />定时上架<input class="easyui-datetimebox " name="time" type="issuedDateStr" id="issuedDateStr" style="width: 180px;height: 30px;" data-options="editable:false" ></div>
			                </div>
			                <div style="overflow: hidden;clear: both">
			                    <div><input type="radio" name="status" id="s0" value="0" />放入仓库，暂不上架</div>
			                </div>
			            </div>
			        </div>
			        <div style="overflow: hidden;clear: both">
			            <div>商品权重：</div><div><input type="text"  class="editinput_0216" name="sort" id="sort" style="width: 50px;border-radius: 5px;" /></div>
			        </div>
			    </div>
			    <div style="height: 20px;"></div>
			</div>
			<div style="text-align: center;margin-top: 20px;">
			    <a href!="#" class="relBtn" onclick="editFobo_fn.releaseSub()" style="display: inline-block;width: 100px;height: 50px;line-height: 50px;background-color: green;color: #ffffff;font-size: 18px;text-align: center;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;">发布</a>
			</div>
    	</div>
    </div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/delFoboGoods.js'></script>
<script>
var rootPath='<%=basePath%>';
var search = location.search;
var productId;
var editFobo_fn = {
	base_next_fn:function(){
		$("#baseForm").form("submit",{
			url:rootPath+"v1/product/insertAppProduct",
			onSubmit: function(){
				return $(this).form('enableValidation').form('validate');	
			},
			success:function(json){
				$("#baseInfor").hide();
				$("#nextbox").show();
				var json = eval('('+json+')');
				productId=json.productId;
				$('input[name="productId"]').val(json.productId);
				
			}
		});
	},
	imgsubmit:function(id){
		$("#"+id).submit();
		Common.loading_mask();
        var obj = document.getElementById(id) ;
        obj.outerHTML=obj.outerHTML;
	},
	productParms_fn:function(productId){
		$.ajax({
			url:rootPath+"/v1/product/getProductByParms",
			method:"post",
			data:{
				productId:productId
			},
			success:function(json){
				var json = eval('('+json+')');
				$("input[name='productName']").val(json[0].productName);
				$("#describe").html(json[0].describe);
				$("input[name='weight']").val(json[0].weight);
				$("input[name='productPrice']").val(json[0].productPrice);
				$("input[name='balance']").val(json[0].balance);
			}
		});
	},
	showImgList:function(type,id){
		$.ajax({
			url:rootPath+"/v1/product/getImageByPorduct",
			data:{
				imageUsedType:type,
				productId:productId
			},
			method:"post",
			success:function(json){				
				var json = eval('('+json+')');
				switch (id) {
				case "plot_list":
                    if(json.length==0){
                        return false;
                    }
				    $('#plot_list').attr('src',json[0].ossUrl);
					break;
				case "order_list":
                    if(json.length==0){
                        return false;
                    }
                    $('#order_list').attr('src',json[0].ossUrl);
					break;
				case "car_list":
                    if(json.length==0){
                        $('#car_list').html('');
                        return false;
                    }
                    initLunBoImg(json);
					break;
					case "det_list":
                        if(json.length==0){
                            $('#det_list').html('');
                            return false;
                        }
                        initDetailImg(json);
						break;
				default:
					break;
				}
			}
		});
	},
	releaseSub:function(){
		var status=$('input[name="status"]:checked').val();
	    var sort=$('#sort').val();
	    if(validateRules.isNull(ltrim(sort)) || !new RegExp("^[0-9]*$").test(sort) || sort.length>3){
            $.messager.alert('提示信息','商品权重不能为空，且只能为正整数，长度不能超过3位','warn');
            return false;
		}
	    var obj={"productId":$('input[name="productId"]').val(),"status":status,"sort":sort};
	    if(status==2){
			var time=$('#issuedDateStr').datetimebox('getValue');
			if(time==''){
				$.messager.alert('提示信息','请选择定时上架的时间','warn');
				return;
			}else{
				obj.issuedDateStr=time;
			}
			
		}
        $.ajax({
            url:rootPath+'/v1/product/updateProduct',
			method:"post",
			data:obj,
			success:function (res) {
                var json = eval('('+res+')');
				if(json.resultCode=="SUCCESS"){
					location.href=rootPath+'v1/product/foboGoodsPage';
				}else{
                    $.messager.alert('提示信息',json.msg,'warn');
				}
            }
		})
	}
};

function uploadPicBatch(obj){
	$("#load").remove();
	switch(obj.keyId){
	case "plot_list":
		$("#plot_list").attr('src',obj.urlPic[0].ossUrl);
		break;
	case "order_list":
		$("#order_list").attr('src',obj.urlPic[0].ossUrl);
		break;
	case "car_list":
        initLunBoImg(obj.urlPic);
		break;
	case "det_list":
        initDetailImg(obj.urlPic);
		break;
		default:{
			$('#'+obj.keyId).attr('src',obj.urlPic[0].ossUrl)
		}
	}
}
function initLunBoImg(arr) {
    var carArr=[];
    for(var i=0,data=arr;i<data.length;i++){
        carArr.push('<div class="img0216 lunbo0216">');
        carArr.push('<a href!="#" class="close0216" onclick="delFaboGoods.delImgOpera('+data[i].imageId+',\'car_list\')"></a>');
        carArr.push('<img src="'+data[i].ossUrl+'"  alt="展示图片" width="160" height="147" id="car'+data[i].imageId+'">');
        carArr.push('<div class="opear0216">');
        carArr.push('<form name="rep-form'+data[i].imageId+'" id="repform'+data[i].imageId+'" target="repform_iframe'+data[i].imageId+'" enctype="multipart/form-data" action="'+rootPath+'v1/product/insertBatchImage" method="post">');
        carArr.push('<label class="btn0216" for="img'+data[i].imageId+'">替换</label><span>排序</span><input type="text" class="txt0216" onblur="delFaboGoods.updateSort('+data[i].imageId+',this.value,\'car_list\')" value="'+data[i].imageUsedSort+'" />');
        carArr.push('<input type="file" id="img'+data[i].imageId+'"name="picFile" accept="image/jpeg , image/png" onchange="editFobo_fn.imgsubmit(\'repform'+data[i].imageId+'\')">');
        carArr.push('<input type="hidden" name="productId" value="'+data[i].productId+'"/>');
        carArr.push('<input type="hidden" name="imageUsedType" value="SHOW"/>');
        carArr.push('<input type="hidden" name="keyId" value="car'+data[i].imageId+'"/>');
        carArr.push('</form><iframe id="repform_iframe'+data[i].imageId+'" name="repform_iframe'+data[i].imageId+'" style="display:none;"></iframe></div></div>');
    }
    $('#car_list').html(carArr.join(''));
}
function initDetailImg(arr) {
    var detArr=[];
    for(var i=0,data=arr;i<data.length;i++){
        detArr.push('<div class="d-item0216" >');
        detArr.push('<a href!="#" class="close0216" onclick="delFaboGoods.delImgOpera('+data[i].imageId+',\'det_list\')"></a>');
        detArr.push('<img width="640" src="'+data[i].ossUrl+'" alt="展示图片" id="det'+data[i].imageId+'" > ');
        detArr.push('<div class="opear0216">');
        detArr.push('<form name="det-form'+data[i].imageId+'" id="detform'+data[i].imageId+'" target="detform_iframe'+data[i].imageId+'" enctype="multipart/form-data" action="'+rootPath+'v1/product/insertBatchImage" method="post">');
        detArr.push('<label class="btn0216" for="img'+data[i].imageId+'">替换</label><span>排序</span><input type="text" class="txt0216" value="'+data[i].imageUsedSort+'" onblur="delFaboGoods.updateSort('+data[i].imageId+',this.value,\'det_list\')" />');
        detArr.push('<input type="file" id="img'+data[i].imageId+'" name="picFile" accept="image/jpeg , image/png" onchange="editFobo_fn.imgsubmit(\'detform'+data[i].imageId+'\')">');
        detArr.push('<input type="hidden" name="productId" value="'+data[i].productId+'"/>');
        detArr.push('<input type="hidden" name="imageUsedType" value="DETAIL"/>');
        detArr.push('<input type="hidden" name="keyId" value="det'+data[i].imageId+'"/>');
        detArr.push('</form><iframe id="detform_iframe'+data[i].imageId+'" name="detform_iframe'+data[i].imageId+'" style="display:none;"></iframe></div></div>');
    }
    $('#det_list').html(detArr.join(''));
}
</script>
</body>
</html>