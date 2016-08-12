$.header = (function () {
    return {
        timer2:null,
        T:0,
        w:0,
        move:function(obj,iTarget)
        {
            clearInterval(obj.timer);
            obj.timer=setInterval(function (){
                var iSpeed=(iTarget - $.header.T)/8;
                iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
                $.header.T+=iSpeed;
                obj.style.top=$.header.T%$.header.w+'px';
                if($.header.T==iTarget){
                    clearInterval(obj.timer);
                }
            },30);
        },
        
        scrT:function(){
            try{
                //向上滚动
                var oBox=$(".mail_promise")[0];
                var oUl=$(".scrBox")[0];
                var aLi=oUl.children;

                if(aLi.length>1){
                    oUl.innerHTML+=oUl.innerHTML;
                    $.header.w=oUl.offsetHeight/2;
                    var count=0;
                    clearInterval($.header.timer2);
                    $.header.timer2=setInterval(function(){
                        count++;
                        $.header.move(oUl,-count*aLi[0].offsetHeight)
                    },2000)
                }
            }catch(e){}
        },
        show: function () {
            if ($(".mail_promise").length == 0) {
                $.post('/v20/msg/headmenu_message.html', {}, function (html) {
                    if ($(html).length > 0) {
                        $('body').append(html);
                        //做成动画出来
                        $('.mail_promise').animate({height: "40px"}, 200, 'linear',function(){
                            $.header.scrT()
                        });
                        $('.mail_promise').on("touchend", '.closed', function (e) {//打开连接
                            $.ajax({url: '/v20/log.html', data: {operationType: 38}, type: 'post', dataType: 'json'});
                            $.header.hide();
                            return false;
                        }).on("touchend", '.tt', function (e) {

                            $.ajax({url: '/v20/log.html', data: {operationType: 37}, type: 'post', dataType: 'json'});
                            var url = $(this).attr("href");
                            if (url) {
                                location.href = url;
                            }
                            return false;
                        });
                    } else {
                        $.header.hide();
                    }
                }, 'text');
            }
        },
        hide: function () {
            $(".mail_promise").remove();
        }
    };
})();
