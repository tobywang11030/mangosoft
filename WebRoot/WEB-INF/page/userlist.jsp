<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh" class="pu"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/public_headmessage.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/head_nav.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/user-list.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/user_box.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/home_page.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/herd_hello.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/resources/xl_js/common_alert.css" rel="stylesheet" type="text/css">
    
</head>
<body class="" isshownewyearad="0" data-jsid="" data-userid="427543124" yy="no"><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<input type="hidden" name="fromChannel" id="fromChannel" value="6307">
<input type="hidden" name="isWechatUser" id="isWechatUser" value="0">




<div class="blank50"></div>








  

<header class="head">
    <h1 class="disbox-center logo"></h1>
    <ul class="main_nav disbox-hor" id="nav_menu">
         <li class="disbox-flex disbox-center active"><a href="<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}">缘分</a></li>
        <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=chatlist&openid=${user.userOpenid}">聊天</a></li>
       
        <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}">我</a></li>
    </ul>
</header>

<section id="index_section" class="home_page">
<!-- 

    <div class="filtrate">
        <ol class="filtrate_con">
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/09/08/07/1447027633548AC7DD6E_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=418111693&amp;source=2"><p class="description">长腿MM</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201507/10/10/07/1436494061337ABEF57A_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=332681054&amp;source=2"><p class="description">小巧玲珑</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/29/18/08/1448791727979A38FBFA_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=434331834&amp;source=2"><p class="description">活跃用户</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201510/10/23/16/1444490203009A19F909_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=396415051&amp;source=2"><p class="description">活跃用户</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/28/02/15/1448648130208A47A5EC_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=433562610&amp;source=2"><p class="description">白领丽人  </p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201507/17/20/50/1437137459086A026EE9_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=329992468&amp;source=2"><p class="description">长腿MM</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/26/16/04/1448525082704ACB1F79_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=431569606&amp;source=2"><p class="description">长腿MM</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/17/09/14/1447722847689A0EB391_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=425837671&amp;source=2"><p class="description">青春萌妹</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/23/08/50/1448239855832A34D4FD_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=430366851&amp;source=2"><p class="description">独守空房</p></li>
            
                <li style="background: url(http://px1.youyuan.com/resize/photo/n/n/n/90/110/201504/16/16/44/1429173852672A20EDE7_c.jpg) center center no-repeat;background-size: cover;" href="/v20/user/user_info.html?userId=286654795&amp;source=2"><p class="description">活跃用户</p></li>
        </ol>
    </div> -->


    <!--公告 消息-->
    <div id="noticeDiv" class="notice" style="opacity: 1; -webkit-transform-origin: 0px 0px 0px; -webkit-transform: scale(1, 1);">
        <img src="<%=request.getContextPath()%>/resources/xl_img/blue_voice.png">

        <div id="notice_box" class="notice_box">
            <ol id="ul1" data-key="H5-A1" class="person" style="-webkit-transform-origin: 0px 0px 0px; opacity: 1; -webkit-transform: scale(1, 1);"><li class="adli" tty="0"><a href="#" class="adStatistics" activeid="90" positionid="H5-A1" provinceid="16" userid="427543124" adtype="0">100元话费限时赠送,点击查看</a></li></ol>
        </div>
    </div>


    <div class="content">
        
            <div class="amend">
                <div class="msg_tit">
                    <p class="left" id="province">
                        <span>${region.regionName}</span>
                        <select>
                        <c:forEach items="${regionpro}" var="rp">
                         <option value="${rp.regionId}" <c:if test="${region.regionId==rp.regionId}">selected="selected"</c:if> >${rp.regionName}</option>
                        </c:forEach>
                           
                        </select>
                    </p>
                    <div href="<%=request.getContextPath()%>/weixinpro/web?action=match&openid=${user.userOpenid}" class="right">
                        征友条件<i class="re_trg"></i>                    </div>
                </div>
            </div>
            <div id="recommend">
                <c:forEach items="${ul}" var="usermatch">
                    <div class="inflo">
                        <ul class="disbox-hor home-user-list" href="<%=request.getContextPath()%>/weixinpro/web?action=userinfo&openid=${user.userOpenid}&matchid=${usermatch.id}">
                            <li class="foot-icon">
                                <img src="${usermatch.photo}">                            </li>
                            <li class="disbox-flex user_mession">
                                <b class="tit">${usermatch.name} </b>

                                <p>${usermatch.age}岁 | ${region.regionName}</p>

                                <p class="feature">
                                <c:forEach items="${usermatch.peopleCharList}" var="ch">
                                <span>${ch.content}</span>
                                </c:forEach>
                                 <c:forEach items="${usermatch.interestList}" var="interest">
                                <span>${interest.content}</span>
                                </c:forEach>
                               <c:if test="${usermatch.authTypePhone==1}"> <span>手机认证</span></c:if>
                               <c:if test="${usermatch.authTypePeople==1}"> <span>实名认证</span></c:if>
                                <c:if test="${usermatch.userType==1}"> <span>VIP</span></c:if>
                                   
                                    
                                    
                                </p>

                                <p class="recite">寻找${region.regionName} 
                                <c:choose>
                                <c:when test="${(usermatch.userinfoSelect.ageSelect==0 and usermatch.userinfoSelect.ageSelectMax==0 ) or usermatch.userinfoSelect.ageSelect==null}">
                                不限年龄
                                </c:when>
                                <c:otherwise>
                                 ${usermatch.userinfoSelect.ageSelect}~${usermatch.userinfoSelect.ageSelectMax}岁
                                </c:otherwise>
                                </c:choose>
                                <c:choose>
                                <c:when test="${(usermatch.userinfoSelect.heightSelect==0 and usermatch.userinfoSelect.heightSelectMax==0) or usermatch.userinfoSelect.heightSelect==null}">
                                不限身高
                                </c:when>
                                <c:otherwise>
                                ${usermatch.userinfoSelect.heightSelect}~${usermatch.userinfoSelect.heightSelectMax}CM
                                </c:otherwise>
                                </c:choose>
                                的<c:if test="${user.sex==0}">男</c:if><c:if test="${user.sex==1}">女</c:if>生</p>
                            </li>
                        </ul>
                        <div class="bot_btn">
                            <span class="look" href="<%=request.getContextPath()%>/weixinpro/web?action=userinfo&openid=${user.userOpenid}&matchid=${usermatch.id}">看看Ta</span>
                            <span data-hi="${usermatch.id}" data-source="${user.id}" class="hello">打招呼</span>
                        </div>
                    </div>
                
                 </c:forEach>
                
          
                
      
                
            </div>
            <c:choose>
            <c:when test="${offset==0}">
              <div   class="see_more" onclick="javascript:location.href='<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}&offset=${offset+1}';">下一页</div>
            </c:when>
            <c:otherwise>
              <div style="float: left;width: 50%"  class="see_more" onclick="javascript:location.href='<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}&offset=${offset-1}';">上一页</div>
            <div  style="float: left;width: 50%" class="see_more" onclick="javascript:location.href='<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}&offset=${offset+1}';">下一页</div>
            </c:otherwise>
            </c:choose>
           
           
            
        
        

    </div>
