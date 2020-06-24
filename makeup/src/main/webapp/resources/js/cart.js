// 장바구니 추가
function insert_cart(){
	$('#addCart').css('display', 'block');
	$('#myModal').css('display', 'block');
	
	var form = $('#insertForm').serialize();

	$.ajax({
		url: '/makeup/insert.ct',
		dataType: 'text',
		type: 'post',
		data: form,
		success: function(data){
			alert(data);
//			alert(data.product_no);
//			alert(data.amount);
//			alert(data.cart_id);
		},error: function(jqXHR, textStatus, errorThrown){
			alert('실패');
		}
	})
}

// 계속 쇼핑하기 버튼 클릭 이벤트
function go_shopping(){
	$('#myModal').css('display', 'none');
}