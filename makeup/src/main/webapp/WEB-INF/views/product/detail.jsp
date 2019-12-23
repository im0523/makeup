<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.header { width: 1200px; height: 600px;}
.imagepath { width: 550px; height: 550px; float: left;}
.infoArea { width: 550px; height: 550px; border: 1px solid; float: right;}
.name { width: 550px; height: 25px; line-height: 15px; font-size: 20px; }
.price { width: 550px; height: 50px; line-height: 15px; font-size: 15px; font-weight: bold; border-bottom: 1px solid #ececec;}

</style>
</head>
<body>
<%-- <input type="hidden" data-name="no" id="no" value="${vo.no }"> --%>
<div class="header">
	<div class="imagepath"><img src="${vo.imagepath }" /></div>
	<div class="infoArea">
		<p class="name">${vo.name }</p>
		<p class="price">${vo.price }</p>
		<div class="buy-btn">buy now</div>
	</div>
</div>
</body>
</html>