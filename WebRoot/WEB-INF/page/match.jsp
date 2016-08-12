<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_setting.css" rel="stylesheet" type="text/css">
    
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<div class="top_blank"></div>
<nav class="nav" style="position: absolute;">
    <h2>征友条件</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
    <div class="right">
        <span id="save_btn" class="seach_sure">确定</span>
    </div>
</nav>
<div class="content">
    <div class="option_box">
        <div class="top">
            <h2>年龄范围</h2>
            <span class="unlimit"><span class="title pink">
            <c:if test="${user.userinfoSelect==null or user.userinfoSelect.ageSelect==null or (user.userinfoSelect.ageSelect==0 and user.userinfoSelect.ageSelectMax==0)}">不限</c:if>
            <c:if test="${user.userinfoSelect.ageSelect==18 and user.userinfoSelect.ageSelectMax==25}">18-25岁</c:if>
            <c:if test="${user.userinfoSelect.ageSelect==26 and user.userinfoSelect.ageSelectMax==35}">26-35岁</c:if>
            <c:if test="${user.userinfoSelect.ageSelect==36 and user.userinfoSelect.ageSelectMax==45}">36-45岁</c:if>
            <c:if test="${user.userinfoSelect.ageSelect==46 and user.userinfoSelect.ageSelectMax==55}">46-55岁</c:if>
            <c:if test="${user.userinfoSelect.ageSelect==56 and user.userinfoSelect.ageSelectMax==100}">55岁以上</c:if>
            </span><i class="top_trg"></i></span>
        </div>
        <ul data-type="age">
            
                <li>
                
                <span data-value="0" data-max="0" <c:if test="${user.userinfoSelect==null or user.userinfoSelect.ageSelect==null or (user.userinfoSelect.ageSelect==0 and user.userinfoSelect.ageSelectMax==0)}">class="pink"</c:if> >不限</span>
                
                
            
                
                <span data-value="18" data-max="25" <c:if test="${user.userinfoSelect.ageSelect==18}">class="pink"</c:if>>18-25岁</span>
                
                </li>
            
                <li>
                <span data-value="26" data-max="35" <c:if test="${user.userinfoSelect.ageSelect==26}">class="pink"</c:if>>26-35岁</span>
                
                
            
                
                <span data-value="36" data-max="45" <c:if test="${user.userinfoSelect.ageSelect==36}">class="pink"</c:if>>36-45岁</span>
                
                </li>
            
                <li>
                <span data-value="46" data-max="55" <c:if test="${user.userinfoSelect.ageSelect==46}">class="pink"</c:if>>46-55岁</span>
                
                
            
                
                <span data-value="56" data-max="100" <c:if test="${user.userinfoSelect.ageSelect==56}">class="pink"</c:if>>55岁以上</span>
                
                </li>
            

        </ul>
    </div>
    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>身高范围</h2>
                <span class="unlimit"><span class="title pink">
                 <c:if test="${user.userinfoSelect==null or user.userinfoSelect.heightSelect==null or (user.userinfoSelect.heightSelect==0 and user.userinfoSelect.heightSelectMax==0)}">不限</c:if>
            <c:if test="${user.userinfoSelect.heightSelect==0 and user.userinfoSelect.heightSelectMax==160}">160cm以下</c:if>
            <c:if test="${user.userinfoSelect.heightSelect==161 and user.userinfoSelect.heightSelectMax==165}">161-165cm</c:if>
            <c:if test="${user.userinfoSelect.heightSelect==166 and user.userinfoSelect.heightSelectMax==170}">166-170cm</c:if>
            <c:if test="${user.userinfoSelect.heightSelect==171 and user.userinfoSelect.heightSelectMax==250}">170以上</c:if>
            
                </span><i class="bot_trg"></i></span>
        </div>
        <ul class="hidden" data-type="height">
            
                <li>
                <span data-value="0" data-max="0" <c:if test="${user.userinfoSelect==null or user.userinfoSelect.heightSelect==null or (user.userinfoSelect.heightSelect==0 and user.userinfoSelect.heightSelectMax==0)}">class="pink"</c:if>>不限</span>

                
                

            
                
                <span data-value="0" data-max="160"  <c:if test="${user.userinfoSelect.heightSelect==0 and user.userinfoSelect.heightSelectMax==160}">class="pink"</c:if>>160cm以下</span>

                
                </li>

            
                <li>
                <span data-value="161" data-max="165"   <c:if test="${user.userinfoSelect.heightSelect==161 and user.userinfoSelect.heightSelectMax==165}">class="pink"</c:if>>161-165cm</span>

                
                

            
                
                <span data-value="166" data-max="170"  <c:if test="${user.userinfoSelect.heightSelect==166 and user.userinfoSelect.heightSelectMax==170}">class="pink"</c:if>>166-170cm</span>

                
                </li>

            
                <li>
                <span data-value="171" data-max="250" <c:if test="${user.userinfoSelect.heightSelect==171 and user.userinfoSelect.heightSelectMax==250}">class="pink"</c:if>>170以上</span>

                <span></span>
                </li>

            
        </ul>
    </div>

    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>最低学历</h2>
            <span class="unlimit"><span class="title pink">
            <c:if test="${user.userinfoSelect==null or user.userinfoSelect.eduSelect==null or user.userinfoSelect.eduSelect==0}">不限</c:if>
            <c:if test="${user.userinfoSelect.eduSelect==1}">高中,中专及以上</c:if>
            <c:if test="${user.userinfoSelect.eduSelect==2}">大专及以上</c:if>
            <c:if test="${user.userinfoSelect.eduSelect==3}">本科及以上</c:if>
            
            </span><i class="bot_trg"></i></span>
        </div>
        <ul class="hidden" data-type="edu">
            
                <li>
                <span data-value="0" <c:if test="${user.userinfoSelect==null or user.userinfoSelect.eduSelect==null or user.userinfoSelect.eduSelect==0}">class="pink"</c:if>>不限</span>
                
                
            
                
                <span data-value="1" <c:if test="${user.userinfoSelect.eduSelect==1}">class="pink"</c:if>>高中,中专及以上</span>
                
                </li>
            
                <li>
                <span data-value="2" <c:if test="${user.userinfoSelect.eduSelect==2}">class="pink"</c:if>>大专及以上</span>
                
                
            
                
                <span data-value="3"  <c:if test="${user.userinfoSelect.eduSelect==3}">class="pink"</c:if>>本科及以上</span>
                
                </li>
            
        </ul>
    </div>

    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>收入范围</h2>
            <span class="unlimit"><span class="title pink">
              <c:if test="${user.userinfoSelect==null or user.userinfoSelect.incomSelect==null or user.userinfoSelect.incomSelect==0}">不限</c:if>
            <c:if test="${user.userinfoSelect.incomSelect==4}">2000元以上</c:if>
            <c:if test="${user.userinfoSelect.incomSelect==5}">5000元以上</c:if>
            <c:if test="${user.userinfoSelect.incomSelect==6}">10000元以上</c:if>
            </span><i class="bot_trg"></i></span>
        </div>
        <ul class="hidden" data-type="salary">
            
                <li>
                <span data-value="0" <c:if test="${user.userinfoSelect==null or user.userinfoSelect.incomSelect==null or user.userinfoSelect.incomSelect==0}">class="pink"</c:if>>不限</span>
                
                
            
                
                <span data-value="4"  <c:if test="${user.userinfoSelect.incomSelect==4}">class="pink"</c:if>>2000元以上</span>
                
                </li>
            
                <li>
                <span data-value="5"  <c:if test="${user.userinfoSelect.incomSelect==5}">class="pink"</c:if>>5000元以上</span>
                
                
            
                
                <span data-value="6" <c:if test="${user.userinfoSelect.incomSelect==6}">class="pink"</c:if>>10000元以上</span>
                
                </li>
            
            
        </ul>
    </div>

    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>居住地</h2>
                <span class="unlimit"><span class="title pink">
                <c:if test="${ur.regionName==null}">不限</c:if>
                ${ur.regionName}
                </span><i class="bot_trg"></i></span>
        </div>
        <ul class="four_list hidden" data-type="province">
 <li>   
            <c:forEach items="${region}" var="r" varStatus="st">
            
               <span <c:if test="${r.regionId==user.userinfoSelect.location}">class="pink"</c:if>  data-value="${r.regionId}">${r.regionName}</span>
                <c:if test="${st.count%4==0}">
               </li> <li>
               </c:if> 
            </c:forEach>
            </li>
            
             
            
            
        </ul>
    </div>
    
