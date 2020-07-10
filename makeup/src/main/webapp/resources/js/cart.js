$(document).ready(function(){
	$('#list-allCheck').click();	// 장바구니 전체 선택
	
	var a = '';
	var c = 0;
	$('.totalVal').each(function(idx){
		a = $('.totalVal:eq('+idx+')').text().split(',');
		var b = ''; 
		
		for( var i=0; i<a.length; i++){
			b += a[i];
		}

		var c1 = parseInt(b);
		c += c1;
	})
	$('#pdPrice').text(c);		//총 주문금액 출력

	// total 금액 콤마(,) 찍기
	var pdPrice = $('#pdPrice').text();
	var split = pdPrice.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	pdPrice = $('#pdPrice').text(split);
	
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

	// 물품 하나에 대한 개별 물품당 합계 금액 콤마(,) 찍기
	var money = $(o).parent().parent().parent().next().next().children().text();	// 현재 입력 되어 있는 합계금액 찾기
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');					// 숫자 3개 단위로 콤마 넣는 정규식
	money = $(o).parent().parent().parent().next().next().children().text(split);	// 합계 금액에 콤마 삽입
	
//	$('.totalVal').text($('.totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
	
	// 상품들의 총 합계 금액 변경
	var addPrice = $(o).parent().parent().parent().prev().text().split(',');		// 더하려는 금액 찾아서 콤마 없애기
	var addPriceSpl = '';							// 배열에 담김    ex) 27,000 => ['27', '000']
	
	for(var i=0; i<addPrice.length; i++){
		addPriceSpl += addPrice[i];
	}
	var addPriceVal = parseInt(addPriceSpl);		// String 타입의 금액을 int형으로 변환
	
	var pdPrice =$('#pdPrice').text().split(',');	// 기존 상품들의 총 합계 금액 찾아서 콤마 없애기
	var pdPriceSpl = '';							// 배열에 담김    ex) 27,000 => ['27', '000']
	
	for(var i=0; i<pdPrice.length; i++){
		pdPriceSpl += pdPrice[i];
	}
	var pdPriceVal = parseInt(pdPriceSpl);			// String 타입의 금액을 int형으로 변환
	
	var TotalValStr = pdPriceVal + addPriceVal;		// 총 합계 + 수량증가 한 상품 1개 가격을 더하는 처리
	
	$('#pdPrice').text(TotalValStr);				// 총 합계 금액 바꿔주는 처리
	var realTotalVal = $('#pdPrice').text();		// 총 합계 금액을 찾아서
	var TotalPriceSpl = realTotalVal.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');	// 숫자 3개 단위로 콤마 넣는 정규식
	$('#pdPrice').text(TotalPriceSpl);				// 합계 금액에 콤마 삽입
	
	
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
	
	// 물품 하나에 대한 개별 물품당 합계 금액 콤마(,) 찍기
	var money = $(o).parent().parent().parent().next().next().children().text();		// 현재 입력 되어 있는 합계금액 찾기
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');						// 숫자 3개 단위로 콤마 넣는 정규식
	money = $(o).parent().parent().parent().next().next().children().text(split);		// 합계 금액에 콤마 삽입
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
	
	// 상품들의 총 합계 금액 변경
	var minPrice = $(o).parent().parent().parent().prev().text().split(',');		// 빼려는 금액 찾아서 콤마 없애기
	var minPriceSpl = '';							// 배열에 담김    ex) 27,000 => ['27', '000']
	
	for(var i=0; i<minPrice.length; i++){
		minPriceSpl += minPrice[i];
	}
	var minPriceVal = parseInt(minPriceSpl);		// String 타입의 금액을 int형으로 변환
	
	var pdPrice =$('#pdPrice').text().split(',');	// 기존 상품들의 총 합계 금액 찾아서 콤마 없애기
	var pdPriceSpl = '';							// 배열에 담김    ex) 27,000 => ['27', '000']
	
	for(var i=0; i<pdPrice.length; i++){
		pdPriceSpl += pdPrice[i];
	}
	var pdPriceVal = parseInt(pdPriceSpl);			// String 타입의 금액을 int형으로 변환
	
	var TotalValStr = pdPriceVal - minPriceVal;		// 총 합계 - 수량감소 한 상품 1개 가격을 빼는 처리
	
	$('#pdPrice').text(TotalValStr);				// 총 합계 금액 바꿔주는 처리
	var realTotalVal = $('#pdPrice').text();		// 총 합계 금액을 찾아서
	var TotalPriceSpl = realTotalVal.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');	// 숫자 3개 단위로 콤마 넣는 정규식
	$('#pdPrice').text(TotalPriceSpl);				// 합계 금액에 콤마 삽입
}