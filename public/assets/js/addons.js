define([], function () {
    $("input[name='captcha']:visible").each(function () {

    function loadScript(url, callback){
        var script = document.createElement("script");
        script.type = "text/javascript";
        if (script.readyState){ //IE
            script.onreadystatechange = function(){
                if (script.readyState == "loaded" || script.readyState == "complete"){
                    script.onreadystatechange = null;
                    callback();
                }
            };
        } else { //Others
            script.onload = function(){
                callback();
            };
        }
        script.src = url;
        document.getElementsByTagName("head")[0].appendChild(script);
    }

    var obj = $(this);
    var form = obj.closest('form');

    var subBtn = $("button[type='submit']",form);

    subBtn.hide();
    subBtn.parent().append('<p class="wait show" style="min-height:44px;line-height:44px;">正在加载验证码...</p>');

    obj.parent().removeClass('input-group')
        .html('<input type="hidden" id="t-captcha" name="captcha" value="" class="form-control" data-msg-required="请完成验证码验证" data-rule="required"/>' +
            '<input type="hidden" name="tcaptcha_ticket" value="">' +
            '<input type="hidden" name="tcaptcha_randstr" value="">');
    loadScript("https://ssl.captcha.qq.com/TCaptcha.js",function () {
        $(".wait", form).remove();
        subBtn.show();
        $('#t-captcha').on('invalid.rule', function(e, ruleName){
            if (ruleName === 'required') {
                var captcha = new TencentCaptcha(Config.tcaptcha_appid, function(res) {
                    if(res.ret === 0){
                        var $ticket = $("input[name='tcaptcha_ticket']",form);
                        var $randstr = $("input[name='tcaptcha_randstr']",form);
                        $ticket.val(res.ticket);
                        $randstr.val(res.randstr);
                        $("#t-captcha").val('ok');
                        form.submit();
                    }
                });
                captcha.show(); // 显示验证码
            }
        });
        // 监听表单错误事件
        form.on("error.form", function (e, data) {
            $("#t-captcha").val('');
        });
    });
});
});