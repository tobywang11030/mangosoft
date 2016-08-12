<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh" class="pu"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
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
        <link href="<%=request.getContextPath()%>/resources/xl_js/myspace.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/home_page.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/herd_hello.css" rel="stylesheet" type="text/css">
        <!--<script src="<%=request.getContextPath()%>/resources/xl_js/tip.html"></script><script src="<%=request.getContextPath()%>/resources/xl_js/tip(1).html"></script> 
        
           //若iframe携带返回数据，则显示在feedback中
            if(data != null){
              // alert(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
              var rs = data.replace(/&lt;/g,'<').replace(/&gt;/g,'>');
             // alert(rs);
               if(rs.indexOf("success")!=-1){
            	  var fn =  rs.split(",")[1];
            	  //alert(fn);
            	  $("#txphoto").attr('src',fn); 
            	  $("#upload_file").val('');
               }else{
            	   alert("上传失败");
               }
               
            }
         -->
        <script type="text/javascript">
        function doinit(){
        	var win = document.getElementById('exec_target').contentWindow;
        	//alert( win.document.body.innerHTML );
        	var data;
        	if(win.document.body.innerHTML!="")
          	 data = win.document.getElementsByTagName("pre")[0].innerHTML;  
          	
          	 if(data != null){
                 // alert(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
                 var rs = data.replace(/&lt;/g,'<').replace(/&gt;/g,'>');
                // alert(rs);
                  if(rs.indexOf("success")!=-1){
               	  var fn =  rs.split(",")[1];
               	  //alert(fn);
               	  document.getElementById('txphoto').src=fn;
            	  document.getElementById('upload_file').value="";
               	 // $("#txphoto").attr('src',fn); 
               	 // $("#upload_file").val('');
                  }else if(rs.indexOf("error_no_tishi")!=-1){
                	  
                  }else{
               	   alert("上传失败");
                  }
                  
               }
           }
        </script>
<style>
    #exec_target{display:none;width:0;height:0;}
</style>
</head>
<body yy="no"><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<input type="hidden" name="fromChannel" id="fromChannel" value="6307">

<div class="top_blank"></div>








  

<header class="head">
    <h1 class="disbox-center logo"></h1>
    <ul class="main_nav disbox-hor" id="nav_menu">
        <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=userlist&openid=${user.userOpenid}">缘分</a></li>
        <li class="disbox-flex disbox-center "><a href="<%=request.getContextPath()%>/weixinpro/web?action=chatlist&openid=${user.userOpenid}">聊天</a></li>
       
        <li class="disbox-flex disbox-center active"><a href="<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}">我</a></li>
    </ul>
</header>



