var Photo=(function(){
    return {
        addPhoto:function(data){
            var img = new Image();
            img.onload=function(){
                var li = $("<li></li>").append(img).append('<div class="loading">待审核</div>');
                $("#add_photo").after(li)
            }
            img.src = 'http://pd.youyuan.com/resize/photo/n/n/n/100/100' + data.path;
        }
    }
})();
$(function () {
    var backUrl = $("#backUrl").val();
    //取消红娘弹窗
    $("body").on("tap","#cancel,.closed",function(){
        $(".common_alert,.mask").addClass("hidden");
    });
    
    if (window.youyuan) {
        $('#add_photo').on("tap", function () {
            var options = {url:  'http://'+location.host+'/v20/photo/upload_file.html', params: {isMain: "0", userId: $("#GUID").val()}, callback: Photo.addPhoto};
            youyuan.upload(JSON.stringify(options));
        });
    } else {
        var uploadImg,state,loading,itv;
        $("#add_photo").upload({
            action: '/v20/photo/upload_file.html',
            params: {isMain: 0},
            onChooseFile: function (img, file) {
                uploadImg = img;
                state = $('<span class="state"></span>');
                loading = $('<div class="loading">上传中</div>').append(state);
                var li = $("<li></li>").append(img).append(loading);
                $("#add_photo").after(li);
                $("#add_photo").hide();
                var len = 0;
                itv = setInterval(function () {
                    len += 5;
                    if (len > 100)len = 0;
                    state.css('width', len + '%')
                }, 100)
            },
            onSubmit: function(data){
                $("#add_photo").show();
                if (data.re == 1) {
                    clearInterval(itv);
                    loading.html('待审核');
                    uploadImg.src = 'http://pd.youyuan.com/resize/photo/n/n/n/100/100' + data.path;
                    var back = $("#back").val();
                    if(back && back == 'hongniang' ){
                    	$(".common_alert,.mask").removeClass("hidden");
                    }
                    if(backUrl!=null && 'hongniang_service_interceptor'==$.trim(backUrl)){
                    	location.href='/v20/info/hongniang_service_interceptor.html';
                    }
                } else {
                    $.tips("上传失败，图片不得超过3M！");
                    $("#add_photo").next().remove();
                }
            }
        });
    }
});
