<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>SeaBird</title>
    <link charset="utf-8" type="text/css" rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/style3.css">
  </head>
  
  <body>
	  <script  type="text/javascript">
	  	
	  	window.onload = function() {
	  		var login = "${login }";
	  		if (login == "0") {
				alert("Login failed!");
			}
	  	}
	  
	    //pop up login
	    function ShowNo()                        //hide the two layers
	    {
	        document.getElementById("doing").style.display = "none";
	        document.getElementById("divLogin").style.display = "none";
	    }
	    function $(id) {
	        return (document.getElementById) ? document.getElementById(id) : document.all[id];
	    }
	    function showFloat()                    //display
	    {
	        //var range = getRange();
	        //$('doing').style.width = range.width + "px";
	        //$('doing').style.height = range.height + "px";
	        $('doing').style.display = "block";
	        document.getElementById("divLogin").style.display = "";
	    }
	  </script>
	  
	<div id="top">
        <div class="wp">
            <div class="z">
                <a style="color:#999;" id="logo"></a>
                <a href="/DockerCloud/container/list">Containers</a>
                <a href="/DockerCloud/image/list">Images</a>
                <a href="/DockerCloud/configuration">Configuration</a>
                <a href="https://github.com/dongzhou2468/DockerCloud" target="_blank">GitHub</a>
            </div>
            <div class="y">
                <a href="#" onclick="showFloat()">Sign in</a>
                <a href="#">Sign up</a>
            </div>
        </div>
    </div>  
	<div class="band-bg" style="opacity=1;position: absolute;left:0;right:0;top:52px;bottom:0;z-index:1;background:url(img/Cloud.jpg) no-repeat center 0;background-size:cover">
	</div>
	
    <!--translucent layer-->
    <div id="doing" style="filter:alpha(opacity=40);-moz-opacity:0.4;opacity:0.4;background-color:#404040;width:100%;height:100%;z-index:1000;position: absolute;left:0;top:0;display:none;overflow: hidden;">
    </div>
    <!--login layer-->
    <div id="divLogin" style="display:none;">
        <div id="signin" class="rl-modal in" aria-hidden="false">
            <div class="rl-modal-header">
                <h1>
                    <span class="active-title">Sign in</span>
                </h1>
                <button type="button" class="rl-close" data-dismiss="modal" onclick="ShowNo()"></button>
            </div>
            <div class="rl-modal-body">
                <form id="signup-form" method="post" action="/DockerCloud/login">
                    <div>
                        <input type="text" name="email" data-validate="email" autocomplete="off" class="rlf-input rlf-input-email" placeholder="pls input your email">
                    </div>
                    <div>
                        <input type="password" name="password" autocomplete="off" class="rlf-input rlf-input-pwd" placeholder="pls input the password">
                    </div>
                    <div class="auto-forget">
                        <label for="auto-signin" class="l"><input type="checkbox" checked="checked" id="auto-signin">auto-signin</label>
                        <a href="#" class="rlf-forget r" target="_blank">forgot password</a>
                    </div>
                    <div>
                        <input type="submit" value="Sign  in" class="rlf-btn-green btn-full r">
                    </div>
                </form>
            </div>
        </div>
    </div>
  </body>
</html>
