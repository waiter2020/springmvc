<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>自定义工具栏 - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>自定义工具栏</h1> 
                <p>Custom toolbar (icons handler)</p>   
            </header>
            <div id="test-editormd">
                <textarea style="display:none;">### Custom toolbar

```javascript
$(function() {
    var testEditor = editormd("test-editormd", {
        width: "90%",
        height: 640,
        path : '../lib/',
        toolbarIcons : function() {
            // Or return editormd.toolbarModes[name]; // full, simple, mini
            // Using "||" set icons align right.
            return ["undo", "redo", "|", "bold", "hr", "|", "preview", "watch", "|", "fullscreen", "info", "testIcon", "testIcon2", "file", "faicon", "||", "watch", "fullscreen", "preview", "testIcon"]
        },
        toolbarIconsClass : {
            testIcon : "fa-gears"  // 指定一个FontAawsome的图标类
        },
        toolbarIconTexts : {
            testIcon2 : "测试按钮"  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
        },

        // 用于增加自定义工具栏的功能，可以直接插入HTML标签，不使用默认的元素创建图标
        toolbarCustomIcons : {
            file   : "&lt;input type="file" accept=".md" /&gt;",
            faicon : "&lt;i class="fa fa-star" onclick="alert('faicon');"&gt;&lt;/i&gt;"
        },

        // 自定义工具栏按钮的事件处理
        toolbarHandlers : {
            /**
             * @param {Object}      cm         CodeMirror对象
             * @param {Object}      icon       图标按钮jQuery元素对象
             * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
             * @param {String}      selection  编辑器选中的文本
             */
            testIcon : function(cm, icon, cursor, selection) {

                //var cursor    = cm.getCursor();     //获取当前光标对象，同cursor参数
                //var selection = cm.getSelection();  //获取当前选中的文本，同selection参数

                // 替换选中文本，如果没有选中文本，则直接插入
                cm.replaceSelection("[" + selection + ":testIcon]");

                // 如果当前没有选中的文本，将光标移到要输入的位置
                if(selection === "") {
                    cm.setCursor(cursor.line, cursor.ch + 1);
                }

                // this == 当前editormd实例
                console.log("testIcon =>", this, cm, icon, cursor, selection);
            },

            testIcon2 : function(cm, icon, cursor, selection) {
                cm.replaceSelection("[" + selection + ":testIcon2](" + icon.html() + ")");
                console.log("testIcon2 =>", this, icon.html());
            }
        },

        lang : {
            toolbar : {
                file : "上传文件",
                testIcon : "自定义按钮testIcon",  // 自定义按钮的提示文本，即title属性
                testIcon2 : "自定义按钮testIcon2",  
                undo : "撤销 (Ctrl+Z)"
            }
        },

        onload : function(){
            $("[type=\"file\"]").bind("change", function(){
                alert($(this).val());
                testEditor.cm.replaceSelection($(this).val());
                console.log($(this).val(), testEditor);
            });
        }
    });
});
```
</textarea>
            </div>
        </div>
        
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script> 
        <!-- 多语言和自定义工具栏的整合测试 -->
        <script src="../languages/en.js"></script>   
        <script type="text/javascript">
            $(function() {
                var testEditor = editormd("test-editormd", {
                    width: "90%",
                    height: 640,
                    path : '../lib/',
                    watch : false,
                    toolbarIcons : function() {
                        // Or return editormd.toolbarModes[name]; // full, simple, mini
                        // Using "||" set icons align right.
                        return ["undo", "redo", "|", "bold", "hr", "|", "preview", "watch", "|", "fullscreen", "info", "testIcon", "testIcon2", "file", "faicon", "||", "watch", "fullscreen", "preview", "testIcon", "file"]
                    },
                    // toolbarIcons : "full", // You can also use editormd.toolbarModes[name] default list, values: full, simple, mini.
                    toolbarIconsClass : {
                        testIcon : "fa-gears"  // 指定一个FontAawsome的图标类
                    },
                    toolbarIconTexts : {
                        testIcon2 : "测试按钮Test button"  // 如果没有图标，则可以这样直接插入内容，可以是字符串或HTML标签
                    },
                    
                    // 用于增加自定义工具栏的功能，可以直接插入HTML标签，不使用默认的元素创建图标
                    toolbarCustomIcons : {
                        file   : "<input type=\"file\" accept=\".md\" />",
                        faicon : "<i class=\"fa fa-star\" onclick=\"alert('faicon');\"></i>"
                    },

                    // 自定义工具栏按钮的事件处理
                    toolbarHandlers : {
                        /**
                         * @param {Object}      cm         CodeMirror对象
                         * @param {Object}      icon       图标按钮jQuery元素对象
                         * @param {Object}      cursor     CodeMirror的光标对象，可获取光标所在行和位置
                         * @param {String}      selection  编辑器选中的文本
                         */
                        testIcon : function(cm, icon, cursor, selection) {
                            
                            //var cursor    = cm.getCursor();     //获取当前光标对象，同cursor参数
                            //var selection = cm.getSelection();  //获取当前选中的文本，同selection参数
                            
                            // 替换选中文本，如果没有选中文本，则直接插入
                            cm.replaceSelection("[" + selection + ":testIcon]");
                            
                            // 如果当前没有选中的文本，将光标移到要输入的位置
                            if(selection === "") {
                                cm.setCursor(cursor.line, cursor.ch + 1);
                            }
                            
                            // this == 当前editormd实例
                            console.log("testIcon =>", this, cm, icon, cursor, selection);
                        },
                        
                        testIcon2 : function(cm, icon, cursor, selection) {
                            cm.replaceSelection("[" + selection + ":testIcon2](" + icon.html() + ")");
                            console.log("testIcon2 =>", this, icon.html());
                        }
                    },
                    
                    lang : {
                        toolbar : {
                            file : "上传文件",
                            testIcon : "自定义按钮testIcon",  // 自定义按钮的提示文本，即title属性
                            testIcon2 : "自定义按钮testIcon2",  
                            undo : "撤销 (Ctrl+Z)"
                        }
                    },

                    onload : function(){
                        $("[type=\"file\"]").bind("change", function(){
                            alert($(this).val());
                            testEditor.cm.replaceSelection($(this).val());
                            console.log($(this).val(), testEditor);
                        });
                    }
                });
            });
        </script>
    </body>
</html>