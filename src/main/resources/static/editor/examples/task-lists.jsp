<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Github Flavored Markdown task lists - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Github Flavored Markdown task lists</h1>    
            </header>
            <div id="test-editormd">                
                <textarea style="display:none;">### Setting

    {
        taskList : true
    }

### Examples

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported;
- [x] list syntax required (any unordered or ordered list supported);
- [x] this is a complete item;
- [ ] this is an incomplete item [test link](#);
- [ ] this is an incomplete item;
    - [ ] this is an incomplete item [test link](#);
    - [ ] this is an incomplete item [test link](#);
- [x] list syntax required (any unordered or ordered list supported);
- [x] this is a complete item;
- [ ] this is an incomplete item [test link](#);
- [ ] this is an incomplete item;
    - [ ] this is an incomplete item [test link](#);
- [x] list syntax required (any unordered or ordered list supported);
- [x] this is a complete item;
- [ ] this is an incomplete item [test link](#);
- [ ] this is an incomplete item;
    - [ ] this is an incomplete item [test link](#);
    - [ ] this is an incomplete item [test link](#);

> Github Flavored Markdown task lists
</textarea>
            </div>
        </div>        
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            var testEditor;
            
            $(function() {         
                testEditor = editormd("test-editormd", {
                    width  : "90%",
                    height : 720,
                    taskList : true,
                    path   : '../lib/',
                    htmlDebode : true,
                    onload : function() {
                    }
                });
            });
        </script>
    </body>
</html>