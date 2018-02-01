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
		<jsp:param name="nav" value="snLotterManagerPage"/>
    </jsp:include>
    <div class="left content0718">
    	<div class="column-content0718">
            <div class="content-tool0718 clearfix">
                <h3 class="left"></h3>
                <div class="right">
                    <a class="btn search-btn0718">搜索</a>
                    <a class="btn reset-btn0718">重置</a>
                    <a class="btn excle-btn0718">导出订单</a>
                </div>
            </div>
        </div>
        <div class="column-content0718">
            <form method="post" class="easyui-form search-form0721 clearfix" id="searchForm" data-options="novalidate:true">
                <div class="left ">
                    <table cellpadding="5" class="right">
                        <tr>
                            <td class="text_right">中奖日期:</td>
                            <td><input class="date startDate" data-options="editable:false" >--<input class="date endDate" data-options="editable:false"></td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
        <!-- <div id="cc" class="easyui-calendar"></div> -->
        <div class="column-content0718 table-cont1216" id="table" style="margin-bottom: 10px;">
            <table id="order" style="width: 956px;height: 620px;"></table>

        </div>
    </div>

</div>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/jquery.easyui.min.js'></script>
<script src='<%=basePath %>js/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js'></script>
<script src='<%=basePath %>js/plugin/validateRule.js'></script>
<script src='<%=basePath %>js/common.js'></script>
<script src='<%=basePath %>js/snLotter.js'></script>
<script>
var rootPath='<%=basePath%>';
snLotter.init();
</script>
</body>
</html>