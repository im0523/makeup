$(document).ready(function(){
	$('#list-allCheck').click();	// 장바구니 전체 선택
	
//	alert($('.totalVal').text());
//	
//	$('.totalVal').each(function(){
//		alert($('.totalVal').text())
//	})
})

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
	var product_price = $(o).parent().parent().parent().prev().text().split(',');	// 상품 1개당 가격
	var priceSpl = '';
	
	for( var i=0; i<product_price.length; i++){
		priceSpl += product_price[i];
	}
	
	$(o).parent().prev().attr('value', cntAdd );		// + 버튼 누를 시 수량 증가
	$(o).parent().parent().parent().next().next().children().text( priceSpl * cntAdd );	// total 가격 변경해주는 처리

//	// total 금액 콤마(,) 찍기
	var money = $(o).parent().parent().parent().next().next().children().text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $(o).parent().parent().parent().next().next().children().text(split);
//	alert(money.text());
	
//	$('.totalVal').text($('.totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
}

//수량 감소버튼
function ct_quantityDown(o){
	var cnt = parseInt($(o).parent().next().val());
	var cntMin = cnt-1;
	
	//total 금액도 변경하기 위한 변수
	var product_price = $(o).parent().parent().parent().prev().text().split(',');	// 상품 1개당 가격
	var priceSpl = '';
	
	for( var i=0; i<product_price.length; i++){
		priceSpl += product_price[i];
	}
	
	if( cnt == 1 ){
		alert('수량은 0보다 작을 수 없습니다');
		return;
	}
	
	$(o).parent().next().attr('value', cntMin );				// - 버튼 누를 시 수량 감소
	$(o).parent().parent().parent().next().next().children().text( priceSpl * cntMin );	// total 가격 변경해주는 처리
	
	// total 금액 콤마(,) 찍기
	var money = $(o).parent().parent().parent().next().next().children().text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $(o).parent().parent().parent().next().next().children().text(split);
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
}