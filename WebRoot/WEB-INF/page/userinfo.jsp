<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="zh" class="pu"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta content="yes" name="apple-mobile-web-app-capable">
    <meta content="black" name="apple-mobile-web-app-status-bar-style">
    <meta content="telephone=no" name="format-detection">
    <title>想恋</title>
    
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_reset.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_disbox.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/public_headmessage.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_box.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/bottom_call.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/user_info.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/resources/xl_js/foot.css" rel="stylesheet" type="text/css">
    
</head>
<body><div class="tips" style="display: none;"></div><div class="waiting" style="display: none;"></div>
<input type="hidden" id="userId" value="429611092">
<input type="hidden" id="msgType" value="0">
<input type="hidden" id="from" value="userinfo">
<input type="hidden" id="isStrategy" value="false">

<div class="top_blank"></div>
<nav class="nav">
    <h2>${matchuser.name}</h2>

    <div class="left" data-goback="">
        <i class="le_trg"></i>返回
    </div>
    
        <div class="right" href="<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}">
            <i class="house_icon"></i>
        </div>
    
</nav>

<div class="content">
    <section class="user_space">
        <div class="user_box">
            <dl class="user">
               
                		<dt class="smallShow">
                		 <c:choose>
	 <c:when test="${matchuser.sex==0}"> 
		    <c:choose>
		    <c:when test="${matchuser.photo!=null}"> <img src="${matchuser.photo}"></c:when>
								<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/boy.png"></c:otherwise>
		   </c:choose>
	</c:when>
	<c:otherwise> 
								
			 <c:choose>
		    <c:when test="${matchuser.photo!=null}"> <img src="${matchuser.photo}"></c:when>
			<c:otherwise> <img src="<%=request.getContextPath()%>/resources/xl_img/girl.png"></c:otherwise>
		   </c:choose>
	</c:otherwise>
	 </c:choose>
                		</dt>
                	
                <dd>
                    <b class="name">${matchuser.name}<span class="personIcon" style="display: inline-block;"></span>
                    
                    </b>

                    <p>${matchuser.age}岁·${region.regionName}·<c:choose>
              <c:when test="${matchuser.userinfo.height==null or matchuser.userinfo.height==0}">
              身高未透露
              </c:when>
              <c:otherwise>
              ${matchuser.userinfo.height}cm
              </c:otherwise>
              </c:choose></p>

                    <p>
                      <c:choose>
                <c:when test="${matchuser.authTypePhone==0}">
                        <span data-value="phone" class="phone noCheck">手机认证</span>
				</c:when>
				<c:otherwise>	
				<span data-value="phone" class="phone ">手机认证</span>
				 </c:otherwise>
				   </c:choose>
                         <c:choose>
                <c:when test="${matchuser.authTypePeople==0}">
                      <span data-value="identity" class="identity noCheck">身份认证</span>
						</c:when>
						<c:otherwise>	
						  <span data-value="identity" class="identity">身份认证</span>
						 </c:otherwise>
				   </c:choose>  
                        
                    </p>
                </dd>
            </dl>
           
        </div>

        
                <div  style=" width: 100%;overflow-x: scroll;background: #fff; margin: 10px 0; box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1)">
                     
                    <ul class="need_photo" style="width:100%">
                        
                            
                                <c:forEach items="${matchuser.xlPhotos}" var="photo" varStatus="st">
                                 <li href="<%=request.getContextPath()%>/weixinpro/web?action=myalbum&view=match&matchid=${matchuser.id}&pid=${st.index}"><img src="${photo.src}"></li>
                                </c:forEach>
                            <li data-afp="${matchuser.id}" data-source="${user.id}" class="require disbox-center">索要<br>照片</li>
                        
                    </ul>
                </div>
            
	<!--心情展示start-->
        
    <!--心情展示end-->
   <dl class="heart">
                <dt>内心独白</dt>
                <dd>${matchuser.heartSay}</dd>
            </dl>
        
        <div class="date_list">
            <ul class="date_nav">
                <li class="disbox-center active">基本资料</li>
            </ul>
            <ol class="user_date">
                <li>
                    <span>学历</span>
                    <span>   <c:choose>
              <c:when test="${matchuser.userinfo.education==null or matchuser.userinfo.education==0}">
              未透露
              </c:when>
              <c:otherwise>
            <c:if test="${matchuser.userinfo.education==5}">
                                         初中及以下
            </c:if>
             <c:if test="${matchuser.userinfo.education==1}">
                                   高中及中专
            </c:if>
             <c:if test="${matchuser.userinfo.education==2}">
                                         大专
            </c:if>
             <c:if test="${matchuser.userinfo.education==3}">
                                         本科
            </c:if>
             <c:if test="${matchuser.userinfo.education==4}">
                                       硕士及以上
            </c:if>
              </c:otherwise>
              </c:choose></span>
                </li>
                <li>
                    <span>月收入</span>
                    <span>
                      <c:choose>
              <c:when test="${matchuser.userinfo.income==null or matchuser.userinfo.income==0}">
              请选择
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfo.income==3}">
                                       2000元以下
            </c:if>
             <c:if test="${matchuser.userinfo.income==4}">
                                        2000-5000
            </c:if>
             <c:if test="${matchuser.userinfo.income==5}">
                                       5000-10000
            </c:if>
             <c:if test="${matchuser.userinfo.income==6}">
                                      10000-20000
            </c:if>
             <c:if test="${matchuser.userinfo.income==7}">
                                      20000以上
            </c:if>
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
                <li>
                    <span>职业</span>
                    <span>
                       <c:choose>
              <c:when test="${matchuser.userinfo.work==null or matchuser.userinfo.work==0}">
              请选择
              </c:when>
              <c:otherwise>
            <c:if test="${matchuser.userinfo.work==1}">
                                        在校学生
            </c:if>
             <c:if test="${matchuser.userinfo.work==2}">
                                   军人
            </c:if>
             <c:if test="${matchuser.userinfo.work==3}">
                                         私营业主
            </c:if>
             <c:if test="${matchuser.userinfo.work==4}">
                                         企业职工
            </c:if>
             <c:if test="${matchuser.userinfo.work==5}">
                                       农业劳动者
            </c:if>
             <c:if test="${matchuser.userinfo.work==6}">
                                       政府机关/事业单位工作者
            </c:if>
             <c:if test="${matchuser.userinfo.work==7}">
                                       其他
            </c:if>
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
                <li>
                    <span>星座</span>
                    <span>水瓶</span>
                </li>
                <li>
                    <span>体重</span>
                    <span> <c:choose>
              <c:when test="${matchuser.userinfo.weight==null or matchuser.userinfo.weight==0}">
             未透露
              </c:when>
              <c:otherwise>
              ${matchuser.userinfo.weight}斤
              </c:otherwise>
              </c:choose> </span>
                </li>
                <li>
                    <span>血型</span>
                    <span> <c:choose>
              <c:when test="${matchuser.userinfo.bloodType==null or matchuser.userinfo.bloodType.isEmpty()}">
              未透露
              </c:when>
              <c:otherwise>
              ${matchuser.userinfo.bloodType}型
              </c:otherwise>
              </c:choose></span>
                </li>

                <li>
                    <span>婚姻状况</span>
                    <span>  <c:choose>
              <c:when test="${matchuser.userinfo.maritalstatus==null or matchuser.userinfo.maritalstatus==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfo.maritalstatus==1}">
                                       未婚
            </c:if>
             <c:if test="${matchuser.userinfo.maritalstatus==2}">
                                        离异
            </c:if>
             <c:if test="${matchuser.userinfo.maritalstatus==3}">
                                       丧偶
            </c:if>
            
              </c:otherwise>
              </c:choose></span>
                </li>
                <li>
                    <span>是否有房</span>
                    <span>
                      <c:choose>
              <c:when test="${matchuser.userinfo.horse==null or matchuser.userinfo.horse==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfo.horse==1}">
                                       已购房
            </c:if>
             <c:if test="${matchuser.userinfo.horse==2}">
                                        与父母同住
            </c:if>
             <c:if test="${matchuser.userinfo.horse==3}">
                                       租房
            </c:if>
             <c:if test="${matchuser.userinfo.horse==4}">
                                       其他
            </c:if>
            
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
            </ol>
        </div>
        <div class="date_list">
            <ul class="date_nav">
                <li class="disbox-center active">详细资料</li>
            </ul>
            <ol class="user_date">
                <li>
                    <span>是否想要小孩</span>
                    <span> <c:choose>
              <c:when test="${matchuser.userinfoMore.child==null or matchuser.userinfoMore.child==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfoMore.child==1}">
                                    想
            </c:if>
              <c:if test="${matchuser.userinfoMore.child==2}">
                                       不想
            </c:if>
              <c:if test="${matchuser.userinfoMore.child==3}">
                                   还没想好
            </c:if>
          
            
              </c:otherwise>
              </c:choose></span>
                </li>
                <li>
                    <span>能否接受异地恋</span>
                    <span><c:choose>
              <c:when test="${matchuser.userinfoMore.distanceLove==null or matchuser.userinfoMore.distanceLove==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfoMore.distanceLove==1}">
                                    能
            </c:if>
              <c:if test="${matchuser.userinfoMore.distanceLove==2}">
                                       看情况
            </c:if>
              <c:if test="${matchuser.userinfoMore.distanceLove==3}">
                                  不能
            </c:if>
          
            
              </c:otherwise>
              </c:choose></span>
                </li>
                <li>
                    <span>喜欢的异性类型</span>
                    <span>
                     <c:choose>
              <c:when test="${matchuser.userinfoMore.lovePeopleType==null or matchuser.userinfoMore.lovePeopleType==0}">
              未透露
              </c:when>
              <c:otherwise>
              <c:forEach items="${pt}" var="people">
              <c:if test="${matchuser.userinfoMore.lovePeopleType==people.id}">
               ${people.content}
              </c:if>
             
              </c:forEach>
           
            
          
            
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
                <li>
                    <span>能否接受婚前性行为</span>
                    <span>
                     <c:choose>
              <c:when test="${matchuser.userinfoMore.psb==null or matchuser.userinfoMore.psb==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfoMore.psb==1}">
                                    能
            </c:if>
              <c:if test="${matchuser.userinfoMore.psb==2}">
                                       看情况
            </c:if>
              <c:if test="${matchuser.userinfoMore.psb==3}">
                                  不能
            </c:if>
          
            
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
                <li>
                    <span>是否愿意与父母同住</span>
                    <span>
                     <c:choose>
              <c:when test="${matchuser.userinfoMore.liveWithParents==null or matchuser.userinfoMore.liveWithParents==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfoMore.liveWithParents==1}">
                                    愿意
            </c:if>
              <c:if test="${matchuser.userinfoMore.liveWithParents==2}">
                                       看情况
            </c:if>
              <c:if test="${matchuser.userinfoMore.liveWithParents==3}">
                                  不愿意
            </c:if>
          
            
              </c:otherwise>
              </c:choose>
                    </span>
                </li>
                <!-- 详细资料页添加魅力部位，兴趣爱好，个人特征-->
                <li>
                    <span>魅力部位</span>
                    <span> <c:choose>
              <c:when test="${matchuser.userinfoMore.charm==null or matchuser.userinfoMore.charm==0}">
              未透露
              </c:when>
              <c:otherwise>
           
             <c:if test="${matchuser.userinfoMore.charm==1}">
                                    笑容
            </c:if>
              <c:if test="${matchuser.userinfoMore.charm==2}">
                                       眉毛
            </c:if>
              <c:if test="${matchuser.userinfoMore.charm==3}">
                                  眼睛
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==4}">
                                  头发
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==5}">
                                  鼻梁
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==6}">
                                  嘴唇
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==7}">
                                 牙齿
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==8}">
                               颈部
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==9}">
                                  耳朵
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==10}">
                                  手
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==11}">
                                  胳膊
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==12}">
                                  胸部
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==13}">
                                  腰部
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==14}">
                                  脚
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==15}">
                                  腿
            </c:if>
             <c:if test="${matchuser.userinfoMore.charm==16}">
                                  臀部
            </c:if>
            
          
            
              </c:otherwise>
              </c:choose></span>
                </li>
                <li>
                    <span>兴趣爱好</span>
                    <span>
                      <c:forEach items="${inlist}" var="interest" varStatus="st">
                                 <c:if test="${st.count!=1}">,</c:if>${interest.content}
                                </c:forEach>
                   </span>
                </li>
                <li>
                    <span>个人特征</span>
                    <span> 
                    <c:forEach items="${chlist}" var="ch" varStatus="st">
                                 <c:if test="${st.count!=1}">,</c:if>${ch.content}
                                </c:forEach>
                  </span>
                </li>
            </ol>
        </div>
        <div class="date_list">
            <ul class="date_nav">
                <li class="disbox-center active">征友条件</li>
            </ul>
            <ol class="user_date">
                <li>
                    <span>常出没地</span>
                    <span>${region.regionName}</span>
                </li>
                <li>
                    <span>年龄范围</span>
                    
                        <span>  <c:if test="${matchuser.userinfoSelect==null or matchuser.userinfoSelect.ageSelect==null or (matchuser.userinfoSelect.ageSelect==0 and matchuser.userinfoSelect.ageSelectMax==0)}">不限</c:if>
            <c:if test="${matchuser.userinfoSelect.ageSelect==18 and matchuser.userinfoSelect.ageSelectMax==25}">18-25岁</c:if>
            <c:if test="${matchuser.userinfoSelect.ageSelect==26 and matchuser.userinfoSelect.ageSelectMax==35}">26-35岁</c:if>
            <c:if test="${matchuser.userinfoSelect.ageSelect==36 and matchuser.userinfoSelect.ageSelectMax==45}">36-45岁</c:if>
            <c:if test="${matchuser.userinfoSelect.ageSelect==46 and matchuser.userinfoSelect.ageSelectMax==55}">46-55岁</c:if>
            <c:if test="${matchuser.userinfoSelect.ageSelect==56 and matchuser.userinfoSelect.ageSelectMax==100}">55岁以上</c:if></span>
                    
                    
                    
                    
                </li>
                <li>
                    <span>身高范围</span>
                    
                        <span> <c:if test="${matchuser.userinfoSelect==null or matchuser.userinfoSelect.heightSelect==null or (matchuser.userinfoSelect.heightSelect==0 and matchuser.userinfoSelect.heightSelectMax==0)}">不限</c:if>
            <c:if test="${matchuser.userinfoSelect.heightSelect==0 and matchuser.userinfoSelect.heightSelectMax==160}">160cm以下</c:if>
            <c:if test="${matchuser.userinfoSelect.heightSelect==161 and matchuser.userinfoSelect.heightSelectMax==165}">161-165cm</c:if>
            <c:if test="${matchuser.userinfoSelect.heightSelect==166 and matchuser.userinfoSelect.heightSelectMax==170}">166-170cm</c:if>
            <c:if test="${matchuser.userinfoSelect.heightSelect==171 and matchuser.userinfoSelect.heightSelectMax==250}">170以上</c:if></span>
                    
                    
                    
                    
                </li>
                <li>
                    <span>最低学历</span>
                    <span> <c:if test="${matchuser.userinfoSelect==null or matchuser.userinfoSelect.eduSelect==null or matchuser.userinfoSelect.eduSelect==0}">不限</c:if>
            <c:if test="${matchuser.userinfoSelect.eduSelect==1}">高中,中专及以上</c:if>
            <c:if test="${matchuser.userinfoSelect.eduSelect==2}">大专及以上</c:if>
            <c:if test="${matchuser.userinfoSelect.eduSelect==3}">本科及以上</c:if></span>
                </li>
                <li>
                    <span>最低收入</span>
                    <span>  <c:if test="${matchuser.userinfoSelect==null or matchuser.userinfoSelect.incomSelect==null or matchuser.userinfoSelect.incomSelect==0}">不限</c:if>
            <c:if test="${matchuser.userinfoSelect.incomSelect==4}">2000元以上</c:if>
            <c:if test="${matchuser.userinfoSelect.incomSelect==5}">5000元以上</c:if>
            <c:if test="${matchuser.userinfoSelect.incomSelect==6}">10000元以上</c:if></span>
                </li>
            </ol>
        </div>
    </section>
