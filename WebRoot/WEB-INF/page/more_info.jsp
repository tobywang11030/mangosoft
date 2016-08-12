<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>相恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/option_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_setting.css" rel="stylesheet" type="text/css">
    
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<div class="top_blank"></div>
<nav class="nav" style="position: absolute;">
    <h2>详细资料</h2>
    <div class="left" onClick="history.go(-1)">
        <i class="le_trg"></i>返回
    </div>
    <div class="right">
        <span id="search_sure" class="seach_sure">确定</span>
    </div>
</nav>
<div class="content">
    <ul class="habit-list">
        <li class="user_mession">
            <label class="left">是否想要小孩</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                        
                        <span class="pink">
                         <c:choose>
              <c:when test="${user.userinfoMore.child==null or user.userinfoMore.child==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfoMore.child==1}">
                                    想
            </c:if>
              <c:if test="${user.userinfoMore.child==2}">
                                       不想
            </c:if>
              <c:if test="${user.userinfoMore.child==3}">
                                   还没想好
            </c:if>
          
            
              </c:otherwise>
              </c:choose>
                        </span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="need_bady" class="value_select">
                        <option value="0">请选择</option>
                        
                            <option value="1" <c:if test="${user.userinfoMore.child==1}">selected="selected"</c:if>>想</option>
                        
                            <option value="2"  <c:if test="${user.userinfoMore.child==2}">selected="selected"</c:if>>不想</option>
                        
                            <option value="3"  <c:if test="${user.userinfoMore.child==3}">selected="selected"</c:if>>还没想好</option>
                        
                    </select>
                </div>
            </div>
        </li>
        <li class="user_mession">
            <label class="left">能否接受异地恋</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                        
                        <span class="pink">  <c:choose>
              <c:when test="${user.userinfoMore.distanceLove==null or user.userinfoMore.distanceLove==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfoMore.distanceLove==1}">
                                    能
            </c:if>
              <c:if test="${user.userinfoMore.distanceLove==2}">
                                       看情况
            </c:if>
              <c:if test="${user.userinfoMore.distanceLove==3}">
                                  不能
            </c:if>
          
            
              </c:otherwise>
              </c:choose></span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="diff_lover" class="value_select">
                        <option value="0">请选择</option>
                        
                            <option value="1" <c:if test="${user.userinfoMore.distanceLove==1}">selected="selected"</c:if>>能</option>
                        
                            <option value="2" <c:if test="${user.userinfoMore.distanceLove==2}">selected="selected"</c:if>>看情况</option>
                        
                            <option value="3" <c:if test="${user.userinfoMore.distanceLove==3}">selected="selected"</c:if>>不能</option>
                        
                    </select>
                </div>
            </div>
        </li>
        <li class="user_mession">
            <label class="left">喜欢的异性类型</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                         
                        <span class="pink">
                        <c:choose>
              <c:when test="${user.userinfoMore.lovePeopleType==null or user.userinfoMore.lovePeopleType==0}">
              请选择
              </c:when>
              <c:otherwise>
              <c:forEach items="${pt}" var="people">
              <c:if test="${user.userinfoMore.lovePeopleType==people.id}">
               ${people.content}
              </c:if>
             
              </c:forEach>
           
            
          
            
              </c:otherwise>
              </c:choose>
                        </span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="love_type" class="value_select">
                    
                     
              <c:forEach items="${pt}" var="people">
              <option value="${people.id}" <c:if test="${user.userinfoMore.lovePeopleType==people.id}">selected="selected"</c:if>> ${people.content}</option>
              </c:forEach>
                    </select>
                </div>
            </div>
        </li>
        <li class="user_mession">
            <label class="left">能否接受婚前性行为</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                        
                        <span class="pink">
                        <c:choose>
              <c:when test="${user.userinfoMore.psb==null or user.userinfoMore.psb==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfoMore.psb==1}">
                                    能
            </c:if>
              <c:if test="${user.userinfoMore.psb==2}">
                                       看情况
            </c:if>
              <c:if test="${user.userinfoMore.psb==3}">
                                  不能
            </c:if>
          
            
              </c:otherwise>
              </c:choose>
                        </span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="sex_first" class="value_select">
                        <option value="0">请选择</option>
                        
                            <option value="1" <c:if test="${user.userinfoMore.psb==1}">selected="selected"</c:if>>能</option>
                        
                            <option value="2" <c:if test="${user.userinfoMore.psb==2}">selected="selected"</c:if>>看情况</option>
                        
                            <option value="3" <c:if test="${user.userinfoMore.psb==3}">selected="selected"</c:if>>不能</option>
                        
                    </select>
                </div>
            </div>
        </li>
        <li class="user_mession">
            <label class="left">是否愿意与父母同住</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                        
                        <span class="pink">
                         <c:choose>
              <c:when test="${user.userinfoMore.liveWithParents==null or user.userinfoMore.liveWithParents==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfoMore.liveWithParents==1}">
                                    愿意
            </c:if>
              <c:if test="${user.userinfoMore.liveWithParents==2}">
                                       看情况
            </c:if>
              <c:if test="${user.userinfoMore.liveWithParents==3}">
                                  不愿意
            </c:if>
          
            
              </c:otherwise>
              </c:choose>
                        </span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="live_with" class="value_select">
                        <option value="0">请选择</option>
                        
                            <option value="1" <c:if test="${user.userinfoMore.liveWithParents==1}">selected="selected"</c:if>>愿意</option>
                        
                            <option value="2" <c:if test="${user.userinfoMore.liveWithParents==2}">selected="selected"</c:if>>看情况</option>
                        
                            <option value="3" <c:if test="${user.userinfoMore.liveWithParents==3}">selected="selected"</c:if>>不愿意</option>
                        
                    </select></div>
            </div>
        </li>
        <li class="user_mession">
            <label class="left">魅力部位</label>

            <div class="right">
                <div class="select">
                    <span class="value">
                        
                        <span class="pink">
                         <c:choose>
              <c:when test="${user.userinfoMore.charm==null or user.userinfoMore.charm==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${user.userinfoMore.charm==1}">
                                    笑容
            </c:if>
              <c:if test="${user.userinfoMore.charm==2}">
                                       眉毛
            </c:if>
              <c:if test="${user.userinfoMore.charm==3}">
                                  眼睛
            </c:if>
             <c:if test="${user.userinfoMore.charm==4}">
                                  头发
            </c:if>
             <c:if test="${user.userinfoMore.charm==5}">
                                  鼻梁
            </c:if>
             <c:if test="${user.userinfoMore.charm==6}">
                                  嘴唇
            </c:if>
             <c:if test="${user.userinfoMore.charm==7}">
                                 牙齿
            </c:if>
             <c:if test="${user.userinfoMore.charm==8}">
                               颈部
            </c:if>
             <c:if test="${user.userinfoMore.charm==9}">
                                  耳朵
            </c:if>
             <c:if test="${user.userinfoMore.charm==10}">
                                  手
            </c:if>
             <c:if test="${user.userinfoMore.charm==11}">
                                  胳膊
            </c:if>
             <c:if test="${user.userinfoMore.charm==12}">
                                  胸部
            </c:if>
             <c:if test="${user.userinfoMore.charm==13}">
                                  腰部
            </c:if>
             <c:if test="${user.userinfoMore.charm==14}">
                                  脚
            </c:if>
             <c:if test="${user.userinfoMore.charm==15}">
                                  腿
            </c:if>
             <c:if test="${user.userinfoMore.charm==16}">
                                  臀部
            </c:if>
            
          
            
              </c:otherwise>
              </c:choose>
                        </span>
                    </span>
                    <i class="bot_trged"></i>
                    <select id="charm" class="value_select">
                        <option value="0">请选择</option>
                        
                            <option value="1" <c:if test="${user.userinfoMore.charm==1}">selected="selected"</c:if>>笑容</option>
                             <option value="2" <c:if test="${user.userinfoMore.charm==2}">selected="selected"</c:if>>眉毛</option>
                        
                            <option value="3" <c:if test="${user.userinfoMore.charm==3}">selected="selected"</c:if>>眼睛</option>
                        
                            <option value="4" <c:if test="${user.userinfoMore.charm==4}">selected="selected"</c:if>>头发</option>
                        
                            <option value="5" <c:if test="${user.userinfoMore.charm==5}">selected="selected"</c:if>>鼻梁</option>
                        
                            <option value="6" <c:if test="${user.userinfoMore.charm==6}">selected="selected"</c:if>>嘴唇</option>
                        
                            <option value="7" <c:if test="${user.userinfoMore.charm==7}">selected="selected"</c:if>>牙齿</option>
                        
                            <option value="8" <c:if test="${user.userinfoMore.charm==8}">selected="selected"</c:if>>颈部</option>
                        
                            <option value="9" <c:if test="${user.userinfoMore.charm==9}">selected="selected"</c:if>>耳朵</option>
                        
                            <option value="10" <c:if test="${user.userinfoMore.charm==10}">selected="selected"</c:if>>手</option>
                        
                            <option value="11" <c:if test="${user.userinfoMore.charm==11}">selected="selected"</c:if>>胳膊</option>
                        
                            <option value="12" <c:if test="${user.userinfoMore.charm==12}">selected="selected"</c:if>>胸部</option>
                        
                            <option value="13" <c:if test="${user.userinfoMore.charm==13}">selected="selected"</c:if>>腰部</option>
                        
                            <option value="14" <c:if test="${user.userinfoMore.charm==14}">selected="selected"</c:if>>脚</option>
                        
                            <option value="15" <c:if test="${user.userinfoMore.charm==15}">selected="selected"</c:if>>腿</option>
                        
                            <option value="16" <c:if test="${user.userinfoMore.charm==16}">selected="selected"</c:if>>臀部</option>
                        
                           
                        
                    </select>
                </div>
            </div>
        </li>
    </ul>
    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>兴趣爱好</h2>
            <span class="unlimit"><span class="pink">可多选</span></span>
        </div>

        <ul class="four_list" id="interest">
            
              <li>
              <c:forEach items="${it}" var="interest" varStatus="st">
             
               <span <c:if test="${interest.flag==1}">class="pink"</c:if>  typeid="${interest.id}">${interest.content}</span>
               <c:if test="${st.count%4==0}">
               </li> <li>
               </c:if>
              </c:forEach>
              </li>
           


        </ul>
    </div>
    <div class="option_box" style="margin-top: 10px">
        <div class="top">
            <h2>个人特征</h2>
            <span class="unlimit"><span class="pink">可多选</span></span>
        </div>
        <ul class="four_list" id="char">
            
               <li>   
            <c:forEach items="${ct}" var="personalType" varStatus="st">
            
               <span <c:if test="${personalType.flag==1}">class="pink"</c:if>  typeid="${personalType.id}">${personalType.content}</span>
                <c:if test="${st.count%4==0}">
               </li> <li>
               </c:if> 
            </c:forEach>
            </li>
                

            

        </ul>
    </div>
</div>

    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <script type="text/javascript">
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
                $.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=more_info&openid=${user.userOpenid}',
                    data: {characteristic: inter, interest:character, need_baby_id: need_bady, diff_area_love_id: diff_lover, lover_type_id: love_type, sex_first_id: first, live_with_parent_id: live_with, charm_id: charm},
                    dataType: 'json',
                    type: 'post',
                    success: function (data) {
                        $.waiting.hide();
                        location.href = "<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}"
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
        
    </script>
</body></html>