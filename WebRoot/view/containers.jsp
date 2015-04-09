<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int count = Integer.parseInt(request.getAttribute("count").toString());
int currentPage = Integer.parseInt(request.getAttribute("currentPage").toString());
int pageCount = (count%3 == 0)? count/3 : count/3 + 1;
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>Containers | DockerCloud</title>
    <meta charset="UTF-8">
	<!--[if lt IE 9]>
	<script src="dist/html5shiv.js"></script>
	<![endif]-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/fenye.css">
	<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
  
  </head>
  
  <body>
  	<div class="nav">
	    <ul>
	        <li><a href="#">SeaBird</a></li>
	        <li><a href="#">Containers</a></li>
	        <li><a href="#">Images</a></li>
	        <li><a href="#">Configuration</a></li>
	        <li><a href="#">DockerHub</a></li>
	    </ul>
	    <div class="cls"></div>
	</div><br>
	
	<div>
		<h1 class="page-header">Containers ( <%=count %> )</h1>
	</div>
<!-- fanye 
    n  	             page  n/3  n%3
	1 => 1         :   1    0    1
	2 => 2         :   1	0    2
	3 => 3         :   1	1    0

	4 => 3 + 1     :   2    1    1
	5 => 3 + 2     :   2	1    2
	6 => 3 + 3     :   2	2    0

	7 => 3 + 3 + 1 :   3	2    1
	8 => 3 + 3 + 2 :   3    2    2
	9 => 3 + 3 + 3 :   3    3    0
 -->
    <section id="pricePlans">
		<ul id="plans">
		<%
		int edge = 3;
		if(currentPage == pageCount)
			edge = (count % 3 == 0) ? 3 : count % 3;
		for(int i = 0; i < edge; i++) {
			i = i + (currentPage - 1) * 3;
			request.setAttribute("i", i);%>
			<li class="plan">
				<ul class="planContainer">
					<li class="title"><h2><a href="http://localhost:8080/DockerCloud/container/info?i=<%=i%>">${(cts[i].names)[0]}</a></h2></li>
					<li class="price"><p> <span> </span></p></li>
					<li>
						<ul class="options">
							<li>Id <span>${cts[i].subId }</span></li>
							<li>Image <span>${cts[i].image}</span></li>
							<li>Command <span>${cts[i].command}</span></li>
							<li>Ports <span>${cts[i].ports}</span></li>
							<li>Status <span>${cts[i].status}</span></li>
						</ul>
					</li>
					<c:set var="status" value="${cts[i].status}" scope="request"></c:set>
					<% 
					String status = request.getAttribute("status").toString();
					if(status.startsWith("Exited")) {%>
					<li>
						<table align="center" border="0" style="width:100%;table-layout:fixed;">
							<tr>
								<td style="text-align:center;"><ul><li class="button"><a href="http://localhost:8080/DockerCloud/container/start?i=<%=i%>&currentPage=<%=currentPage%>">Start</a></li></ul></td>
								<td style="text-align:center;"><ul><li class="button"><a class="deletePlanButton" href="http://localhost:8080/DockerCloud/container/remove?i=<%=i%>&currentPage=<%=currentPage%>">Delete</a></li></ul></td>
							</tr>
						</table>
					</li>
					<%
					} else {%>
					<li style="margin-top:0.4em" class="button"><a class="stopPlanButton" href="http://localhost:8080/DockerCloud/container/stop?i=<%=i%>&currentPage=<%=currentPage%>">Stop</a></li>
					<%} %>
				</ul>
			</li>
  		<%	i = i - (currentPage - 1) * 3;
  		} %>
  			
		</ul>
	</section>
	
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
 	</div><br>
 
    <table>
		<thead>
			<tr>
				<th>Id</th><th>Names</th><th>Image</th>
				<th>Command</th><th>Ports</th><th>Status</th><th>Operation</th>
			</tr>
		</thead>
		<tbody>
		<%
		for(int i = 0; i < count; i++) {
			request.setAttribute("i", i);
		%>
			<tr>
				<td>${cts[i].subId}</td><td>${(cts[i].names)[0]}</td>
				<td>${cts[i].image}</td><td>${cts[i].command}</td>
				<td>${cts[i].ports}</td><td>${cts[i].status}</td>
				<td><button onclick="window.location.href='http://localhost:8080/DockerCloud/container/start?i=<%=i%>'">Start</button></td>
			</tr>
		<%
		}
		%>	
		</tbody>
	</table>
  </body>
</html>
