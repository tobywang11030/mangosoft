<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, matchuser-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<title>想恋</title>
 <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/write_msg.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/new_Chat.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/face.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/voice.css" rel="stylesheet" type="text/css">
 <link href="<%=request.getContextPath()%>/resources/xl_js/common_alert.css" rel="stylesheet" type="text/css">
 <script type="text/javascript">
function initlist(){

	 $.getJSON("<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=chatforme&openid=${user.userOpenid}&matchid=${matchuser.id}", function(data) {
		
		// removeChildren();
		$("#chat_list").empty();
			$.each(data, function(i, item) {
				var $li = $("<li></li>");
				$li.addClass("time");
				$li.append(item.sendtime);
				var $li1 = $("<li></li>");
				if(item.from_id==${user.id}){
					$li1.addClass("me disbox-hor dis_block");
				}else{
					$li1.addClass("you disbox-hor dis_block");
				}
				var $div = $("<div></div>");
				if(item.from_id==${user.id}){
					$div.addClass("f_right");
				}else{
					$div.addClass("f_left");
				}
				$div.css('position','relative'); 
				$div.append("<img src='"+item.photo+"'/>");
				var $div1 = $("<div></div>");
				if(item.from_id==${user.id}){
					$div1.addClass("disbox-flex f_right no_padding");
				}else{
					$div1.addClass("disbox-flex f_left no_padding");
				}
				var $p = $("<p></p>");
				$p.addClass("talk");
				$p.append(item.content);
				$div1.append($p);
				var $div2 = $("<div></div>");
				if(item.from_id==${user.id}){
					$div2.addClass("f_right");
				}else{
					$div2.addClass("f_left");
				}
				$li1.append($div);
				$li1.append($div1);
				$li1.append($div2);
				
				$("#chat_list").append($li);
				$("#chat_list").append($li1);
				
				var bodyh=$(document.body).height();
			
				var senddivh = $('#senddiv').height();
				var dlh= $('#dlh').height();
				 $("#ulchat").height(parseInt(bodyh)-parseInt(senddivh)-parseInt(dlh));
				$('#ulchat').scrollTop( $('#ulchat')[0].scrollHeight);
			});
    });
}

function initdialogue(){
	initlist();
	setInterval("initlist()",3000);
	
}
function removeChildren(){    
	var pnode =  document.getElementById("chat_list");
	var childs=pnode.childNodes;    
	for(var i=childs.length-1;i>=0;i--){    
	pnode.removeChild(childs.item(i));    
	}    
	}  
	function dosay(){

		 $.post("<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=chatsay&openid=${user.userOpenid}&matchid=${matchuser.id}",
				    {
			 content:$("#say").val()
				     
				    },
				    function(data,status){
				    	if(data=="success"){
							 initlist();
							 $("#say").val("");
						}else{
							alert("发送失败");
						}
				    });
	}
</script>
 </head>
<body onload="initdialogue();">

<div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
	<div class="top_blank"></div>
	<div id="chat_nav" class="nav" style="position: absolute;">
		<h2 class="title" id="title_nav">${matchuser.name}</h2>
		
		<div class="left"  onClick="history.go(-1)">
			<i class="le_trg"></i>返回
		</div>
		
			<div class="right" href="<%=request.getContextPath()%>/weixinpro/web?action=chatlist&openid=${user.userOpenid}">下一封</div>
		
	</div>

	<div id="chat_detail" class="content">
		
			<dl class="Material" href="<%=request.getContextPath()%>/weixinpro/web?action=matchuserinfo&openid=${user.userOpenid}&matchid=${matchuser.id}" id="dlh">
				<dt>
					 <c:choose>
	 <c:when test="${matchuser.sex==0}"> 
		    <c:choose>
		    <c:when test="${matchuser.photo!=null}"> <img src="${matchuser.photo}"></c:when>
								<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/boy.png"></c:otherwise>
		   </c:choose>
	</c:when>
	<c:otherwise> 
								
			 <c:choose>
		    <c:when test="${matchuser.photo!=null}"> <img src="${matchuser.photo}"></c:when>
			<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/girl.png"></c:otherwise>
		   </c:choose>
	</c:otherwise>
	 </c:choose>
				</dt>
				<dd>
					<p class="nick_name">${matchuser.age}岁·${region.regionName}·${matchuser.userinfo.height}cm
					</p>
					<p class="info"> <c:if test="${matchuser.userinfo.maritalstatus==1}">
                                       未婚
            </c:if>
             <c:if test="${matchuser.userinfo.maritalstatus==2}">
                                        离异
            </c:if>
             <c:if test="${matchuser.userinfo.maritalstatus==3}">
                                       丧偶
            </c:if>·   <c:if test="${matchuser.userinfo.income==3}">
                                       2000元以下
            </c:if>
             <c:if test="${matchuser.userinfo.income==4}">
                                        2000-5000
            </c:if>
             <c:if test="${matchuser.userinfo.income==5}">
                                       5000-10000
            </c:if>
             <c:if test="${matchuser.userinfo.income==6}">
                                      10000-20000
            </c:if>
             <c:if test="${matchuser.userinfo.income==7}">
                                      20000以上
            </c:if></p>
					<p>
						  <c:choose>
                <c:when test="${matchuser.authTypePhone==0}">
                        <span data-value="phone" class="phone noCheck">手机认证</span>
				</c:when>
				<c:otherwise>	
				<span data-value="phone" class="phone ">手机认证</span>
				 </c:otherwise>
				   </c:choose>
                         <c:choose>
                <c:when test="${matchuser.authTypePeople==0}">
                      <span data-value="identity" class="identity noCheck">身份认证</span>
						</c:when>
						<c:otherwise>	
						  <span data-value="identity" class="identity">身份认证</span>
						 </c:otherwise>
				   </c:choose>  
					</p>
				</dd>
			</dl>
		
		<div id="ulchat" style="overflow:auto;">
		<ul id="chat_list" class="chatList">
			

		</ul>
		</div>
	</div>
	
	
			
				
						<div class="but_send" id="senddiv"><div style="width: 80%;height: 100%;float: left;"><input type="text" id="say" style="width: 100%;height: 100%"></div><div style="width: 20%;height: 100%;float: left;" onclick="dosay()">发送</div></div>
					
			
		
	
	<!-- 语音弹窗-->
	<input type="hidden" id="matchuserId" value="388055773">
	<input type="hidden" id="senderId" value="427543124">
	<input type="hidden" id="question" value="请问你近期有结婚打算吗？">
	<input type="hidden" id="creatTime" value="2015-11-30 16:37">
	<input type="hidden" id="myIcon" value="/xfile/weixin/<%=request.getContextPath()%>/resources/v20/images/boy.png">

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/expression.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/say_hello.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/chat.js"></script>
	<script src="<%=request.getContextPath()%>/resources/xl_js/jweixin-1.0.0.js"></script>
	<script>
		Expression.replaceHtml($('#chat_list'));
	</script>
	
	
<div id="_cfgwp"><span isenoughactivedaynum="true" version="6.0.5.8"></span></div></body></html>