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
#image0 { width: 130px; height: 130px;}
#image1, #image2, #image3, #image4, #image5, #image6 { width: 90px; height: 90px; padding: 0 5px;}
.context { width: 150px; height: 30px; line-height: 30px; float: left; margin: 0;}
</style>
</head>
<body>
<h2>상품등록</h2>
<form action="insert.pd" method="post" enctype="multipart/form-data">
	<div class="content" style="width: 900px; margin: 0 auto; border: 1px solid gray;">
		<div style="width: 130px; height: 130px;">
			<label>
				<img class="image_add" id="image0" src="img/image_add.png"/>
				<input type="file" name="thumbNail" class="file-attach"/>
			</label>
		</div>
		
		<div class="seqBox" style="margin-top: 20px;">
			<div class="product_name">상품명</div>
				<input class="pd_nameInput" type="text" name="product_name"/>
		</div>
		<div class="seqBox">
			<div class="product_category">카테고리</div>
				<select name="product_category">
					<option value="">선택없음</option>
					<option value="face">face</option>
					<option value="lips">lips</option>
					<option value="eye">eye</option>
					<option value="multi">multi</option>
					<option value="cleansing">cleansing</option>
					<option value="gifting">gifting</option>
					<option value="acc">acc</option>
				</select>
		</div>
		<div class="seqBox">
			<div class="product_price">가격</div>
				<span class="product_price_f">KRW</span>
				<input type="text" name="product_price_c" id="product_price_c" style="width: 80px; float: left;"
					   onkeyup="autoComma(this);" maxlength="11"/>
				<input type="hidden" id="product_price" name="product_price"/>
		</div>
		<div class="seqBox" style="height: 80px;">
			<div class="product_explanation">상품설명</div>
				<textarea style="width: 605px;" name="product_explanation"></textarea>
		</div>
		<div class="seqBox" style="height: 90px;">
			<div style="width: 150px; height: 100px; margin-top: 0; float: left;">이미지 등록</div>
			<div class="imagefiles">
				<c:forEach begin="1" end="6" varStatus="status">
					<label>
						<img class="image_add" id="image${status.count }" src="img/image_add.png"/>
						<input class="file-attach" type="file"  name="image"/>
					</label>
				</c:forEach>
			</div>
		</div>
		<div class="seqBox" style="height: 100px;">
			<div class="context">내용</div>
				<textarea style="width: 605px;" name="product_context"></textarea>
		</div>
	</div>
	
	
	<div style="width: 95px; height: 50px; margin: 0 auto;">
		<a class="btn-fill" onclick="go_submit();">등록</a>
		<a class="btn-empty" onclick="location='list.pd'">취소</a>
	</div>
</form>

<script type="text/javascript" src="js/product.js" charset="UTF-8"></script>
<script type="text/javascript">
$(document).on("change", ".file-attach", handleImgFileSelect);		

function readURL(value, tag){
	if(value.files && value.files[0]){
		var reader = new FileReader();
		reader.onload = function (e){
			$(tag).attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
}

function handleImgFileSelect(e){
	var id = $(this).attr('id');
	var seq = $('.file-attach').index(this)
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	console.log('상품', this);
	readURL(this, '#image'+seq);
	$('#image'+seq).removeClass('image_add');
}
</script>		     	
</body>
</html>