<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div { width: 85%; height: 100px; margin: 0 auto; line-height: 80px; margin-top: 28px;}
.position { width: 600px; height: 100px;}
img { float: left; cursor: pointer;}
ul li { list-style: none; float: right; font-size: 20px; color: dimgray; padding: 0 20px;}
.bar { border-right: 1px solid #ddd; height: 16px; margin: 34px 20px 0;}
</style>
</head>
<body>
<div>
	<a onclick="location='list.pd'"><img src="img/logo.PNG" /></a>
	<div class="position">
	<ul>
		<li class="bar"></li>
		<li><a onclick="location='list.pd'" style="cursor: pointer;">STORE</a></li>
		<li><a>PRODUCT</a></li>
		<li><a>BRAND</a></li>
	</ul>
	</div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</body>
</html>