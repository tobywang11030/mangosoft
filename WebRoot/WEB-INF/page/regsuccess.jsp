<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="black" name="apple-mobile-web-app-status-bar-style">
<meta content="telephone=no" name="format-detection">
<title>想恋</title>
    <link href="<%=request.getContextPath()%>/resources/xl_js/register_qa_new.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/resources/xl_js/zepto.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/public.js"></script>
    <script src="<%=request.getContextPath()%>/resources/xl_js/waiting.js"></script>
    <script type="text/javascript">

    var Msg=(function (){
       return {
           send:function($this){
               var qList=$(".online-people li"),qLen=qList.length;
               var userids="";
               for(var i=0;i<qLen;i++){
                   var value=qList.eq(i).attr("data-value");
                   if(userids!=""){
                       userids= userids+","+value;
                   }else{
                       userids= value;
                   }
               }
               var choose=$this.data("value");
               $.post("<%=request.getContextPath()%>/weixinpro/ajax?&ajaxtype=heartsay&openid=${user.userOpenid}",{heartsay:choose,userIds:userids},function(data,status){
                   location.href='<%=request.getContextPath()%>/weixinpro/web?action=myhome&openid=${user.userOpenid}';
               });
            }
       }
    })();

    $(function(){
        $(".signin dd").on("touchend",function(){
            $(this).addClass("active");
    		Msg.send($(this));
            //setTimeout(function(){
            //    location.href='/v20/index.html';
            //},2000);
        })
    });
    </script>
</head>
<body class="lj-bg">
<ol class="online-people">
    	<c:forEach items="${userlist}" var="usermatch">
	
	   <li data-value="${usermatch.id}"><img src="${usermatch.photo}"></li>
	</c:forEach>
    
      
    
    <div class="space">${region.regionName}</div>
