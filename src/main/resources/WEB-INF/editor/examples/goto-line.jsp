<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Goto line - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />   
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />     
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Goto line</h1>   
            </header>
            <div class="btns">
                <button id="goto-line-btn">Goto line 90</button>
                <button id="goto-line-150-btn">Goto line 150</button>
                <button id="goto-line-240-btn">Goto line 240</button>
                <button id="goto-line-300-btn">Goto line 300</button>
                <button id="goto-line-400-btn">Goto line 400</button>
                <button id="goto-first-line-btn">Goto first line</button>
                <button id="goto-last-line-btn">Goto last line</button>
            </div>
            <div id="test-editormd"></div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            var testEditor;
            
            $(function() {
                
                $.get("test.md", function(md){
                    testEditor = editormd("test-editormd", {
                        width           : "90%",
                        height          : 740,
                        path            : "../lib/",
                        markdown        : md,
                        codeFold        : true,
                        htmlDecode      : "style,script,iframe",
                        tex             : true,
                        emoji           : true,
                        taskList        : true,
                        flowChart       : true,
                        sequenceDiagram : true,
                        //gotoLine        : false  // disabled
                    });
                });
                
                $("#goto-line-btn").bind("click", function(){
                    testEditor.gotoLine(90);
                });
                
                $("#goto-line-150-btn").bind("click", function(){
                    testEditor.gotoLine(150);
                });
                
                $("#goto-line-240-btn").bind("click", function(){
                    testEditor.gotoLine(240);
                });
                
                $("#goto-line-300-btn").bind("click", function(){
                    testEditor.gotoLine(300);
                });
                
                $("#goto-line-400-btn").bind("click", function(){
                    testEditor.gotoLine(400);
                });
                
                $("#goto-first-line-btn").bind("click", function(){
                    testEditor.gotoLine("first");
                    // or
                    //testEditor.gotoLine(1);
                });
                
                $("#goto-last-line-btn").bind("click", function(){
                    testEditor.gotoLine("last");
                    // or
                    //testEditor.gotoLine(testEditor.cm.lineCount());
                });
            });
        </script>
    </body>
</html>