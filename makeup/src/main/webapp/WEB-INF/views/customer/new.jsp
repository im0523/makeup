<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div_cate, table { width: 50%;}
.cate { font-size: 15px; color: #545454; font-weight: bold;}
table tr th { width: 120px;}
input { width: 150px;}
.radio { width: 10px; height: 10px; line-height: 10px;}
.phone { width: 30px;}
<link rel="stylesheet" type="text/css" href="css/style.css">
</style>
</head>
<body>
<h3>회원 등록</h3>
<form action="insert.cu" >

<div class="div_cate">
	<span class="cate">[ 인적사항 ]</span>
</div>
<table>
<tr>
	<th>아이디</th>
		<td><input onkeyup="$('#id_usable').val('n'); validate('id')" type="text" name="id"/>
			<a id="btn-usable" onclick="usable()" class="btn-fill-s">중복확인</a>
			<span style="font-size: 10px; color: #545454; margin-left: 30px;">대/소문자 구분</span></td>
</tr>
<tr>
	<th>패스워드</th>
		<td><input type="text" name="pwd"/>
	<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 30px;">패스워드 확인</span>
			<input type="text" name="pwd_ch"/></td>
</tr>
<tr>
</tr>
<tr>
	<th>이름</th>
		<td><input type="text" name="name"/></td>
</tr>
<tr>
	<th>주민등록번호</th>
		<td><input style="width:70px;" type="text" name="birth_b"/> -
			<input style="width:70px;" type="text" name="birth_e"/></td>
</tr>
<tr>
	<th>휴대폰 번호</th>
		<td><input class="phone" type="text" name="phone"/> -
			<input class="phone" type="text" name="phone"/> -
			<input class="phone" type="text" name="phone"/></td>
</tr>
<tr>
	<th>성별</th>
		<td><label style="font-size: 13px;"><input class="radio" type="radio" name="gender" value="남"/>남</label>
			<label style="font-size: 13px;"><input class="radio" type="radio" name="gender" value="여"/>여</label></td>
</tr>
<tr>
	<th>이메일</th>
		<td><input style="width:230px;"type="text" name="email"/></td>
</tr>
<tr>
	<th>주소</th>
		<td><input style="width: 60px;" type="text" name="postcode" id="postcode" placeholder="우편번호" readonly="readonly"/>
				<a onclick="execPostCode()" class="btn-fill-s">우편번호 찾기</a></td>
</tr>
<tr>
	<th></th>
		<td><input style="width: 400px;" type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly="readonly"/>
			<input style="width: 330px;" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소"/></td>
</tr>
</table>

<div class="div_cate">
	<span class="cate">[ 학력사항 ]</span>
</div>
<table>
<tr>
	<th>졸업년월</th>
		<td><input type="text" name="graduate_h" style="width: 100px;"/>
			<input type="text" name="schoolname_h" style="margin-left: 70px;"/>
	<span style="font-size: 10px; color: #545454; font-weight: lighter;">고등학교</span>
	<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 50px;">소재지</span>
			<input type="text" name="location_h" style="width: 100px;"/></td>
</tr>
<tr>
	<th>졸업년월</th>
		<td><input type="text" name="graduate_u" style="width: 100px;"/>
			<input type="text" name="schoolname_u" style="margin-left: 70px;"/>
	<span style="font-size: 10px; color: #545454; font-weight: lighter;">대학교</span>
	<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 59px;">소재지</span>
			<input type="text" name="location_u" style="width: 100px;"/></td>
</tr>
<tr>
	<th>졸업년월</th>
		<td><input type="text" name="graduate_h" style="width: 100px;"/>
			<input type="text" name="schoolname_h" style="margin-left: 70px;"/>
	<span style="font-size: 10px; color: #545454; font-weight: lighter;">대학원</span>
	<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 59px;">소재지</span>
			<input type="text" name="location_h" style="width: 100px;"/></td>
</tr>
</table>

<div class="div_cate">
	<span class="cate">[ 자격증 ]</span>
</div>

<table>
<tr>
	<th>자격증명</th>
		<td>
			<select>
				<option value="">종류</option>
				<option value="정보처리기능사">정보처리기능사</option>
				<option value="정보처리산업기사">정보처리산업기사</option>
				<option value="정보처리기사">정보처리기사</option>
			</select>
		
		<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 50px;">취득일</span>
		<input type="text" name="location_h"/>
		<span class="btn-fill-s" style="margin-left: 250px;">추가</span>
		</td>
</tr>
</table>

<div class="div_cate">
	<span class="cate">[ 교육사항 ]</span>
</div>

<table>
<tr>
	<th>기간</th>
		<td><input type="text" name="period_edu"/>
		<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 20px;">기관명</span>
			<input type="text" name="organization"/>
		<span style="font-size: 10px; color: #545454; font-weight: lighter; margin-left: 20px;">내용</span>
			<input type="text" name="context_edu" style="width: 230px;"/>
			<span class="btn-fill-s" style="margin-left: 50px;">추가</span></td>
</tr>
</table>

<div class="div_cate">
	<span class="cate">[ 경력사항 ]</span>
</div>

<table>
<tr>
	<th>근무기간</th>
	<th>회사명</th>
	<th style="width: 100px;">역할</th>
	<th style="text-align: left;">직책</th>
</tr>

<tr>
	<td style="text-align: center;"><input type="text" name="hiredate_c" style="width: 80px;"/> - 
									<input type="text" name="resigndate_c" style="width: 80px;"/></td>
	<td style="text-align: center;"><input type="text" name="company_c"/></td>
	<td style="text-align: center;">
		<select>
			<option value="">선택</option>
			<option value="SI">SI</option>
			<option value="SM">SM</option>
			<option value="PL">PL</option>
			<option value="PM">PM</option>
			<option value="OP">OP</option>
		</select>
	</td>
	<td style="padding-left: 0px;">
		<select>
			<option value="">선택</option>
			<option value="사원">사원</option>
			<option value="주임">주임</option>
			<option value="대리">대리</option>
			<option value="과장">과장</option>
			<option value="차장">차장</option>
			<option value="부장">부장</option>
			<option value="팀장">팀장</option>
			<option value="이사">이사</option>
			<option value="상무">상무</option>
			<option value="대표">대표</option>
		</select>
		<span class="btn-fill-s" style="margin-left: 50px;">추가</span>
	</td>
</tr>
</table>

<div class="div_cate">
	<span class="cate">[ 스킬 ]</span>
</div>

<table style="width: 1250px;">
	<tr>
		<th style="width: 250px;">프로젝트명</th>
		<th style="width: 160px;">참여기간</th>
		<th style="width: 80px;">고객사</th>
		<th style="width: 80px;">근무회사</th>
		<th style="width: 30px;">역할</th>
		<th style="width: 40px;">언어</th>
		<th style="width: 40px;">DBMS</th>
		<th style="width: 40px;">OS</th>
		<th style="width: 40px;">TOOL</th>
		<th style="width: 40px;">통신</th>
		<th style="width: 40px;">기타</th>
		<th style="width: 30px;"></th>
	</tr>
	
	<tr>
		<td style="text-align: center;"><input type="text" style="width: 250px;" name="project"/></td>
		<td style="padding: 0px;"><input type="text" name="hiredate_s" style="width: 80px;"/> - 
									<input type="text" name="resigndate_s" style="width: 80px;"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 80px;" name="client"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 80px;" name="company_s"/></td>
		<td style="text-align: center; padding:0px;">
			<select name="position_s">
				<option value="">선택</option>
				<option value="SI">SI</option>
				<option value="SM">SM</option>
				<option value="PL">PL</option>
				<option value="PM">PM</option>
				<option value="OP">OP</option>
			</select>
		</td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="language"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="dbms"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="os"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="tool"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="communication"/></td>
		<td style="text-align: center; padding:0px;"><input type="text" style="width: 45px;" name="etc"/></td>
		<td><span class="btn-fill-s">추가</span></td>
	</tr>
</table>
</form>

<div style="width: 90px; height: 50px; margin: 50px auto;">
	<a class="btn-empty" onclick="history.back()">취소</a>
	<a class="btn-fill" onclick="location='insert.cu'">등록</a>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function usable(){
	var data = validate('id');
	if( data.code != 'valid' ){	//중복확인 불필요
		alert ( data.desc );
		return;
	}
}

function execPostCode(){
	new daum.Postcode({
		oncomplete: function(data){
			//우편번호 찾기 버튼을 눌렀을 때
			
			var fullRoadAddr = data.roadAddress;	//도로명 주소 변수
			var extraRoadAddr = '';		//도로명 조합형 주소 변수
			
			//법정 동명이 있을 경우 추가한다. (법정 리는 제외)
			//법정 동의 경우 마지막 문자가 "/동/로/가"로 끝난다.
			if( data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraRoadAddr += data.bname;
			}
			
			//건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName !=='' && data.apartment ==='Y'){
				extraRoadAddr += (extraRoadAddr !=='' ? ', ' + data.buildingName : data.buildingName);
			}
			//도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr !==''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			//도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr !==''){
				fullRoadAddr += extraRoadAddr;
			}
			
			//우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;	//5자리 새 우편번호 사용
			document.getElementById('roadAddress').value = fullRoadAddr;
			document.getElementById('detailAddress').focus();
		}
	}).open();
}
</script>
</body>
</html>