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
        <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/setting.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
    
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<nav class="nav">
    <h2>注册成功</h2>
</nav>
<div class="top_blank content setting">
<ul class="data_box" id="user_info">
    <li><label>您的昵称：</label><span>${user.name}</span></li>
   
    <li><label>性&nbsp;&nbsp; &nbsp;别：</label><span>
     <c:choose>
		    <c:when test="${user.sex==0}">男</c:when>
								<c:otherwise>女</c:otherwise>
		   </c:choose>
    </span></li>
</ul>
<section class="option_box">
    <div class="top">
        <h2>请正确选择您的年龄！</h2>
    </div>
    <ul class="four_list" data-type="age">
        
            
                <li>
            
            <span data-value="18">18</span>
            
            <span data-value="19">19</span>
            
            <span data-value="20">20</span>
            
            <span data-value="21">21</span>
            
                </li><li>
            
            <span data-value="22">22</span>
            
            <span data-value="23">23</span>
            
            <span data-value="24">24</span>
            
            <span data-value="25">25</span>
            
                </li><li>
            
            <span data-value="26">26</span>
            
            <span data-value="27">27</span>
            <span data-value="28">28</span>
            
            <span data-value="29">29</span>
            
                </li><li>
            
            <span data-value="30">30</span>
            
            
        
            
            <span data-value="31">31</span>
            
            
        
            
            <span data-value="32">32</span>
            
            
        
            
            <span data-value="33">33</span>
            
            
        
            
                </li><li>
            
            <span data-value="34">34</span>
            
            
        
            
            <span data-value="35">35</span>
            
            
        
            
            <span data-value="36">36</span>
            
            
        
            
            <span data-value="37">37</span>
            
            
        
            
                </li><li>
            
            <span data-value="38">38</span>
            
            
        
            
            <span data-value="39">39</span>
            
            
        
            
            <span data-value="40">40</span>
            
            
        
            
            <span data-value="41">41</span>
            
            
        
            
                </li><li>
            
            <span data-value="42">42</span>
            
            
        
            
            <span data-value="43">43</span>
            
            
        
            
            <span data-value="44">44</span>
            
            
        
            
            <span data-value="45">45</span>
            
            
        
            
                </li><li>
            
            <span data-value="46">46</span>
            
            
        
            
            <span data-value="47">47</span>
            
            
        
            
            <span data-value="48">48</span>
            
            
        
            
            <span data-value="49">49</span>
            
            
        
            
                </li><li>
            
            <span data-value="50">50</span>
            
            
        
            
            <span data-value="51">51</span>
            
            
        
            
            <span data-value="52">52</span>
            
            
        
            
            <span data-value="53">53</span>
            
            
        
            
                </li><li>
            
            <span data-value="54">54</span>
            
            
        
            
            <span data-value="55">55</span>
            
                <span></span><span></span>
            
            
                </li>
            
        
    </ul>
</section>
</div>
    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
<script type="text/javascript" >
var Setting = (function () {
    return{
        isRunning: false,
        width: 0,
        param: {},
        submit: function (callback) {
            $.waiting.show("处理中...");
            Setting.isRunning = true;
            $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=age&openid=${user.userOpenid}', data: Setting.param, dataType: 'json', type: 'post', success: function (text) {
                $.waiting.hide();
                Setting.width = text;
                Setting.isRunning = false;
                callback();
            },error:function(){
                $.waiting.hide();
                $.tips("网络异常，请稍候再试");
            }
            });
        }
    }
})();
//登陆注册落地页

$(function () {
    $('body').on("tap", '[data-value]', function () {
        if (Setting.isRunning) {
            return;
        }
        var $this = $(this), value = $this.data('value'), type = $this.closest('[data-type]').data('type');
        if (!$this.hasClass("pink")) {
            $this.closest('[data-type]').find('[data-value]').removeClass('pink')
            $this.addClass("pink");
        }
        Setting.param[type] = value;
        Setting.submit(function () {
            location.href = "<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}"
        });
    })

});

</script>


</body></html>