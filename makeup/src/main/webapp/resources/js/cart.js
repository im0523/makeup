$(document).ready(function(){
	$('#list-allCheck').click();	// 장바구니 전체 선택
	
	// 상품 총 합계 구하기
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
	
	// 50,000원 이상 배송비 무료
	if( c >= 50000 ){		// 총 상품 가격이 50,000원 이상일 때
		$('#deliveryFee').text('0');
		$('#cartTotalPr').text($('#pdPrice').text());
	}else if( c == 0 ){		// 총 상품 가격이 0원일 때
		$('#deliveryFee').text('0');
	}else{					// 총 상품 가격이 50,000원 미만일 때
		$('#deliveryFee').text('2,500');
		
		$('#cartTotalPr').text(c+2500);	// 총 합계는 = 상품가격 + 배송비
		var totalSpl = $('#cartTotalPr').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');		// 총합계에 콤마(,) 삽입
		$('#cartTotalPr').text(totalSpl);
	}
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
	
	// 해당 물품을 선택하지 않은 상태에서 수량증가 버튼을 눌렀을 경우, 개당 총 금액은 변하지만 총 상품금액 합계는 변하지 않는다
	var state = $(o).parent().parent().parent().prev().prev().prev().prev().children();
	if( state.is(':checked') ){
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
		
		// 50,000원 이상 배송비 무료
		if( realTotalVal >= 50000 ){
			$('#deliveryFee').text('0');
			$('#cartTotalPr').text($('#pdPrice').text());
		}else{
			$('#deliveryFee').text('2,500');
			
			$('#cartTotalPr').text(parseInt(realTotalVal)+2500);	// 총 합계는 = 상품가격 + 배송비
			var totalSpl = $('#cartTotalPr').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');		// 총합계에 콤마(,) 삽입
			$('#cartTotalPr').text(totalSpl);
		}
	}
	
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
	
//$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
	
	// 해당 물품을 선택하지 않은 상태에서 수량감소 버튼을 눌렀을 경우, 개당 총 금액은 변하지만 총 상품금액 합계는 변하지 않는다
	var state = $(o).parent().parent().parent().prev().prev().prev().prev().children();
	if( state.is(':checked') ){
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
		
		// 50,000원 이상 배송비 무료
		if( realTotalVal >= 50000 ){
			$('#deliveryFee').text('0');
			$('#cartTotalPr').text($('#pdPrice').text());
		}else{
			$('#deliveryFee').text('2,500');
			
			$('#cartTotalPr').text(parseInt(realTotalVal)+2500);	// 총 합계는 = 상품가격 + 배송비
			var totalSpl = $('#cartTotalPr').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');		// 총합계에 콤마(,) 삽입
			$('#cartTotalPr').text(totalSpl);
		}
	}
}

function go_selectPd(o){
	var selectPrice = $(o).parent().next().next().next().next().next().next().children().text().split(',');
	var selectPriceSpl = '';
	
	for(var i=0; i<selectPrice.length; i++){
		selectPriceSpl += selectPrice[i];
	}
	var selectPrVal = parseInt(selectPriceSpl);
	
	var pdPrice =$('#pdPrice').text().split(',');	// 기존 상품들의 총 합계 금액 찾아서 콤마 없애기
	var pdPriceSpl = '';							// 배열에 담김    ex) 27,000 => ['27', '000']
	
	for(var i=0; i<pdPrice.length; i++){
		pdPriceSpl += pdPrice[i];
	}
	var pdPriceVal = parseInt(pdPriceSpl);			// String 타입의 금액을 int형으로 변환
	
	var realPrice = 0;
	if( $(o).is(':checked') ){		// 클릭한 체크박스가 체크 되어 있을 경우
		realPrice = pdPriceVal + selectPrVal;		// 총 합계금액에서 선택한 상품 총 금액만큼 더하는 처리
	}else{							// 클릭한 체크박스가 체크 해제 되어 있을 경우
		realPrice = pdPriceVal - selectPrVal;		// 총 합계금액에서 선택한 상품 총 금액만큼 빼는 처리
	}
	
	$('#pdPrice').text(realPrice);					// 총 합계 금액 바꿔주는 처리
	var realTotalVal = $('#pdPrice').text();		// 총 합계 금액을 찾아서
	var TotalPriceSpl = realTotalVal.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');	// 숫자 3개 단위로 콤마 넣는 정규식
	$('#pdPrice').text(TotalPriceSpl);				// 합계 금액에 콤마 삽입
//	alert($(o).parent().next().next().next().next().next().next().children().text());
	
	// 총 상품 가격 : 50,000원 이상 배송비 무료
	if( realTotalVal >= 50000 ){
		$('#deliveryFee').text('0');
		$('#cartTotalPr').text($('#pdPrice').text());
	}else if( realTotalVal == 0 ){
		$('#deliveryFee').text('0');
		$('#cartTotalPr').text('0');
	}else{			// 총 상품 가격 : 50,000원 이하일 경우
		$('#deliveryFee').text('2,500');	// 배송비 2500원
		
		$('#cartTotalPr').text(parseInt(realTotalVal)+2500);	// 총 합계는 = 상품가격 + 배송비
		var totalSpl = $('#cartTotalPr').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');		// 총합계에 콤마(,) 삽입
		$('#cartTotalPr').text(totalSpl);
	}
}

function go_selectPdAll(){
	if( $('#list-allCheck').is(':checked') ){		// 전체선택 되어 있을 경우
		// 총 상품가격 구하는 처리
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
		
		// 50,000원 이상 배송비 무료
		if( c >= 50000 ){
			$('#deliveryFee').text('0');
			$('#cartTotalPr').text($('#pdPrice').text());
		}else{
			$('#deliveryFee').text('2,500');
		}
	}else{
		$('#pdPrice').text('0');		// 전체선택 해제 되어 있을 경우
		$('#cartTotalPr').text('0');
	}
}

// 장바구니의 선택상품 삭제
function go_delCart(){
	var checkLength = $('.list-checkBox:checked').length;

	if( checkLength > 0 ){
		if( confirm('선택한 상품을 삭제하시겠습니까?') ){ 
			// name이 같은 체크박스의 값들을 배열에 담는다
			var checkArr = [];
			$('.list-checkBox:checked').each(function(idx){
				checkArr.push($('.list-checkBox:checked:eq('+idx+')').next().val());
			})
			
			$.ajax({
				url: 'delete.ct',
				type: 'post',
				dataType: 'json',
				data: {
					cart_id : checkArr
				},
				success:function(data){
					location.reload();
				},error:function(jqXHR, textStatus, errorThrown){
					alert('실패' + textStatus + ' : ' + errorThrown);
				}
			})
		}
	}else if( checkLength == 0 ){
		alert('삭제할 상품을 선택해주세요');
	}
}