</section>




<div id="mask" class="mask hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;">
    <div class="msg_tip">
        <h3>提示</h3>
        <p>有头像男生收到的回信比没有头像的多十倍！</p>
        <p>快去上传头像吧~</p>
        <ul>
            <li class="btn_cancel">暂不上传</li>
            <li class="btn_sure">立即上传</li>
        </ul>
    </div>
</div>


<div id="hongniang_mask" class="hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;">
    <div class="hn">
        <img class="hn_closed" src="<%=request.getContextPath()%>/resources/xl_img/hn_closed_03.png">
        <div class="hn_btn">免费领取红娘服务</div>
    </div>
</div>

	
	
	<div id="hongniang_mask" class="hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;">
	    <div class="hn">
	        <img class="hn_closed" src="<%=request.getContextPath()%>/resources/xl_img/hn_closed_03.png">
	        <div class="hn_btn">免费领取红娘服务</div>
	    </div>
	</div>
	
	

	

<script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/ajax.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>

<script type="text/javascript">
$("body").on("tap", '[data-hi]', function (e) {
    $.stopPropagation(e);

    var $this = $(this), userId = $this.data('hi'), source = $this.data('source');
    var fate=null;
    if($this.hasClass('fateFlag')){
    	fate='ok';
    }
    if (!source) {        source = '0';
    }
    $.waiting.show("正在打招呼...")
    $('[data-hi="' + userId + '"]').removeAttr('data-hi').removeClass("hello").addClass("hello_out").html("已打招呼");
    $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=sayhello', data: {userId: userId, source: source,fateFlag:fate}, dataType: 'json', type: 'post', success: function (data) {
        $.waiting.hide()
        if (data == 13) {
            location.href = "/v20/user/hello_template.html?userId=" + userId;
        }else{
           setTimeout(function(){
               $.waiting.hide();
			   if($("#helloMsgContent").length!=1){
				   	if(data==6){
					   $.tips("你今天已经向Ta打过招呼了。");
					   
				   	}else{
					   $.tips("招呼已发出，请耐心等待Ta的回复");
					   
				   	};
			   }else if($("#helloMsgContent").length==1){
					if(data==6){
						$.tips("你今天已经向Ta打过招呼了。");
						setTimeout(function(){
							location.reload();
						},2000)
						/*
						setTimeout(function(){
							$(".but_send").html("打招呼，已经刷新！");
						},150)
						*/
					   
					}else{
					   $.tips("招呼已发出，请耐心等待Ta的回复");
						setTimeout(function(){
							location.reload();
						},2000)
						/*
						setTimeout(function(){
							$(".but_send").html("打招呼，已经刷新！");
						},150)
						*/
					};		

			   }
           },30)
        }
    }, error: function () {
        $.waiting.hide()
    }
    });
    return false;
})

