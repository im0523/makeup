// 장바구니 추가
function insert_cart(){
	var form = $('#insertForm').serialize();

	$.ajax({
		url: '/makeup/insert.ct',
		dataType: 'json',
		type: 'post',
		data: form,
		success: function(data){
			$('#addCart').css('display', 'block');
			$('#myModal').css('display', 'block');
		},error: function(jqXHR, textStatus, errorThrown){
			alert('실패');
		}
	})
}

// 계속 쇼핑하기 버튼 클릭 이벤트
function go_shopping(){
	$('#myModal').css('display', 'none');
}

// 로그인 한 사용자의 장바구니 목록 출력
function go_cartList(id){
	$('#insertForm').attr('action', 'list.ct');
	$('#insertForm').submit();
}