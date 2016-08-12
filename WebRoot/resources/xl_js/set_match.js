//征友条件
var Match = (function () {
    return {
        param: {
            con_age_min: $('#con_age_min').val(),
            con_age_max: $('#con_age_max').val(),
            con_height_min: $('#con_height_min').val(),
            con_height_max: $('#con_height_max').val(),
            con_income: $('#con_income').val(),
            con_province: $('#con_province').val(),
            con_edu: $('#con_edu').val(),
            con_girlCareId:$("#con_girlCareId").val()
        },
        changeEvent: function ($this) {
            var $this_box = $this.closest(".option_box"),
                $top = $this_box.find(".top"),
                $title = $this_box.find(".title"),
                $option = $this.closest("ul");
            $option.find("li span").removeClass("pink");
            $this.addClass("pink");
            $title.addClass("pink").html($this.html());
            Match.toggle($top);
        },
        changeAge: function (ageMin, ageMax) {
            Match.param.con_age_max = ageMax;
            Match.param.con_age_min = ageMin;
        },
        changeHeight: function (heightMin, heightMax) {
            Match.param.con_height_min = heightMin;
            Match.param.con_height_max = heightMax;
        },
        changeSalary: function (salary) {
            Match.param.con_income = salary;
        },
        changeEducation: function (education) {
            Match.param.con_edu = education;
        },
        changeProvince: function (provinceId) {
            Match.param.con_province = provinceId;
        },
        changeInterest: function (girlCare) {
            Match.param.con_girlCareId = girlCare;
        },
        save: function () {
            $.waiting.show("处理中...");
            $.ajax({url: "/v20/info/require_reset.html", data: Match.param, dataType: 'json', type: 'post', success: function (data) {
                $.waiting.hide();
                if (data) {
                    $.tips("保存成功");
                    location.href="/v20/info/myspace.html"
                }
            }, error: function () {
                $.waiting.hide();
                $.tips("网络异常，请稍后再试");
            }
            })
        },
        toggle: function ($this) {
            var $ul = $this.next("ul");
            if($ul.hasClass("hidden")){//显示
                $(".top i").removeClass("top_trg").addClass('bot_trg');
                $(".option_box ul").addClass("hidden");
                $this.find("i").addClass("top_trg").removeClass("bot_trg");
                $ul.removeClass("hidden");
            }else{//隐藏
                $this.find("i").removeClass("top_trg").addClass('bot_trg');
                $ul.addClass("hidden");
            }
        }
    }
})
();
//高级搜索
$(function () {
    //切换下拉
    $("body").on("tap", ".top", function () {
        Match.toggle($(this));
    }).on("tap", "#save_btn", function () {
        Match.save();
    }).on("tap",'[data-value]',function(){
        var $this = $(this),type=$this.closest("[data-type]").data("type"),value=$this.data('value'),maxValue=$this.data('max');
        if(type=='age'){
            Match.changeAge(value,maxValue);
        }else if(type=='height'){
            Match.changeHeight(value,maxValue);
        }else if(type=='edu'){
            Match.changeEducation(value);
        }else if(type=='salary'){
            Match.changeSalary(value);
        }else if(type=='province'){
            Match.changeProvince(value);
        }else if(type=='girlCare')
        {
            Match.changeInterest(value)
        }
        Match.changeEvent($this);
    }).on("tap","#careField span",function(){
        var value=$(this).data('value');
        $.ajax({url:'/v20/info/get_girCareList.html',data:{'careFieldId':value},dataType:'json',type:'post',success:function(data){
              if(data)
              {
                  var h='';
                  for(var i=0;i<data.length;i++)
                  {
                      var b=data[i];
                       h += '<li>';
                      for(var name in b)
                      {
                          h += '<span data-value='+name+'>'+b[name]+'</span>';
                      }
                      h += "</li>";
                  }
                  $("ul[data-type='girlCare']").html(h);
              }
        }
        })
    })
});
