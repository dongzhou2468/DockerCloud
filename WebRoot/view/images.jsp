<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html ng-app="seagull" class="ng-scope">
  <head>
  	<title>Images | DockerCloud</title>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <style type="text/css">@charset "UTF-8";[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide{display:none !important;}ng\:form{display:block;}.ng-animate-block-transitions{transition:0s all!important;-webkit-transition:0s all!important;}.ng-hide-add-active,.ng-hide-remove{display:block!important;}</style>
    
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/jquery.gritter.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/hover-min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">

    <script src="<%=basePath%>js/angular.min.js"></script>
    <script src="<%=basePath%>js/angular-route.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <script src="<%=basePath%>js/jquery.gritter.min.js"></script>
    <script src="<%=basePath%>js/angular-translate.min.js"></script>
    <script src="<%=basePath%>js/angular-cookies.min.js"></script>
    <script src="<%=basePath%>js/angular-translate-storage-cookie.min.js"></script>
    <script src="<%=basePath%>js/angular-translate-storage-local.min.js"></script>
    <script src="<%=basePath%>js/controllers.js"></script>
    <script src="<%=basePath%>js/style.js"></script>
  </head>
  
  <body ng-controller="IndexController" class="animated fadeIn ng-scope">
 	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand animate-nav ng-binding" href="http://192.168.1.182:10086/">DockerCloud</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="animate-nav"><a href="http://192.168.1.182:10086/containers" class="ng-binding">Containers</a></li>
            <li class="animate-nav"><a href="./Seagull-images_files/Seagull-images.htm" class="ng-binding">Images</a></li>
            <li class="animate-nav"><a href="http://192.168.1.182:10086/configuration" class="ng-binding">Configuration</a></li>
            <li class="animate-nav"><a href="http://192.168.1.182:10086/dockerhub" class="ng-binding">DockerHub</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a class="dropdown-toggle animate-nav ng-binding" data-toggle="dropdown" href="">More <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li class="animate-nav ng-hide" ng-hide="isEnUs()"><a href="" ng-click="changeLanguage(&#39;en-us&#39;)" class="ng-binding">English</a></li>
                <li class="animate-nav" ng-hide="isZhCn()"><a href="" ng-click="changeLanguage(&#39;zh-cn&#39;)" class="ng-binding">简体中文</a></li>
                <li class="animate-nav" ng-hide="isZhHant()"><a href="" ng-click="changeLanguage(&#39;zh-hant&#39;)" class="ng-binding">繁體中文</a></li>
                <li class="animate-nav" ng-hide="isDeDe()"><a href="" ng-click="changeLanguage(&#39;de-de&#39;)" class="ng-binding">Deutsch</a></li>
                <li class="animate-nav" ng-hide="isFrFr()"><a href="" ng-click="changeLanguage(&#39;fr-fr&#39;)" class="ng-binding">Français</a></li>
                <li class="animate-nav"><a href="https://github.com/tobegit3hub/seagull/issues/new" target="_top" class="ng-binding">Need Help</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a class="dropdown-toggle animate-nav ng-binding" data-toggle="dropdown" href="">Local <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <!-- ngRepeat: server in notCurrentServers track by $index -->
                <li class="animate-nav"><a href="" data-toggle="modal" data-target="#addServerModal" class="ng-binding">Add Server</a></li>
                <li class="animate-nav"><a href="" data-toggle="modal" data-target="#clearServersModal" class="ng-binding">Clear Servers</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div> 
    
    <div>
    	${msg}
    </div>
  </body>
</html>
