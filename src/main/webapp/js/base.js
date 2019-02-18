function basesubmit( url , datas){
    $.ajax({
        type: "post",
        dataType : "json",
        async: false,
        url: url,
        data: datas,
        success: function(data){
            layer.msg(data.message,{time:800});
        },
        error: function() {
            layer.msg('网络出现异常，请检查您的网络');
        }
    });
}

function basesubmits( url , datas){
    var d;
    $.ajax({
        type: "post",
        dataType : "json",
        async: false,
        url: url,
        data: datas,
        success: function(data){
            d = data;
        }
    });
    return d;
}