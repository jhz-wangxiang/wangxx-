/*左侧菜单响应式*/
function Huiasidedisplay(){
    if($(window).width()>=768){
        $(".Hui-aside").show()
    }
}
/*获取皮肤cookie*/
function getskincookie(){
    var v = $.cookie("Huiskin");
    var hrefStr=$("#skin").attr("href");
    if(v==null||v==""){
        v="default";
    }
    if(hrefStr!=undefined){
        var hrefRes=hrefStr.substring(0,hrefStr.lastIndexOf('skin/'))+'skin/'+v+'/skin.css';
        $("#skin").attr("href",hrefRes);
    }
}


/*个人信息*/
function myselfinfo(){
    var html = [];
    html.push('<div class="pd-20 cl"><form class="layui-form" id="user_pwd">');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">原始密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="passWordOld" lay-verify="required"></div></div>');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">新密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="passWordNew" lay-verify="required"></div></div>');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">确认新密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="passWordNewAg" lay-verify="required"></div></div>');
    html.push('<div class="mb-10 cl text-c"><button type="button" class="btn btn-primary radius" id="pwd_btn" lay-submit="" lay-filter="user_pwd">确认</button></form></div>');
    html.push('</div>');
    layui.use(['form','layer'],function(){
		var form = layui.form;
		layui.layer.open({
		     type: 1
		    ,title: '修改密码'
		    ,area: '600px'
		    ,maxmin: true
		    ,content: html.join("")
		    ,success: function(layero, index){
		        form.on('submit(user_pwd)', function(data){
		        	$.ajax({
	        		  url: basePath+"v1/sysuser/updatePassWord",
	        		  type:"POST",
	        		  data:data.field,
	        		  success:function(data){
	        			var json = JSON.parse(data);
	        			if(json.resultCode=="SUCCESS"){
	        				layui.layer.msg("修改成功", {icon: "6",time:1000},function(){
				    	    	layui.layer.closeAll();
				    	    });
	        			}else{
	        				layui.layer.msg(json.msg, {
				    	    	time: 2000,
				    	    	btn: ['好的'],
				    			shade: 0.4
				    	    });
	        			}
	        		  }
		        	});
	        	  return false;
	        	});
		    }
		  });
	});
}
$(function(){
    getskincookie();
    Huiasidedisplay();
    var resizeID;
    $(window).resize(function(){
        clearTimeout(resizeID);
        resizeID = setTimeout(function(){
            Huiasidedisplay();
        },500);
    });

    $(".nav-toggle").click(function(){
        $(".Hui-aside").slideToggle();
    });
    $(".Hui-aside").on("click",".menu_dropdown dd li a",function(){
        if($(window).width()<768){
            $(".Hui-aside").slideToggle();
        }
    });

	/*左侧菜单*/
    $(".Hui-aside").Huifold({
        titCell:'.menu_dropdown dl dt',
        mainCell:'.menu_dropdown dl dd',
    });
	/*换肤*/
    $("#Hui-skin .dropDown-menu a").click(function(){
        var v = $(this).attr("data-val");
        $.cookie("Huiskin", v);
        var hrefStr=$("#skin").attr("href");
        var hrefRes=hrefStr.substring(0,hrefStr.lastIndexOf('skin/'))+'skin/'+v+'/skin.css';
        $(window.frames.document).contents().find("#skin").attr("href",hrefRes);
    });
});
var Common = function () {
    return {
		/*计算宽高*/

        viewData: function () {

            var e = 0, l = 0, i = 0, g = 0, f = 0, m = 0;

            var j = window, h = document, k = h.documentElement;

            e = k.clientWidth || h.body.clientWidth || 0;

            l = j.innerHeight || k.clientHeight || h.body.clientHeight || 0;

            g = h.body.scrollTop || k.scrollTop || j.pageYOffset || 0;

            i = h.body.scrollLeft || k.scrollLeft || j.pageXOffset || 0;

            f = Math.max(h.body.scrollWidth, k.scrollWidth || 0);

            m = Math.max(h.body.scrollHeight, k.scrollHeight || 0, l);

			/*documentWidth：；viewWidth：*/

            return {

                scrollTop: g, scrollLeft: i, documentWidth: f, documentHeight: m, viewWidth: e, viewHeight: l

            };

        },

		/*时间戳转换成时间*/

        getLocalDate: function (time) {
            if(time){
                var date = new Date(time)
            }else{
                var date = new Date()
            }
            var Y = date.getFullYear() + '/',

                M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '/',

                D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' ',

                h = date.getHours() + ':',

                m = date.getMinutes() < 10 ? '0' + (date.getMinutes() + ":") : (date.getMinutes() + ":"),

                s = date.getSeconds() < 10 ? '0' + date.getSeconds() : date.getSeconds();
            return Y + M + D + h + m + s;

        },
        getLocalDateBy: function (time) {
            if(time){
                var date = new Date(time)
            }else{
                var date = new Date()
            }
            var Y = date.getFullYear() + '/',

                M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '/',

                D = (date.getDate() < 10 ? '0' + date.getDate() : date.getDate()) + ' '
            return Y + M + D ;

        },

        betweenLength: function(str, _min, _max) {

            return (str.length >= _min && str.length <= _max);

        },
        getCookie:function (name) {

            var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");

            if (arr = document.cookie.match(reg)) return unescape(arr[2]);

            else return null

        },

        setCookie:function (name, value) {

            var Days = 3;

            var exp = new Date();

            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);

            document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString()

        },

        delCookie:function (name) {

            var exp = new Date();

            exp.setTime(exp.getTime() - 30);

            var cval = getCookie(name);

            if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString()

        },
        ltrim:function (text){
            return (text || "").replace(/^\s+/g,"").replace(/\s+$/g,"");
        },
        loadScript:function (__stringUrl, __functionCallback, __stringCharset) {
            var __elementScript = document.createElement("script");
            __elementScript.type = "text/javascript";
            if (typeof __stringCharset != "undefined") {
                __elementScript.charset = __stringCharset;
            }
            __elementScript._functionCallback = typeof __functionCallback != "undefined" ?  __functionCallback : new Function();
            __elementScript[document.all ? "onreadystatechange" : "onload"] = function () {
                if (document.all && this.readyState != "loaded" && this.readyState != "complete") {return;}
                this._functionCallback(this);
                this._functionCallback = null;
                this[document.all ? "onreadystatechange" : "onload"] = null;
                this.parentNode.removeChild(this);
            };
            __elementScript.src = __stringUrl;
            document.getElementsByTagName("head")[0].appendChild(__elementScript);
        },
        GetUrlRequest:function () {  
	   		 var url = location.search;
	   		 var theRequest = new Object();
	   		 if (url.indexOf("?") != -1) {
	   			  var str = url.substr(1);
	   			  strs = str.split("&");
	   			  for(var i = 0; i < strs.length; i ++) {
	   			  	theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
	   			  }
	   		 }
	   		 return theRequest;
	   	},
	   	 layer_show:function(t,b,w,id,fn){
	    	var html = [];
	    	html.push('<article class="cl pd-20"><form action="" method="post" class="form form-horizontal" id="form-admin-add">');
	    	html.push('<div class="row cl"><label class="form-label col-xs-3 col-sm-2"><span class="c-red">*</span>'+b+'：</label>');
	    	html.push('<div class="formControls col-xs-9 col-sm-10"><textarea class="textarea" value="" placeholder="" name=""></textarea>');
	    	html.push('</div></div></form></article>');
	    	layer.open({
	   		  title: t,
	   		  content: html.join(""),
	   		  area:w+'px',
	   		  success:function(layero, index){
	   		  },
	   		  yes: function(index, layero){
	   			fn(layero,id);
	   		    layer.close();
	   		  }
	   		}); 
	    },
	    filter_repeat:function(arr,data){
	    	var len=arr.length+1;
	    	   for(var i=0;i<len;i++){
	    	      if(data == arr[i]){
	    	    	  arr.splice(i,1);
	    	         return;
	    	      }
	    	   };
	    	   return arr.push(data);
	    }
    }
}();