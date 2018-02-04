<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<jsp:include page="_meta.jsp"></jsp:include>
<title>后台管理 </title>
<meta name="keywords" content="后台">
<meta name="description" content="后台">
</head>
<body>

<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp">
	<jsp:param value="order" name="classify"/>
	<jsp:param value="order_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        订单列表
        <span class="c-gray en">&gt;</span>
        订单历史
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="mt-20">
                <table class="layui-hide" id="table"></table>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
	var id = Common.GetUrlRequest()['id'];
	var basePath = "<%=basePath %>";
	if(id == "" || id == null || id == undefined){
		location.href = basePath + "v1/page/orderList";
	}
    var colArr = [
        {field:"exp1",title:"订单编号",align:"center",minWidth:"100"},
        {field:"remark",title:"动作",align:"center",minWidth:"100"},
        {field:"userName",title:"相关人员",align:"center",minWidth:"90"},
        {field:"exp2",title:"备注",align:"center",minWidth:"90"},
		{field:"createDate",title:"时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.createDate)
        }},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
    layui.use("table",function(){
    	var table = layui.table;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/order/selectHistory",
    		method:"POST",
    		where: {pageSize:pageSize,start:start,orderNo:id},
    		request: {pageName:"pageNumber",limitName:"limit"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:true
    	});
    	
    });
</script>
</body>
</html>