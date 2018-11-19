<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>插入字符 / 设置和获取光标位置 / 设置、获取和替换选中的文本 - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>插入字符 / 设置和获取光标位置 / 设置、获取和替换选中的文本</h1> 
                <p>Insert value & Set / Get cursor & Set / Get / Replace selection</p> 
                <br/>
                <div class="btns" style="margin:0">
                    <button id="btn1">设置光标位置 (line:1, ch:2)</button>
                    <button id="btn2">获取光标位置</button>
                    <button id="btn3">设置选中文本 ({line:1, ch:0}, {line:5, ch:100})</button>
                    <button id="btn4">获取选中文本</button>
                    <button id="btn5">替换选中文本为 "$$$$$$$$$"</button>
                    <button id="btn6">在光标处插入 "????"</button>                    
                </div>
            </header>
            <div id="test-editormd">  
                <textarea style="display:none;">### Examples

```javascript
var testEditormd;

$(function() {
    testEditormd = editormd("test-editormd", {
        width: "90%",
        height: 640,
        path : '../lib/'
    });
});

$("#btn1").click(function(){
    testEditormd.setCursor({line:1, ch:2});
});

$("#btn2").click(function(){
    console.log("getCursor =>", testEditormd.getCursor());
});

$("#btn3").click(function(){
    testEditormd.setSelection({line:1, ch:0}, {line:5, ch:100});
});

$("#btn4").click(function(){
    console.log("getSelection =>", testEditormd.getSelection());
});

$("#btn5").click(function(){
    testEditormd.replaceSelection("$$$$$$$$$");
});

$("#btn6").click(function(){
    testEditormd.insertValue("????");
});
```
</textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>   
        <script type="text/javascript">
			var testEditormd;

            $(function() {
                testEditormd = editormd("test-editormd", {
                    width: "90%",
                    height: 640,
                    path : '../lib/'
                });
                
                $("#btn1").click(function(){
                    testEditormd.setCursor({line:1, ch:2});
                    testEditormd.focus();
                });
                
                $("#btn2").click(function(){
                    console.log("getCursor =>", testEditormd.getCursor());
                    testEditormd.focus();
                });
                
                $("#btn3").click(function(){
                    testEditormd.setSelection({line:1, ch:0}, {line:5, ch:100});
                    testEditormd.focus();
                });
                
                $("#btn4").click(function(){
                    console.log("getSelection =>", testEditormd.getSelection());
                    testEditormd.focus();
                });
                
                $("#btn5").click(function(){
                    testEditormd.replaceSelection("$$$$$$$$$");
                    testEditormd.focus();
                });
                
                $("#btn6").click(function(){
                    testEditormd.insertValue("????");
                    testEditormd.focus();
                });
            });
        </script>
    </body>
</html>