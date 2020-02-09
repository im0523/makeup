<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.head { width: 70%; height: 50px; line-height: normal;}
</style>
<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<p class="main">STORE</p>
<div class="head">
	<p><a class="btn-fill" style="float:right;" onclick="location='new.st'">글쓰기</a></p>
</div>
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
		<td style="text-align: center;">${vo.category }</td>
		<td><a style="cursor: pointer; float:left;" onclick="location='detail.st?id=${vo.id}'">${vo.title }&nbsp;</a>
			${empty vo.filename ? '' : '<img src="img/fileimage.gif" style="padding-top: 5px; cursor: default;"/>' }</td>
		<td style="text-align: center;">${vo.writer }</td>
		<td style="text-align: center;">${vo.writedate }</td>
		<td style="text-align: center;">${vo.readcnt }</td>	
	</tr>
</c:forEach>

</table>

</body>
</html>