<div>
    <div class="loading"><i></i>加载中...</div>
    <div>
        <section class="content wxcontent" id="myspace_section">
            <section class="my_space">
                <div class="user_box">
                    <dl class="user">
                        
                                <dt id="change_icon" style="position: relative; overflow: hidden;">
   <c:choose>
	 <c:when test="${user.sex==0}"> 
		    <c:choose>
		    <c:when test="${user.photo!=null}"> <img src="${user.photo}" id="txphoto"></c:when>
								<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/boy.png" id="txphoto"></c:otherwise>
		   </c:choose>
	</c:when>
	<c:otherwise> 
								
			 <c:choose>
		    <c:when test="${user.photo!=null}"> <img src="${user.photo}" id="txphoto"></c:when>
			<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/girl.png" id="txphoto"></c:otherwise>
		   </c:choose>
	</c:otherwise>
	 </c:choose>
                               
                                <div class="checking">点击上传</div>
                       <form id="submit_form" method="post" action="<%=request.getContextPath()%>/weixinpro/uploadphoto?openid=${user.userOpenid}&istx=1" target="exec_target" enctype="multipart/form-data"> <input type="file" accept="image/jpeg,image/png" name="upload_file" id="upload_file" style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; right: 0px; bottom: 0px; opacity: 0;" ></form><iframe id="exec_target" name="exec_target" onload="doinit();"></iframe></dt>
                            
                        <dd>
                            <b class="name">${user.name}
                            </b>


                            <p>${user.age}岁·${region.regionName}</p>

                            <p>
							
							
							<c:choose>
		 <c:when test="${user.userType==0}">
		  <span href="/v20/info/vip_center.html" class="vip noCheck">普通用户</span>
		 </c:when>
								<c:otherwise>
								<span href="/v20/info/vip_center.html" class="vip">VIP</span>
								</c:otherwise>
		   </c:choose>
		   
		  <c:choose>
                <c:when test="${user.authTypePhone==0}">
                         <span href="/v20/info/auth_mobile.html" class="phone noCheck">手机认证</span>
				</c:when>
				<c:otherwise>	
				 <span href="/v20/info/auth_mobile.html" class="phone">手机认证</span>	
				 </c:otherwise>
				   </c:choose>
				   
                          <c:choose>
                <c:when test="${user.authTypePeople==0}">
                        <span href="/v20/info/auth_idcard.html" class="identity noCheck">身份认证</span>
						</c:when>
						<c:otherwise>	
						   <span href="/v20/info/auth_idcard.html" class="identity">身份认证</span>
						 </c:otherwise>
				   </c:choose>
						
						
                            </p>

                        </dd>
                    </dl>
                </div>
                <!--  <div class="btn">
                    <span href="/v20/mylove.html" class="disbox-center">我关注的</span>
                    <span href="/v20/loveme.html" class="disbox-center">关注我的</span>
                </div> 
                
                 <div class="section_1">
                        <ul class="disbox-hor user-list" href="/v20/charge/service_amount.html?type=doubi">
                            <li class="disbox-flex">豆币账户</li>
                            <li class="disbox-center pink">
                                
                                购买
                                <div class="right_trg"></div>
                            </li>
                        </ul>
                        <ul class="disbox-hor user-list" href="/v20/charge/service_amount.html?type=baoyue">
                            <li class="disbox-flex">写信包月</li>
                            <li class="disbox-center pink">
                                
                                开通
                                <div class="right_trg"></div>
                            </li>
                        </ul>
                        
                    
                    </div>
                -->
               
                
                   
                
                <div class="section_1">
                    <ul href="<%=request.getContextPath()%>/weixinpro/web?action=myphoto&openid=${user.userOpenid}" class="disbox-hor user-list">
                        <li class="disbox-flex">我的相册</li>
                        <li class="disbox-center">
                            
                            <div class="re_trg"></div>
                        </li>
                    </ul>
                

                    <ul href="<%=request.getContextPath()%>/weixinpro/web?action=heartsay&openid=${user.userOpenid}" class="disbox-hor user-list">
                        <li class="disbox-flex">内心独白</li>
                        <li class="disbox-center">
                            
                                <c:choose>
		 <c:when test="${user.heartSay!=null}"></c:when>
								<c:otherwise> <span class="no_finish">未完成</span></c:otherwise>
		   </c:choose>
                            
                            <div class="re_trg"></div>
                        </li>
                    </ul>
                </div>
                <div class="section_1">
                    <ul href="<%=request.getContextPath()%>/weixinpro/web?action=basic_info&openid=${user.userOpenid}" class="disbox-hor user-list">
                        <li class="disbox-flex">基本资料</li>
                        <li class="disbox-center">
                            
                                <c:choose>
		 <c:when test="${user.userinfo!=null}"></c:when>
								<c:otherwise><span class="no_finish">未完成</span></c:otherwise>
		   </c:choose>
                            
                            <div class="re_trg"></div>
                        </li>
                    </ul>
                    <ul href="<%=request.getContextPath()%>/weixinpro/web?action=more_info&openid=${user.userOpenid}" class="disbox-hor user-list">
                        <li class="disbox-flex">详细资料</li>
                        <li class="disbox-center">
                            
                                 <c:choose>
		 <c:when test="${user.userinfoMore!=null}"></c:when>
								<c:otherwise><span class="no_finish">未完成</span></c:otherwise>
		   </c:choose>
                            
                            <div class="re_trg"></div>
                        </li>
                    </ul>
                    <ul href="<%=request.getContextPath()%>/weixinpro/web?action=match&openid=${user.userOpenid}" class="disbox-hor user-list">
                        <li class="disbox-flex">征友条件</li>
                        <li class="disbox-center">
                            
                            <c:choose>
		 <c:when test="${user.userinfoSelect!=null}"></c:when>
								<c:otherwise> <span class="no_finish">未完成</span></c:otherwise>
		   </c:choose>
                            
                            <div class="re_trg"></div>
                    </li></ul>
                </div>
                <!-- 
                  <div class="section_1">
                    <ul href="/v20/info/setting_center.html" class="disbox-hor user-list">
                        <li class="disbox-flex">设置中心</li>
                        <li class="disbox-center">
                            <div class="re_trg"></div>
                        </li>
                    </ul>
                </div>
                 -->
              
                
                <div class="CC_Box" style="margin:10px 0;"><div id="CC123" class="CC_Box_li"><ul></ul></div></div>
            </section>

        </section>
    </div>
