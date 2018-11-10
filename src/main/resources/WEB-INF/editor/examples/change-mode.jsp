<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Chnage mode - Editor.md examples</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="../css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
        <style>
            #codes textarea {display: none;}
        </style>
    </head>
    <body>
        <div id="layout">
            <header>
                <h1>Chnage mode</h1>
                <p>Become to the code editor</p>
                <p>Modes : <select id="modes">
                    <option value="">select modes</option>
                </select>&nbsp;&nbsp;Themes : 
                    <select id="themes">
                        <option selected="selected" value="">select themes</option>
                    </select>
                </p>
            </header>
            <div class="btns">
                <button id="get-code-btn">Get code source</button>
                <button id="fullscreen-btn">Fullscreen (Press F11 into, ESC exit)</button>
            </div>
            <div id="codes">
            <textarea id="html-code">&lt;!DOCTYPE html&gt;
&lt;html lang="zh"&gt;
    &lt;head&gt;
        &lt;meta charset="utf-8" /&gt;
        &lt;title&gt;Chnage mode - Editor.md examples&lt;/title&gt;
        &lt;link rel="stylesheet" href="css/style.css" /&gt;
        &lt;link rel="stylesheet" href="../css/editormd.css" /&gt;
        &lt;link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" /&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;div id="layout"&gt;
            &lt;header&gt;
                &lt;h1&gt;Chnage mode&lt;/h1&gt;
            &lt;/header&gt;
            &lt;div id="test-editormd"&gt;
                &lt;textarea style="display:none;"&gt;&lt;/textarea&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;script src="js/jquery.min.js"&gt;&lt;/script&gt;
        &lt;script src="../editormd.js"&gt;&lt;/script&gt;
        &lt;script type="text/javascript"&gt;
            $(function() {
                var testEditor = editormd("test-editormd", {
                    width            : "90%",
                    height           : 720,
                    watch            : false,
                    toolbar          : false,
                    codeFold         : true,
                    searchReplace    : true,
                    placeholder      : "Enjoy coding!",
                    value            : (localStorage.mode) ? $("#"+localStorage.mode.replace("text/", "")+"-code").val() : $("#html-code").val(),
                    theme            : (localStorage.theme) ? localStorage.theme : "default",
                    mode             : (localStorage.mode) ? localStorage.mode : "text/html",
                    path             : '../lib/'
                });
            });
        &lt;/script&gt;
    &lt;/body&gt;
&lt;/html&gt;</textarea>
<textarea id="javascript-code">$(function() {
    var testEditor = editormd("test-editormd", {
        width            : "90%",
        height           : 720,
        watch            : false,
        toolbar          : false,
        codeFold         : true,
        searchReplace    : true,
        placeholder      : "Enjoy coding!",
        value            : (localStorage.mode) ? $("#"+localStorage.mode.replace("text/", "")+"-code").val() : $("#html-code").val(),
        theme            : (localStorage.theme) ? localStorage.theme : "default",
        mode             : (localStorage.mode) ? localStorage.mode : "text/html",
        path             : '../lib/'
    });
});</textarea>
<textarea id="xml-code">&lt;?xml version="1.0" encoding="utf-8" ?&gt;
&lt;root&gt;
	&lt;photo url="https://pandao.github.io/editor.md/examples/images/7.jpg"&gt;
		&lt;title&gt;李健首张专辑《似水流年》封面&lt;/title&gt;
		&lt;width&gt;360&lt;/width&gt;
		&lt;height&gt;360&lt;/height&gt;
	&lt;/photo&gt;
	&lt;photo url="https://pandao.github.io/editor.md/examples/images/7.jpg"&gt;
		&lt;title&gt;李健首张专辑《似水流年》封面&lt;/title&gt;
		&lt;width&gt;360&lt;/width&gt;
		&lt;height&gt;360&lt;/height&gt;
	&lt;/photo&gt;
	&lt;photo url="https://pandao.github.io/editor.md/examples/images/7.jpg"&gt;
		&lt;title&gt;李健首张专辑《似水流年》封面&lt;/title&gt;
		&lt;width&gt;360&lt;/width&gt;
		&lt;height&gt;360&lt;/height&gt;
	&lt;/photo&gt;
&lt;/root&gt;</textarea>
<textarea id="ruby-code">#!/usr/bin/ruby

puts "Hello World!";
 
# Ruby knows what you
# mean, even if you
# want to do math on
# an entire Array
cities  = %w[ London
              Oslo
              Paris
              Amsterdam
              Berlin ]
visited = %w[Berlin Oslo]

