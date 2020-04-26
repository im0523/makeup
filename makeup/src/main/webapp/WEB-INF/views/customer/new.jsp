<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table tr th { width: 120px;}
input { width: 150px;}
<link rel="stylesheet" type="text/css" href="css/style.css">
</style>
</head>
<body>
<h2>회원 가입</h2>
<form action="insert.cu" >
	<table>
	<tr>
		<th>아이디</th>
			<td>
				<input type="text" id="customer_id" name="customer_id" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9]/g, '');" maxlength="16"/>
				<a id="btn-usable" onclick="usable();" class="btn-fill-s">중복확인</a>
				<span style="font-size: 12px; color: #545454; margin-left: 10px;">대/소문자 구분(6~16자)</span>
			</td>
	</tr>
	<tr>
		<th>비밀번호</th>
			<td>
				<input type="password" id="customer_pw" name="customer_pw" onkeyup="isSame(); this.value=this.value.replace(/[^a-zA-Z0-9]/g, '');" maxlength="16"/>
				<span style="font-size: 12px; color: #545454; margin-left: 10px;">대소문자/숫자(6~16자)</span>
				<span style="font-size: 13px; color: #545454; font-weight: lighter; margin-left: 30px;">비밀번호 확인</span>
				<input type="password" id="customer_pwCk" onkeyup="isSame(); this.value=this.value.replace(/[^a-zA-Z0-9]/g, '');" maxlength="16"/>
				<span id="same"></span>
			</td>
	</tr>
	<tr>
	</tr>
	<tr>
		<th>이름</th>
			<td>
				<input type="text" id="customer_name" name="customer_name" maxlength="14" onkeyup="this.value=this.value.replace(/[^a-zA-Z가-힣]/g, '');"/>
			</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
			<td>
				<input style="width:70px;" type="text" id="birth_b" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> -
				<input style="width:70px;" type="text" id="birth_e" maxlength="7" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/>
				<input type="hidden" name="customer_socialNum" id="customer_socialNum"/>
			</td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
			<td>
				<select id="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
				</select> -
<!-- 				<input class="phone" type="text" id="phone1" maxlength="3" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> - -->
				<input class="phone" type="text" id="phone2" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> -
				<input class="phone" type="text" id="phone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/>
				<input type="hidden" name="phone" id="name"/>
			</td>
	</tr>
	<tr>
		<th>이메일</th>
			<td>
				<input style="width:200px;" type="text" id="customer_id" maxlength="30"/>
				<select id="customer_domain">
					<option value="">선택하세요</option>
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
					<option value="1">직접입력</option>
				</select>
				<input type="hidden" id="customer_email" name="customer_email"/>
			</td>
					
					
	</tr>
	<tr>
		<th>주소</th>
			<td><input style="width: 60px;" type="text" name="customer_postcode" id="customer_postcode" placeholder="우편번호" readonly="readonly"/>
					<a onclick="execPostCode()" class="btn-fill-s">우편번호 찾기</a></td>
	</tr>
	<tr>
		<th></th>
			<td><input style="width: 400px;" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly="readonly"/>
				<input style="width: 330px;" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"/></td>
	</tr>
	</table>
</form>

<div style="width: 90px; height: 50px; margin: 50px auto;">
	<a class="btn-fill" onclick="location='insert.cu'">등록</a>
	<a class="btn-empty" onclick="history.back()">취소</a>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
// 유효성검사
function validate(){
	var phone2 = /^\d{3,4}$/;
	var phone3 = /^\d{4}$/;
	
	if( $('#customer_id').val() == '' ){
		alert('아이디를 입력해주세요');
		$('#customer_id').focus();
		return;
// 	}else if( $('#customer_id').val().length < 6 ){
// 		alert('아이디가 너무 짧습니다');
// 		$('#customer_id').focus();
// 		return;
// 	}else if( $('#customer_pw').val() == '' ){
// 		alert('비밀번호를 입력해주세요');
// 		$('#customer_pw').focus();
// 		return;
// 	}else if( $('#customer_pw').val().length < 6 ){
// 		alert('비밀번호가 너무 짧습니다');
// 		$('#customer_pw').focus();
// 		return;
// 	}else if( $('#customer_pw').val() != $('#customer_pwCk').val() ){
// 		alert('비밀번호가 서로 다릅니다');
// 		$('#customer_pw').focus();
// 		return;
// 	}else if( $('#customer_name').val() == '' ){
// 		alert('이름을 입력해주세요');
// 		$('#customer_name').focus();
// // 		return;
// 	}else if( $('#birth_b').val() == '' || $('#birth_e').val() == '' ){
// 		alert('주민등록번호를 입력해주세요');
// 		$('#birth_e').focus();
// 		return;
// 	}else if( $('#birth_b').val().length != 6 || $('#birth_e').val().length != 7 ){
// 		alert('주민등록번호가 올바르지 않습니다');
// 		$('#birth_e').focus();
// 		return;
// 	}else if( $('#phone2').val() == '' || $('#phone3').val() == '' ){
// 		alert('휴대폰 번호를 입력해주세요');
// 		$('#phone3').focus();
// 		return;
// 	}else if( !phone2.test( $('#phone2').val() ) ) {            
//         alert('전화번호 가운데번호는 3자리 또는 4자리');
// 		$('#phone2').focus();
//         return;
// 	}else if( !phone3.test( $('#phone3').val() ) ) {            
//         alert('전화번호 마지막 자리는 4자리');
// 		$('#phone3').focus();
//         return;
	}
}

function usable(){
	$.ajax({
		type: 'post',
		data: {customer_id : $('#customer_id').val() },
		url : '/usable.cu',
		success: function(data){
			console.log(data.customer_id);
		},error: function(req, status){
			alert(customer_id);
			alert('실패');
		}
	})
}

// 비밀번호, 비밀번호확인 값이 같은지 체크
function isSame(){
	var pw = $('#customer_pw').val();
	var pwCk = $('#customer_pwCk').val();
	
	if( pw != '' && pwCk != '' ){
		if( pw == pwCk ){
			$('#same').html('비밀번호가 일치합니다');
			$('#same').css('font-size', '7px');
			$('#same').css('color', 'green');
		}else{
			$('#same').html('비밀번호가 일치하지 않습니다');
			$('#same').css('font-size', '7px');
			$('#same').css('color', 'red');
		}
	}
}

// 우편번호 API
function execPostCode(){
	new daum.Postcode({
		oncomplete: function(data){
			//우편번호 찾기 버튼을 눌렀을 때
			
			var post, address;
			if ( data.userSelectedType == 'J' ){
				post = data.postcode;
				address = data.jibunAddress;
			}else {
				post = data.zonecode;
				address = data.roadAddress;
				var extra = '';
				if( data.buildingName !=''){	//건물 이름이 있으면
					extra = address += data.buildingName;	//넣어주고
				}
				address += extra=='' ? '' : '(' + extra + ')';
			}	
			
			//우편번호와 주소 정보를 해당 필드에 넣는다.
			$('#customer_postcode').val(post);	//5자리 새 우편번호 사용
			$('#roadAddress').val(address);
			$('#detailAddress').focus();
		}
	}).open();
}
</script>
</body>
</html>