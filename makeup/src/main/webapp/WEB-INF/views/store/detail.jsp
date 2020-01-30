<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table tr th { font-size: 12px;}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<p class="main">STORE</p>
<table>
	<tr>
		<th style="width: 60px;">제목</th>
			<td>${vo.title }</td>
	</tr>
	<tr>
		<th style="width: 60px;">내용</th>
			<td>${vo.content }</td>
	</tr>	

</table>
</body>
</html>