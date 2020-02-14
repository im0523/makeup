<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<th style="width: 60px;">작성자</th>
			<td>${vo.writer }</td>
	</tr>
	<tr>
		<th>위치</th>
			<td>${vo.category }</td>
	</tr>	
	<tr>
		<th>내용</th>
			<td>${fn: replace(vo.content, crlf, '<br>') }</td>
	</tr>	
	<tr>
		<th>첨부파일</th>
			<td><a style="cursor: pointer;" onclick="location='download.st?id=${vo.id}'">${vo.filename }</a></td>
	</tr>	

</table>

<div style="width: 150px; height: 50px; margin: 0 auto;">
	<a class="btn-fill" onclick="location='modify.st?id=${vo.id}'">수정</a>
	<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠습니까?') ){ location='delete.st?id=${vo.id}' }">삭제</a>
	<a class="btn-fill" onclick="history.back()">목록으로</a>
</div>
</body>
</html>