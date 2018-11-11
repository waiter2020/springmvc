<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Editor.md examples</title>
        <link rel="stylesheet" href="<%=path%>/editor/examples/css/style.css" />
        <link rel="stylesheet" href="<%=path%>/editor/css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
		<style>
            #layout {
                padding-bottom: 100px;
            }
            
            #header {
                width: 100%;
                color: #fff;
                background: #2196F3;
                padding: 60px 0;
                text-align: center;
                margin-bottom: 30px;
            }
            
            a {
                color: #2196F3;
                text-decoration: none;
            }
            
            #header h1 {
                font-size: 45px; 
                font-weight: normal;
            }
            
			ul { 
				width: 90%;
                padding-bottom:30px;
				margin: 0 auto;
				list-style: none;
			}
            
            ul li {
                width: 24%;
                margin-bottom: 4px;
                display: inline-block;
            }
            
            ul li a {
                color: #2196F3;
                display: block;
                padding: 4px 15px;
                font-size: 14px;
                text-align: left;
                text-decoration: none;
                -webkit-transition: all 300ms ease-out;
                transition: all 300ms ease-out;
            }
            
            ul li a span {
                color: #999;
                display: block;
                padding-top: 3px;
                font-size: 80%;
            }
            
            ul li a:hover {
                color: #fff;
                background: #2196F3;
                border-radius: 8px;
            }
            
            ul li a:hover span {
                color: #fff;
            }
            
            .category, .footer {
				width: 90%;
                padding: 15px;
                font-size: 18px;
				margin: 15px auto 20px;
                border-bottom: 1px solid #eee;
            }
            
            .footer {
                border: none;
                border-top: 1px solid #eee;
                font-size: 12px;
                margin-top: 30px;
                padding-top: 35px;
                text-align: right;                
            }
            
            .menu {
                margin-top: 20px;
                text-align: center;
            }
            
            .menu a {
                color: #fff;
                display: inline-block;
                text-decoration: none;
                padding: 8px 15px;
                border-radius: 5px;
                -webkit-transition: background-color 300ms ease-out;
                transition: background-color 300ms ease-out;
            }
            .menu a:hover {
                background-color: #1A8BE8;
            }
            
            [href="#top"] {
                color: #999;
                float: right;
                padding-top: 10px;
                display: block;
                text-decoration: none;
                font-size: 12px;
                font-weight: normal;
            }
            
            [href="#top"] .fa {
                margin-left: 8px;
                font-size: 1.4em;
            }
		</style>
    </head>
    <body>
        <a name="top"></a>
        <div id="layout">
            <div id="header">
                <h1><i class="editormd-logo editormd-logo-3x"></i></h1>
                <h1>Editor.md Examples</h1>
                <p>Open source online markdown editor.</p>
                <div class="menu">
                    <a href="#basic">Basic</a>
                    <a href="#customs">自定义 Customs</a>
                    <a href="#markdown-extras">Markdown Extras</a>
                    <a href="#image-upload">Image Upload</a>
                    <a href="#events">事件处理 Events handle</a>
                </div>
            </div>
			<h1 class="category"><a name="basic"></a>Basic</h1>
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/simple.jsp">简单示例 <span>Simple example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/full.jsp">完整示例 <span>Full example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/use-requirejs.jsp">使用 Require.js <span>Using Require.js</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/use-seajs.jsp">使用 Sea.js <span>Using Seajs</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/use-zepto.jsp">使用 Zepto.js <span>Using Zepto.js</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/form-get-value.jsp">表单取值 <span>Get textarea value in form</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/html-preview-markdown-to-html.jsp">非编辑时 Markdown 转 HTML 的显示处理 <span>Markdown to HTML for preview</span></a>
				</li>
			</ul>
			<h1 class="category">
			    <a href="#top">TOP<i class="fa fa-angle-up"></i></a>
			    <a name="customs"></a>自定义 Customs
			</h1>
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/custom-toolbar.html">自定义工具栏 <span>Custom toolbar</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/multi-languages.html">多语言 <span>Multi-languages for l18n</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/auto-height.html">自动高度 <span>Auto height</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/toolbar-auto-fixed.html">工具栏自动固定定位的开启与禁用 <span>Enable / disable toolbar auto fixed position.</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/dynamic-create-editormd.html">动态创建 Editor.md <span>Dynamic create Editor.md</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/delay-renderer-preview.html">延迟解析和预览 <span>Delay Rerender & Preview</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/multi-editormd.html">多个 Editor.md 并存 <span>Multi Editor.md</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/goto-line.html">跳转到指定的行 <span>Goto line</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/readonly.html">只读模式 <span>Read only mode</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/themes.html">自定义编辑器样式主题 <span>Setting / change editor style theme</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/search-replace.html">搜索替换功能 <span>Search / Replace</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/code-fold.html">代码折叠功能 <span>Code fold</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/custom-keyboard-shortcuts.html">自定义键盘快捷键 <span>Custom keyboard shortcuts</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/define-plugin.html">自定义插件 <span>Define extention plugins for Editor.md</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/manually-load-modules.html">手动加载依赖模块文件 <span>Manually loading dependent module files.</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/sync-scrolling.html">双向、单向或禁用同步滚动 <span>Bisync, Single, Disabled sync scrolling</span></a>
				<li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/external-use.html">外部使用工具栏的操作方法和对话框 <span>External use of toolbar handlers / modal dialog</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/resettings.html">加载完成且创建成功之后的重配置 <span>loaded resettings</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/change-mode.html">变身为代码编辑器 <span>Change mode become to the code editor</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/set-get-replace-selection.html">插入字符 / 设置和获取光标位置 / 设置、获取和替换选中的文本 <span>Insert value & Set / Get cursor & Set / Get / Replace selection</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/extends.html">扩展成员方法和属性 <span>Expanded of member methods and properties</span></a>
				</li>
            </ul>
			<h1 class="category">
			    <a href="#top">TOP<i class="fa fa-angle-up"></i></a>
			    <a name="markdown-extras"></a>Markdown Extras
			</h1>
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/html-tags-decode.jsp">识别和（过滤）解析 HTML 标签 <span>HTML tags (fliter) decode</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/toc.html">自动生成目录(下拉菜单) ToC / ToCM <span>Table of Contents (ToC)</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/task-lists.html">GFM 任务列表 <span>Github Flavored Markdown (GFM) Task Lists</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/@links.html">@链接 <span>@links</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/emoji.html">Emoji / Twemoji 表情 / Font Awesome 图标 <span>Emoji / Twemoji / Font Awesome icons</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/katex.html">科学公式 TeX <span>TeX / LaTeX (Based on KaTeX)</span> </a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/flowchart.html">流程图 <span>FlowChart example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/sequence-diagram.html">时序图 / 序列图 <span>Sequence Diagram example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/page-break.html">分页符 <span>Page break</span></a>
				</li>
            </ul>
			<h1 class="category">
			    <a href="#top">TOP<i class="fa fa-angle-up"></i></a>
			    <a name="image-upload"></a>Image Upload
			</h1>
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/image-upload.html">图片上传 <span>Image upload</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/image-cross-domain-upload.html">图片跨域上传 <span>Image cross-domain upload</span></a>
				</li>
            </ul>
			<h1 class="category">
			    <a href="#top">TOP<i class="fa fa-angle-up"></i></a>
			    <a name="events"></a>事件处理 Events handle
			</h1>
			<ul>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/on-off.html">事件注册和解除方法 <span>On / Off (bind/unbind) event handle</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/onload.html">加载完成事件处理 <span>Onload event handle example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/onchange.html">变化监听处理 <span>Onchange event handle example</span></a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/editor/examples/onfullscreen.html">全屏事件处理 <span>Onfullscreen / onfullscreenExit event handle example</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/onresize.html">Onresize<span>Onresize event handle</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/onpreviewing-onpreviewed.html">Onpreviewing / Onpreviewed<span>Onpreviewing / Onpreviewed event handle</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/onwatch-onunwatch.html">Onwatch / Onunwatch<span>Onwatch / Onunwatch event handle</span></a>
				</li>
				<li>
				    <a href="${pageContext.request.contextPath}/editor/examples/onscroll-onpreviewscroll.html">Onscroll / Onpreviewscroll<span>Onscroll / Onpreviewscroll event handle</span></a>
				</li>
			</ul>
            <div class="clear"></div>
            <div class="footer">
                <p>
                    <a href="https://pandao.github.io/editor.md/" target="_blank" title="Editor.md">
                        <img src="https://pandao.github.io/editor.md/images/logos/editormd-logo-64x64.png"/>
                    </a>
                </p>
                <p>Copyright &copy; 2015 <a href="https://pandao.github.io/editor.md/" target="_blank" title="Editor.md">Editor.md</a></p>
                <p>Open source online markdown editor. <a href="https://github.com/pandao/editor.md" class="fa fa-github fa-lg" target="_blank" title="Editor.md in Github"></a></p>
                <p>The <a href="https://github.com/pandao/editor.md/blob/master/LICENSE" target="_blank">MIT</a> license</p>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/editor/examples/js/jquery.min.js"></script>
        <script>
            var clickOrTouch = function(touchType) {
                touchType = touchType || "touchend";
                var eventType = "click";

                try {
                    document.createEvent("TouchEvent");
                    eventType = touchType;
                } catch(e) {}

                return eventType;
            };
            
            $(function() {
        
                $("a[href*=#]").bind(clickOrTouch(), function() {
                    if (location.pathname.replace(/^\//, "") == this.pathname.replace(/^\//, "") && location.hostname == this.hostname) 
                    {
                        var hash   = this.hash;
                        var target = $(hash);
                        target     = target.length && target || $("[name=" + hash.slice(1) + "]");

                        if (target.length) 
                        {                            
                            $("html, body").animate({
                                scrollTop: target.offset().top
                            }, 800);

                            return false;
                        }
                    }
                });
            });
        </script>
    </body>
</html>