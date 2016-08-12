//保存生活习惯
var Extend = (function () {
    return {
        search_sure: function () {
            var need_bady = $("#need_bady").val();
            var diff_lover = $("#diff_lover").val();
            var love_type = $("#love_type").val();
            var first = $("#sex_first").val();
            var live_with = $("#live_with").val();
            var charm = $("#charm").val();
            var character = null;
            var inter = null;

            var arr = [];
            var arr1 = [];
            $.each($("#interest span"), function (index, item) {
                if ($(this).hasClass("pink")) {
                    var t = $(this).attr("typeId")
                    arr.push(t)
                }
            })
            $.each($("#char span"), function (index, item) {
                if ($(this).hasClass("pink")) {
                    var t = $(this).attr("typeId")
                    arr1.push(t)
                }
            })
            inter = arr.join(',');
            character = arr1.join(',');
            $.waiting.show("处理中...");
            $.ajax({url: '/v20/info/update.html',
                data: {characteristic: character, interest: inter, need_baby_id: need_bady, diff_area_love_id: diff_lover, lover_type_id: love_type, sex_first_id: first, live_with_parent_id: live_with, charm_id: charm},
                dataType: 'json',
                type: 'post',
                success: function (data) {
                    $.waiting.hide();
                    location.href = "/v20/info/myspace.html"
                },
                error:function(){
                    $.tips("网络异常，请稍后再试");
                    $.waiting.hide();
                }
            })

        },
        interest: function ($this) {
            if ($this.hasClass("pink")) {
                $this.removeClass("pink");
            } else {
                $this.addClass("pink");
            }
        }
    }
})();

$(function () {
    //点击提交
    $("body").on("tap", "#search_sure", function () {
        Extend.search_sure();
    }).on("change", ".select select", function () {
        var $this = $(this), $value = $this.closest(".select").children('.value');
        if ($this.val() != 0) {
            $value.text($this.find('option:selected').text());
        }
    }).on("tap", ".four_list span", function () {//修改兴趣
        Extend.interest($(this))
    });
});
