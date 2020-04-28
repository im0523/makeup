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
tr td a { cursor: pointer; }
</style>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
<p class="main">회원 관리</p>
<div class="head">
	<a class="btn-fill" style="float:right;" onclick="location='new.cu'">회원추가</a>
</div>
<table style="width: 700px;">
<tr>
	<th>아이디</th>
	<th>이름</th>
	<th>생년월일</th>
	<th>등록일</th>
</tr>
<c:forEach items="${page.list }" var="vo" >
	<tr onclick="location='detail.cu?customer_id=${vo.customer_id}'">
		<td><a>${vo.customer_id }</a></td>
		<td><a>${vo.customer_name }</a></td>
		<td><a>${fn:substring(vo.customer_socialNum, 0, 6) }</a></td>
		<td><a>${vo.customer_registerDate }</a></td>
	</tr>
</c:forEach>
</table>
</body>
</html>