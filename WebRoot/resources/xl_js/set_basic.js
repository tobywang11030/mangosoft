//保存基本资料
var Basic=(function(){
    return {
        citys:{},
        focus: function(id,msg){
            $("body").on("focus",id,function(){
                if($(this).val()==msg)
                {
                    $(this).val('');
                }
            })
        },
        blur:function(id,msg){
            $("body").on("blur",id,function(){
                if($(this).val()=='')
                {
                    $(this).val(msg);
                }
            });
        },
        search_sure:function(){
        	var nickname=$("#nickname").val();
            var year=$("#basic_birthday select").eq(0).val();
            var month=$("#basic_birthday select").eq(1).val();
            var day=$("#basic_birthday select").eq(2).val();
            var province=$("#live select").eq(0).val();
            var city=$("#live select").eq(1).val();
            var basic_height=$("#basic_height").val();
            var basic_weight=$("#basic_weight").val();
            var basic_blood=$("#bloodType").val();
            var basic_edu=$("#education").val();
            var basic_work=$("#vocation").val();
            var basic_income=$("#income").val();
            var basic_marry=$("#marry").val();
            var basic_have=$("#haveHouse").val();

            $.waiting.show("处理中...");
            $.ajax({url:'/v20/info/update.html',
                data:{nick_name:nickname,year:year,month:month,day:day,height:basic_height,province:province,city:city,weight:basic_weight,blood_type:basic_blood,edu:basic_edu,work:basic_work,income:basic_income,marry_type:basic_marry,have_house:basic_have},
                dataType:'json',
                type:'post',
                success: function (data) {
                    $.waiting.hide();
                  setTimeout(function(){
                	  if(data==-1){
                		  alert("用户不存在");
                	  }else if(data==-2){
                		  alert("用户昵称包含敏感词");
                	  }else if(data==-3){
                		  alert("用户内心读白包含敏感词");
                	  }else if(data>=80){
                          alert("保存成功!");
                          location.href = "/v20/info/myspace.html";
                      }else{
                          alert("保存成功!");
                          location.href = "/v20/info/set_extend.html";
                      }
                  },20);
                },
                error:function(){
                    $.waiting.hide();
                    $.tips("网络不畅，请稍候再试");
                }
            })
        },
        initCity:function(p_id){
            $("#live_city").empty();
            $(Basic.citys[p_id]).each(function(){
                var u=this;
                $("#live_city").append('<option value="'+ u.id+'">'+ u.name+'</option>');
            });
            $("#live_city").trigger('change');
        },
        change:function(){
            var p_id=$("#live_province").val();
            if(!Basic.citys[p_id]){
                $.ajax({url:'/v20/json/cities.html',data:{provinceId:p_id},dataType:'json',type:'post',success:function(data){
                    Basic.citys[p_id]=data;
                    Basic.initCity(p_id);
                }})
            }else{
                Basic.initCity(p_id);
            }
        }
    }
})();


$(function () {
    //点击提交
    $("body").on("tap","#search_sure",function(){
            Basic.search_sure();
    }).on("change", ".select select", function () {
        var $this = $(this), $value = $this.closest(".select").children('.value');
        if ($this.val() != 0) {
            $value.text($this.find('option:selected').text());
        }
    }).on("change","#live_province",function(){
            Basic.change();
    });
});
