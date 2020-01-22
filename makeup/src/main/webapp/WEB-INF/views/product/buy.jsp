<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<style>
.header { width: 1200px; height: 600px; border: 1px solid #cccccc;}
.imagepath { width: 200px; height: 200px; float: left;  margin-left: 20px;}
.infoArea { width: 930px; height: 200px; float: left;}
.value, .value1 { width: 830px; height: 30px; line-height: 30px; float: left; margin: 20px 0 0 20px;}
.value { width: 50px; font-weight: bold;}
/* table tr th { width: 80px;} */
/* .name { width: 550px; height: 25px; line-height: 15px; font-size: 20px; } */
/* .price { width: 550px; height: 50px; line-height: 15px; font-size: 15px; font-weight: bold; border-bottom: 1px solid #ececec;} */
</style>
<title>Insert title here</title>
</head>
<body>
<p style="width: 122px; margin: auto; font-weight: bold;">상품구매 페이지</p>
<div class="header">
	<div class="imagepath"><img style="width: 200px; height: 200px;" src="${vo.imagepath }" /></div>
		<div class="infoArea">
			<p class="value">상품명</p>
				<p class="value1">${vo.name }
			<p class="value">가격</p>
				<p class="value1">${vo.price }
		</div>
	
</div>
<div style="width: 116px;">
	<a class="btn-fill" onclick="">주문하기</a>
	<a class="btn-fill" onclick="history.back();">취소</a>
</div>
</body>
</html>