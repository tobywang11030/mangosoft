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
        <link href="resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/public_headmessage.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/head_nav.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/user-list.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/user_box.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/nearby02.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/home_page.css" rel="stylesheet" type="text/css">
        <link href="resources/xl_js/herd_hello.css" rel="stylesheet" type="text/css">
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<input type="hidden" name="fromChannel" id="fromChannel" value="6307">
<input type="hidden" name="isWechatUser" id="isWechatUser" value="0">

<div class="top_blank"></div>








  

<header class="head">
    <h1 class="disbox-center logo"></h1>
    <ul class="main_nav disbox-hor" id="nav_menu">
         <li class="disbox-flex disbox-center "><a href="xianglianpro.do?action=userlist&openid=${user.userOpenid}">缘分</a></li>
        <li class="disbox-flex disbox-center "><a href="xianglianpro.do?action=chatlist&openid=${user.userOpenid}">聊天</a></li>
        <li class="disbox-flex disbox-center "><a href="xianglianpro.do?action=locationlist&openid=${user.userOpenid}">附近</a></li>
        <li class="disbox-flex disbox-center active"><a href="xianglianpro.do?action=myhome&openid=${user.userOpenid}">我</a></li>
    </ul>
</header>



<div>
    <div class="loading"><i></i>加载中...</div>
    <div>
        <section class="content" id="found_section">
            <section id="nearby_list" class="content_02 nearby02">
                



    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=435185728&amp;source=3" class="foot-icon"><img src="resources/xl_js/1448938070944A85E7F7_c.jpg"></li>
        <li href="/v20/user/user_info.html?userId=435185728&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">迷路的蛋挞</b>

            <p>20岁·165cm·孝顺</p>

            <p class="foot_imgarrange">
                    寻找陕西 20~25岁的男生
            </p>

        </li>
        <div class="right">4.8km
           	<span data-hi="435185728" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=330541626&amp;source=3" class="foot-icon"><img src="resources/xl_js/1436179585563A551983_c.jpeg"></li>
        <li href="/v20/user/user_info.html?userId=330541626&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">心灵美的小溪流</b>

            <p>21岁·164cm·孝顺</p>

            <p class="foot_imgarrange">
                    寻找陕西 21~23岁 174~174的男生
            </p>

        </li>
        <div class="right">6.1km
           	<span data-hi="330541626" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=323533711&amp;source=3" class="foot-icon"><img src="resources/xl_js/1435227788822AA8644D_c.jpg"></li>
        <li href="/v20/user/user_info.html?userId=323533711&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">小妍子</b>

            <p>18岁·163cm·直爽</p>

            <p class="foot_imgarrange">
                    寻找陕西的男生
            </p>

        </li>
        <div class="right">3.0km
           	<span data-hi="323533711" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=342831012&amp;source=3" class="foot-icon"><img src="resources/xl_js/1439804953881A681A43_c.jpg"></li>
        <li href="/v20/user/user_info.html?userId=342831012&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">害羞的黄豆</b>

            <p>28岁·165cm·直爽</p>

            <p class="foot_imgarrange">
                    寻找陕西的男生
            </p>

        </li>
        <div class="right">9.6km
           	<span data-hi="342831012" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=428898851&amp;source=3" class="foot-icon"><img src="resources/xl_js/1448081042069AA89B60_c.jpeg"></li>
        <li href="/v20/user/user_info.html?userId=428898851&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">天空微晴梦维美</b>

            <p>22岁·159cm·孝顺</p>

            <p class="foot_imgarrange">
                    人生路上孤独和等候，我愿与你分担所有
            </p>

        </li>
        <div class="right">9.1km
           	<span data-hi="428898851" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=320193929&amp;source=3" class="foot-icon"><img src="resources/xl_js/1434784625587ACD28CD_c.jpg"></li>
        <li href="/v20/user/user_info.html?userId=320193929&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">眼睛大的棒棒糖</b>

            <p>19岁·180cm·有爱心</p>

            <p class="foot_imgarrange">
                    寻找22~24岁 187~187的男生
            </p>

        </li>
        <div class="right">5.2km
           	<span data-hi="320193929" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=338478719&amp;source=3" class="foot-icon"><img src="resources/xl_js/1437286630767AC71F1F_c.jpg"></li>
        <li href="/v20/user/user_info.html?userId=338478719&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">蓉蓉</b>

            <p>19岁·162cm·顾家</p>

            <p class="foot_imgarrange">
                    寻找陕西 23~25岁 175~180的男生
            </p>

        </li>
        <div class="right">9.8km
           	<span data-hi="338478719" class="hai_hello">打招呼</span>
       	</div>
    </ul>

    <ul class="disbox-hor user-list">
        <li href="/v20/user/user_info.html?userId=442241107&amp;source=3" class="foot-icon"><img src="resources/xl_js/1449975539537A39063D_c.jpeg"></li>
        <li href="/v20/user/user_info.html?userId=442241107&amp;source=3" class="disbox-flex user_mession">
            <b class="tit">可爱的小猪猪。</b>

            <p>22岁·156cm·有爱心</p>

            <p class="foot_imgarrange">
                    能想找一个真心相爱的你。不知他在哪里？
            </p>

        </li>
        <div class="right">9.4km
           	<span data-hi="442241107" class="hai_hello">打招呼</span>
       	</div>
    </ul>

            </section>
            <input type="hidden" id="shadowData" value="0">
            <span data-more="/v20/nearby_list.html" data-page="2" data-size="8" data-append="#nearby_list" class="see_more">点击查看更多</span>
            
        </section>
    </div>
</div>
<input type="hidden" id="GUID" value="427543124">


<div class="guide_mask"><span data-hi="123" class="mask_btn"></span></div>






    	<script src="resources/xl_js/zepto.min.js"></script>
        <script src="resources/xl_js/public.js"></script>
        <script src="resources/xl_js/waiting.js"></script>
        
    		<script src="resources/xl_js/headmessage.js"></script>
		
        <script src="resources/xl_js/loading_more.js"></script>
        <script src="resources/xl_js/say_hello.js"></script>
        <script src="resources/xl_js/index.js"></script>





     <div class="mail_promise" style="height: 40px;">
	    <div class="scrBox">
            
                <div href="/v20/msg/chat.html?userId=401205599&amp;source=2" class="tt">
                    <span class="yellow">一个...给你回信啦~立即查看</span>
                </div>
            
            
            
            
            
	    </div>
	    
        <span class="closed"></span></div>
 <div id="_cfgwp"><span isenoughactivedaynum="true" version="6.0.5.8"></span></div></body></html>