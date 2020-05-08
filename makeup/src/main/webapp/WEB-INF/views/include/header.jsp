<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div { width: 85%; height: 100px; margin: 0 auto; line-height: 80px; margin-top: 28px;}
img { float: left; cursor: pointer;}
ul li a { cursor: pointer;}
</style>
</head>
<body>
<div>
	<input type="hidden" id="adminCheck" value="${login_info.customer_id }"/>

	<a onclick="location='/makeup'"><img src="img/logo.PNG" /></a>
	<div class="position">
	
	<ul>
		<li class="list-s">COMMUNITY</li>
		<li class="list-s"><a onclick="location='new.cu'">JOIN</a></li>

		<c:choose>
			<c:when test="${!empty login_info.customer_name }">
				<li class="list-s"><a onclick="go_logout()">LOGOUT</a></li>
			</c:when>
			<c:otherwise>
				<li class="list-s"><a onclick="location='login'">LOGIN</a></li>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${!empty login_info.customer_name }">
			<li class="list-s">[ ${login_info.customer_name}님 ]</li>
		</c:if>
	
		<li class="bar"></li>
		<li class="list"><a onclick="location='list.st'">STORE</a></li>
		<li class="list"><a onclick="location='list.pd'">PRODUCT</a></li>
		<li class="list"><a>BRAND</a></li>
		<c:if test="${login_info.customer_name == '관리자' }">
			<li class="list"><a onclick="location='list.cu'">CUSTOMER</a></li>
		</c:if>
	</ul>
	</div>
	
	
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>
</body>
</html>