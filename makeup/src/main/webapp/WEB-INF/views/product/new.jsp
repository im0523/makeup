<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.imagefiles { width: 705px; height: 110px; float: left; margin: 0; padding-left: 10px;}
.file-attach { float: left; display:none;}
#image0 { width: 130px; height: 130px;}
#image1, #image2, #image3 { width: 90px; height: 90px; padding: 0 5px;}
.context { width: 150px; height: 30px; line-height: 30px; float: left; margin: 0;}
</style>
</head>
<body>
<h3>상품등록</h3>
<form action="insert.pd" method="post" enctype="multipart/form-data">
	<div class="content" style="width: 900px; margin: 0 auto; border: 1px solid gray;">
		<div style="width: 130px; height: 130px;">
			<label>
				<img class="image_add" id="image0" src="img/image_add.png"/>
				<input type="file" name="image" class="file-attach"/>
			</label>
		</div>
		
		<div class="product_name">상품명</div>
			<input type="text" name="name"/>
		<div class="product_price">가격</div>
			<input type="text" name="price" style="width: 200px; margin: 0 400px 0 20px; float: left;"/>
		<div class="product_explanation">상품설명</div>
			<textarea style="width: 705px; margin-top: 20px;" name="explanation"></textarea>
		<div style="width: 150px; height: 70px; float: left; margin-top: 70px;">이미지 등록</div>
		<div class="imagefiles">
			<label>
				<img class="image_add" id="image1" src="img/image_add.png"/>
				<input class="file-attach" type="file"  name="image"/>
			</label>
			<label>
				<img class="image_add" id="image2" src="img/image_add.png"/>
				<input class="file-attach" type="file" name="image"/>
			</label>
			<label>
				<img class="image_add" id="image3" src="img/image_add.png"/>
				<input class="file-attach" type="file" name="image"/>
			</label>
		</div>
		<div class="context">내용</div>
			<textarea style="width: 710px;" name="context"></textarea>
	</div>
	<div style="width: 95px; height: 50px; margin: 0 auto;">
		<a class="btn-fill" onclick="$('form').submit()">등록</a>
		<a class="btn-empty" onclick="location='list.pd'">취소</a>
	</div>
</form>


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