<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
.imagepath { margin: 0 auto;}
.product_price, .product_image { width: 150px; height: 60px; margin: 0; line-height: 30px; float: left; }
.product_price{ height: 30px;}
.file-attach { float: left; display:none;}
.image_add { width: 90px; height: 90px;}
.context { width: 150px; height: 30px; line-height: 30px; float: left; margin: 0;}
</style>
</head>
<body>
<h2>상품등록</h2>
<form action="insert.pd" method="post" enctype="multipart/form-data">
	<div class="content" style="width: 900px; margin: 0 auto; border: 1px solid gray;">
		<div style="width: 130px; height: 130px;" id="imageBox0">
			<label>
				<img class="image_add" id="image0" src="img/image_add.png" style="width: 130px; height: 130px;"/>
				<input type="file" id="thumbNail" name="thumbNail" class="file-attach"/>
			</label>
		</div>
		
		<div class="seqBox" style="margin-top: 20px;">
			<div class="product_name">상품명</div>
				<input class="pd_nameInput" type="text" id="product_name" name="product_name"/>
		</div>
		<div class="seqBox">
			<div class="product_category">카테고리</div>
				<select name="product_category">
					<option value="">선택없음</option>
					<c:forEach var="code" items="${codeList }">
						<option value="${code.code_id }">${code.code_name }</option>
					</c:forEach>
				</select>
		</div>
		<div class="seqBox">
			<div class="product_price">가격</div>
				<span class="product_price_f">KRW</span>
				<input type="text" name="product_price_c" id="product_price_c" style="width: 80px; float: left;"
					   onkeyup="autoComma(this);" maxlength="11"/>
				<input type="hidden" id="product_price" name="product_price"/>
		</div>
		<div class="seqBox" style="height: 70px;">
			<div class="product_explanation">상품설명</div>
				<textarea style="width: 605px;" name="product_explanation"></textarea>
		</div>
		<div class="seqBox" style="height: 70px;">
			<div class="context">내용</div>
				<textarea style="width: 605px;" name="product_context"></textarea>
		</div>
		<div class="seqBox" style="height: 30px;">
			<div style="width: 150px; height: 30px; margin-top: 0; float: left; line-height: 30px;">이미지 등록</div>
			<a class="btn-fill-s" onclick="imgAddBtn()" style="float: left; height: 20px; line-height: 20px; margin-top: 4px;
									background-color: gray;">이미지 추가하기</a>
			<div class="imagefiles">
				<c:forEach begin="1" end="3" varStatus="status">
					<div class="imageBox" id="imageBox${status.count }">
						<label>
							<img class="image_add" id="image${status.count }" src="img/image_add.png"/>
							<input class="file-attach" type="file" name="image"/>
						</label>
						<img class="delete-img" id="imageDel${status.count }" src="img/cancel.PNG"
							 style="display: none;" onclick="deleteImg(this)"/>
					</div>
				</c:forEach>
			</div>
		</div>
		
	</div>
	
	<div style="width: 95px; height: 50px; margin: 0 auto;">
		<a class="btn-fill" onclick="go_submit();">등록</a>
		<a class="btn-empty" onclick="location='list.pd'">취소</a>
	</div>
	
	<input type="hidden" id="delete" name="delete" value="0"/>
	
</form>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>
</body>
</html>