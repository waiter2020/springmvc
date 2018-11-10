<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Onwatch / Onunwatch - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Onwatch / Onunwatch event handle</h1>
                <p>Plaese press F12, open the develop tools.</p>     
            </header>
            <div id="test-editormd">                
                <textarea style="display:none;">#### Settings

```javascript
{
    onwatch : function() {
        // console.log("onwatch =>", this, this.id, this.settings);
    },

    onunwatch : function() {
        // console.log("onunwatch =>", this, this.id, this.settings);
    }
}
```
</textarea>
            </div>
        </div>        
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            $(function() {
                var testEditor = editormd("test-editormd", {
                    width  : "90%",
                    height : 720,
                    path   : '../lib/',
                    onwatch : function() {
                        console.log("onwatch =>", this, this.id, this.settings);
                    },
                    onunwatch : function() {
                        console.log("onunwatch =>", this, this.id, this.settings);
                    }
                });
            });
        </script>
    </body>
</html>