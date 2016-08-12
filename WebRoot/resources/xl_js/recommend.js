$(function () {
	$('body').on("tap", ".upload_btn", function () {
        $.ajax({url:"/v20/log.html",
        	data:{operationType:43},
        	type:'post',
        	dataType:'json',
        	error:function(){
        	},
        	success:function(){
        		
            }
        });    
        location.href="http://c.youyuan.com/downloadAction!download.action?channelId=45346";
    });
});



