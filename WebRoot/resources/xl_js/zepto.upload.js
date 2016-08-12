/**
 * 上传照片插件
 * @param action
 * @param params 参数列表
 * @param onChooseFile 选择照片后，提交前调用 (传入的参数为选择的照片对象)
 * @param onSubmit 提交完成后调用 (参数是服务器返回值)
 *
 */
(function ($) {
    $.fn.upload = function (options) {
        var settings = {
            dom: this,
            action: '',
            params: {},
            onChooseFile: false,
            onSubmit: false
        };
        settings = $.extend(settings, options);
        var width = $(settings.dom).width();
        var height = $(settings.dom).height();

        var file = $('<input type="file"/>');
        file.attr({accept: "image/jpeg,image/png", name: "file"});
        if (settings.onSubmit) {
            var iFrameName = "upload_icon_iframe_" + parseInt(Math.random() * 100),
                form = $('<form></form>'),
                iFrame = $("<iframe style='display:none;'></iframe>");
            iFrame.attr({name: iFrameName, id: iFrameName});
            form.attr({action: settings.action, enctype: "multipart/form-data", method: "post", target: iFrameName});
            for (var param in settings.params) {
                var input = $("<input type='hidden'/>").attr({name: param, value: settings.params[param]});
                form.append(input);
                input = null;
            }
            file.appendTo(form);
            form.append(iFrame);

            iFrame.on('load', function () {
                var re = $(this.contentDocument.body).text();
                if(re.indexOf("{")>0){
                    settings.onSubmit($.parseJSON(re));
                }else if (re.length > 4) {
                    settings.onSubmit({'re':1,'path':re});
                }else if(re==''){
                    return;
                }else{
                    // 上传失败
                    settings.onSubmit({'re':re});
                }
            });

            file.css({'position': 'absolute', width: '100%', height: '100%', left: 0, top: 0, right: 0, bottom: 0, opacity: 0});
            form.css({'position': 'absolute', width: '100%', height: '100%', left: 0, top: 0, right: 0, bottom: 0});
            $(settings.dom).css({'position': 'relative', overflow: 'hidden'});
            $(settings.dom).append(form);
        } else {
            file.css({'position': 'absolute', width: '100%', height: '100%', left: 0, top: 0, right: 0, bottom: 0, opacity: 0});
            $(settings.dom).css({'position': 'relative', overflow: 'hidden'}).append(file);
        }

        file.on('change', function () {
            var flg=false;
            if (this.files[0] && this.value.toLocaleString().match('^.*\.[jpg|png]$')) {

                    if (settings.onChooseFile) {
                        var img = new Image();
                        window.URL = window.URL || window.webkitURL;
                        if(window.URL){
                            img.src = window.URL.createObjectURL(this.files[0]);
                            img.onload = function (e) {
                                window.URL.revokeObjectURL(this.src);
                            };
                        }else{
                            if(this.files[0].getAsDataURL){
                                img.src =this.files[0].getAsDataURL();
                            }
                        }
                        settings.onChooseFile(img, this);
                    }
                if (settings.onSubmit) {
                   form.submit();
                }
            }
        })
    }
})(Zepto)