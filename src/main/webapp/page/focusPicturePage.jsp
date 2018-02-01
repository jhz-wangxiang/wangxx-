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
    		<a href="<%=basePath %>v1/product/focusPicturePage" class="l btn_common" style="color:red">顶部banner设置</a>
    		<a href="<%=basePath %>v1/product/salePicturePage" class="l btn_common">服务政策</a>
    		<a href="javascript:;" class="btn_bg_common r" style="margin-left:10px;" onclick="function_all.img_add()">新增图片</a>
    		<a href="javascript:;" class="btn_bg_common r" style="margin-left:10px;" onclick="function_all.setbannertime()">设置banner轮播图切换时间</a>
    		<input type="text" class="r" id="bannertime" style="border:1px solid #ddd; width:50px; font-size:16px; line-height:34px;"/>
    	</div>
    	<div class="clear"></div>
    	<div class="column-content0718 goods-manager0719 table-cont1216" >
            <table id="fpp" style="width: 956px;"></table>
        </div>
    </div>
</div>
<div id="w" class="easyui-window" title="图片上传" data-options="modal:true,closed:true,collapsible:false,minimizable:false,maximizable:false" style="width:700px;padding:10px;">
	<div class="vspace"></div>
	<div class="imgup">
		<div class="l">
			<form name="img-form" id="imgupform" target="img_iframe_header" enctype="multipart/form-data" action="<%=basePath %>v1/product/uploadPc" method="post">
				<label for="picFile" class="">图片上传</label><input type="file" name="picFile" id="picFile" accept="image/jpeg , image/png" onchange="function_all.imgup('imgupform')"/>
			</form>
			<iframe id="img_iframe_header" name="img_iframe_header" style="display:none;"></iframe>
		</div>
		<span class="">图片建议尺寸：1280X200像素，jpg、png格式，大小2M以内。</span>
	</div>
	<div class="clear"></div>
	<div class="product_name"><span class="l">对应商品名称：</span><select id="sel" class="l"></select></div>
	<a href="javascript:;" class="btn_bg_common l" id="img_edit_btn">完成</a>
	<input type="hidden" name="ossUrl"/>
</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script>
var rootPath='<%=basePath%>';
</script>
<script src='<%=basePath %>js/imgupload.js'></script>
</body>
</html>