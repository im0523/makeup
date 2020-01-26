<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main { height: 50px; text-align: center; font-size: 30px; font-weight: bold;}
table {margin: 0 auto; width: 80%; border-top: 1px solid #ececec; border-collapse: collapse;}
table th, table td { border-bottom: 1px solid #ececec; padding: 10px;}
table th { font-size: 10px; color: #545454; font-weight: lighter;}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<p class="main">STORE</p>
<table>
	<tr>
		<th style="width: 60px;">NO</th>
		<th style="width: 100px;">CATEGORY</th>
		<th>TITLE</th>
		<th style="width: 100px;">POSTED BY</th>
		<th style="width: 100px;">DATE</th>
		<th style="width: 80px;">VIEW</th>
	</tr>

<c:forEach items="${page.list }" var="vo">
	<tr>
		<td style="text-align: center;">${vo.no }</td>
		<td style="text-align: center;">일본</td>
		<td>${vo.title }</td>
		<td style="text-align: center;">${vo.writer }</td>
		<td style="text-align: center;">${vo.writedate }</td>
		<td style="text-align: center;">${vo.filename }</td>
	</tr>
</c:forEach>

</table>
</body>
</html>