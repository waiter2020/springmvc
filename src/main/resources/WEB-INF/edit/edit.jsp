<%--
  Created by IntelliJ IDEA.
  User: waiter
  Date: 18-11-9
  Time: 下午4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script src="https://cdn.bootcss.com/markdown.js/0.6.0-beta1/markdown.min.js"></script>
<div>
    <!-- 输入区 -->
    <textarea id="text-input" oninput="this.editor.update()">在此处输入相关markdown语句</textarea>
    <!-- 显示区 -->
    <div id="preview" class="pull-left"> </div>
</div>
<script>
    // markdown
    function Editor(input, preview) {
        this.update = function () {
            preview.innerHTML = markdown.toHTML(input.value);
        };
        input.editor = this;
        this.update();
    }
    var _a = function (id) { return document.getElementById(id); };
    new Editor(_a("text-input"), _a("preview"));
</script>

</body>
</html>
