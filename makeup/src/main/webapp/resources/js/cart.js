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

//수량 증가버튼
function ct_quantityUp(o){
	var cnt = parseInt($(o).parent().prev().val());
	var cntAdd = cnt+1;
	
	//total 금액도 변경하기 위한 변수
//	var product_price = $('#product_price').val();
	var product_price = $(o).parent().parent().parent().prev().text();
//	var productCnt = parseInt($(o).parent().prev().val())+1;
	
	$(o).parent().prev().attr('value', cntAdd );		// + 버튼 누를 시 수량 증가
	$(o).parent().parent().parent().next().next().children().text( product_price * cntAdd );	// total 가격 변경해주는 처리
//	$('#totalCnt').text(cntAdd);						// total 수량 변경해주는 처리
//
//	// total 금액 콤마(,) 찍기
	var money = $('#totalVal').text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $('#totalVal').text(split);
//	alert(money.text());
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
	
}

//수량 감소버튼
function ct_quantityDown(o){
	var cnt = parseInt($(o).parent().next().val());
	var cntMin = cnt-1;
	
	//total 금액도 변경하기 위한 변수
	var product_price = $('#product_price').val();
	var productCnt = parseInt($(o).parent().next().val())-1;
	
	if( cnt == 1 ){
		alert('수량은 0보다 작을 수 없습니다');
		return;
	}
	
	$(o).parent().next().attr('value', cntMin );				// - 버튼 누를 시 수량 감소
	$('#totalVal').text( product_price * productCnt );	// total 가격 변경해주는 처리
	$('#totalCnt').text(cntMin);						// total 수량 변경해주는 처리
	
	// total 금액 콤마(,) 찍기
	var money = $('#totalVal').text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $('#totalVal').text(split);
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
}