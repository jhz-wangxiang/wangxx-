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
    		<h3 class="basetitle">1.商品基本信息</h3>
    		<form method="post" class="clearfix" id="baseForm" data-options="novalidate:true">
	    		<div class="baseinput"><p class="text_right l">商品标题：</p><input type="text" name="productName" readonly id="productName" class="editinput_0216 l" /><p class="l">编号：自动生成</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">商品描述：</p><textarea id="describe" readonly class="describe editinput_0216 edittextarea_0216 l" ></textarea><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">重量：</p><input name="weight" readonly id="weight" type="text" class="editinput_0216 l" /><p class="l">kg</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">价格：</p><input name="productPrice" readonly id="productPrice" type="text" class="editinput_0216 l"  /><p class="l">金币</p><div class="vspace"></div></div>
	    		<div class="baseinput"><p class="text_right l">库存：</p><input name="balance" readonly id="balance" type="text" class="editinput_0216 l" /><p class="l">件</p><div class="vspace"></div></div>
	    		<!-- <a class="btn_bg_common l" onclick="editFobo_fn.base_next_fn()">下一步</a> -->
    		</form>
    	</div>
    	<div id="nextbox" class="column-content0718 goods-manager0719">
    		<div class="cont-item0216">
			    <h3>2.图片上传</h3>
			    <h4>商品图片</h4>
			    <div class="upload-item0216">		       
		        	<p class="title0216">
		        		<span>展示图</span><span>选择本地图片：</span>						
					</p>					
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传1张图片。</p>
			        <div class="img0216" ><!-- <a href!="#" class="close0216"></a> --><img src="<%=basePath %>image/defaultImg.png" width="160px" id="plot_list" height="147"/></div>
			    </div>
			    <div class="upload-item0216">
			        	<p class="title0216">
			        		<span>展示图</span><span>选择本地图片：</span>
						</p>
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传1张图片。</p>
			        <div class="img0216"><!-- <a href!="#" class="close0216"></a> --><img src="<%=basePath %>image/defaultImg.png" width="160px" id="order_list" height="147"/></div>
			    </div>
			    <div style="height: 20px;"></div>
			</div>
			<div class="cont-item0216">
			    <div class="upload-item0216 upload-lb0216" style="width: 100%;">
			        <p class="title0216">
			        	<span>展示轮播图</span><span>选择本地图片：</span>
			        </p>
			        <p class="tip0216">提示：1. 本地上传图片大小不能超过2M。建议尺寸：410x278</p>
			        <p class="tip0216 tip-two0216">2. 本类目下，最多可以上传5张图片。</p>
			       <div class="lb-list0216" id="car_list"></div>
			        <div style="height: 20px;"></div>
			    </div>
			</div>
			<div class="cont-item0216">
			    <div class="upload-item0216 upload-lb0216" style="width: 100%;">
				        <p class="title0216">
				        	<span>详情图</span><span>选择本地图片：</span>
				        </p>
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
			                    <div><input type="radio" name="status" id="s2" value="2" />定时上架<input class="" name="time" type="issuedDateStr" readonly="readonly" id="issuedDateStr" style="width: 180px;height: 30px;"></div>
			                </div>
			                <div style="overflow: hidden;clear: both">
			                    <div><input type="radio" name="status" id="s0" value="0" />放入仓库，暂不上架</div>
			                </div>
			            </div>
			        </div>
			        <div style="overflow: hidden;clear: both">
			            <div>商品权重：</div><div><input type="text"  readonly class="editinput_0216" name="sort" id="sort" style="width: 50px;border-radius: 5px;" /></div>
			        </div>
			    </div>
			    <div style="height: 20px;"></div>
			</div>
    	</div>
    </div>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src="<%=basePath %>js/delFoboGoods.js"></script>
<script>
var rootPath='<%=basePath%>';
var search = location.search;
var editFobo_fn = {
	/* base_next_fn:function(){
		$("#baseForm").form("submit",{
			url:rootPath+"v1/product/insertAppProduct",
			onSubmit: function(){
				return $(this).form('enableValidation').form('validate');	
			},
			success:function(){
				$("#nextbox").show();
			}
		});
	} */
	
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
                $('#sort').val(json[0].sort);
                /* $('input[name="status"]').prop('checked',false); */
                $('#s'+json[0].status).prop('checked',true);
                if(json[0].status==2){
                	$('#issuedDateStr').val(Common.getLocalTime(json[0].issuedDate));
                }
			}
		});
	},
	//plot_list
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
	}
	
};
if(location.search!=""){
	var productId = search.split("?productId=")[1];
	editFobo_fn.productParms_fn(productId);
	$("input[name='productId']").val(productId);
	editFobo_fn.showImgList("PLOT","plot_list");
	editFobo_fn.showImgList("ORDER","order_list");
    editFobo_fn.showImgList("SHOW","car_list");
    editFobo_fn.showImgList("DETAIL","det_list");

}else{
	location.href = rootPath+"/v1/product/foboGoodsPage";
}

function initLunBoImg(arr) {
    var carArr=[];
    for(var i=0,data=arr;i<data.length;i++){
        carArr.push('<div class="img0216 lunbo0216">');
        carArr.push('<img src="'+data[i].ossUrl+'"  alt="展示图片" width="160" height="147" id="car'+data[i].imageId+'">');
        carArr.push('</div>');
    }
    $('#car_list').html(carArr.join(''));
}
function initDetailImg(arr) {
    var detArr=[];
    for(var i=0,data=arr;i<data.length;i++){
        detArr.push('<div class="d-item0216" >');
        detArr.push('<img width="640" src="'+data[i].ossUrl+'" alt="展示图片" id="det'+data[i].imageId+'" > ');
        detArr.push('</div>');
    }
    $('#det_list').html(detArr.join(''));
}
</script>
</body>
</html>