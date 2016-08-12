<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_setting.css" rel="stylesheet" type="text/css">
      
    <script type="text/javascript"> 
	   function setPro(){  

			
			 $.getJSON("<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=1", function(data) {
       
				$.each(data, function(i, item) {
				//$("live_province").append("<option>11</option>");  
				if(${user.userinfo.locationProvince}==item.regionId){
				document.getElementById("live_province").options.add(new Option(item.regionName,item.regionId,true,true));
				document.getElementById("s_v").innerHTML=item.regionName;
				}else{
				document.getElementById("live_province").options.add(new Option(item.regionName,item.regionId));
				}
				
				//alert(item.regionName);
				
				});
           });
	   
	   get_city_now();
	   
	   }
	   	function get_city_now(){
	 $.getJSON("<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=2&cityid=${user.userinfo.locationProvince}", function(data) {
       
				$.each(data, function(i, item) {
				//$("live_province").append("<option>11</option>");  
				if(${user.userinfo.locationCity}==item.regionId){
				document.getElementById("live_city").options.add(new Option(item.regionName,item.regionId,true,true));
				document.getElementById("c_v").innerHTML=item.regionName;
				}else{
				document.getElementById("live_city").options.add(new Option(item.regionName,item.regionId));
				}
				
				//alert(item.regionName);
				
				});
           });
	}
	function get_city(obj){
	document.getElementById("live_city").innerHTML="";
	document.getElementById("c_v").innerHTML="";
	document.getElementById("s_v").innerHTML=obj.options[obj.options.selectedIndex].text;
	 $.getJSON("<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=2&cityid="+obj.options[obj.options.selectedIndex].value, function(data) {
       
				$.each(data, function(i, item) {
				//$("live_province").append("<option>11</option>");  
				if(${user.userinfo.locationCity}==item.regionId){
				document.getElementById("live_city").options.add(new Option(item.regionName,item.regionId,true,true));
				document.getElementById("c_v").innerHTML=item.regionName;
				}else if(i==0){
				document.getElementById("live_city").options.add(new Option(item.regionName,item.regionId,true,true));
				
				document.getElementById("c_v").innerHTML=item.regionName;
				}else{
				document.getElementById("live_city").options.add(new Option(item.regionName,item.regionId));
				}
				
				//alert(item.regionName);
				
				});
           });
	}
	function set_c_v(obj){
	document.getElementById("c_v").innerHTML=obj.options[obj.options.selectedIndex].text;
	}
	</script>
</head>
<body onLoad="setPro();"><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<div class="top_blank"></div>
<nav class="nav" style="position: absolute">
    <h2>基本资料</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
    <div class="right">
        <span id="search_sure" class="seach_sure">确定</span>
    </div>
</nav>
<div class="content">

<ul class="habit-list">
<li class="user_mession" style="height: auto; overflow: hidden;">
    <label class="left">昵称</label>

    <div class="right" style=" height:auto;">
        <input type="text" id="nickname" placeholder="${user.name}">  <br>
       <span style="float:right;"> *禁止使用非法昵称 </span>
    </div>
</li>
<li class="user_mession">
    <label class="left">生日</label>

    <div id="basic_birthday" class="right">
        <div class="select">
            <span class="value">${user.userinfo.birthdayYear}年</span>
            <i class="bot_trged"></i>
            <select class="value_select">
<c:forEach  var="st" begin="1955" end="1997" varStatus="i">
  <option <c:if test="${user.userinfo.birthdayYear==st + 41-2*(i.count-1)+1}">selected="selected"</c:if> value="${st + 41-2*(i.count-1)+1}" >${st + 41-2*(i.count-1)+1}年
                    </option>
</c:forEach>
                
                    
                 
                
            </select>
        </div>
        <div class="select">
            <span class="value">${user.userinfo.birthdayMonth}月</span>
            <i class="bot_trged"></i>
            <select class="value_select">
                <c:forEach begin="1" end="12" step="1" var="st">
                <option value="${st}" <c:if test="${user.userinfo.birthdayMonth==st}">selected="selected"</c:if>>${st}月
                    </option>
                </c:forEach>
                 
                
            </select>
        </div>
        <div class="select">
            <span class="value">${user.userinfo.birthdayDay}日</span>
            <i class="bot_trged"></i>
            <select class="value_select">
                
                    <c:forEach begin="1" end="31" step="1" var="st">
                <option value="${st}" <c:if test="${user.userinfo.birthdayDay==st}">selected="selected"</c:if>>${st}日
                    </option>
                </c:forEach>
                
            </select>
        </div>

    </div>
