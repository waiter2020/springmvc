<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Delay Rerender & Preview - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Delay Rerender & Preview</h1>
                <p>P.S. If you input the content too much and too fast, You can setting the delay value. </p>
                <p>P.S. 适用于输入内容太多太快的情形，但要是一个合理的值，不然会显得预览太慢。打字慢会相对显得慢，打字快时则相对显得快。</p>
            </header>
            <div id="test-editormd">
                <textarea style="display:none;">#### Setting

    {
        delay : 300 // Uint : ms, default value is 300, and this example is set value 1000
    }


</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
			var testEditor;

            $(function() {
                
                $.get("test.md", function(md) {
                    testEditor = editormd("test-editormd", {
                        width              : "90%",
                        height             : 640,
                        path               : "../lib/",
                        delay              : 1000,
                        appendMarkdown     : md,
                        codeFold           : true,
                        saveHTMLToTextarea : true,
                        searchReplace      : true,
                        htmlDecode         : "style,script,iframe",
                        emoji              : true,
                        taskList           : true,
                        tex                : true,
                        flowChart          : true,
                        sequenceDiagram    : true
                    });
                });
            });
        </script>
    </body>
</html>