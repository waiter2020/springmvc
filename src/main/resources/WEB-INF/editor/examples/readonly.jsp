<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Read only mode - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>只读模式</h1> 
                <p>Read only mode</p> 
            </header>
            <div class="btns">
                <button id="watch-btn">Enable watch</button>
                <button id="unwatch-btn">Disable watch</button>
            </div>
            <div id="test-editormd" class="editormd-onlyread">   
                <textarea style="display:none;">#### Setting

```javascript
{
    readOnly        : true,
    //styleActiveLine : false,       // disable active line
    //watch           : false,       // disable watch
    //lineNumbers     : false        // hide line numbers
}
```
</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>   
        <script type="text/javascript">
			var testEditor;

            $(function() {
                testEditor = editormd("test-editormd", {
                    width           : "90%",
                    height          : 540,
                    path            : "../lib/",
                    //watch           : false,           // disable watch
                    readOnly        : true,
                    styleActiveLine : false,   // disable active line
                    //lineNumbers     : false      // hide line numbers
                });
                
                $("#watch-btn").click(function(){
                    testEditor.watch();
                });
                
                $("#unwatch-btn").click(function(){
                    testEditor.unwatch();
                });
            });
        </script>
    </body>
</html>