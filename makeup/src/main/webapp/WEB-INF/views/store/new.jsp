<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<style type="text/css">
table { width: 55%;}
table th { font-size: 13px; width: 120px; }
input, textarea { width: 90%;}
.btn-img { width: 30px; height: 30px;}
</style>
</head>
<body>
<h3>스토어 등록</h3>
<form action="insert.st" method="post" enctype="multipart/form-data">
<table>
<tr>
	<th>제목</th>
		<td><input type="text" name="title"/></td>
</tr>
<tr>
	<th>작성자</th>
		<td><input type="text" name="writer"/></td>
</tr>
<tr>
	<th>국가</th>
		<td>
			<select name="category">
				<option>국내</option>
				<option>해외</option>
			</select>
		</td>
</tr>
<tr>
	<th>내용</th>
		<td><textarea name="content"></textarea></td>
</tr>
<tr>
	<th>첨부파일</th>
		<td>
			<img style="display: none;" src="img/cancel.PNG" class="btn-img" id="delete-file">
			<label id="file-name"></label>
			<label>
				<img class="btn-img" src="img/image_add.png" />
				<input style="display: none;" type="file" name="file" id="attach-file"/>
			</label>
		</td>
</tr>
</table>
</form>

<div style="width: 95px; height: 50px; margin: 0 auto;">
<a class="btn-fill" onclick="$('form').submit()">등록</a>
<a class="btn-empty" onclick="location='list.st'">취소</a>
</div>

<script type="text/javascript">
$('#attach-file').change(function(){
	$('#file-name').text( this.files[0].name );
	$('#delete-file').css('display', 'inline-block');
})

//첨부파일 삭제 이미지 버튼 눌렀을 때 처리
$('#delete-file').click(function(){
	$('#file-name').text('');
	$('#attach-file').val('');	//file 태그에 대한 data 없애기(보여지는 부분에 대한)
	$('#delete-file').css('display', 'none');
})
</script>
</body>
</html>