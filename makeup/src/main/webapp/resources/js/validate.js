// 유효성검사
function validate(){
	var phone2 = /^\d{3,4}$/;
	var phone3 = /^\d{4}$/;
	
	if( $('#customer_pw').val() == '' ){
		alert('비밀번호를 입력해주세요');
		$('#customer_pw').focus();
		return false;
	}else if( $('#customer_pw').val().length < 6 ){
		alert('비밀번호가 너무 짧습니다');
		$('#customer_pw').focus();
		return false;
	}else if( $('#customer_pw').val() != $('#customer_pwCk').val() ){
		alert('비밀번호가 서로 다릅니다');
		$('#customer_pw').focus();
		return false;
	}else if( $('#customer_name').val() == '' ){
		alert('이름을 입력해주세요');
		$('#customer_name').focus();
		return false;
	}else if( $('#customer_name').val() == '관리자' ){
		alert('이름을 확인해주세요');
		$('#customer_name').focus();
		return false;
	}else if( $('#birth_b').val() == '' || $('#birth_e').val() == '' ){
		alert('주민등록번호를 입력해주세요');
		$('#birth_e').focus();
		return false;
	}else if( $('#birth_b').val().length != 6 || $('#birth_e').val().length != 7 ){
		alert('주민등록번호가 올바르지 않습니다');
		$('#birth_e').focus();
		return false;
	}else if( $('#phone2').val() == '' || $('#phone3').val() == '' ){
		alert('휴대폰 번호를 입력해주세요');
		$('#phone3').focus();
		return false;
	}else if( !phone2.test( $('#phone2').val() ) ) {            
        alert('전화번호 가운데번호는 3자리 또는 4자리');
		$('#phone2').focus();
        return false;
	}else if( !phone3.test( $('#phone3').val() ) ) {            
        alert('전화번호 마지막 자리는 4자리');
		$('#phone3').focus();
        return false;
	}
	
	return true;
}

//비밀번호, 비밀번호확인 값이 같은지 체크
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