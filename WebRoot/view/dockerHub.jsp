<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int count = Integer.parseInt(request.getAttribute("count").toString());
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>SeaBird | DockerHub</title>
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
	            <a class="cate_name" href="http://localhost:8080/DockerCloud/image/list?i=0">Installation</a>
	            <a class="cate_name" href="#">Configuration</a>
	            <a class="cate_name selected" href="http://localhost:8080/DockerCloud/image/search?search=ubuntu">DockerHub</a>
	        </div>
    	</div>
    	<div class="right" style="left:185px;top:30px;font-size:28px;">
    		<h1>DockerHub&emsp;</h1>
    		<form class="right" action="http://localhost:8080/DockerCloud/image/search">
      			<input name="search" class="search-box" type="text" placeholder="ubuntu" autocomplete="off">
    		</form>
    	</div>
    	<div class="big right" style="top:80px;">
        	<div class="image-tbhead">
        		<div class="td" style="width:150px;">Name</div>
        		<div class="td1" style="width:325px;">Description</div>
        		<div class="td" style="width:85px;">IsOfficial</div>
        		<div class="td" style="width:85px;">IsTrusted</div>
        		<div class="td" style="width:85px;">StarCount</div>
        	</div>
        	<%
        	for(int i = 0; i < count; i++){
        		request.setAttribute("i", i);
        		if(i % 2 != 0 && i != 0){%>
		        	<div class="image-tbline">
		        <%} else {%>
		        	<div class="image-tbline" style="background-color:#fff;">
		        <%} %>
		        		<div class="td" style="width:150px;">${imgs[i].name }</div>
		        		<div class="td1" style="width:350px;" title="${imgs[i].description }">${imgs[i].description }</div>
		        		<div class="td" style="width:80px;">${imgs[i].is_official }</div>
		        		<div class="td" style="width:80px;">${imgs[i].is_trusted }</div>
		        		<div class="td" style="width:80px;">${imgs[i].star_count }</div>
		        		<div class="td" style="width:30px;position:relative;margin-top:-5px;">
		        			<a href="#" style="background-color:#5cb85c;width:75px;margin-left:-22px;">Apply</a>
		        		</div>
		        	</div>
        	<%} %>
      	</div>
    </div>	
  </section>
  </body>
</html>
