$(function(){
	// thumbNail 변경 유무 - delete 파라미터
	$('#thumbNail').change(function(){
		$('#delete').val(1);
	})
	
	$('#thumbNailMo').change(function(){
		$('#delete').val(2);
	})
	
	// 수정화면에서 DB에 저장된 카테고리 불러오기
	if ( $('#product_category').val() != null ){
		var value = $('#hiddenCat').val();		// hidden 값에 DB에 저장 된 값을 넣어놓고
		$('#product_category').val(value);		// 실제 DB에 저장 할 값에 넣어줘서 select option 에 선택되게 한다
	}

	$('#list ul li').on('click', function(){
	var cate_val = $(this).text();
	
	$('#cate_val').val(cate_val);
	$('#list').attr('action', 'list.pd');
	$('#list').submit();
	
	})
})


// 등록, 수정처리
function go_submit(){
	var price_c = $('#product_price_c').val();
	var price = price_c.split(',');
	var result = '';
	
	for(var i=0; i<price.length; i++){
//		alert(price[i]);
		result += price[i];
	}
	
	$('#product_price').val(result);
	
	if( $('#delete').val() == 0 ){
		alert('대표사진을 넣어주세요');
		return false;
	}
	if( $('#product_name').val() == '' ){
		alert('상품명을 입력해주세요');
		$('#product_name').focus();
		return false;
	}
	if( price_c == '' ){
		alert('가격을 입력해주세요');
		$('#product_price_c').focus();
		return false;
	}
	$('form').submit();
}

// 수량 증가버튼
function quantityUp(){
	var cnt = parseInt($('#quantity').val());
	var cntAdd = cnt+1;
	var quantity = $('#quantity').val();
	
	//total 금액도 변경하기 위한 변수
	var product_price = $('#product_price').val();
	var productCnt = parseInt( $('#quantity').val() ) +1;
	
	$('#quantity').attr('value', cntAdd );				// + 버튼 누를 시 수량 증가
	$('#totalVal').text( product_price * productCnt );	// total 가격 변경해주는 처리
	$('#totalCnt').text(cntAdd);						// total 수량 변경해주는 처리

	// total 금액 콤마(,) 찍기
	var money = $('#totalVal').text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $('#totalVal').text(split);
//	alert(money.text());
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
	
}

// 수량 감소버튼
function quantityDown(){
	var cnt = parseInt($('#quantity').val());
	var cntMin = cnt-1;
	var quantity = $('#quantity').val();
	
	//total 금액도 변경하기 위한 변수
	var product_price = $('#product_price').val();
	var productCnt = parseInt( $('#quantity').val() ) -1;
	
	if( quantity == 1 ){
		alert('수량은 0보다 작을 수 없습니다');
		return;
	}
	
	$('#quantity').attr('value', cntMin );				// - 버튼 누를 시 수량 감소
	$('#totalVal').text( product_price * productCnt );	// total 가격 변경해주는 처리
	$('#totalCnt').text(cntMin);						// total 수량 변경해주는 처리
	
	// total 금액 콤마(,) 찍기
	var money = $('#totalVal').text();
	var split = money.split(/(?=(?:\d{3})+(?:\.|$))/g).join(',');
	money = $('#totalVal').text(split);
	
//	$('#totalVal').text($('#totalVal').text().split(/(?=(?:\d{3})+(?:\.|$))/g).join(','));		// 위 세줄을 이렇게 한줄로도 표현 가능
}

function autoComma(obj) {
    var deleteComma = obj.value.replace(/[^,a-zA-Z가-힣]/g, '');		// 숫자만 입력되게
   
    // 입력된 값에 콤마(,) 삽입 함수 호출
    obj.value = insertComma(removeComma(obj.value));
}

// 천단위 이상의 숫자에 콤마(,)를 삽입
function insertComma(str) {

    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

// 콤마(,)가 들어간 값에 콤마를 제거하는 함수
function removeComma(str) {

    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function deleteImg(o){
//	alert($(o).closest('img').attr('src'));
}