<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int count = Integer.parseInt(request.getAttribute("count").toString());
//int res = Integer.parseInt(request.getAttribute("response").toString());
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>SeaBird | Images</title>
    <script src="js/jquery-latest.js"></script>
	<link rel="stylesheet" href="css/style3.css">
  </head>
  
  <body>
  	<div id="top">
        <div class="wp">
            <div class="z">
                <a style="color:#999;" id="logo"></a>
            </div>
            <div class="y">
                <a href="http://product.7po.com">Sign in</a>
                <a href="http://dev.7po.com/" target="_blank">About Us</a>
            </div>
        </div>
    </div>
  	<script>
  	
  	window.onload = function() {
  		var res = "${response }";
  		if(res == "201") {
  			alert("\nApplication installed successfully.\n\nStart before you use this application.");
  		} else if(res != "0") {
  			alert("Installation failed!\n");
  		}
  	}
  	
jQuery(function($){
	$(window).scroll(function(){
		if ($(document).scrollTop() > 10) $('#scrolltop').show();
		else $('#scrolltop').hide();
		if ($(document).scrollTop() >= 52) {
			if ($('#fix').length == 0) {
				var left = $('.small').offset().left;
				var clone = $('.small').clone().attr('id','fix').css({'position':'fixed','top':'0px','left':left+'px'});
				$('.small').css('visibility','hidden');
				clone.insertAfter('.small');
			}
		} else {
			$('#fix').remove();
			$('.small').css('visibility','visible');
		}
	});
    var height = $('.small').outerHeight() > $('.big').outerHeight() ? $('.small').outerHeight() : $('.big').outerHeight();
	var wHeight=document.documentElement.clientHeight;
	if (height + 80 + 52 < wHeight) {
		$('.mid').height(wHeight - 52 - 32);
		return;
	}
	$('.mid').height(height + 100);
});
	</script>
  <section>
  	<div class="mid">
  		<div class="small">
	        <div class="cate">
	            <a class="cate_name" href="http://localhost:8080/DockerCloud/container/list?forwardPage=1">Applications</a>
	            <a class="cate_name selected" href="http://localhost:8080/DockerCloud/image/list?i=0">Installation</a>
	            <a class="cate_name" href="#">Configuration</a>
	            <a class="cate_name" href="http://localhost:8080/DockerCloud/image/search?search=ubuntu">DockerHub</a>
	        </div>
    	</div>
    	<div class="right" style="left:185px;top:30px;font-size:28px;">
    		<h1>Installation&emsp;</h1>
    		<form class="right" action="#">
      			<input name="search" class="search-box" type="text" placeholder="Search" autocomplete="off">
    		</form>
    	</div>
    	<div class="big right" style="top:80px;">
        	<div class="image-tbhead">
        		<div class="td1">Name</div>
        		<div class="td">RepoTags</div>
        		<div class="td">Created</div>
        		<div class="td">VirtualSize</div>
        		<div class="td">Operation</div>
        	</div>
        	<%
        	for(int i = 0; i < count; i++){
        		request.setAttribute("i", i);
        		if(i % 2 != 0 && i != 0){%>
		        	<div class="image-tbline">
		        <%} else {%>
		        	<div class="image-tbline" style="background-color:#fff;">
		        <%} %>
		        		<div class="td1">${imgs[i].name }</div>
		        		<div class="td" title="${imgs[i].repoTag }"><p style="overflow:hidden;height:30px;">${imgs[i].repoTag }</p></div>
		        		<div class="td">${imgs[i].date }</div>
		        		<div class="td">${imgs[i].sizeUnit }</div>
		        		<div class="td" style="width:180px;position:relative;margin-top:-5px;">
		        			<a href="http://localhost:8080/DockerCloud/image/run?i=<%=i %>" style="left:5px;background-color:#5cb85c;">Install</a>
		        			<a href="http://localhost:8080/DockerCloud/image/remove?i=<%=i %>" style="left:100px;">Delete</a>
		        		</div>
		        	</div>
        	<%} %>
      	</div>
    </div>
  </section>
  </body>
</html>