$("body").on("tap",".btn_box",function(){
    var source = $(this).data('source');
    $(this).find(".btn").addClass("hai_out")
    $.waiting.show("正在打招呼...");
    $(".pto li").each(function(){
        var $this = $(this), userId = $this.data('sayhi');
        if (!source) {
            source = '0';
        }
        $('[data-hi="' + userId + '"]').removeAttr('data-sayhi').removeClass("hello").addClass("hello_out");
        $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=sayhello', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {
        	$.waiting.hide();
        	$.tips("招呼已发出，请耐心等待Ta的回复");
        }, error: function () {
        	$.waiting.hide();
        	$.tips("网络不畅，请稍后再试.");
        }
        });
    });
   setTimeout(function(){
       location.reload();
   },2000);
}).on("tap",'#ignore_unread',function(){

    $.ajax({url: ' /v20/msg/ignore_unread.html', type: 'post', dataType: 'json',
        success: function (text) {
            $.tips("已忽略全部!");
            location.reload();
        }
    });
});

// 群打招呼功能添加
function sayHis(users,backFun){
    if(users instanceof Array){
        users = users.join(',');
    }
   $.ajax({url: '/v20/msg/say_hello_jump_batch.do',data:{userIds:users}, type: 'post', dataType: 'json',
        success: function (text) {
            if(text==1){
                $.tips("打招呼成功!");
            }else{
                $.tips("打招呼失败!");
            }
            if(backFun){
                backFun(text);
            }
        }
    });
}

// 附近的人页面点击群打招呼事件处理及初始化 
// 微信端5769渠道单独增加此功能
$(function(){
    var href = location.href,from = $("#fromChannel").val();
    if(href.indexOf("nearby.html")>0 && from==5769){
        $("body").append('<a id="sayHis" class="sayHis"><img src="http://x.test.uyuan.info/xfile/weixin/resources/v20/images/hi.png">群打招呼</a>');
        $(".blank80").css("height",120);
        $("#sayHis").on("click",function(){
            // 获取20位未打招呼用户
            var list = $(".hai_hello"),len = list.length,arr=[],i=len,item,x=0;
            for(;i>0;i--){
                item = list.eq(i-1);
                if(!item.hasClass("hello_out")){
                    arr.push(item.data('hi'));
                    x++;
                    if(x>=20){
                        break;
                    }
                }
            }
            if(x==0){
                $.tips("都打过招呼了，查看更多的人吧！");
            }else{
                // 群打招呼
                sayHis(arr,function(){
                    i = 0;
                    len = arr.length;
                    for(;i<len;i++){
                        // 设置打招呼按钮状态
                        $('[data-hi="' + arr[i] + '"]').removeAttr('data-hi').removeClass("hello").addClass("hello_out").html("已打招呼");
                    }
                });
            }
        })
    }
});
</script>

<script src="<%=request.getContextPath()%>/resources/xl_js/index.js"></script>
<!-- <script src="<%=request.getContextPath()%>/resources/xl_js/recommend.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/headmessage.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/say_hello.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/loading_more.js"></script> -->






    
      <!-- 
       <div class="mail_promise" style="height: 40px;">
	    <div class="scrBox">
            <div href="/v20/msg/chat.html?userId=370009620&amp;source=2" class="tt">
                    <span class="yellow">弱小...给你回信啦~立即查看</span>
                </div>
             
               
            
            
            
            
	    </div>
	      <span class="closed"></span></div>
	    -->
	    
      
 </body></html>