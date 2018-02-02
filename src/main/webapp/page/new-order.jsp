<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="_meta.jsp"></jsp:include>

<title>文件管理 </title>
<meta name="keywords" content="文件管理">
<meta name="description" content="文件管理">
</head>
<body>
<jsp:include page="_header.jsp"></jsp:include>
<jsp:include page="_menu.jsp">
    <jsp:param value="file" name="classify"/>
    <jsp:param value="file_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        订单管理
        <span class="c-gray en">&gt;</span>
        新建订单
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal" id="form-admin-add">
                <h4>客户信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>行李信息</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">航班号：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
                <h4>寄送地址</h4>
                <div class="line"></div>
                <div class="mt-20">
                    <div class="row cl">
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">收件人：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-3">
                            <label class="form-label col-xs-4 col-sm-3">管理员：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <input type="text" class="input-text" value="" placeholder="" id="adminName" name="adminName">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <label class="form-label col-xs-4 col-sm-3">收获地址：</label>
                            <div class="formControls col-xs-8 col-sm-9">
                                <textarea class="textarea"></textarea>
                            </div>
                        </div>
                        <div class="cl"></div>
                    </div>
                </div>
            </form>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort" id="table">
                </table>
                <div id="page"></div>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="<%=basePath %>lib/laypage/skin/laypage.css" />
<script type="text/javascript" src="<%=basePath %>lib/laypage/layui.js"></script>
<script type="text/javascript">
    var colArr = [
        {name:'id',title:'文件标示',show:true,width:'50px'},
        {name:'fileChName',title:'文件名称',show:true,width:'80px'},
        {name:'fileEnName',title:'title',show:false,width:'80px'},
        {name:'fileOssUrl',title:'文件路径',show:true,fuc:function(value,row){
            return '<a download="'+row.fileChName+'" href="tool/download?fileId='+row.id+'"  target="_blank" onclick="fun_all.download(\''+row.id+'\')">'+value+'</a>';
        }},
        {name:'size',title:'大小',show:true,width:'50px',fuc:function(value){
            return Math.round(value/1024)+"KB";
        }},
        {name:'createDate',title:'初始时间',show:true,width:'150px',fuc:function(value){
            return val = Common.getLocalDate(value);
        }},
        {name:'updateDate',title:'更新时间',show:true,width:'150px',fuc:function(value){
            if(value==null || value==""){
                return val = Common.getLocalDate();
            }else{
                return val = Common.getLocalDate(value);
            }

        }},
        {name:'flag',title:'flag',show:false,width:'50px'},
        {name:'folderId',title:'folderId',show:false,width:'50px'},
        {name:'username',title:'操作人',show:true,width:'80px'},
        {name:'opera',title:'操作',show:true,width:'50px',fuc:function(value,row){
            var html = '<a style="text-decoration:none" class="ml-5" href="javascript:fun_all.file_add(\'修改\',800,\'update\',\''+row.fileEnName+'\',\''+row.id+'\');" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a><a style="text-decoration:none;display:none;" class="ml-5" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>'
            return html;
        }},
    ];
    var basePath = "<%=basePath %>";
    var pageNum = 1;
    var pageSize = 10;
    var formData = "";
</script>
</body>
</html>