</div>

<input type="hidden" id="GUID" value="427543124">

<div id="mask" class="mask hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;"></div>
<!--弹窗-->
<div id="identity" class="simple_info hidden">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_identity.jpg"></dt>
        <dd class="tit">身份验证</dd>
        <dd>身份验证特别有诚意、让Ta安心</dd>
    </dl>    
</div>
<div id="vip" class="simple_info hidden">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_vip.jpg"></dt>
        <dd class="tit">vip用户</dd>
        <dd>拥有免费写信等11大特权</dd>
    </dl>
</div>
<div id="phone" class="simple_info hidden">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_phone.jpg"></dt>
        <dd class="tit">手机验证用户</dd>
        <dd>忘记密码可第一时间找回</dd>
    </dl>       
</div>
<!--关注-->







    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/ajax.js"></script>

    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    
    	<script src="<%=request.getContextPath()%>/resources/xl_js/headmessage.js"></script>
	
  
    <script src="<%=request.getContextPath()%>/resources/xl_js/say_hello.js"></script>
    <!--   <script src="<%=request.getContextPath()%>/resources/xl_js/index.js"></script>
       <script src="<%=request.getContextPath()%>/resources/xl_js/myspace.js"></script>
         <script src="<%=request.getContextPath()%>/resources/xl_js/loading_more.js"></script>
         <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.upload.js"></script>
           <script src="<%=request.getContextPath()%>/resources/xl_js/jquery-1.3.2.min.js"></script>
           
           
             var ifbody = document.getElementById("exec_target");
        var bodyhtml = ifbody.innerHTML;
        alert(bodyhtml);
            //iframe加载响应，初始页面时也有一次，此时data为null。
  
    $("#exec_target").load(function(){
    	 alert('sef');
        var data = $(window.frames['exec_target'].document.body).find("pre").html();
        alert('4848');
        //若iframe携带返回数据，则显示在feedback中
        if(data != null){
          // alert(data.replace(/&lt;/g,'<').replace(/&gt;/g,'>'));
          var rs = data.replace(/&lt;/g,'<').replace(/&gt;/g,'>');
         // alert(rs);
           if(rs.indexOf("success")!=-1){
        	  var fn =  rs.split(",")[1];
        	  //alert(fn);
        	  $("#txphoto").attr('src',fn); 
        	  $("#upload_file").val('');
           }else{
        	   alert("上传失败");
           }
           
        }
    });
     -->
     
       <script type="text/javascript">
$(document).ready(function(){
    //选择文件成功则提交表单
    $("#upload_file").change(function(){
        if($("#upload_file").val() != '') $("#submit_form").submit();
      
    });

   
});
</script>
 <style>.CC_Box_li{width: 100%;height:65.66666666666667px;border:0px solid #000;position:relative;overflow:hidden;}.CC_Box_li ul{position:absolute;top:0;left:0;width:9000px;transition:1s all ease;}.CC_Box_li ul li{width:394px;height:65.66666666666667px;float:left;list-style:none}.banimg{ width:394px;height:65.66666666666667px;}@-webkit-keyframes scro{from{left:0;}to{left:-394px;}}</style>
 








</body></html>