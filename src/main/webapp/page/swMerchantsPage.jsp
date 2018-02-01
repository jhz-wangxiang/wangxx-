<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include  file="../common/commonHead.jsp"%>
<jsp:include page="header.jsp"></jsp:include>
<!--内容-->
<div class="container0718 clearfix">
    <jsp:include page="leftNav.jsp">
		<jsp:param name="nav" value="joinBusiness"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|招商加盟</h3>
            </div>
        </div>
        <div class="column-content0718">
            <form method="post" enctype="multipart/form-data" class="easyui-form search-form0721 clearfix" id="searchForm" data-options="novalidate:true"  style="margin-left: 0;">
                <div class="left "style="margin-left:0px">
                    <table cellpadding="3" class="right">
                        <tr>
                        	<td class="text_right" >操作时间:</td>
                            <td><input class="date startDate" id="startTime" name="startTime" data-options="editable:false" style="width: 160px" >--<input class="date endDate" id="endTime" name="endTime" data-options="editable:false" style="width: 160px" ></td>
                            <td class="text_right">公司名称:</td>
                            <td><input class="easyui-textbox" type="text" id="companyName" name="companyName" data-options="novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">所属城市:</td>
                            <td><input class="easyui-textbox" type="text" id="address" name="address" data-options="novalidate:true"/>
                            </td>
                            <td class="text_right">所属行业:</td>
                            <td><input class="easyui-textbox" type="text" id="industry" name="industry" data-options="novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text_right">联系人姓名:</td>
                            <td><input class="easyui-textbox" type="text" id="name" name="name" data-options="novalidate:true"/>
                            </td>
                            <td class="text_right">联系人电话:</td>
                            <td><input class="easyui-textbox" type="text" id="phone" name="phone" data-options="novalidate:true"/>
                            </td>
                        </tr>
                        <tr>
                        	<td class="text_right">联系人邮箱:</td>
                            <td><input class="easyui-textbox" type="text" id="email" name="email" data-options="novalidate:true"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <div class="column-content0718">
            <div class="content-tool0718 clearfix">
                <div class="right">
                    <a class="btn search-btn0718 import-btn0405" id="searchBtn">搜索</a>
                    <a class="btn search-btn0718 import-btn0405" id="daochu" href="<%=basePath %>v1/merchants/exportMerchants">导出</a>
                </div>
            </div>
        </div>
        <div class="column-content0718 operation-log0720 table-cont1216">
            <table id="operationLog" style="width: 956px;height: 745px;"></table>
        </div>
    </div>

</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/swMerchants.js'></script>
<script>
var rootPath='<%=basePath%>';
swMerchants.init();
$(function(){
	/* $("#table").height(Common.viewData().viewHeight-355);
	$(".panel").height(Common.viewData().viewHeight-355);
	$(window).resize(function(){
		console.log(Common.viewData().viewHeight-355)
		$("#table").height(Common.viewData().viewHeight-355);
		$(".panel").height(Common.viewData().viewHeight-355);
	}); */ 
})
</script>
</body>
</html>