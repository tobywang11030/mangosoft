<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh" class="pu"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js//public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/head_nav.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user-list.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/mail.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/home_page.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/herd_hello.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/simple_info.css" rel="stylesheet" type="text/css">
        <style>
		.wx .information{ width: 100%;height: 40px;line-height: 40px;background: #fff;margin-bottom: 5px;text-align: center;font-size: 0.9em; margin-top:0px !important; padding-top:0px !important}
		.wx ..onekey_set{ margin-top:0px; border:1px solid red;}
		</style>
    
<script type="text/javascript">
function initlist(offset){
	 $.getJSON("<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=chatlist&openid=${user.userOpenid}&offset="+offset, function(data) {
	       
			$.each(data, function(i, item) {
				
				var $ul = $("<ul></ul>");
				$ul.addClass("disbox-hor user-list");
				$ul.attr("href","<%=request.getContextPath()%>/weixinpro/web?action=chat&openid=${user.userOpenid}&matchid="+item.from_id+"&cid="+item.id);
				var $li1 = $("<li></li>");
				$li1.addClass("foot-icon disbox-center");
				$li1.append("<img src='"+item.photo+"'/>");
				var $li2 = $("<li></li>");
				$li2.addClass("disbox-flex user_mession");
				var $b = $("<b></b>");
				$b.addClass("tit");
				if(item.isNew=="0"){
				var $span = $("<span></span>");
				$span.addClass("pink");
				$span.append("[最新回信]");
				$b.append($span);
				}
				var $p = $("<p></p>");
				$p.addClass("bot");
				$p.append(item.from_age+"岁·"+item.from_p+"·"+item.from_height);
				$li2.append($b);
				$li2.append($p);
				var $div = $("<div></div>");
				$div.addClass("right");
				$div.append(item.time);
				var $i = $("<i></i>");
				$i.addClass("cycle_tag");
				if(item.readed==0){
					$i.append("未读");
					}else{
						$i.append("已读");
						}
				
				$ul.append($li1);
				$ul.append($li2);
				$ul.append($div);
				$ul.append($i);
				$("#mail_list").append($ul);
			
			});
    });
}
function domore(){
	var nextoffset = $("#offset").val();
	initlist(parseInt(nextoffset)+1);
	 $("#offset").val(parseInt(nextoffset)+1);
}
</script>
</head>
<body onload="initlist(0);">
<input type="hidden" value="0" id="offset">
<div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>

<div class="top_blank"></div>








  

<header class="head">
    <h1 class="disbox-center logo"></h1>
    <ul class="main_nav disbox-hor" id="nav_menu">
          <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}">缘分</a></li>
        <li class="disbox-flex disbox-center active"><a href="<%=request.getContextPath()%>/weixinpro/web?action=chatlist&openid=${user.userOpenid}">聊天</a></li>
       
        <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}">我</a></li>
    </ul>
</header>



<div>
    <div class="loading"><i></i>加载中...</div>
    <div>
        <div href="/v20/msg/filter_msg_set.html" class="onekey_set">免扰信件过多？一键设置！<i class="re_trg"></i></div>
        <section id="index_section" class="home_page content">
            
                    
                    
                    
                    
                    <div id="mail_list">
                        



  

                    </div>
                    
                        <div class="see_more" onclick="domore();">
                            点击查看更多
                        </div>
                    
                    
                
        </section>
    </div>
</div>
<input type="hidden" id="GUID" value="427543124">

<div id="mask" class="mask hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;"></div>
<div class="simple_info simple_info_unaffect hidden">
    <p class="title"><span>友情提示</span></p>
    <p class="abolish">
        已经帮你处理了<span class="pink">12</span>封信！<br>
        是否记录你的选择？
    </p>
    <div class="col2_btn">
        <a class="btn3" href="http://citylove.lover2.cc/v20/msg/mails.html###">暂不记录</a>
        <a class="btn4" href="http://citylove.lover2.cc/v20/msg/mails.html###">记录当前选择</a>
    </div>
</div>
<div class="simple_info simple_info_guolv hidden">
    <p class="title"><span>友情提示</span></p>
    <p class="abolish_yellow">亲，你收到的<span>2222</span>封未读信中，有<span>22</span><span>封是无头像的异性发来的。</span>为提高未读私信的处理能力，你是否愿意使用有缘小助手批量处理这些信件？</p>
    <p class="btttom">
        有缘小助手服务介绍：<br>
        1.帮助你将招呼信件全部设为已读；<br>
        2.我们将你的征友条件转变成问题代你向满足征友要求的异性发出相关的问题；<br>
        3.为了不错过美丽的缘分，当你不在线时会代你至多响应一次男用户发来的招呼信。<br>
        注：有缘小助手是用户自主设置的服务功能，如不满意可随时取消设置，请放心使用。
    </p>
    <div class="col2_btn">
        <a class="btn1" href="http://citylove.lover2.cc/v20/msg/mails.html###">暂不使用</a>
        <a class="btn2" href="http://citylove.lover2.cc/v20/msg/mails.html###">确定使用</a>
    </div>
</div>
<input id="filterType" type="hidden" value="2">

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/headmessage.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/loading_more.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/say_hello.js"></script>
    
<div id="_cfgwp"><span isenoughactivedaynum="true" version="6.0.5.8"></span></div></body></html>