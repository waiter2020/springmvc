/*

@Name：不落阁整站模板源码 
@Author：Absolutely 
@Site：http://www.lyblogs.cn

*/

prettyPrint();
layui.use(['form', 'layedit'], function () {
    var form = layui.form;
    var $ = layui.jquery;
    var layedit = layui.layedit;

    //评论和留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
    });
    //评论和留言的编辑器的验证
    layui.form.verify({
        content: function (value) {
            value = $.trim(layedit.getText(editIndex));
            if (value == "") return "自少得有一个字吧";
            layedit.sync(editIndex);
        }
    });

    //监听评论提交
    form.on('submit(formRemark)', function (data) {
        var index = layer.load(1);

        layer.close(index);
            $.ajax({
                url: $("#comment").attr("action"),
                type: "post",
                contentType: "application/json;charset=utf-8",
                dataType: 'json',
                data: JSON.stringify({'content':data.field.comment}),
                async: true,
                success: function(result){
                    $("#div1").html(result);
                    html=" <li >\n" +
                            "                                <div class=\"comment-parent\">\n" +
                            "                                    <img class=\"comment-child\" src=\"../images/Absolutely.jpg\" alt=\"absolutely\" />\n" +
                            "                                    <div class=\" info \" >\n" +
                            "                                        <span class=\"username\">"+result.userName+"</span>\n" +
                            "                                        <span class=\"time\">"+Format(result['create'], 'yyyy-MM-dd HH:mm:ss')+"</span>\n" +
                            "                                    </div>\n" +
                            "                                    <br/>\n" +
                            "                                    <div class=\"content\">\n" +
                                                                    result.content +
                            "                                    </div>\n" +
                            "                                </div>\n" +
                            "                            </li>";
                    $('.blog-comment').prepend(html);
                    $('#remarkEditor').val('');
                    editIndex = layui.layedit.build('remarkEditor', {
                        height: 150,
                        tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
                    });
                    layer.msg("评论成功", { icon: 1 });
                }});
            return false;
    //     //模拟评论提交
    //     setTimeout(function () {
    //         layer.close(index);
    //         var content = data.field.comment;
    //         var html = '<li><div class="comment-parent"><img src="../images/Absolutely.jpg"alt="absolutely"/><div class="info"><span class="username">Absolutely</span><span class="time">2017-03-18 18:46:06</span></div><div class="content">' + content + '</div></div></li>';
    //         $('.blog-comment').append(html);
    //         $('#remarkEditor').val('');
    //         editIndex = layui.layedit.build('remarkEditor', {
    //             height: 150,
    //             tool: ['face', '|', 'left', 'center', 'right', '|', 'link'],
    //         });
    //         layer.msg("评论成功", { icon: 1 });
    //     }, 500);
    //     return false;
    // });
});
});

function Format(now,mask)
{
    var d =  new Date(now);
    var zeroize = function (value, length)
    {
        if (!length) length = 2;
        value = String(value);
        for (var i = 0, zeros = ''; i < (length - value.length); i++)
        {
            zeros += '0';
        }
        return zeros + value;
    };

    return mask.replace(/"[^"]*"|'[^']*'|\b(?:d{1,4}|m{1,4}|yy(?:yy)?|([hHMstT])\1?|[lLZ])\b/g, function ($0)
    {
        switch ($0)
        {
            case 'd': return d.getDate();
            case 'dd': return zeroize(d.getDate());
            case 'ddd': return ['Sun', 'Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat'][d.getDay()];
            case 'dddd': return ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][d.getDay()];
            case 'M': return d.getMonth() + 1;
            case 'MM': return zeroize(d.getMonth() + 1);
            case 'MMM': return ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'][d.getMonth()];
            case 'MMMM': return ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'][d.getMonth()];
            case 'yy': return String(d.getFullYear()).substr(2);
            case 'yyyy': return d.getFullYear();
            case 'h': return d.getHours() % 12 || 12;
            case 'hh': return zeroize(d.getHours() % 12 || 12);
            case 'H': return d.getHours();
            case 'HH': return zeroize(d.getHours());
            case 'm': return d.getMinutes();
            case 'mm': return zeroize(d.getMinutes());
            case 's': return d.getSeconds();
            case 'ss': return zeroize(d.getSeconds());
            case 'l': return zeroize(d.getMilliseconds(), 3);
            case 'L': var m = d.getMilliseconds();
                if (m > 99) m = Math.round(m / 10);
                return zeroize(m);
            case 'tt': return d.getHours() < 12 ? 'am' : 'pm';
            case 'TT': return d.getHours() < 12 ? 'AM' : 'PM';
            case 'Z': return d.toUTCString().match(/[A-Z]+$/);
                // Return quoted strings with the surrounding quotes removed
            default: return $0.substr(1, $0.length - 2);
        }
    });
};