<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int count = Integer.parseInt(request.getAttribute("count").toString());
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
	$('.mid').height(height+250);
});
	</script>
  <section>
  	<div class="mid">
  		<div class="small">
	        <div class="cate">
	            <a class="cate_name" href="http://localhost:8080/DockerCloud/container/list?forwardPage=1">Containers</a>
	            <a class="cate_name selected" href="#">Images</a>
	            <a class="cate_name" href="#">Configuration</a>
	            <a class="cate_name" href="#">DockerHub</a>
	        </div>
    	</div>
    	<div class="right" style="left:185px;top:30px;font-size:28px;">
    		<h1>Images&emsp;</h1>
    		<form class="right" action="#">
      			<input name="search" class="search-box" type="text" placeholder="Search" autocomplete="off">
    		</form>
    	</div>
    	<div class="big right" style="top:80px;">
        	<div class="image-tbhead">
        		<div class="td">Id</div>
        		<div class="td1">RepoTags</div>
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
		        		<div class="td">${imgs[i].subId }</div>
		        		<div class="td1"><p style="overflow:hidden;height:30px;">${imgs[i].name }</p></div>
		        		<div class="td">${imgs[i].date }</div>
		        		<div class="td">${imgs[i].sizeUnit }</div>
		        		<div class="td"><div class="td2"><a href="#" style="color:#fff;">Delete</a></div></div>
		        	</div>
        	<%} %>
      	</div>
    </div>
  </section>
  </body>
</html>
