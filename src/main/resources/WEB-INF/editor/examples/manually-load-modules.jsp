<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Manually load modules - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>手动加载模式 Manually load modules</h1>
                <p>在这种模式下，可以同步使用 Editor.md 实例的成员方法。</p>            
            </header>
            <div id="test-editormd">                
                <textarea style="display:none;">#### Manually load modules exmaple

```html
&lt;script src="js/jquery.min.js"&gt;&lt;/script&gt;
&lt;link rel="stylesheet" href="../lib/codemirror/codemirror.min.css" /&gt;        
&lt;link rel="stylesheet" href="../lib/codemirror/addon/dialog/dialog.css" /&gt; 
&lt;link rel="stylesheet" href="../lib/codemirror/addon/search/matchesonscrollbar.css" /&gt; 
&lt;script src="../lib/codemirror/codemirror.min.js"&gt;&lt;/script&gt;

&lt;!-- Or, You can also one by one load CodeMirror modes & addons. --&gt;
&lt;script src="../lib/codemirror/addons.min.js"&gt;&lt;/script&gt;
&lt;script src="../lib/codemirror/modes.min.js"&gt;&lt;/script&gt;

&lt;script src="../lib/marked.min.js"&gt;&lt;/script&gt;

&lt;!-- if setting previewCodeHighlight == true --&gt;
&lt;script src="../lib/prettify.min.js"&gt;&lt;/script&gt;

&lt;!-- if setting flowchart == true, or sequence-diagram == true --&gt;
&lt;script src="../lib/raphael.min.js"&gt;&lt;/script&gt;
&lt;script src="../lib/underscore.min.js"&gt;&lt;/script&gt;
&lt;script src="../lib/sequence-diagram.min.js"&gt;&lt;/script&gt;
&lt;script src="../lib/flowchart.min.js"&gt;&lt;/script&gt;
&lt;script src="../lib/jquery.flowchart.min.js"&gt;&lt;/script&gt;

<!-- if setting tex == true -->
&lt;link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/KaTeX/0.1.1/katex.min.css" /&gt;
&lt;script src="//cdnjs.cloudflare.com/ajax/libs/KaTeX/0.1.1/katex.min.js"&gt;&lt;/script&gt;

&lt;link rel="stylesheet" href="../css/editormd.css" /&gt;
&lt;script src="../editormd.js"&gt;&lt;/script&gt;
&lt;script type="text/javascript"&gt;
	$(function() {
		var testEditor = editormd("test-editormd", {
			width  : "90%",
			height : 720,
			autoLoadModules : false  // Manually load modules
		});

		testEditor.fullscreen(); // In Manually load mode, You can be synchronized using the member method.
	});
&lt;/script&gt;
```

#### KaTeX test

$$E = mc^2$$
</textarea>
            </div>
        </div>
        
        <script src="js/jquery.min.js"></script>
        <link rel="stylesheet" href="../lib/codemirror/codemirror.min.css" />        
        <link rel="stylesheet" href="../lib/codemirror/addon/dialog/dialog.css" />  
        <link rel="stylesheet" href="../lib/codemirror/addon/search/matchesonscrollbar.css" /> 
        <script src="../lib/codemirror/codemirror.min.js"></script>
        
        <!-- Or, You can also one by one load CodeMirror modes & addons. -->
        <script src="../lib/codemirror/addons.min.js"></script>
        <script src="../lib/codemirror/modes.min.js"></script>
        
        <script src="../lib/marked.min.js"></script>
        
        <!-- if setting previewCodeHighlight == true -->    
        <script src="../lib/prettify.min.js"></script>
        
        <!-- if setting flowchart == true, or sequence-diagram == true -->        
        <script src="../lib/raphael.min.js"></script>
        <script src="../lib/underscore.min.js"></script>
        <script src="../lib/sequence-diagram.min.js"></script>
        <script src="../lib/flowchart.min.js"></script>
        <script src="../lib/jquery.flowchart.min.js"></script>
        
        <!-- if setting tex == true -->
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/KaTeX/0.1.1/katex.min.css" />
        <script src="//cdnjs.cloudflare.com/ajax/libs/KaTeX/0.1.1/katex.min.js"></script>
        
        <link rel="stylesheet" href="../css/editormd.css" />
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            $(function() {
                var testEditor = editormd("test-editormd", {
                    width           : "90%",
                    height          : 720,
                    path            : "../lib/",
                    tex             : true,
                    autoLoadModules : false  // Enable manually load modules
                });

                testEditor.fullscreen(); // This can be synchronized using the member method
            });
        </script>
    </body>
</html>