<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--카드결제 -->
	<div id="card">
		<table>
			<tr>
				<th>카드구분</th>
				<td>
					<label><input type="radio" name="cardType" value="person">&nbsp;&nbsp;개인카드</label>
					<label><input type="radio" name="cardType" value="company">&nbsp;&nbsp;법인카드</label>
				</td>
			</tr>
			<tr>
				<th>카드선택</th>
				<td>
					<select>
	  					<option>--선택해주세요.--</option>
	 					<option value="국민">국민</option>
	 					<option value="비씨">비씨</option>
	 					<option value="신한">신한</option>
	 					<option value="현대">현대</option>
	 					<option value="삼성">삼성</option>
	 					<option value="롯데">롯데</option>
	 					<option value="외환">외환</option>
	 					<option value="NH">NH</option>
	 					<option value="하나">하나</option>
	 					<option value="우리">우리</option>
	 					<option value="광주">광주</option>
	 					<option value="수협">수협</option>
	 					<option value="씨티">씨티</option>
	 					<option value="전북">전북</option>
	 					<option value="제주">제주</option>
	 					<option value="카카오뱅크">카카오뱅크</option>
	 					<option value="케이뱅크">케이뱅크</option>
					</select>
				</td>		
			</tr>
		</table>
	</div>
	
	<!--무통장 입금  -->
	<div id="account">
		<table>
			<tr>
				<th>입금은행</th>
				<td>
					<select name="bank">
	  					<option>--선택해주세요.--</option>
	 					<option value="농협">농협</option>
	 					<option value="국민은행">국민은행</option>
	 					<option value="신한은행">신한은행</option>
	 					<option value="우리은행">우리은행</option>
	 					<option value="기업은행">기업은행</option>
	 					<option value="KEB하나은행">KEB하나은행</option>
	 					<option value="대구은행">대구은행</option>
	 					<option value="부산은행">부산은행</option>
	 					<option value="우체국">우체국</option>
	 					<option value="스탠다드차타드">스탠다드차타드은행</option>
	 					<option value="광주은행">광주은행</option>
	 					<option value="경남은행">경남은행</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="accountNotice">
					<span>농협, 국민, 부산, SC, 우체국</span>은 ATM현금 입금 불가 (은행 창구, 인터넷 뱅킹 이용 가능)
				</td>
			</tr>
		</table>
	</div>
</body>
</html>