puts "I still need " +
     "to visit the " +
     "following cities:",
     cities - visited</textarea>
<textarea id="json-code">{
    "employees": [
        {
            "firstName" : "Bill",
            "lastName" : "Gates"
        },
        {
            "firstName" : "George",
            "lastName" : "Bush"
        },
        {
            "firstName" : "Thomas",
            "lastName" : "Carter"
        }
    ],
    "employees": [
        {
            "firstName" : "Bill",
            "lastName" : "Gates"
        },
        {
            "firstName" : "George",
            "lastName" : "Bush"
        },
        {
            "firstName" : "Thomas",
            "lastName" : "Carter"
        }
    ],
}</textarea>
<textarea id="php-code">&lt;?php
    $app = new Phalcon\Mvc\Micro();

    //Set a route with the name "show-post"
    $app->get('/blog/{year}/{title}', function ($year, $title) use ($app) {

        //.. show the post here
        return $year.$title;

    })->setName('show-post');

    $app->get('/', function () {
        echo "<h1>Welcome !</h1>";

        echo $app->url->get(array(
            'for' => 'show-post',
            'title' => 'php-is-a-great-framework',
            'year' => 2012
        ));
    });

    $app->get('/posts/{year:[0-9]+}/{title:[a-zA-Z\-]+}', function ($year, $title) {
        echo "<h1>Title: $title</h1>";
        echo "<h2>Year: $year</h2>";
    });

    //Requiring another file
    $app->get('/show/results', function () {
        require 'views/results.php';
    });

    //Returning a JSON
    $app->get('/get/some-json', function () {
        echo json_encode(array("some", "important", "data"));
    });

    //This route makes a redirection to another route
    $app->post('/old/welcome', function () use ($app) {
        $app->response->redirect("new/welcome");
    });

    $app->post('/new/welcome', function () use ($app) {
        echo 'This is the new Welcome';
    });

    /*
    //Matches if the HTTP method is POST
    $app->post('/api/products/add', "add_product");

    //Matches if the HTTP method is PUT
    $app->put('/api/products/update/{id}', "update_product");

    //Matches if the HTTP method is DELETE
    $app->put('/api/products/remove/{id}', "delete_product");

    //Matches if the HTTP method is GET or POST
    $app->map('/repos/store/refs')->via(array('GET', 'POST'));
    */

    $app->handle();
?&gt;</textarea>
<textarea id="cpp-code">#include "dialog.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Dialog w;
    w.show();

    return a.exec();
}</textarea>
<textarea id="java-code">package com.demo.blog;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

@Before(BlogInterceptor.class)
public class BlogController extends Controller {
	public void index() {
		setAttr("blogPage", Blog.me.paginate(getParaToInt(0, 1), 10));
		render("blog.html");
	}

	public void add() {
	}

	@Before(BlogValidator.class)
	public void save() {
		getModel(Blog.class).save();
		redirect("/blog");
	}

	public void edit() {
		setAttr("blog", Blog.me.findById(getParaToInt()));
	}

	@Before(BlogValidator.class)
	public void update() {
		getModel(Blog.class).update();
		redirect("/blog");
	}

