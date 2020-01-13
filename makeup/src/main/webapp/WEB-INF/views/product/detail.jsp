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
.infoArea { width: 550px; height: 550px; border-top: 1px solid; float: right;}
.name { width: 550px; height: 25px; line-height: 15px; font-size: 20px; }
.price { width: 550px; height: 50px; line-height: 15px; font-size: 15px; font-weight: bold; border-bottom: 1px solid #ececec;}
.explanation { width: 550px; margin-top: 0px; line-height: 20px; }
.img-box { width: 1200px; height: auto; margin: 20px auto; bottom: 0;}
.image { width: 1000px; margin: 0 auto;}
.btn-box { width: 150px;}
</style>
</head>
<body>
<div class="header">
	<div class="imagepath"><img src="${vo.imagepath }" /></div>
	<div class="infoArea">
		<p class="name">${vo.name }</p>
		<p class="price">${vo.price }</p>
		<div class="explanation">${vo.explanation }</div>
		<a onclick="location='buy.pd?no=${vo.no}'" style="cursor: pointer;"><div class="buy-btn">buy now</div></a>
		<div class="btn-box">
			<a class="btn-fill" onclick="location='modify.pd?no=${vo.no}'">상품수정</a>
			<a class="btn-fill" onclick="if( confirm('정말 삭제하시겠어요?') ){ location='delete.pd?no=${vo.no}' }">상품삭제</a>
		</div>
	</div>
</div>
<div class="img-box">
	<div><img src="${vo.image1 }" class="image"/></div>
	<div><img src="${vo.image2 }" class="image"/></div>
	<div><img src="${vo.image3 }" class="image"/></div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>