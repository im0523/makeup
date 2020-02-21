<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<p class="main">고객 관리</p>
<table style="width: 700px;">
<tr>
	<th style="width: 60px;">번호</th>
	<th style="width: 100px;">이름</th>
	<th style="width: 100px;">아이디</th>
	<th style="width: 100px;">생년월일</th>
	<th style="width: 50px;">성별</th>
</tr>
<c:forEach items="${page.list }" var="vo" >
	<tr>
		<td>${vo.no }</td>
		<td>${vo.name }</td>
		<td>${vo.id }</td>
		<td>${vo.birthday }</td>
		<td>${vo.gender }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>