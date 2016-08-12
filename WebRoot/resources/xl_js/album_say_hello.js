$("body").on("tap", '[data-sayhi]', function (e) {
    $.stopPropagation(e);
    var $this = $(this), userId = $this.data('sayhi'), source = $this.data('source');
    if (!source) {
        source = '0';
    }
    $('[data-sayhi="' + userId + '"]').removeAttr('data-sayhi').removeClass("hello").addClass("hello_out").html('<i class="icon-bt-hello"></i>已打招呼');
    $.waiting.show("正在打招呼...");
    $.ajax({url: 'xianglianpro.do?action=ajax&ajaxtype=sayhello', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {

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