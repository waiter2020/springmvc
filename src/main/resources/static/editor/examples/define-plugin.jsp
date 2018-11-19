<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Define extention plugins for Editor.md - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Define extention plugins for Editor.md</h1> 
            </header>
            <div id="test-editormd">                
                <textarea style="display:none;">[TOC]

### Define plugin

#### Plugin directory

    editor.md/
        plugins/
            plugin-name/
                ....

#### Example

```javascript
(function() {

    var factory = function (exports) {

		var $ = jQuery;           // if using module loader(Require.js/Sea.js).

		exports.customMethod = function() {
		    //....
		};

		exports.fn.youPluginName = function() {
		    /*
			var _this       = this; // this == the current instance object of Editor.md
			var lang        = this.lang;
			var settings    = this.settings;
			var editor      = this.editor;
			var cursor      = cm.getCursor();
			var selection   = cm.getSelection();

			cm.focus();
            */

			//....
		};

	};

	// CommonJS/Node.js
	if (typeof require === "function" && typeof exports === "object" && typeof module === "object")
    {
        module.exports = factory;
    }
	else if (typeof define === "function")  // AMD/CMD/Sea.js
    {
		if (define.amd) { // for Require.js

			define(["editormd"], function(editormd) {
                factory(editormd);
            });

		} else { // for Sea.js
			define(function(require) {
                var editormd = require("./../../editormd");
                factory(editormd);
            });
		}
	} 
	else
	{
        factory(window.editormd);
	}

})();
```

#### Usage plugin

```html
&lt;script src="../plugins/you-plugin-name/you-plugin-name.js"&gt;&lt;/script&gt;
&lt;script&gt;
    editormd.customMethod();

    var testEditor = editormd("test-editormd", {
        path   : '../lib/',
        onload : function() {
            this.youPluginName();
            this.pluginA();
            this.executePlugin("somePluginName", "you-plugin-name/you-plugin-name"); // load and execute plugin
        }
    });

    // or
    $("#btn").click(function(){
        testEditor.youPluginName();
    });
&lt;/script&gt;
```
</textarea>
            </div>
        </div>        
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            var testEditor;
            
            editormd.fn.customMethod = function() {
                console.log("customMethod", this);
            };
            
            editormd.fn.pluginA = function() {
                console.log("pluginA", this);
            };
            
            $(function() {
                editormd.methodOne = function(){
                    console.log("editormd.methodOne");
                };
                
                editormd.loadPlugin("../plugins/test-plugin/test-plugin", function(){
                    editormd.testPlugin();
                });
                
                editormd.loadPlugin("../plugins/image-dialog/image-dialog", function(){
                
                    testEditor = editormd("test-editormd", {
                        width  : "90%",
                        height : 720,
                        path   : '../lib/',
                        onload : function() {
                            this.customMethod();
                            testEditor.imageDialog();
                            this.executePlugin("htmlEntitiesDialog", "html-entities-dialog/html-entities-dialog"); // load and execute plugin
                            this.pluginA();
                        }
                    }); // execute plugin
                });
                
                editormd.methodOne();
            });
        </script>
    </body>
</html>