</div>
<!-- 
 <div class="bottom">
        <span data-attention="429611092">关注</span><span href="/v20/black.html?matchuserId=429611092">拉黑</span><span href="/v20/report.html?matchuserId=429611092">举报</span>
    </div>

 -->
   

    

<!--公告 消息 (狸猫渠道不显示公告信息)-->

	<footer class="foot">
		<ul>
		
			<li href="xianglianpro.do?action=userlist&openid=${user.userOpenid}">缘分</li>
			<li href="xianglianpro.do?action=chatlist&openid=${user.userOpenid}">信箱</li>
			<!-- 
			<li href="/v20/nearby.html">附近</li>
			 -->
			
			<li href="xianglianpro.do?action=myhome&openid=${user.userOpenid}">我</li>
		</ul>
		<p>©2016 想恋</p>
		<!--公告 消息-->
	    <div id="noticeDiv" class="notice" style="height:22px; overflow:hidden">
	        <img src="<%=request.getContextPath()%>/resources/xl_img/blue_voice.png">
	        <div id="notice_box" class="notice_box">
	            <ol id="ul1" data-key="weixin-userspace-01" class="person"></ol>
	        </div>
	    </div>
	    	    
	</footer>



<!-- 
 <a class="another" href="http://citylove.lover2.cc/v20/matchuser/matchuser_info.html?source=10" data-next=""><i class="re_trg"></i></a>
 -->
   

    <div class="bottomNext">
      
             <span data-sayhi="${matchuser.id}" data-source="${user.id}"><i class="icon-bt-hello"></i>打招呼</span>
        
        
    </div>




