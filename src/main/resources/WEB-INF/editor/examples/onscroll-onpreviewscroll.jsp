<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Onscroll / Onpreviewscroll - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Onscroll / Onpreviewscroll event handle</h1>
                <p>Plaese press F12, open the develop tools.</p>     
            </header>
            <div id="test-editormd">                
                <textarea style="display:none;">#### Settings

```javascript
{
    onscroll : function(event) {
        // console.clear();
        // console.log("onscroll =>", this, this.id, this.settings, event);
        // ...
    },

    onpreviewscroll : function(event) {
        // console.clear();
        // console.log("onpreviewscroll =>", this, this.id, this.settings, event);
        // ...
    }
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
                $.get("./test.md", function(md){
                    testEditor = editormd("test-editormd", {
                        width  : "90%",
                        height : 720,
                        appendMarkdown : md,
                        path   : '../lib/',
                        onscroll : function(event) {
                            console.clear();
                            console.log("onscroll =>", this, this.id, this.settings, event);
                        },
                        onpreviewscroll : function(event) {
                            console.clear();
                            console.log("onpreviewscroll =>", this, this.id, this.settings, event);
                        }
                    });
                });
            });
        </script>
    </body>
</html>