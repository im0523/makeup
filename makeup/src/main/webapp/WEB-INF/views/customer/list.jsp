<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.head { width: 70%; height: 50px; line-height: normal; }
table tr th { width: 100px; }
table tr td { text-align: center; }
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<p class="main">회원 관리</p>
<div class="head">
	<a class="btn-fill" style="float:right;" onclick="location='new.cu'">회원등록</a>
</div>
<table style="width: 700px;">
<tr>
	<th>아이디</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>등록일</th>
</tr>
<c:forEach items="${page.list }" var="vo" >
	<tr>
		<td>${vo.customer_id }</td>
		<td>${vo.customer_name }</td>
		<td>${fn:substring(vo.customer_socialNum, 0, 6) }</td>
		<td>${vo.customer_registerDate }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>