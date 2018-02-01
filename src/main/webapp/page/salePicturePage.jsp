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
    		<a href="<%=basePath %>v1/product/focusPicturePage" class="l btn_common">顶部banner设置</a>
    		<a href="<%=basePath %>v1/product/salePicturePage" class="l btn_common" style="color:red">服务政策</a>
    		<div class="vspace"></div>
    		<div class="imgup">
    			<span class="l">选择本地图片:</span>
				<div class="l">
					<form name="img-form" id="imgupform" target="img_iframe_header" enctype="multipart/form-data" action="<%=basePath %>v1/product/insertBatchImage" method="post">
						<label for="picFile" class="">图片上传</label><input type="file" name="picFile" id="picFile" multiple accept="image/jpeg , image/png" onchange="salePP_fn.imgup('imgupform')"/>
						<input type="hidden" name="imageUsedType" value="SALE"/>
					</form>
					<iframe id="img_iframe_header" name="img_iframe_header" style="display:none;"></iframe>
				</div>
				<div class="clear"></div>
				<span class="">1. 本地上传单张图片大小不能超过1M。建议尺寸：1280*600。<br/>2. 本类目下，最多可以上传20张图片。</span>
			</div>
    	</div>
    	<div class="clear"></div>
    	<div class="column-content0718 goods-manager0719" >
            <ul class="spp_list">
            </ul>
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
</script>
<script src='<%=basePath %>js/spp.js'></script>
</body>
</html>