</li>
<li class="user_mession">
    <label class="left">居住地</label>

    <div id="live" class="right">
        <div class="select">
            <span class="value" id="s_v">
               
                
            </span>
            <i class="bot_trged"></i>
            <select id="live_province" class="value_select" onChange="get_city(this)">  
            </select>
        </div>
        <div class="select fixed_width">
            <span class="value" id="c_v">
                </span>
            <i class="bot_trged"></i>
            <select id="live_city" class="value_select" onChange="set_c_v(this)">
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">身高</label>

    <div class="right">
        <div class="select">
            <span class="value">
                <span class="pink">
              <c:choose>
              <c:when test="${user.userinfo.height==null or user.userinfo.height==0}">
              请选择
              </c:when>
              <c:otherwise>
              ${user.userinfo.height}cm
              </c:otherwise>
              </c:choose>
                </span></span>
            <i class="bot_trged"></i>
            <select id="basic_height" class="value_select">
         
            <c:forEach begin="140" end="220" step="1" var="st">
              <option value="${st}" <c:if test="${user.userinfo.height==st}">selected="selected"</c:if> >${st}cm
                        </option>
                    
            </c:forEach>
         
               
                
                    
                      
                    
                    
                    
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">体重</label>

    <div class="right">
        <div class="select">
            <span class="value">
                <span class="pink">
                 <c:choose>
              <c:when test="${user.userinfo.weight==null or user.userinfo.weight==0}">
              请选择
              </c:when>
              <c:otherwise>
              ${user.userinfo.weight}斤
              </c:otherwise>
              </c:choose>
                </span></span>
            <i class="bot_trged"></i>
            <select id="basic_weight" class="value_select">
                
            <c:forEach begin="60" end="300" step="2" var="st">
              <option value="${st}" <c:if test="${user.userinfo.weight==st}">selected="selected"</c:if> >${st}斤
                        </option>
                    
            </c:forEach>
          
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">血型</label>

    <div class="right">
        <div class="select">
            <span class="value">
                <span class="pink">
                  <c:choose>
              <c:when test="${user.userinfo.bloodType==null or user.userinfo.bloodType.isEmpty()}">
              请选择
              </c:when>
              <c:otherwise>
              ${user.userinfo.bloodType}
              </c:otherwise>
              </c:choose>
                </span></span>
            <i class="bot_trged"></i>
            <select id="bloodType" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="A" <c:if test="${user.userinfo.bloodType=='A'}">selected="selected"</c:if> >A</option>
                
                    <option value="B" <c:if test="${user.userinfo.bloodType=='B'}">selected="selected"</c:if>>B</option>
                
                    <option value="AB" <c:if test="${user.userinfo.bloodType=='AB'}">selected="selected"</c:if>>AB</option>
                
                    <option value="O" <c:if test="${user.userinfo.bloodType=='O'}">selected="selected"</c:if>>O</option>
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">学历</label>

    <div class="right">
        <div class="select">
            <span class="value">
                
                <span class="pink">
                  <c:choose>
              <c:when test="${user.userinfo.education==null or user.userinfo.education==0}">
              请选择
              </c:when>
              <c:otherwise>
            <c:if test="${user.userinfo.education==5}">
                                         初中及以下
            </c:if>
             <c:if test="${user.userinfo.education==1}">
                                   高中及中专
            </c:if>
             <c:if test="${user.userinfo.education==2}">
                                         大专
            </c:if>
             <c:if test="${user.userinfo.education==3}">
                                         本科
            </c:if>
             <c:if test="${user.userinfo.education==4}">
                                       硕士及以上
            </c:if>
              </c:otherwise>
              </c:choose>
                </span>
            </span>
            <i class="bot_trged"></i>
            <select id="education" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="5" <c:if test="${user.userinfo.education==5}">selected="selected"</c:if>>初中及以下</option>
                
                    <option value="1" <c:if test="${user.userinfo.education==1}">selected="selected"</c:if>>高中及中专</option>
                
                    <option value="2" <c:if test="${user.userinfo.education==2}">selected="selected"</c:if>>大专</option>
                
                    <option value="3" <c:if test="${user.userinfo.education==3}">selected="selected"</c:if>>本科</option>
                
                    <option value="4" <c:if test="${user.userinfo.education==4}">selected="selected"</c:if>>硕士及以上</option>
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">职业</label>

    <div class="right">
        <div class="select">
            <span class="value">
                
                <span class="pink">
                   <c:choose>
              <c:when test="${user.userinfo.work==null or user.userinfo.work==0}">
              请选择
              </c:when>
              <c:otherwise>
            <c:if test="${user.userinfo.work==1}">
                                        在校学生
            </c:if>
             <c:if test="${user.userinfo.work==2}">
                                   军人
            </c:if>
             <c:if test="${user.userinfo.work==3}">
                                         私营业主
            </c:if>
             <c:if test="${user.userinfo.work==4}">
                                         企业职工
            </c:if>
             <c:if test="${user.userinfo.work==5}">
                                       农业劳动者
            </c:if>
             <c:if test="${user.userinfo.work==6}">
                                       政府机关/事业单位工作者
            </c:if>
             <c:if test="${user.userinfo.work==7}">
                                       其他
            </c:if>
              </c:otherwise>
              </c:choose>
                </span>
            </span>
            <i class="bot_trged"></i>
            <select id="vocation" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="1" <c:if test="${user.userinfo.work==1}">selected="selected"</c:if>>在校学生</option>
                
                    <option value="2" <c:if test="${user.userinfo.work==2}">selected="selected"</c:if>>军人</option>
                
                    <option value="3" <c:if test="${user.userinfo.work==3}">selected="selected"</c:if>>私营业主</option>
                
                    <option value="4" <c:if test="${user.userinfo.work==4}">selected="selected"</c:if>>企业职工</option>
                
                    <option value="5" <c:if test="${user.userinfo.work==5}">selected="selected"</c:if>>农业劳动者</option>
                
                    <option value="6" <c:if test="${user.userinfo.work==6}">selected="selected"</c:if>>政府机关/事业单位工作者</option>
                
                    <option value="7" <c:if test="${user.userinfo.work==7}">selected="selected"</c:if>>其他</option>
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">收入</label>

    <div class="right">
        <div class="select">
            <span class="value">
                
                <span class="pink">
                    <c:choose>
              <c:when test="${user.userinfo.income==null or user.userinfo.income==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfo.income==3}">
                                       2000元以下
            </c:if>
             <c:if test="${user.userinfo.income==4}">
                                        2000-5000
            </c:if>
             <c:if test="${user.userinfo.income==5}">
                                       5000-10000
            </c:if>
             <c:if test="${user.userinfo.income==6}">
                                      10000-20000
            </c:if>
             <c:if test="${user.userinfo.income==7}">
                                      20000以上
            </c:if>
              </c:otherwise>
              </c:choose>
                </span>
            </span>
            <i class="bot_trged"></i>
            <select id="income" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="3" <c:if test="${user.userinfo.income==3}">selected="selected"</c:if>>2000元以下</option>
                
                    <option value="4" <c:if test="${user.userinfo.income==4}">selected="selected"</c:if>>2000-5000</option>
                
                    <option value="5" <c:if test="${user.userinfo.income==5}">selected="selected"</c:if>>5000-10000</option>
                
                    <option value="6" <c:if test="${user.userinfo.income==6}">selected="selected"</c:if>>10000-20000</option>
                
                    <option value="7" <c:if test="${user.userinfo.income==7}">selected="selected"</c:if>>20000以上</option>
                
            </select></div>
    </div>