	public void delete() {
		Blog.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}
</textarea>
<textarea id="actionscript-code">package com.flite
{
	import flash.net.*;
	import flash.events.*;
	import flash.display.*;

	/**
	 * @package com.flite
	 * @class   XMLLoader
	 * @author  pandao pandao@vip.qq.com
	 */

	public class XMLLoder
	{
		public var xml:XML;
		public var url:String;
		public var list:XMLList;
		public var percent:Number = 0;
		public var onload:Function;
		public var onerror:Function;
		public var onpreload:Function;
		public var onprogress:Function;

		private var loader:URLLoader;

		public function XMLLoder(url:String) : void
		{
			this.url = url;

			xml = new XML();
			xml.ignoreWhite = true;

            loader = new URLLoader();
            loader.load(new URLRequest(url));
			loader.addEventListener(Event.OPEN, preloadHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            loader.addEventListener(Event.COMPLETE, loadedHandler);
		}

		private function preloadHandler(event:Event) : void
        {
			onpreload = onpreload || new Function;
			onpreload(event);
		}

		private function errorHandler(event:IOErrorEvent) : void
		{
			onerror = onerror || new Function;
			onerror(event);
		}

		private function progressHandler(event:ProgressEvent) : void
		{
			percent = Math.round((event.bytesLoaded / event.bytesTotal) * 100);

			onprogress = onprogress || new Function;
			onprogress(event, percent);
		}

		private function loadedHandler(event:Event) : void
		{
			xml = XML(loader.data);

			onload = onload || new Function;
			onload(xml);
		}
	}

}</textarea><textarea id="perl-code">#!/usr/bin/perl
use strict;
use warnings;

print "Hello, World...\n";
</textarea>
           <textarea id="go-code">package main

import (
    "github.com/astaxie/beego"
)

type MainController struct {
    beego.Controller
}

func (this *MainController) Get() {
    this.Ctx.WriteString("hello world")
}

func main() {
    beego.Router("/", &MainController{})
    beego.Run()
}</textarea><textarea id="python-code">#!/usr/bin/env python

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()</textarea>
           <textarea id="css-code">    body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,
    th,td,hr,button,article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section {
        margin:0;padding:0;
    }

    article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary {
        display: block;
    }

    audio, canvas, video {
        display: inline-block;
    }

    body, button, input, select, textarea {
        font:12px/1.5 Tahoma, "Hiragino Sans GB", "Microsoft Yahei", Arial;
    }

    body {
        font-size:12px;
        color:#666;
        background:#fff url(../images/) no-repeat left top;
    }

    a {
        color:#444;
        text-decoration: none;
    }

    a:hover {
        color:#065BC2;
        text-decoration: none;
    }

    .clear {
        zoom:1;
    }

    .clear:after {
        content:"";
        height:0;
        visibility:hidden;
        clear:both;
        display:block;
    }

    img {
        border:none;
        vertical-align: middle;
    }

    ul {
        list-style: none;
    }</textarea></div>
            <div id="test-editormd">
                <textarea style="display:none;"></textarea>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="../editormd.js"></script>
        <script type="text/javascript">
            var testEditor;
            
            function getCodeValue() {
                return (localStorage.modeName) ? $("#"+localStorage.modeName.replace("text/", "").replace("c/c++", "cpp")+"-code").val() : $("#html-code").val();
            }
            
            $(function() {
                testEditor = editormd("test-editormd", {
                    width            : "90%",
                    height           : 720,
                    watch            : false,
                    toolbar          : false,
                    codeFold         : true,
                    searchReplace    : true,
                    placeholder      : "Enjoy coding!",
                    value            : getCodeValue(),
                    theme            : (localStorage.theme) ? localStorage.theme : "default",
                    mode             : (localStorage.mode) ? localStorage.mode : "text/html",
                    path             : '../lib/'
                });

                $("#get-code-btn").bind("click", function() {
                    alert(testEditor.getValue());
                });

                $("#fullscreen-btn").bind("click", function() {
                    testEditor.fullscreen();
                });
                
                var select = $("#themes");
                
                for (var i = 0, len = editormd.themes.length; i < len; i ++)
                {                    
                    var theme    = editormd.themes[i];
                    var selected = (localStorage.theme == theme) ? " selected=\"selected\"" : "";
                    select.append("<option value=\"" + theme + "\"" + selected + ">" + theme + "</option>");
                }
                
                select.change(function(){
                    var theme = $(this).val();
                    
                    if (theme == "")
                    {
                        alert("theme == \"\"");
                        return false;
                    }
                    
                    localStorage.theme = theme;
                    testEditor.setTheme(theme);
                });   
                
                var modesSelect = $("#modes");
                var modeNames = ["text/html", "javascript", "php", "text/xml", "text/json", "java", "actionscript", "perl", "go", "python", "c/c++", "css", "ruby"];
                var modes     = ["text/html", "javascript", "php", "text/xml", "text/json", "clike", "javascript", "perl", "go", "python", "clike", "css", "ruby"];
                
                for (var i = 0, len = modes.length; i < len; i ++)
                {                    
                    var mode    = modes[i];
                    var selected = (localStorage.modeName == modeNames[i]) ? " selected=\"selected\"" : "";
                    modesSelect.append("<option value=\"" + mode + "\"" + selected + " name=\"" + modeNames[i] + "\"" + selected + ">" + modeNames[i] + "</option>");
                }
                
                modesSelect.change(function(){
                    var mode = $(this).val();
                    var modeName = $(this).find("option:selected").attr("name");
                    
                    if (mode == "")
                    {
                        alert("mode == \"\"");
                        return false;
                    }
                    
                    localStorage.mode     = mode;
                    localStorage.modeName = modeName;
                    
                    var code = getCodeValue();
                    
                    testEditor.setCodeMirrorOption("mode", mode);
                    //testEditor.setCodeMirrorOption("value", code);
                    testEditor.setValue(code);
                });  
            });
        </script>
    </body>
</html>