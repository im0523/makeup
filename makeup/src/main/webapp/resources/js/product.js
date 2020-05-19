// 수량 증가버튼
function quantityUp(){
	var cnt = parseInt($('#quantity').val());
	var cntAdd = cnt+1;
	var quantity = $('#quantity').val();
	
	$('#quantity').attr('value', cntAdd );
}

// 수량 감소버튼
function quantityDown(){
	var cnt = parseInt($('#quantity').val());
	var cntMin = cnt-1;
	var quantity = $('#quantity').val();
	
	if( quantity == 1 ){
		alert('수량은 0보다 작을 수 없습니다');
		return;
	}
	
	$('#quantity').attr('value', cntMin );
}

function comma(obj) {
    var regx = new RegExp(/(-?\d+)(\d{3})/);
    var bExists = obj.indexOf(".", 0);//0번째부터 .을 찾는다.
    var strArr = obj.split('.');
    while (regx.test(strArr[0])) {//문자열에 정규식 특수문자가 포함되어 있는지 체크
        //정수 부분에만 콤마 달기 
        strArr[0] = strArr[0].replace(regx, "$1,$2");//콤마추가하기
    }
    if (bExists > -1) {
        //. 소수점 문자열이 발견되지 않을 경우 -1 반환
        obj = strArr[0] + "." + strArr[1];
    } else { //정수만 있을경우 //소수점 문자열 존재하면 양수 반환 
        obj = strArr[0];
    }
    return obj;//문자열 반환
}