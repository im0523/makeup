<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보 수정</h2>
<form class="updateForm" action="update.cu">
	<table>
	<tr>
		<th>아이디</th>
			<td>${vo.customer_id }
				<input type="hidden" name="customer_id" value="${vo.customer_id }"/>
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
				<input type="text" id="customer_name" name="customer_name" maxlength="14" onkeyup="this.value=this.value.replace(/[^a-zA-Z가-힣]/g, '');"
						value="${vo.customer_name }"/>
			</td>
	</tr>
	<tr>
		<th>주민등록번호</th>
			<td>
				<input style="width:70px;" type="text" id="birth_b" maxlength="6" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"
						value="${fn:substring(vo.customer_socialNum, 0, 6) }"/> -
				<input style="width:70px;" type="text" id="birth_e" maxlength="7" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"
						value="${fn:substring(vo.customer_socialNum, 6, 13) }"/>
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
				<input class="phone" type="text" id="phone2" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/> -
				<input class="phone" type="text" id="phone3" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g, '');"/>
				<input type="hidden" name="customer_phone" id="customer_phone" value="${vo.customer_phone }"/>
			</td>
	</tr>
	<tr>
		<th>이메일</th>
			<td>
				<input style="width:200px;" type="text" id="customer_emailId" maxlength="28" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@_-.]/g, '');"/>
				<select id="customer_domain">
					<option value="">선택하세요</option>
					<option>@naver.com</option>
					<option>@gmail.com</option>
					<option>@daum.net</option>
					<option value="1">직접입력</option>
				</select>
				<input type="hidden" id="customer_email" name="customer_email" value="${vo.customer_email }"/>
			</td>
					
					
	</tr>
	<tr>
		<th>주소</th>
			<td>
				<input style="width: 60px;" type="text" name="customer_postCode" id="customer_postCode" placeholder="우편번호" readonly="readonly"
						value="${vo.customer_postCode }"/>
					<a onclick="execPostCode()" class="btn-fill-s">우편번호 찾기</a></td>
	</tr>
	<tr>
		<th></th>
			<td>
				<input style="width: 470px;" type="text" name="customer_address" id="customer_address" placeholder="도로명주소" readonly="readonly"
						value="${vo.customer_address }"/>
				<input style="width: 260px;" type="text" name="customer_detailAddress" id="customer_detailAddress" placeholder="상세주소"
						value="${vo.customer_detailAddress }"/>
			</td>
	</tr>
	</table>
</form>

<div style="width: 90px; height: 50px; margin: 50px auto;">
	<a class="btn-fill" onclick="go_update();">수정</a>
	<a class="btn-empty" onclick="history.back()">취소</a>
</div>
</body>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="js/validate.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/customer.js" charset="UTF-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 휴대폰번호 불러오기
	var phone = $('#customer_phone').val();
	var phoneSpl = phone.split('-');
	
	$('#phone1').val(phoneSpl[0]);
	$('#phone2').val(phoneSpl[1]);
	$('#phone3').val(phoneSpl[2]);
	
	// 이메일 불러오기
	var email = $('#customer_email').val();
	//email이 null이 아닐 때 @를 기준으로 나누고
	if( email != '' ){
		emailSpl = email.split('@');
	
		$('#customer_emailId').val(emailSpl[0]);
		$('#customer_domain').val('@'+emailSpl[1]);
	}
	
	// 이메일 도메인을 직접입력 했을 경우
	if( $('#customer_domain').val() == null) {
		$('#customer_domain').val('1');
		$('#customer_emailId').val(email);
	}
})
</script>
</html>