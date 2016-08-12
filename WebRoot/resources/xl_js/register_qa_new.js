
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
           $.post("/v20/registerQANewSave.html",{msgId:choose,userIds:userids},function(data,status){
               location.href='/v20/index.html';
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
