<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div_cate, table { width: 45%;}
.cate { font-size: 15px; color: #545454; font-weight: bold;}
table tr th { width: 120px;}
input { width: 150px;}
.radio { width: 10px; height: 10px; line-height: 10px;}
.phone { width: 30px;}
<link rel="stylesheet" type="text/css" href="css/style.css">
</style>
</head>
<body>
<h3>회원 등록</h3>
<div class="div_cate">
	<span class="cate">[ 인적사항 ]</span>
</div>
<table>
<tr>
	<th>아이디</th>
		<td><input type="text" name="id"/></td>
</tr>
<tr>
	<th>패스워드</th>
		<td><input type="text" name="password"/> &nbsp;&nbsp;&nbsp;
	<span style="font-size: 10px; color: #545454; font-weight: lighter;">패스워드 확인</span>
			<input type="text" name="password"/></td>
</tr>
<tr>
</tr>
<tr>
	<th>이름</th>
		<td><input type="text" name="name"/></td>
</tr>
<tr>
	<th>주민등록번호</th>
		<td><input style="width:70px;" type="text" name="birthday"/> -
			<input style="width:70px;" type="text" name="birthday"/></td>
</tr>
<tr>
	<th>휴대폰 번호</th>
		<td><input class="phone" type="text" name="phone"/> -
			<input class="phone" type="text" name="phone"/> -
			<input class="phone" type="text" name="phone"/></td>
</tr>
<tr>
	<th>성별</th>
		<td><label style="font-size: 13px;"><input class="radio" type="radio" name="gender" value="남"/>남</label>
			<label style="font-size: 13px;"><input class="radio" type="radio" name="gender" value="여"/>여</label></td>
</tr>
<tr>
	<th>이메일</th>
		<td><input style="width:180px;"type="text" name="email"/></td>
</tr>
<tr>
	<th>주소</th>
		<td><input style="width: 60px;" type="text" name="address" placeholder="우편번호" readonly="readonly"/>
				<a onclick="execPostCode();" class="btn-fill-s">우편번호 찾기</a></td>
</tr>
<tr>
	<th></th>
		<td><input style="width: 400px;" type="text" name="address" placeholder="주소"/>
			<input style="width: 250px;" type="text" name="address" placeholder="상세주소"/></td>
</tr>


</table>

<div class="div_cate">
	<span class="cate">[ 학력사항 ]</span>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function execPostCode(){
	new daum.Postcode({
		oncomplete: function(data){
			//우편번호 찾기 버튼을 눌렀을 때
			
			var fullRoadAddr = data.roadAddress;	//도로명 주소 변수
			var extraRoadAddr = '';		//도로명 조합형 주소 변수
			
			//법정 동명이 있을 경우 추가한다. (법정 리는 제외)
			//법정 동의 경우 마지막 문자가 "/동/로/가"로 끝난다.
			if( data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
		}
	})
}
</script>
</body>
</html>