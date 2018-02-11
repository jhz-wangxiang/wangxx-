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
	<jsp:param value="flight" name="classify"/>
	<jsp:param value="flight_list" name="level"/>
</jsp:include>
<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        航班管理
        <span class="c-gray en">&gt;</span>
         航班管理
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="" method="post" class="form form-horizontal layui-form" id="form-admin-add">
              <div class="row cl">
                  <div class="text-c">
                  		班次：<input type="text" class="input-text" style="width:250px" id="" name="flightNum">
                          <button name="" id="" class="btn btn-success" type="button" onclick="searchTable()"><i class="Hui-iconfont Hui-iconfont-search2"></i>查询</button>
                  	</div>
               </div>
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="flight_add()" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加班次</a></span><span class="r"><span class="btn-upload form-group"><a href="javascript:void();" class="btn btn-primary upload-btn radius"><i class="Hui-iconfont">&#xe642;</i> 导入航班</a><input type="file" name="file" class="input-file" onchange="file_upload(event)" /></span></span></div>
            <div class="mt-20">
                <table class="layui-hide" id="table"></table>
                <div id="page"></div>
            </div>
        </article>
    </div>
</section>
<jsp:include page="_footer.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/plugin/layui/css/layui.css" />
<script type="text/javascript" src="<%=basePath%>js/plugin/layui/layui.js"></script>
<script type="text/javascript">
    var colArr = [
		{field:"operation",title:"操作",templet: function(d){
			var h = [];
			h.push('<a title="编辑" href="javascript:;" onclick="modifyFlight(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>');
			h.push('<a title="删除" href="javascript:;" onclick="delFlight(\''+d.id+'\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>');
		    return h.join("");
		},width:"100",align:"center"},
        {field:"flightNum",title:"航班号",align:"center",minWidth:"100"},
        {field:"compay",title:"航站楼",align:"center",minWidth:"90"},
        {field:"startPlace",title:"出发地",align:"center",minWidth:"150"},
        {field:"endPlace",title:"目的地",align:"center",minWidth:"150"},
        {field:"startTime",title:"开始时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.startTime)
        }},
        {field:"endTime",title:"结束时间",align:"center",minWidth:"150",templet:function(d){
        	return Common.getLocalDate(d.endTime)
        }},
        {field:"startHour",title:"计划起飞",align:"center",width:"90"},
        {field:"endHour",title:"计划到达",align:"center",width:"90"},
        {field:"exp1",title:"订单首字母",align:"center",width:"90"},
    ];
    var basePath = "<%=basePath %>";
    var pageNumber = 1;
    var pageSize = 10;
    var start = 0;
    var limit = 10;
    var formData = "";
    var tableIns ;
    var modifyFlight = function(id){
    	$.ajax({
			url:basePath+"v1/flight/getFlightNumListPage",
			type:"POST",
			data:{
				pageNumber:"1",
				pageSize:"10",
				id:id
			},
			success:function(data){
				var html = [];
				var json = JSON.parse(data);
				html.push('<div class="pd-20"><form class="layui-form" action="">');
				html.push('<div class="layui-form-item"><label class="layui-form-label">航班号：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_flightNum" lay-verify="required" autocomplete="off" value="'+json.list[0].flightNum+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">航站楼：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_compay" lay-verify="required" autocomplete="off" value="'+json.list[0].compay+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">出发地：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_startPlace" lay-verify="required" autocomplete="off" value="'+json.list[0].startPlace+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">目的地：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_endPlace" lay-verify="required" autocomplete="off" value="'+json.list[0].endPlace+'" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">开始时间：</label>');
				html.push('<div class="layui-input-block"><input type="text" id="modify_startTimeStr" name="modify_startTimeStr" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">结束时间：</label>');
				html.push('<div class="layui-input-block"><input type="text" id="modify_endTimeStr" name="modify_endTimeStr" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">计划起飞：</label>');
				html.push('<div class="layui-input-block"><input type="text" id="modify_startHour" name="modify_startHour" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">计划到达：</label>');
				html.push('<div class="layui-input-block"><input type="text" id="modify_endHour" name="modify_endHour" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
				html.push('<div class="layui-form-item"><label class="layui-form-label">订单首字母：</label>');
				html.push('<div class="layui-input-block"><input type="text" name="modify_exp1" lay-verify="required" autocomplete="off" value="'+json.list[0].exp1+'" class="layui-input"></div></div>');
				html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="modifyFlight">确认</button></div>');
				html.push('</form></div>');
				layui.use(['form','layer','laydate'],function(){
					var form = layui.form;
					var laydate = layui.laydate;
					layui.layer.open({
					     type: 1
					    ,title: '航班信息'
					    ,area: '600px'
					    ,maxmin: true
					    ,content: html.join(""),
					    success:function(){
					    	laydate.render({
					    	    elem: '#modify_startTimeStr'
					    	    ,format: 'yyyy/MM/dd'
					    	    ,value: new Date(json.list[0].startTime)
					    	  });
					    	laydate.render({
					    	    elem: '#modify_endTimeStr'
					    	    ,format: 'yyyy/MM/dd'
					    	    ,value: new Date(json.list[0].endTime)
					    	  });
					    	
					    	 laydate.render({
					    	    elem: '#modify_endHour'
				    	    	,type: 'time'
						    	,format:"HH"
						    	,value:json.list[0].endHour
					    	  });
					    	 laydate.render({
					    	    elem: '#modify_startHour'
					    	    ,type: 'time'
					    	    ,format:"HH"
					    	    ,value:json.list[0].startHour
					    	  });
					    	form.on('submit(modifyFlight)', function(data){
					    		
					        	  var fd = {
					        		id:json.list[0].id,
					    		  };
					        	  for(var d in data.field){
					        		  fd[d.replace("modify_","")] = data.field[d];
					        	  }
					        	  console.log(fd)
					        	  $.ajax({
					        		  url: basePath+"v1/flight/updateFlightNum",
					        		  type:"POST",
					        		  data:fd,
					        		  success:function(d){
					        			var j = JSON.parse(d);
						    	    	if(j.resultCode=="SUCCESS"){
						    	    		layui.layer.msg(j.msg, {
								    	    	time: 1000,
								    			shade: 0.4,
								    	    },function(){
								    	    	location.reload();
								    	    });
						    	    	}else{
						    	    		layui.layer.msg(j.msg, {
								    	    	time: 3000,
								    	    	btn: ['好的'],
								    			shade: 0.4
								    	    });
						    	    	}
					        		  }
					        	  })
					        	  return false;
					        });
					    }
					  });
				});
			}
		})
    }
    var flight_add = function(){
		var html = [];
		html.push('<div class="pd-20"><form class="layui-form" action="">');
		html.push('<div class="layui-form-item"><label class="layui-form-label">航班号：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_flightNum" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">航站楼：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_compay" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">出发地：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_startPlace" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">目的地：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_endPlace" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">开始时间：</label>');
		html.push('<div class="layui-input-block"><input type="text" id="add_startTimeStr" name="add_startTimeStr" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">结束时间：</label>');
		html.push('<div class="layui-input-block"><input type="text" id="add_endTimeStr" name="add_endTimeStr" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">计划起飞：</label>');
		html.push('<div class="layui-input-block"><input type="text" id="add_startHour" name="add_startHour" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">计划到达：</label>');
		html.push('<div class="layui-input-block"><input type="text" id="add_endHour" name="add_endHour" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-form-item"><label class="layui-form-label">订单首字母：</label>');
		html.push('<div class="layui-input-block"><input type="text" name="add_exp1" lay-verify="required" autocomplete="off" value="" class="layui-input"></div></div>');
		html.push('<div class="layui-layer-btn"><button class="btn btn-primary radius" lay-submit="" lay-filter="addFlight">确认</button></div>');
		html.push('</form></div>');
		layui.use(['form','layer','laydate'],function(){
			var form = layui.form;
			var laydate = layui.laydate;
			layui.layer.open({
			     type: 1
			    ,title: '航班信息'
			    ,area: '600px'
			    ,maxmin: true
			    ,content: html.join(""),
			    success:function(){
			    	laydate.render({
			    	    elem: '#add_startHour'
			    	    ,type: 'time'
			    	    ,format:"HH:mm"
			    	    ,value:new Date()
			    	  });
			    	laydate.render({
			    	    elem: '#add_startTimeStr'
			    	    ,format: 'yyyy/MM/dd'
			    	    ,value:new Date()
			    	  });
			    	laydate.render({
			    	    elem: '#add_endTimeStr'
			    	    ,format: 'yyyy/MM/dd'
			    	    ,value:new Date()
			    	  });
			    	
			    	 laydate.render({
			    	    elem: '#add_endHour'
		    	    	,type: 'time'
				    	,format:"HH:mm"
				    	,value:new Date()
			    	  });
			    	form.on('submit(addFlight)', function(data){
			        	  var fd = {
			        		
			    		  };
			        	  for(var d in data.field){
			        		  fd[d.replace("add_","")] = data.field[d];
			        	  }
			        	  console.log(fd)
			        	  $.ajax({
			        		  url: basePath+"v1/flight/insertFlightNum",
			        		  type:"POST",
			        		  data:fd,
			        		  success:function(d){
			        			var j = JSON.parse(d);
				    	    	if(j.resultCode=="SUCCESS"){
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 1000,
						    			shade: 0.4,
						    	    },function(){
						    	    	location.reload();
						    	    });
				    	    	}else{
				    	    		layui.layer.msg(j.msg, {
						    	    	time: 3000,
						    	    	btn: ['好的'],
						    			shade: 0.4
						    	    });
				    	    	}
			        		  }
			        	  })
			        	  return false;
			        });
			    }
			  });
		});
    }
    var delFlight = function(id){
		layer.confirm('确认要删除吗？',function(index){
			$.ajax({
				url: basePath+"v1/flight/deleteFlightNum",
				type:"POST",
				data:{id:id},
				success:function(data){
					var j = JSON.parse(data);
					if(j.resultCode=="SUCCESS"){
						layer.msg('已删除!',{icon:1,time:1000},function(){
			    	    	location.reload();
			    	    });
					}else{
						layer.msg(j.msg,{icon:1,time:1000});
					}
				}
			})
			
		});
	}
    var searchTable = function(){
		var data = {
		    flightNum:Common.ltrim($("input[name='flightNum']").val()),
			start:start
		}
		tableIns.reload({
		  where: data
		});
	}
    var file_upload = function(e){
    	layer.open({
            type: 1
            ,title: false
            ,closeBtn: false
            ,area: '300px'
            ,shade: 0.4
            ,id: 'file'
            ,moveType: 1
            ,content: '<div class="progress-bar text-l"><span class="sr-only" id="precent" style="background: linear-gradient(to right, #da81a1 35%,#7aa4c8 68%);"></span></div>'
            ,success: function(layero){
            	var fd = new FormData();
        		fd.append("file", e.target.files[0]);
        		$.ajax({
        	        type: 'post',
        	        url: basePath+'v1/flight/importFlightNum',
        	        data: fd,
        	        contentType: false,
        	        processData: false,
        	        xhr: function(){
        	        	var xhr = $.ajaxSettings.xhr();
        	        	if(xhr.upload){ 
        	        		xhr.upload.addEventListener('progress',function(e){
                            	var percent=Math.round(e.loaded * 100 / e.total);
                            	$('#precent').css("width",percent.toString() + '%');
                            }, false);
                        } 
        		        return xhr;
        	        },
        	        success: function(data) {
        	            $("input[name='file']").val("");
        	            var json = JSON.parse(data)
        	            if(json.resultCode=="SUCCESS"){
        	            	layer.msg('导入成功',{icon:1,time:1000},function(){
        		    	    	location.reload();
        		    	    });
        	            }else{
        	            	layer.msg(json.msg,{icon:1,time:1000});
        	            }
        	        }
        	    })
            }
          });
		
	}
    layui.use(['form','table'],function(){
    	var table = layui.table;
    	var form = layui.form;
    	tableIns = table.render({
    		elem:"#table",
    		url: basePath+"v1/flight/getFlightNumListPage",
    		method:"POST",
    		where: {start:start},
    		request: {pageName:"pageNumber",limitName:"pageSize"},
    		response: {dataName: 'list',countName: 'total',statusCode: "1"},
    		cols:[colArr],
    		page:{
    			limits:[10, 20,50]
    		}
    	});
    	
    });
</script>
</body>
</html>