<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Sync scrolling - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Sync scrolling</h1>
            </header>
            <div class="btns">
                <button class="bisync-btn">Bisynchronous (Default)</button>
                <button class="single-btn">Single</button>
                <button class="disabled-btn">Disabled</button>
            </div>
            <div id="test-editormd">
                <textarea style="display:none;">[TOC]

#### Setting

config:

```javascript
{
    // true -> bisync, false -> disabled, "single" -> Only editor area sync
    syncScrolling : true | false | "single"
}
```

function:

```javascript
editor.config("syncScrolling", true);
//editor.config("syncScrolling", false);
//editor.config("syncScrolling", "single");
```
</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.min.js"></script>
        <script type="text/javascript">
			var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width   : "90%",
                    height  : 360,
                    path    : "../lib/"
                });
                
                $(".bisync-btn").click(function(){
                    testEditor.config("syncScrolling", true);
                });
                
                $(".single-btn").click(function(){
                    testEditor.config("syncScrolling", "single");
                });
                
                $(".disabled-btn").click(function(){
                    testEditor.config("syncScrolling", false);
                });
            });
        </script>
    </body>
</html>