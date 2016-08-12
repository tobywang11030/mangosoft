<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_setting.css" rel="stylesheet" type="text/css">
    
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<div class="top_blank"></div>
<nav class="nav" style="position: absolute;">
    <h2>内心独白</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
    <div class="right">
        <span id="des_sure" class="seach_sure">确定</span>
    </div>
</nav>

<div class="content">
    <textarea autofocus="autofocus" maxlength="120" id="textBox" class="desc_textarea" placeholder="${user.heartSay}" ></textarea>
    <p class="limit"></p>
</div>

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <!-- 
     <script src="<%=request.getContextPath()%>/resources/xl_js/set_desc.js"></script>
     -->
     <script type="text/javascript">
   //内心独白
     $(function () {
         //点击提交
         $("body").on("tap", "#des_sure", function () {
             var tex = $("#textBox").val();
             var openid = $("#openid").val();
             if (tex.length == 0) {
                 return;
             }
             if (tex.length < 10) {
                 $.tips("内心独白最少输入10字");
                 return;
             }
             if (tex.length > 120) {
                 $.tips("内容长度限定在120字内哦！");
                 return;
             }
             $.waiting.show("处理中...");
             $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=heartsay&openid='+openid,
                 data: {heartsay: tex},
                 dataType: 'json',
                 type: 'post',
                 success: function (data) {
                     location.href = "<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid="+openid;
                 },
                 error:function(){
                     $.tips("网络异常，请稍后再试");
                     $.waiting.hide();
                 }
             });

         }).on('change keyup', 'textarea', function () {
             var len = $(this).val().length;
             $('.limit').text("还可输入"+(120 - len)+"字");
         });

     });

     </script>
   
    <input type="hidden" id="openid" value="${user.userOpenid}">
</body></html>