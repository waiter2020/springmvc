<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>动态创建 Editor.md - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>动态创建 Editor.md</h1>
                <p>Dynamic create Editor.md</p>
                <br/>
                <div class="btns" style="margin:0;">
                    <button id="create-btn">动态创建一个 Editor.md</button>
                    <button id="remove-btn">移除 Editor.md</button>
                </div>
            </header>
        </div>
        
        <script src="js/jquery.min.js"></script> 
        <script type="text/javascript">
            var testEditormd;
            
            $(function() {                
                $("#create-btn").click(function(){                    
					$.getScript("../editormd.js", function() {
                        $("#layout").append("<div id=\"test-editormd\"></div>");
                        
                        testEditormd = editormd("test-editormd", {
                            width: "90%",
                            height: 640,
                            markdown : "### 动态创建 Editor.md\r\n\r\nDynamic create Editor.md",
                            path : '../lib/'
                        });
					});
                });  
                
                $("#remove-btn").click(function() {
                    testEditormd.editor.remove();
                });
            });
        </script>
    </body>
</html>