$(function(){
	// 체크박스 전체선택 & 전체해제
	$('#list-allCheck').click(function(){
		if( $('#list-allCheck').prop('checked') ){
            $('input[type=checkbox]').prop('checked', true); 
        }else{
            $('input[type=checkbox]').prop('checked', false); 
        }
	})
	
	//체크박스 하나라도 해제되어 있을 시 전체선택 체크박스도 해제
	$('.list-checkBox').click(function(){
		if( $('.list-checkBox:checked').length == $('.list-checkBox').length ){		// 체크박스에 체크된 갯수가 체크박스 전체갯수 숫자와 같으면
			$('#list-allCheck').prop('checked', true);		// allCheck 체크박스도 체크를 하고
		}else {
			$('#list-allCheck').prop('checked', false);		// 그렇지 않으면 allCheck 체크박스도 체크를 해제
		}
	})
})


// 아이디 중복체크
function usable(){
	$.ajax({
		type: 'post',
		url : 'id_usable',
		data: {customer_id : $('#customer_id').val() },
		dataType: 'json',
		success: function(data){
			
			if( $('#customer_id').val() == '' ){
				alert('아이디를 입력해주세요');
				$('#customer_id').focus();
				return;
			}else if( $('#customer_id').val().length < 5 ){
				alert('아이디가 너무 짧습니다');
				$('#customer_id').focus();
				return;
			}
// 			alert(data);
			
			if( data == true ){
				alert('사용 가능한 아이디입니다');
				$('#usable').val('1');
			}else{
				alert('이미 사용중인 아이디입니다');
				$('#usable').val('0');
			}
			
		},error: function(data, req, status){
			alert('실패');
		}
	})
}

// 입력한 id 값에 변경이 생길 시 #usable 값을 0으로
function id_usable(){
	$('#usable').val('0');
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
			$('#customer_postCode').val(post);	//5자리 새 우편번호 사용
			$('#customer_address').val(address);
			$('#customer_detailAddress').val('');
			$('#customer_detailAddress').focus();
		}
	}).open();
}

// 회원 등록 버튼 클릭시
function go_insert(){
	var check = validate();
	
	if(check == false){
		return;
	}
	
	if( $('#usable').val() == 1){
		addData();
		
		$('.insertForm').submit();
		alert('회원가입 성공!');
	}
}

// 주민등록번호, 전화번호, 이메일 각각 합쳐서 하나의 data로 저장
function addData(){
	var socialNum = $('#birth_b').val() + $('#birth_e').val();
	var phone = $('#phone1').val() + '-' +$('#phone2').val() + '-' + $('#phone3').val();
	var email = $('#customer_emailId').val() + $('#customer_domain').val();
	
	$('#customer_phone').val(phone);
	$('#customer_socialNum').val(socialNum);

	if( $('#customer_domain').val() == '1' ){
		$('#customer_email').val(  $('#customer_emailId').val()  );
	}else{
		$('#customer_email').val(email);
	}
}

// 회원 정보수정 버튼 클릭시
function go_update(){
	var check = validate();
	
	if( check == false ){
		return;
	}

	addData();
	
	$('.updateForm').submit();
	alert('회원정보가 변경되었습니다');
}

// 로그인 처리
function go_login(){
	var id = $('#customer_id').val();
	var pw = $('#customer_pw').val();
	
	if( id == '' ){
		alert('아이디를 입력해주세요');
		$('#customer_id').focus();
		return;
	}else if( pw == '' ){
		alert('비밀번호를 입력해주세요');
		$('#customer_pw').focus();
		return;
	}
	
	$.ajax({
		type: 'post',
		url: 'loginCheck',
		data: {
			customer_id: id,
			customer_pw: pw
		},
		success: function(data){
			if( data == 1){
				window.location=document.referrer;	// 이전 화면으로 가는 처리
			}else{
				alert('비밀번호가 맞지 않습니다');
			}
		},error: function(){
			alert('실패');
		}
	});
}

// 로그아웃 처리
function go_logout(){
	$.ajax({
		url: 'logout',
		success: function(){
			
			if( $('#adminCheck').val() == 'admin' ){	// 로그아웃이 성공하면
				location.href = '/makeup';		// 관리자일 경우에는 초기 화면으로 돌아가고
			}else{
				location.reload();				// 일반 회원일 경우에는 현재 페이지로
			}
			
		},error: function(req, text){
			alert(text + ': ' + req.status);
		}
	});
}

// 고객 검색
function go_search(){
	alert('조회');
}

// 고객 탈퇴
function customer_delete(){
	$('.list-checkBox:checked').each(function(){
		var customer_id = $(this).parent().find('input:last').val();	// 체크된 id값 가져오는 처리
		
		$.ajax({
			url: 'delete.cu',
			data: {customer_id : customer_id},
			success: function(data){
				location.reload();
			},error: function(req, text){
				alert('실패');
			}
		})
	})
	
}