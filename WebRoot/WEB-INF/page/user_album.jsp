<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
            <link href="<%=request.getContextPath()%>/resources/xl_js/public_headmessage.css" rel="stylesheet" type="text/css">
            <link href="<%=request.getContextPath()%>/resources/xl_js/user_album.css" rel="stylesheet" type="text/css">
            <link href="<%=request.getContextPath()%>/resources/xl_js/bottom_call.css" rel="stylesheet" type="text/css">
        
</head>
<body style="background-color: #000" class="disbox-ver"><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<nav class="nav" id="album_top">
    <h2>${matchuser.name}（<span id="now">2</span>/<span id="all"></span>）</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
</nav>
<div class="album disbox-flex disbox-hor">
    <ul class="disbox-hor" id="photo_list" style="width: 800%;">
            <c:forEach items="${matchuser.xlPhotos}" var="photo">
                               
                              
                               <li class="disbox-flex disbox-center" style="-webkit-transform: translateX(-100%);"><img src="${photo.src}"></li>
         </c:forEach>
        
    </ul>
</div>
<div class="bottomNext" id="album_bottom">
	 
             <span data-sayhi="${matchuser.id}" data-source="${user.id}"><i class="icon-bt-hello"></i>打招呼</span>
        

    
</div>
<input type="hidden" value="${pid}" id="photo_index">


    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <!-- 
    <script src="<%=request.getContextPath()%>/resources/xl_js/album_say_hello.js"></script>
    -->
    <script src="<%=request.getContextPath()%>/resources/xl_js/user_album.js"></script>
    <script type="text/javascript">
    $("body").on("tap", '[data-sayhi]', function (e) {
        $.stopPropagation(e);
        var $this = $(this), userId = $this.data('sayhi'), source = $this.data('source');
        if (!source) {
            source = '0';
        }
        $('[data-sayhi="' + userId + '"]').removeAttr('data-sayhi').removeClass("hello").addClass("hello_out").html('<i class="icon-bt-hello"></i>已打招呼');
        $.waiting.show("正在打招呼...");
        $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=sayhello', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {

            if (data == 13) {
                location.href = "/v20/user/hello_template.html?userId=" + userId;
            } else {
                $.waiting.hide();
                if (data == 6) {
                    $.tips("你今天已经向Ta打过招呼了。");
                } else {
                    $.tips("招呼已发出，请耐心等待Ta的回复");
                }

            }
        }, error: function () {
            $.waiting.hide()
        }
        });
        return false;
    })
    </script>
<div id="_cfgwp"><span isenoughactivedaynum="true" version="6.0.5.8"></span></div></body></html>