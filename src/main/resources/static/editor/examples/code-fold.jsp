<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Code folding - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Code folding</h1>
                <p>Switch code folding : Press Ctrl + Q / Command + Q</p>
            </header>
            <div id="test-editormd">
                <textarea style="display:none;"></textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            var testEditor;
            
            $(function() {
                $.get("./test.md", function(md) {
                    testEditor = editormd("test-editormd", {
                        width  : "90%",
                        height : 720,
                        markdown : "#### Setting\r\n\r\n    {\n        codeFold : true\n    }\r\n\r\n" + md,
                        codeFold : true,
                        htmlDecode : true,
                        tex : true,
                        taskList : true,
                        emoji : true,
                        flowChart : true,
                        sequenceDiagram : true,
                        path   : '../lib/'
                    });
                });
            });
        </script>
    </body>
</html>