</li>
<li class="user_mession">
    <label class="left">婚姻状况</label>

    <div class="right">
        <div class="select">
            <span class="value">
                
                <span class="pink">
                 <c:choose>
              <c:when test="${user.userinfo.maritalstatus==null or user.userinfo.maritalstatus==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfo.maritalstatus==1}">
                                       未婚
            </c:if>
             <c:if test="${user.userinfo.maritalstatus==2}">
                                        离异
            </c:if>
             <c:if test="${user.userinfo.maritalstatus==3}">
                                       丧偶
            </c:if>
            
              </c:otherwise>
              </c:choose>
                </span>
            </span>
            <i class="bot_trged"></i>
            <select id="marry" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="1" <c:if test="${user.userinfo.maritalstatus==1}">selected="selected"</c:if>>未婚</option>
                
                    <option value="2" <c:if test="${user.userinfo.maritalstatus==2}">selected="selected"</c:if>>离异</option>
                
                    <option value="3" <c:if test="${user.userinfo.maritalstatus==3}">selected="selected"</c:if>>丧偶</option>
                
            </select>
        </div>
    </div>
</li>
<li class="user_mession">
    <label class="left">是否有房</label>

    <div class="right">
        <div class="select">
            <span class="value">
                
                <span class="pink">
                 <c:choose>
              <c:when test="${user.userinfo.horse==null or user.userinfo.horse==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfo.horse==1}">
                                       已购房
            </c:if>
             <c:if test="${user.userinfo.horse==2}">
                                        与父母同住
            </c:if>
             <c:if test="${user.userinfo.horse==3}">
                                       租房
            </c:if>
             <c:if test="${user.userinfo.horse==4}">
                                       其他
            </c:if>
            
              </c:otherwise>
              </c:choose>
                </span>
            </span>
            <i class="bot_trged"></i>
            <select id="haveHouse" class="value_select">
                <option value="0">请选择</option>
                
                    <option value="1" <c:if test="${user.userinfo.horse==1}">selected="selected"</c:if>>已购房</option>
                
                    <option value="2" <c:if test="${user.userinfo.horse==2}">selected="selected"</c:if>>与父母同住</option>
                
                    <option value="3" <c:if test="${user.userinfo.horse==3}">selected="selected"</c:if>>租房</option>
                
                    <option value="4" <c:if test="${user.userinfo.horse==4}">selected="selected"</c:if>>其他</option>
                
            </select>
        </div>
    </div>
</li>
</ul>

</div>

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <script type="text/javascript">
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
                $.ajax({url:'<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=basic_info&openid=${user.userOpenid}',
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
                    		  $.tips("保存成功！");
                              location.href = "<%=request.getContextPath()%>/weixinpro/web?action=more_info&openid=${user.userOpenid}";
                          }else{
                        	  $.tips("保存成功！");
                              location.href = "<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}";
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
             //   Basic.change();
        });
    });
    </script>
   
    
</body></html>