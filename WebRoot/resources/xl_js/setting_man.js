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
            location.href = "xianglianpro.do?action=myhome&openid=${user.userOpenid}"
        });
    })

});
