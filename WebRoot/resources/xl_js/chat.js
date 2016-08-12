var Audio=(function(){
    return {
        onstop: function () {
                $(this).closest("[data-audio]").find(".voice").removeClass("voice_gif");
        },
        onplay: function () {
            $(this).closest("[data-audio]").find(".voice").addClass("voice_gif");
        },
        init: function () {

            $('audio').each(function () {
                this.onloadedmetadata = function () {
                    var s = parseInt(this.duration);
                    if(s>0){
                        $(this).closest("[data-audio]").next('[data-audiotime]').text(s + '"');
                    }
                    this.onended = Audio.onstop;
                    this.onpause = Audio.onstop;
                    this.onplay = Audio.onplay;
                }
            })

        },
        play: function ($this) {
           $("audio").each(function () {
               if (this.play) {
                   this.pause();
              }
           });
            var audio = $this.find("audio")[0];
            if( audio.currentTime){
                audio.currentTime = 0;
                audio.play();
            }else{
                audio.play();
                $this.find(".voice").addClass("voice_gif");
                setTimeout(function(){
                    $this.find(".voice").removeClass("voice_gif");
                },8000)
            }
        }
    }
})();

//聊天发信息
var Chat = (function () {
    return {
        isLoading: false,
        userId: $("#userId").val(),
        page: 2,
        size: 3,
        loadData: function () {
            if (Chat.isLoading)return;
            Chat.isLoading = true;
            $('#see_more_record').removeClass('chat_record').addClass('loading').html('<i></i>正在拼命加载...').show();
            $.ajax({url: "/v20/msg/chat_list.html",
                type: "post",
                dataType: 'text',
                data: {userId: Chat.userId, page: Chat.page, size: Chat.size},
                success: function (text) {
                    Chat.page++;
                    Chat.isLoading = false;
                    $("#chat_list").prepend(text);

                    Expression.replaceHtml($('#chat_list'));
                    if (text.trim().length > 0) {

                        //diaoy
                        $('#see_more_record').removeClass('loading').addClass('chat_record').html('<span>更多聊天记录</span>');
                    } else {
                        $('#see_more_record').remove();
                    }
                }, error: function () {
                    Chat.isLoading = false;
                    $('#see_more_record').removeClass('loading').addClass('chat_record').html('<span>更多聊天记录</span>');
                }
            });
        },
       showInput:function () {
    	   $.ajax({url: "/v20/msg/show_input.html",
               type: "post",
               dataType: 'json',
               data: {userId: Chat.userId},
               success: function (text) {
            	   if(text == 1){
            		   var nickName = $("#title_nav").html();
            		   setTimeout(function(){
            			   $("#title_nav").html("对方正在输入...");
                	   }, 100);
                	   setTimeout(function(){
                		   $("#title_nav").html(nickName);
                	   }, 1000);
            	   }
               }, error: function () {
               }
           });
       } ,
        new_answer:function($this){
            var answer=$this.data("answer");
            var userId=$("#userId").val();
            var question=$("#question").val();
            var creatTime = $("#creatTime").val();
            var date = new Date();
            creatTime = creatTime?creatTime:(date.getFullYear() + '-'+ (date.getMonth()>9?(date.getMonth()+1):('0'+(date.getMonth()+1))) + '-' + (date.getDate()>9?date.getDate():('0'+date.getDate())) + ' ' + (date.getHours()>9?date.getHours():('0'+date.getHours()))+":"+(date.getMinutes()>9?date.getMinutes():('0'+date.getMinutes())));
            $this.addClass("active");
            $.ajax({url:'/v20/msg/say_hello_qa.html',type:'post',data:{question:question,answer:answer,userId:userId,creatTime:creatTime},dataType:'json',
            	success:function(data){
            		$(".new_answer").hide();
            		var message = "答对了，试着和她聊聊吧！";
            		if(data == 2){
            			message = "哦！答错了，找其他美女聊聊吧！";
            		}
            		$.tips(message);
            		setTimeout(function(){
            			 location.reload();
                    },1000);
            		
            	}
            });
            
        } ,
        old_answer:function($this){
            var answer=$this.data("answer");
            var userId=$("#userId").val();
            var question=$("#question").val();
            var creatTime = $("#creatTime").val();
            var date = new Date();
            creatTime = creatTime?creatTime:(date.getFullYear() + '-'+ (date.getMonth()>9?(date.getMonth()+1):('0'+(date.getMonth()+1))) + '-' + (date.getDate()>9?date.getDate():('0'+date.getDate())) + ' ' + (date.getHours()>9?date.getHours():('0'+date.getHours()))+":"+(date.getMinutes()>9?date.getMinutes():('0'+date.getMinutes())));
            $this.addClass("active");
            $.ajax({url:'/v20/msg/say_hello_qa.html',type:'post',data:{question:question,answer:answer,userId:userId,creatTime:creatTime},dataType:'json',
            	success:function(data){
            		$.tips("回信已成功发送，请耐心等待回复~");
            		setTimeout(function(){
            			 location.reload();
                    },1000);
            	}
            });
        }
    }
})
();


$(function () {		
    $("body").on("tap", '#see_more_record', function () {
        Chat.loadData();
       
    });
    //点击播放语音
    $("body").on("tap", "[data-audio]", function () {
        Audio.play($(this))
    });
    Audio.init();
    /*下线输入状态
     * Chat.showInput();*/
    $("body").on("tap", '.new_answer li', function () {
        //新版Qa选择答案逻辑
        Chat.new_answer($(this));
    }).on("tap", '.answer li', function () {
        //老版选择答案逻辑
        Chat.old_answer($(this));
    });
});