<div id="mask" class="mask hidden" style="width:100%; height:100%; background:rgba(0,0,0,0.7); position:fixed; left:0; top:0; z-index:1000;"></div>
<!--弹窗-->
<div id="identity" class="simple_info hidden" href="/v20/info/auth_idcard.html">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_identity.jpg"></dt>
        <dd class="tit">身份验证</dd>
        <dd>身份验证特别有诚意、让Ta安心</dd>
    </dl>
    <span class="btn">我也去验证</span>
</div>
<div id="vip" class="simple_info hidden">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_vip.jpg"></dt>
        <dd class="tit">vip用户</dd>
        <dd>拥有免费写信等11大特权</dd>
    </dl>
    

</div>
<div id="phone" class="simple_info hidden" href="/v20/info/auth_mobile.html">
    <p class="title"><span>勋章简介</span></p>
    <dl class="examine">
        <dt><img src="<%=request.getContextPath()%>/resources/xl_img/sample_phone.jpg"></dt>
        <dd class="tit">手机验证用户</dd>
        <dd>忘记密码可第一时间找回</dd>
    </dl>
    <span class="btn">我也去验证</span>
</div>

<div class="shadowBanner">
    <div><img src="<%=request.getContextPath()%>/resources/xl_img/1448160179289A406AA8_c(1).jpeg"></div>
