<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>多语言支持 - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>多语言支持（l18n）</h1> 
                <p>multi-languages for l18n.
                    <select id="lang-select">
                        <option selected="selected">Languages</option>
                        <option value="en">English (en)</option>
                        <option value="zh-tw">繁體中文 (zh-tw)</option>
                        <option value="zh-cn">简体中文 (zh-cn)</option>
                    </select>
                </p>
            </header>
            <div id="test-editormd">
                <textarea style="display:none;">###多语言支持（l18n）

目前支持三种语言：简体中文、繁體中文、English，默认为简体中文 (zh-cn default)。

```html
&lt;!-- English --&gt;
&lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

&lt;!-- 繁體中文 --&gt;
&lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
```
</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <!--<script src="../languages/en.js"></script>
        <script src="../languages/zh-tw.js"></script> -->
        <script type="text/javascript">
            var testEditor;
            
            $(function() {
                testEditor = editormd("test-editormd", {
                    width: "90%",
                    height: 640,
                    emoji : true,
                    path : '../lib/'
                });
                
                //console.log(editormd.defaults.lang); 
                var lang = "zh-cn";
                
                // 动态加载语言包
                // Dynamic load language package
                $("#lang-select").change(function() {
                    var value = $(this).val();
                    var path  = "../languages/";
                    
                    if (value == "zh-cn") 
                    {
                        location.reload();
                    } 
                    else
                    {                    
                        editormd.loadScript(path + value, function() {
                            testEditor.lang = editormd.defaults.lang;
                            
                            // 只重建涉及语言包的部分，如工具栏、弹出对话框等
                            testEditor.recreate();                
                                    
                            // 整个编辑器重建，预览HTML会重新生成，出现闪动
                            //testEditor = editormd("test-editormd", {
                                //width: "90%",
                                //height: 640,
                                //path : '../lib/'
                            //});

                            lang = value;
                            console.log(lang, value, editormd.defaults.lang);                        
                        });
                    }
                });
            });
        </script>
    </body>
</html>