</div>
<input type="hidden" id="con_age_min" value="">
<input type="hidden" id="con_age_max" value="">
<input type="hidden" id="con_height_min" value="">
<input type="hidden" id="con_height_max" value="">
<input type="hidden" id="con_income" value="">
<input type="hidden" id="con_province" value="">
<input type="hidden" id="con_edu" value="">
<input type="hidden" id="con_girlCareId" value="">


    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <script type="text/javascript">
  //寰佸弸鏉′欢
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
                $.waiting.show("处理中..");
                $.ajax({url: "<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=match_info&openid=${user.userOpenid}", data: Match.param, dataType: 'json', type: 'post', success: function (data) {
                    $.waiting.hide();
                  
                        $.tips("保存成功");
                        location.href="<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}"
                    
                }, error: function () {
                    $.waiting.hide();
                    $.tips("网络异常，请稍后再试");
                }
                })
            },
            toggle: function ($this) {
                var $ul = $this.next("ul");
                if($ul.hasClass("hidden")){//鏄剧ず
                    $(".top i").removeClass("top_trg").addClass('bot_trg');
                    $(".option_box ul").addClass("hidden");
                    $this.find("i").addClass("top_trg").removeClass("bot_trg");
                    $ul.removeClass("hidden");
                }else{//闅愯棌
                    $this.find("i").removeClass("top_trg").addClass('bot_trg');
                    $ul.addClass("hidden");
                }
            }
        }
    })
    ();
    //楂樼骇鎼滅储
    $(function () {
        //鍒囨崲涓嬫媺
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

    </script>
</body></html>