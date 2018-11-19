<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Page break - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Page break</h1>
            </header>
            <div class="btns">
                <button id="print-btn">Print Test</button>
                <button id="disabled-btn">Disabled</button>
                <button id="enabled-btn">Enabled</button>
            </div>
            <div id="test-editormd">
                <textarea style="display:none;">#### Syntax

    [At least 8 equals]

    [========]

#### Disabled

    {
        pageBreak : false
    }

#### Examples

[========]

> page start

#### Editor.md directory

    editor.md/
            lib/
            css/
            scss/
            tests/
            fonts/
            images/
            plugins/
            examples/
            languages/
            editormd.js
            ...

> page end
</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
			var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width   : "90%",
                    height  : 720,
                    path    : "../lib/"
                });
                
                $("#print-btn").click(function(){
                    var html = testEditor.preview.html();
                    
                    document.write('<link rel="stylesheet" href="css/style.css" /><link rel="stylesheet" href="../css/editormd.css" />' + html);
                    window.print();
                });
                
                $("#disabled-btn").click(function(){
                    testEditor.config("pageBreak", false);
                });
                
                $("#enabled-btn").click(function(){
                    testEditor.config("pageBreak", true);
                });
            });
        </script>
    </body>
</html>