</div>


<div class="StrategyInfo StrategyA rel" style=" display:none">
    <div class="close_btnR abs"></div>
    <div class="top_">她设置了关心的问题，请你回答</div>
    <div class="blank15"></div>
    <div class="tit_"></div>
    <div class="blank15"></div>
    <div class="box_">
        <ul>
            <!--
            <li>政治家的理想主义</li>
            <li>源自于苏联的救援体系</li>
            <li>已经是市场经济</li>
            -->
        </ul>
    </div><!-- box_ end -->
</div><!-- StrategyA -->

<div class="StrategyInfo StrategyB rel" style=" display:none">
    <div class="close_btnR abs"></div>
    <div class="top_"><div class="ltb Smile"></div><div class="rtb">答对啦！</div></div>
    <div class="blank20"></div>
    <div class="p-l-20 l-h-30">她还有一个问题，请你回答</div>
    <div class="blank10"></div>
    <div class="tit_ p-l-20"></div>
    <div class="blank20"></div>
    <div class="spokbtn">回复并索要联系方式</div>
</div><!-- StrategyA -->




 <script src="<%=request.getContextPath()%>/resources/xl_js/ajax.js"></script>
	    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    
   		<script src="<%=request.getContextPath()%>/resources/xl_js/headmessage.js"></script>
    <!--  
    <script src="<%=request.getContextPath()%>/resources/xl_js/user_info.js"></script>
   -->
   <script type="text/javascript">
 //对方空间页
   var UserInfo = (function () {
       return {
           needPhoto: function ($this) {

               if (!$this.data("visited")) {
                   $this.data("visited", true)
                   var userId=$this.data('afp');
                   var sourceId = $this.data('source');
                   $.ajax({url: "<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=needphoto", type: 'post', data: {userId: sourceId,sourceId:userId}, dataType: "json", success: function (data) {
                       if (data == -90) {
                           location.href = "/v20/user/interceptor_photo.html"
                       } else {
                           $.tips("已发送上传照片邀请");
                           alert("已发送上传照片邀请");
                       }
                   }});
               }else{
                   $.tips("已经索要过照片了");
               }
           }, intercept: function ($this) {
               var Id = '#' + $this.data("value");
               $("#mask").removeClass("hidden");
               $(Id).removeClass("hidden").siblings(".simple_info").addClass("hidden");
           },
           cancelCheck: function () {
               $(".simple_info").addClass("hidden");
               $("#mask").addClass("hidden");
           }
       }
   })();
   $(function () {
       // 更换头像图片
       var src= $(".shadowBanner img").attr("src");
       src= src.replace("/90/110","/225/275");
       $(".shadowBanner img").attr("src",src);
       
       //返回顶部
       $(".another").on("tap",function(){
           $(window).scrollTop(0);
       });
       //点击事件 打招呼
       $('body').on("tap", '[data-sayhi]', function () {
   		
   		
   			var $this = $(this), userId = $this.data('sayhi'), source = $this.data('source');
   			if (!source) {
   				source = '0';
   			}
   			$.waiting.show("正在打招呼...")
   			$('[data-sayhi]').removeAttr('data-sayhi').removeClass('hello').addClass("hello_out").html('<i class="icon-bt-hello"></i>已打招呼');
   			$.ajax({url: '<%=request.getContextPath()%>/weixinpro/ajax?ajaxtype=sayhello', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {
   				if (data == 13) {
   					location.href = "/v20/user/hello_template.html?userId=" + userId;
   				} else {//下一位
   					$.waiting.hide()
   					if (data == 6) {
   						$.tips("你今天已经向Ta打过招呼了。");
   					} else {
   						$.tips("招呼已发出，请耐心等待Ta的回复");
   					}
   					//两秒后跳转下一个人
   				   /* setTimeout(function () {
   						location.href = "/v20/user/user_info.html";
   					}, 2000);*/
   	
   				}
   			}, error: function () {
   				$.waiting.hide();
   			}});
   		
   		
       }).on("tap", '[data-attention]', function () {
           var userId = $(this).data("attention");
           var $this = $(this);

           if ($this.hasClass("hello_out")) {
               $.ajax({url: '/v20/remove_love.html', data: {userId: userId}, dataType: 'json', type: 'post', success: function (data) {
                   $this.removeClass("hello_out").html("关注");
                   $.tips("你取消了对Ta的关注");
               }});
           } else {
               $.ajax({url: '/v20/add_love.html', data: {userId: userId}, dataType: 'json', type: 'post', success: function (data) {
                   $this.addClass("hello_out").html("取消关注")
                   $.tips("你关注了Ta");
               }});
           }
       }).on("tap", "[data-value]", function () {
           UserInfo.intercept($(this))
       }).on("tap", ".closed,#mask", function () {
           UserInfo.cancelCheck();
       }).on("tap", "[data-afp]", function () {
           UserInfo.needPhoto($(this));
       }).on("tap", '#btnSendMsg,#write_msg', function () {
           if($.header) $.header.hide();
       }).on("tap", '[data-next]', function () {
           $(this).css({'background-color':'#ccc'})
       }).on("tap",".smallShow",function(){
           //显示头像大图        
           $(".shadowBanner").show();
           var a=$(".shadowBanner img").height();
           $(".shadowBanner img").css({position:"relative",top:"50%",marginTop:-a/2-50});

       }).on("tap",".shadowBanner",function(){
           $(this).hide();
       });
       $(".date_nav li").eq(0).trigger('tap');
       if($.header) $.header.show();
       $(window).scrollTop(-1);
       //认证头像
       if((!$(".phone").hasClass("noCheck") && $(".phone")[0]) || (!$(".identity").hasClass("noCheck") && $(".identity")[0])){
           $(".personIcon").css("display","inline-block");
       }
   });

   /******************************************************************
   H5正向化，打招呼问题拦截 2015-06-15 Liuxx
   *******************************************************************/
   window.onload=function(){
   	$.ajax({
   		//url:"http://192.168.66.90:8080/php/test5.php",
   		url:"/v20/msg/getQuestionAndAnswers.html",
   		type:"post",
   		dataType:"json",
   		//jsonpCallback:"Jsoncallback",
   		//data:{name:"Zepto",type:"JSONP"},
   		success:function(data){
   			var yy=JSON.stringify(data);
   			var answers=data.answers;
   			
   			/*$(".StrategyA,.mask").show();*/

   		    /*这里只需一层取各项数据*/
   		    for(var i in answers){
   				$(".StrategyA .tit_").html(data.question);
   				$(".StrategyB .tit_").html(data.nextQuestion);
   			}
   			/****去JSON对象中的数组转成数组字符串****/
   			var arr=JSON.stringify(data.answers);
   			/******************在每个逗号(,)处进行分解 ss=arr.split(",");********************/
   				/***********把数组字符串转成对象后循环*************/
   				var aArr=eval(arr);
   				for(var k=0; k<aArr.length; k++){
   					var harr='';
   					var html="<li>"+aArr[k]+"</li>";
   					$(".StrategyInfo .box_ ul").append(html);
   				}
   			
   		}
   	})

   }

   /*** 关闭弹窗 ***/
   $(".close_btnR").click(function(){
   	$(".StrategyInfo,.mask").hide();
   });
   /*** 事件跳转处理 ***/
   $(document).on("tap",".StrategyInfo .box_ li",function(){
   			var $this = $(".h5-hello-Btn"), userId = $this.data('sayhi'), source = $this.data('source');
   			if (!source) {
   				source = '0';
   			}
   			$.waiting.show("正在打招呼...")
   			$('[data-sayhi]').removeAttr('data-sayhi').removeClass('hello').addClass("hello_out").html('<i class="icon-bt-hello"></i>已打招呼');
   			$.ajax({url: '/v20/msg/say_hello_one.html', data: {userId: userId, source: source}, dataType: 'json', type: 'post', success: function (data) {
   				if (data == 13) {
   					location.href = "/v20/user/hello_template.html?userId=" + userId;
   				} else {//下一位
   					$.waiting.hide()
   					if (data == 6) {
   						$(".tips").css({"z-index":"2000","border":"1px solid #5c5c5c !important"})
   						$.tips("你今天已经向Ta打过招呼了。");
   					} else {
   						$(".tips").css({"z-index":"2000","border":"1px solid #5c5c5c !important"})
   						$.tips("招呼已发出，请耐心等待Ta的回复");
   					}
   					//两秒后跳转下一个人
   				   /* setTimeout(function () {
   						location.href = "/v20/user/user_info.html";
   					}, 2000);*/
   	
   				}
   			}, error: function () {
   				$.waiting.hide();
   			}});
   			
   	$(".StrategyA").hide();
   	$(".StrategyB").show();
   })
   /*** 跳转按钮处理 ***/
   $(document).on("touchstart",".StrategyInfo .box_ li",function(event){
   	$(event.target).addClass("lion");
   }).on("touchend",".StrategyInfo .box_ li",function(event){
   	$(event.target).removeClass("lion");
   });
   /*** 去付费吧 ***/
   $(document).on("tap",".spokbtn",function(){
   	location.href="/v20/charge/pay_intercept.html";
   })

   /***文字广告***/
    function getAdN(){
   			
   			/***********************
   			注明：获取广告数据接口 
   			1. 用户ID是：userId
   			2. 版位号是：position
   			3. 回调方法：jsoncallback
   			*******************************/
   			$.ajax({
   				//url:"http://192.168.66.90:8080/php/test7.php",
   				url:"/v20/user/tip.html",
   				type:"GET",
   				data:{position:"weixin-userspace-01"},
   				dataType:"jsonp",
   				jsonp: 'Jsoncallback',
   				success:function(data){
   					//alert(data)
   					var yy=JSON.stringify(data);
   					var item=data.advert;
   					if(data!=''){
   						for(var i=0;i<data.advert.length;i++){
   							var h = "",jsId=$("body").data("jsid"),userId=$("body").data("userid");
   							if(item[i].linkType==1){
   								var linkTypeN='target="_blank"';
   							}
   							if(item[i].linkType==0){
   								var linkTypeN='';
   							}
   							var	html ='<li class="adli" tty="'+i+'">';
   								html+='<a href="'+item[i].linkUrl+'" class="adStatistics" activeid="'+item[i].activeid+'" positionid="weixin-userspace-01" provinceid="'+data.province+'" userid="'+userId+'" adtype="'+item[i].type+'">'+item[i].content+'</a>';
   								html+='</li>';
   							$("#ul1").append(html);		
   							// 加入统计信息
   							$.get("http://x.youyuan.com/adStatistics.gif?eventid="+item[i].activeid+"&positionid=weixin-userspace-01&provinceid="+data.province+"&userid="+userId+"&adtype=OnLoad");
   						}
   						$("#ul1").on("click",".adStatistics",function(){
   							var activeid=$(this).attr("activeid"),provinceid=$(this).attr("provinceid"),userid=$("body").attr("userid");
   							// 点击统计
   							if($(this).attr("activeid")) {
   								$.get("http://x.youyuan.com/adStatistics.gif?eventid="+activeid+"&positionid=weixin-userspace-01&provinceid="+provinceid+"&userid="+userid+"&adtype=Click");
   							}
   							
   						});
   						//广告轮播
   						i>0 && scrT();
   						if($("#ul1").html()!="") {
   							$("#ul1").show();
   							$("#noticeDiv").show(200);
   						}			
   					}
   				},
   				error:function(status){
   				// 此处放失败后执行的代码
   				}
   			});
           }
           var moveObj={T:0,w:0,timer:null}

   		function move(obj,iTarget)
   		    {
   		        clearInterval(obj.timer);
   		        obj.timer=setInterval(function (){
   		            var iSpeed=(iTarget - moveObj.T)/8;
   		            iSpeed=iSpeed>0?Math.ceil(iSpeed):Math.floor(iSpeed);
   		            moveObj.T+=iSpeed;
   		            obj.style.top=moveObj.T%moveObj.w+'px';
   		            if(moveObj.T==iTarget){
   		                clearInterval(obj.timer);
   		            }
   		        },30);
   		    }
   		function scrT(){
   		   try{
   		       //向上滚动
   		       var oBox=document.getElementById('notice_box');
   		       var oUl=oBox.getElementsByTagName('ol')[0];
   		       var aLi=oUl.children;
   		        if(aLi.length>1){
   		            oUl.innerHTML+=oUl.innerHTML;
   		            moveObj.w=oUl.offsetHeight/2;
   		            var count=0;
   		            clearInterval(moveObj.timer);
   		            moveObj.timer=setInterval(function(){
   		                count++;
   		                move(oUl,-count*aLi[0].offsetHeight)
   		            },2000)
   		        }
   		   }catch(e){}
   		}
           getAdN();
   </script>






     
 </body></html>