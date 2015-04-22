<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int count = Integer.parseInt(request.getAttribute("count").toString());
int currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
int pageCount = (count%10 == 0)? count/10 : count/10 + 1;
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Hello Containers!</title>
    <script src="js/jquery-latest.js"></script>
	<link rel="stylesheet" href="css/style3.css">
	<link rel="stylesheet" href="css/fenye.css">
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
	$('.mid').height(height+50);
});
	</script>
  <section>
  	<div class="mid">
  		<div class="small">
	        <div class="cate">
	            <a class="cate_name selected" href="#">Containers</a>
	            <a class="cate_name" href="http://localhost:8080/DockerCloud/image/list">Images</a>
	            <a class="cate_name" href="#">Configuration</a>
	            <a class="cate_name" href="#">DockerHub</a>
	        </div>
    	</div>
    	<div class="right" style="left:185px;top:30px;font-size:28px;">
    		<h1>Containers&emsp;</h1>
    		<form class="right" action="#">
      			<input name="search" class="search-box" type="text" placeholder="Search" autocomplete="off">
    		</form>
    		<!-- hr style="margin-top:18px;height:3px;border:none;border-top:1px solid;"></hr -->
    	</div>
    	<div class="big right" style="top:80px;">
        <ul>
        <%
		int edge = 10;
		boolean last = false;
		if(last = currentPage == pageCount)
			edge = (count % 10 == 0) ? 10 : count % 10;
		for(int i = 0; i < edge; i++) {
			i = i + (currentPage - 1) * 10;
			request.setAttribute("i", i);%>
            <li id="1428575893" class="apk_infos">
                <a href="${cts[i].website }"><img src="img/app/${i}.jpg" alt="${cts[i].name }"/></a>
                <h1 class="apk_title"><a href="${cts[i].website }">${cts[i].name } </a><span>v1.5.24 &emsp;[${cts[i].containerStatus }]</span></h1>
                <p class="apk_desc">Image: ${cts[i].image}<br>Ports: ${cts[i].ports}</p>
                <span class="apk_info">2015-04-09 &bull; 11Stars</span>
                <span class="apk_tag">Type: Web</span>
                <c:set var="status" value="${cts[i].containerStatus}" scope="request"></c:set>
                <%
                String status = request.getAttribute("status").toString();
                if(status.equals("Running")){ %>
                <a class="apk_down" href="http://localhost:8080/DockerCloud/container/stop?i=<%=i%>&currentPage=<%=currentPage%>">Stop</a>
                <%
                } else { %>
                <a class="apk_down delete" style="right:3px" href="http://localhost:8080/DockerCloud/container/remove?i=<%=i%>&currentPage=<%=currentPage%>">Delete</a>
                <a class="apk_down start" href="http://localhost:8080/DockerCloud/container/start?i=<%=i%>&currentPage=<%=currentPage%>">Start</a>
                <%} %>
            </li>
            <%
            if(last)
            	i = i - 10;
        } %>
        </ul>
        <div class="fenye">
 		<%
 		if(currentPage == 1) {%>
 			<a href="javascript:void(0);">&lt; </a>
 		<%} else {%>
 			<a href="http://localhost:8080/DockerCloud/container/list?forwardPage=<%=currentPage-1 %>&retrieve=0">&lt; </a>
 		<%}
 		for(int i = 1; i < pageCount + 1; i++) {
 			if(i == currentPage) {%>
 				<a class="current" href="javascript:void(0);"><%=i %></a>
 			<%} else {%>
 				<a href="http://localhost:8080/DockerCloud/container/list?forwardPage=<%=i %>&retrieve=0"><%=i %></a>
 			<%}
 		}
 		if(currentPage == pageCount) {%>
 			<a href="javascript:void(0);">&gt; </a>
 		<%} else {%>
 			<a href="http://localhost:8080/DockerCloud/container/list?forwardPage=<%=currentPage+1 %>&retrieve=0">&gt; </a>
 		<%} %>
 	</div>
      	</div>
      	
    </div>
  </section>
  </body>
</html>
