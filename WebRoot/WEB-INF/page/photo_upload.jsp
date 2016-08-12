<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/common_alert.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/photo_upload.css" rel="stylesheet" type="text/css">
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
              location.reload(true);   
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
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<input type="hidden" id="GUID" value="427543124">
<input type="hidden" id="backUrl" value="">
<div class="top_blank"></div>
<nav class="nav" style="position: absolute;">
    <h2>我的相册</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
</nav>
<div class="content">
    <section class="my_photo">
        <p class="top">室外拍摄的照片更明亮，皮肤更白，更有吸引力。</p>
        <ol class="add_photo">

            
              <li id="add_photo" class="disbox-center add_icon" style="position: relative; overflow: hidden; -webkit-transform-origin: 0px 0px 0px; opacity: 1; -webkit-transform: scale(1, 1);">+  <form id="submit_form" method="post" action="<%=request.getContextPath()%>/weixinpro/uploadphoto?openid=${user.userOpenid}&istx=0" target="exec_target" enctype="multipart/form-data"> <input type="file" accept="image/jpeg,image/png" name="upload_file" id="upload_file" style="position: absolute; width: 100%; height: 100%; left: 0px; top: 0px; right: 0px; bottom: 0px; opacity: 0;" ></form><iframe id="exec_target" name="exec_target" onload="doinit();"></iframe></li>

         
            <c:forEach items="${user.xlPhotos}" var="photo" varStatus="st">
                                 <li href="<%=request.getContextPath()%>/weixinpro/web?action=myalbum&view=my&openid=${user.userOpenid}&pid=${st.index}&toid=${user.id}" ><img src="${photo.src}"></li>
                                </c:forEach>
            
             
            
           
            

        </ol>
        <ul class="quick_pass">
            <li>·单张照片最大2M</li>
            <li>·上传过程中请不要离开当前页面</li>
         
        </ul>
    </section>
</div>

    
    <!--红娘弹窗-->
    <input type="hidden" id="back" name="back" value="">
<div class="mask hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.5); position:fixed; left:0; top:0; z-index:1000;"></div>
<div class="simple_info common_alert hidden">
    <p class="title"><span>提示</span></p>
     
	    
	    	<strong class="articial">糟了！没有完善资料无法开通红娘服务</strong>
		    <div class="bot_btn">
		    	<span href="/v20/user/hongniang_service.html">返回</span>
		        <span href="/v20/register_guide.html?back=hongniang">去完善</span>
		    </div>
	    
    
    <span class="closed"></span>
</div>

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/xl_js/zepto.upload.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <!-- 
    <script src="<%=request.getContextPath()%>/resources/xl_js/photo_upload.js"></script>
     -->
          <script type="text/javascript">
$(document).ready(function(){
    //选择文件成功则提交表单
    $("#upload_file").change(function(){
        if($("#upload_file").val() != '') $("#submit_form").submit();
        $.tips("上传中...");
      
    });

   
});
</script> 
<div id="_cfgwp"><span isenoughactivedaynum="true" version="6.0.5.8"></span></div></body></html>