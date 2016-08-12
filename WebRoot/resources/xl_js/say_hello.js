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
    $.ajax({url: 'xianglianpro.do?action=ajax&ajaxtype=sayhello', data: {userId: userId, source: source,fateFlag:fate}, dataType: 'json', type: 'post', success: function (data) {
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
        $.ajax({url: 'xianglianpro.do?action=ajax&ajaxtype=sayhello', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {
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