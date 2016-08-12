$(function () {
    /* var bDown=true;*/
    //上传照片
    if (window.youyuan) {
        $('#change_icon').on("tap", function () {
            var options = {url:  'http://'+location.host+'/v20/photo/upload_file.html', params: {isMain: "1", userId: $("#GUID").val()}, callback: "Photo.addPhoto"};
            youyuan.upload(JSON.stringify(options));
        });
    } else {
        $("#change_icon").upload({
            action: '/v20/photo/upload_file.html',
            params: {isMain: 1},
            onChooseFile:function(img){
                Photo.loading(img);
            },
            onSubmit: function (data) {
                Photo.changePhoto(data);
            }
        })
    }
    MySpace.init();
	$('body').on("tap", "[data-value]", function () {
        MySpace.intercept($(this));
    }).on("tap", ".closed,#mask", function () {
    	MySpace.cancelCheck();
    }).on("tap",".atte_btn",function(){
        $.ajax({url:"/v20/banner_attention_flag_send.html",type:"post",data:"",dataType:"json",success:function(data){
            $(".attention").remove();
        }
        });
    });
    //添加服务头像
    if((!$(".vip").hasClass("noCheck") && $(".vip")[0]) || (!$(".phone").hasClass("noCheck") && $(".phone")[0]) || (!$(".identity").hasClass("noCheck") && $(".identity")[0])){
        $(".personIcon").css("display","inline-block");
    }
});

var MySpace = (function () {
	return {
		intercept: function ($this) {
            var Id = '#' + $this.data("value");
            $("#mask").removeClass("hidden");
            $(Id).removeClass("hidden").siblings(".simple_info").addClass("hidden");
        },
        cancelCheck: function () {
            $(".simple_info").addClass("hidden");
            $("#mask").addClass("hidden");
        },
        init:function(){
            $.header.show();
            if(getCookie("showBrowser")){
                $(".book_mark").remove();
            }
            browser();
        }
	};
})();

/***********************
    注明：获取广告数据接口 
    1. 用户ID是：userId
    2. 版位号是：position
    3. 回调方法：jsoncallback
    我的空间广告
    *******************************/
    pageadload()
    function pageadload(){
    ajax({
        //url:"http://192.168.66.90:8080/php/test7.php",
        url:"/v20/user/tip.html",
        //url:"http://p.fxt.dev.uyuan.info/v20/testActive.html",
        type:"POST",
        data:{position:"weixin-myspace-02"},
        dataType:"jsonp",
        callback:"Jsoncallback",
        success:function(data){
            var yy=JSON.stringify(data);
            var itemD=data.advert,$adList=$(".CC_Box_li ul"),adlength=data.advert.length,_userId=$("body").data("userid");
            if(adlength==1){
                var liname='one';
            }else{
                var liname='adli';
                $(".CC_Box_li ul").attr("id","elUl");
            }
            if(data!=''){
                var ison=true;
                if(ison){
                    for(var i=0;i<data.advert.length;i++){
                        if(itemD[i].linkType==1){
                            var linkTypeN='target="_blank"';
                        }
                        if(itemD[i].linkType==0){
                            var linkTypeN='';
                        }

                        var _html='<li class="'+liname+'"><a href="'+itemD[i].linkUrl+'" eventid="'+itemD[i].activeid+'" provinceid="'+data.province+'" '+linkTypeN+'><img src="'+itemD[i].picUrl+'" class="banimg"></a></li>';
                        $(".CC_Box_li ul").append(_html);

                        /***【刘新修】广告展示数量统计***/
                        $.get("http://x.youyuan.com/adStatistics.gif?eventid="+itemD[i].activeid+"&positionid=weixin-myspace-02&provinceid="+data.province+"&userid="+_userId+"&adtype=OnLoad&_=16");
                    }
                    /***【刘新修】广告点击数量统计***/
                    $adList.on("touchstart","a",function(){
                        var _eventid=$(this).attr("eventid");
                        var _provinceid=$(this).attr("provinceid");
                        //alert(_eventid)
                        $.get("http://x.youyuan.com/adStatistics.gif?eventid="+_eventid+"&positionid=weixin-myspace-02&provinceid="+_provinceid+"&userid="+_userId+"&adtype=Click&_=16");
                    });
                    
                }
            }
        },
        fail:function(status){
            $.tips("服务器或网络异常请稍后重试！");
        }
    });
    }

    //注意先后顺序
    var domW=$(".CC_Box").width();
    var leng=$(".CC_Box_li ul li").length;
    var boxW=domW*leng;
    var domH=domW/12;

    document.write("<style>.CC_Box_li{width: 100%;height:"+domH*2+"px;border:0px solid #000;position:relative;overflow:hidden;}.CC_Box_li ul{position:absolute;top:0;left:0;width:9000px;transition:1s all ease;}.CC_Box_li ul li{width:"+domW+"px;height:"+domH*2+"px;float:left;list-style:none}.banimg{ width:"+domW+"px;height:"+domH*2+"px;}@-webkit-keyframes scro{from{left:0;}to{left:-"+domW+"px;}}</style>");
    window.onload=function(){
        var oUl=document.getElementsByTagName('ul')[0];
        var elUl=document.getElementById("elUl");
        if(elUl!=null){
            setInterval(function(){ 
                elUl.style.WebkitAnimation='scro 0.5s linear forwards';
                elUl.style.MozAnimation="scro 0.5s linear forwards";
                elUl.style.msAnimation='scro 0.5s linear forwards';
                elUl.style.OAnimation='scro 0.5s linear forwards';
                elUl.style.animation='scro 0.5s linear forwards';
                //oUl.style.transform='translateY(-100px)';
                //oUl.addEventListener("webkitAnimationEnd",end);
                if(elUl.offsetLeft<=-domW){
                    elUl.style.WebkitAnimation='';
                    var b=elUl.children[0];
                    elUl.appendChild(b);
                    //clearInterval(timer)
                }           
            },3000);
        }
    }



