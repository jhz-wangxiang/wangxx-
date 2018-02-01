<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>
<!--内容-->
<div class="container0718 clearfix">
    <jsp:include page="leftNav.jsp">
		<jsp:param name="nav" value="goodsManager"/>
    </jsp:include>
    <div class="left content0718">
        <div class="column-content0718">
            <div class="content-tool0718 content-title0719 clearfix">
                <h3 class="left">|商品管理</h3>
            </div>
        </div>
        <div class="column-content0718 goods-manager0719 table-cont1216" >
            <table id="orderManager" style="width: 956px;height: 745px;"></table>
        </div>
    </div>

</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/orderManager.js'></script>
<script>
var rootPath='<%=basePath%>';
OrderManager.init();
</script>
</body>
</html>