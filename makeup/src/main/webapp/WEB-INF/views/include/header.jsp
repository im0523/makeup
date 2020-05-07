<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div { width: 85%; height: 100px; margin: 0 auto; line-height: 80px; margin-top: 28px;}
img { float: left; cursor: pointer;}
.position { width: 750px; height: 100px; float: right; margin-top: 0px;}
.list { list-style: none; float: left; font-size: 20px; color: dimgray; padding: 0 20px;}
.list-s { list-style: none; float: left; font-size: 13px; color: dimgray; padding: 0 8px;}
.bar { list-style: none; float: left; border-right: 1px solid #ddd; height: 16px; margin: 33px -5px;}
ul li a { cursor: pointer;}
</style>
</head>
<body>
<div>
	<a onclick="location='/makeup'"><img src="img/logo.PNG" /></a>
	<div class="position">
	<ul>
		<li class="list"><a onclick="location='list.cu'">CUSTOMER</a></li>
		<li class="list"><a>BRAND</a></li>
		<li class="list"><a onclick="location='list.pd'">PRODUCT</a></li>
		<li class="list"><a onclick="location='list.st'">STORE</a></li>
		<li class="bar"></li>
		<li class="list-s"><a onclick="location='login'">LOGIN</a></li>
		<li class="list-s"><a onclick="location='new.cu'">JOIN</a></li>
		<li class="list-s">COMMUNITY</li>
	</ul>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>