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
/*弹出层*/
/*
 参数解释：
 title	标题
 url		请求的url
 id		需要操作的数据id
 w		弹出层宽度（缺省调默认值）
 h		弹出层高度（缺省调默认值）
 */
function layer_show(title,url,w,h){
    if (title == null || title == '') {
        title=false;
    };
    if (url == null || url == '') {
        url="404.html";
    };
    if (w == null || w == '') {
        w=800;
    };
    if (h == null || h == '') {
        h=($(window).height() - 50);
    };
    layer.open({
        type: 2,
        area: [w+'px', h +'px'],
        fix: false, //不固定
        maxmin: true,
        shade:0.4,
        title: title,
        content: url
    });
}

/*时间*/
function getHTMLDate(obj) {
    var d = new Date();
    var weekday = new Array(7);
    var _mm = "";
    var _dd = "";
    var _ww = "";
    weekday[0] = "星期日";
    weekday[1] = "星期一";
    weekday[2] = "星期二";
    weekday[3] = "星期三";
    weekday[4] = "星期四";
    weekday[5] = "星期五";
    weekday[6] = "星期六";
    _yy = d.getFullYear();
    _mm = d.getMonth() + 1;
    _dd = d.getDate();
    _ww = weekday[d.getDay()];
    obj.html(_yy + "年" + _mm + "月" + _dd + "日 " + _ww);
};

/*个人信息*/
function myselfinfo(){
    var html = [];
    html.push('<div class="pd-20 cl">');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">原始密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="password"></div><div class="col-sm-2 text-c status-icon-color os"><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo"></i></div></div>');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">新密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="new"></div><div class="col-sm-2 text-c status-icon-color ns"><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo"></i></div></div>');
    html.push('<div class="mb-10 cl"><h5 class="col-sm-3">确认新密码</h5><div class="col-sm-7"><input type="password" class="input-text" id="" name="new_r"></div><div class="col-sm-2 text-c status-icon-color nrs"><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo"></i></div></div>');
    html.push('<div class="mb-10 cl text-c"><button type="button" class="btn btn-primary radius" id="pwd_btn">确认</button></div>');
    html.push('</div>');
    layer.open({
        type: 1,
        area: '500px',
        fix: false,
        shade:0.4,
        title: '修改密码',
        content: html.join(""),
        success: function(layero, index){
            Common.loadScript(basePath+'static/h-ui.admin/js/checkpwd.js',function(){},"utf-8");
        }
    });
}
$(function(){
    getHTMLDate($("#top_time"));
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
            var Y = date.getFullYear() + '-',

                M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-',

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
        }

    }
}();