</ol>
<input type="hidden" name="listUserMap" id="listUserMap" value="[{uid=405095542, onlineFlag=false, photoNum=1, constellation=天秤, cityId=300, tag=独守空房, cityName=汉中, isPayingMember=false, provinceName=陕西, salaryName=2000-5000, miniPhoto=http://px1.youyuan.com/resize/photo/n/n/n/63/77/201510/27/19/31/1445945484758AB3857E_c.jpeg, moodPhoto=http://px1.youyuan.com/resize/photo/n/n/n/50/50/201510/27/19/31/1445945484758AB3857E_c.jpeg, marriageName=未婚, interestId=18, height=159, birthdayDay=13, bloodName=B, age=18, charmId=3, characterName=爱吃, superMaxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/225/275/201510/27/19/31/1445945484758AB3857E_c.jpeg, nickname=睡不着的饼干, callingName=其他, identityCard=, iconFileName=1445945484758AB3857E, houseName=租房, salaryId=4, birthdayYear=1997, houseId=3, mobile=13709165548, provinceId=16, birthday=1997-10-13, sex=1, desc=, maxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/180/220/201510/27/19/31/1445945484758AB3857E_c.jpeg, weight=184, hasIcon=true, characterId=30, educationName=高中及中专, bloodId=2, distance=7.3, searchDesc=寻找陕西 18~22岁 170~180的男生, squarePhoto=http://px1.youyuan.com/resize/photo/n/n/n/200/200/201510/27/19/31/1445945484758AB3857E_c.jpeg, birthdayMonth=10, qq=null, educationId=1, interestName=旅游, charmName=眼睛, callingId=7, defaultPhoto=false, marriageId=1, isPhoneOnline=true, photoUrl=http://px1.youyuan.com/resize/photo/n/n/n/90/110/201510/27/19/31/1445945484758AB3857E_c.jpeg}, {uid=381365106, onlineFlag=false, photoNum=0, constellation=金牛, cityId=297, tag=独守空房, cityName=咸阳, isPayingMember=false, provinceName=陕西, salaryName=2000-5000, miniPhoto=http://px1.youyuan.com/resize/photo/n/n/n/63/77/201509/19/10/28/1442629721813A9465DE_c.jpg, moodPhoto=http://px1.youyuan.com/resize/photo/n/n/n/50/50/201509/19/10/28/1442629721813A9465DE_c.jpg, marriageName=未婚, interestId=18, height=159, birthdayDay=25, bloodName=A, age=27, charmId=1, characterName=好动, superMaxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/225/275/201509/19/10/28/1442629721813A9465DE_c.jpg, nickname=路过云朵, callingName=其他, identityCard=430922198504252820, iconFileName=1442629721813A9465DE, houseName=租房, salaryId=4, birthdayYear=1988, houseId=3, mobile=15596765825, provinceId=16, birthday=1988-04-25, sex=1, desc=, maxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/180/220/201509/19/10/28/1442629721813A9465DE_c.jpg, weight=186, hasIcon=true, characterId=29, educationName=高中及中专, bloodId=1, distance=5.9, searchDesc=寻找湖南 28~38岁 165~180的男生, squarePhoto=http://px1.youyuan.com/resize/photo/n/n/n/200/200/201509/19/10/28/1442629721813A9465DE_c.jpg, birthdayMonth=4, qq=null, educationId=1, interestName=旅游, charmName=笑容, callingId=7, defaultPhoto=false, marriageId=1, isPhoneOnline=true, photoUrl=http://px1.youyuan.com/resize/photo/n/n/n/90/110/201509/19/10/28/1442629721813A9465DE_c.jpg}, {uid=419748957, onlineFlag=false, photoNum=2, constellation=金牛, cityId=294, tag=小巧玲珑, cityName=西安, isPayingMember=false, provinceName=陕西, salaryName=2000元以下, miniPhoto=http://px1.youyuan.com/resize/photo/n/n/n/63/77/201511/09/00/37/1447000631138A6B395E_c.jpg, moodPhoto=http://px1.youyuan.com/resize/photo/n/n/n/50/50/201511/09/00/37/1447000631138A6B395E_c.jpg, marriageName=未婚, interestId=6, height=160, birthdayDay=9, bloodName=B, age=21, charmId=3, characterName=贤惠, superMaxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/225/275/201511/09/00/37/1447000631138A6B395E_c.jpg, nickname=莫若&amp;, callingName=在校学生, identityCard=612324199405093182, iconFileName=1447000631138A6B395E, houseName=与父母同住, salaryId=3, birthdayYear=1994, houseId=2, mobile=13259458325, provinceId=16, birthday=1994-05-09, sex=1, desc=我知道了，原来我喜欢的就是高富帅，哈哈，这三项其中有两项符合就可以。以结婚为目的, maxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/180/220/201511/09/00/37/1447000631138A6B395E_c.jpg, weight=110, hasIcon=true, characterId=21, educationName=大专, bloodId=2, distance=1.2, searchDesc=寻找陕西 18~25岁 181~185的男生, squarePhoto=http://px1.youyuan.com/resize/photo/n/n/n/200/200/201511/09/00/37/1447000631138A6B395E_c.jpg, birthdayMonth=5, qq=null, educationId=2, interestName=听音乐, charmName=眼睛, callingId=1, defaultPhoto=false, marriageId=1, isPhoneOnline=false, photoUrl=http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/09/00/37/1447000631138A6B395E_c.jpg}, {uid=368730403, onlineFlag=false, photoNum=4, constellation=巨蟹, cityId=294, tag=寻缘再嫁, cityName=西安, isPayingMember=false, provinceName=陕西, salaryName=null, miniPhoto=http://px1.youyuan.com/resize/photo/n/n/n/63/77/201510/09/21/39/1444397950342AF05BF4_c.jpg, moodPhoto=http://px1.youyuan.com/resize/photo/n/n/n/50/50/201510/09/21/39/1444397950342AF05BF4_c.jpg, marriageName=离异, interestId=18, height=162, birthdayDay=26, bloodName=B, age=28, charmId=0, characterName=直爽, superMaxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/225/275/201510/09/21/39/1444397950342AF05BF4_c.jpg, nickname=匆匆那年, callingName=null, identityCard=, iconFileName=1444397950342AF05BF4, houseName=null, salaryId=0, birthdayYear=1987, houseId=0, mobile=, provinceId=16, birthday=1987-06-26, sex=1, desc=, maxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/180/220/201510/09/21/39/1444397950342AF05BF4_c.jpg, weight=276, hasIcon=true, characterId=33, educationName=保密, bloodId=2, distance=2.7, searchDesc=寻找陕西的男生, squarePhoto=http://px1.youyuan.com/resize/photo/n/n/n/200/200/201510/09/21/39/1444397950342AF05BF4_c.jpg, birthdayMonth=6, qq=null, educationId=0, interestName=旅游, charmName=null, callingId=0, defaultPhoto=false, marriageId=2, isPhoneOnline=true, photoUrl=http://px1.youyuan.com/resize/photo/n/n/n/90/110/201510/09/21/39/1444397950342AF05BF4_c.jpg}, {uid=420918791, onlineFlag=false, photoNum=0, constellation=摩羯, cityId=296, tag=青春萌妹, cityName=宝鸡, isPayingMember=false, provinceName=陕西, salaryName=2000元以下, miniPhoto=http://px1.youyuan.com/resize/photo/n/n/n/63/77/201511/11/07/47/1447199249170A291B8F_c.jpg, moodPhoto=http://px1.youyuan.com/resize/photo/n/n/n/50/50/201511/11/07/47/1447199249170A291B8F_c.jpg, marriageName=未婚, interestId=4, height=162, birthdayDay=1, bloodName=A, age=19, charmId=1, characterName=可爱, superMaxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/225/275/201511/11/07/47/1447199249170A291B8F_c.jpg, nickname=追星的铅笔, callingName=其他, identityCard=, iconFileName=1447199249170A291B8F, houseName=与父母同住, salaryId=3, birthdayYear=1996, houseId=2, mobile=15691669524, provinceId=16, birthday=1996-01-01, sex=1, desc=, maxPhoto=http://px1.youyuan.com/resize/photo/n/n/n/180/220/201511/11/07/47/1447199249170A291B8F_c.jpg, weight=200, hasIcon=true, characterId=35, educationName=初中及以下, bloodId=1, distance=1.8, searchDesc=寻找浙江 18~22岁的男生, squarePhoto=http://px1.youyuan.com/resize/photo/n/n/n/200/200/201511/11/07/47/1447199249170A291B8F_c.jpg, birthdayMonth=1, qq=null, educationId=5, interestName=摄影, charmName=笑容, callingId=7, defaultPhoto=false, marriageId=1, isPhoneOnline=true, photoUrl=http://px1.youyuan.com/resize/photo/n/n/n/90/110/201511/11/07/47/1447199249170A291B8F_c.jpg}]">
<dl class="signin">
	<dt>注册成功<span class="min-tit">选一句话向附近的人介绍自己</span></dt>
	<c:forEach items="${hsl}" var="heart">
	<dd data-value="${heart.content}">${heart.content}</dd>
	</c:forEach>
    
    
</dl>

</body></html>