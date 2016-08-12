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
