var Setting = (function () {
    return{
        isRunning: false,
        width: 0,
        param: {},
        submit: function (callback) {
            $.waiting.show("处理中...");
            Setting.isRunning = true;
            $.ajax({url: 'xianglianpro.do?action=ajax&ajaxtype=age&openid=${user.userOpenid}', data: Setting.param, dataType: 'json', type: 'post', success: function (text) {
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