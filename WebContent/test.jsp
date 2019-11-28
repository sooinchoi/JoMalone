<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

.regex {
	color: salmon
}

.ec-base-box.typeThinBg {
	border-width: 1px;
	border-color: #ddd;
	background-color: #fafafa;
	display: inline-block;
}

.content {
	overflow: auto;
	height: 110px;
	padding: 20px;
	border: 1px solid #d5d5d5;
	background: #fff;
}

content>div {
	display: block;
}
</style>
</head>
<body>
	<form action="signup.sign" method="POST" id="signform">
		<div id="wrapper">
			<div class="title">회원 가입 정보 입력</div>
			<label>아이디 : </label><input type="text" name="id" id="id">
			<div class="id regex"></div>

			<label>패스워드 : </label><input type="password" name="pw" id="pw"><br>
			<div class="pw regex"></div>

			<label>패스워드확인 : </label><input type="password" id="repw"><br>
			<div class="repw regex"></div>

			<label>이름: </label><input type="text" name="name" id="name"><br>
			<div class="name regex"></div>

			<label>전화번호 : </label> <select name="phone1" id="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="017">018</option>
				<option value="017">019</option>
			</select> <input type="text" name="phone2" id="phone2"> <input
				type="text" name="phone3" id="phone3"><br>
			<div class="phone regex"></div>

			<label>이메일 : </label><input type="text" name="email1" id="email1">
			<select name="email2" id="email2">
				<option value="naver">@naver.com</option>
				<option value="daum">@daum.net</option>
				<option value="gmail">@gmail.com</option>
				<option value="input">직접입력<input type="text"
						placeholder="직접입력" name="email2 2"></option>
			</select>
			<div class="email regex"></div>

			<label>우편번호 :</label>
			<input type="text" id="postcode" placeholder="우편번호" name="zipcode"> 
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
			<label>주소1 : </label>
			<input type="text" id="address1" placeholder="도로명주소" name="address1"><br> 
			<label>주소2 : </label>
			<input type="text" id="address2" placeholder="상세주소" name="address2"><br> 
			
			
			<label>생년월일 :</label> 
			<select name="year" id="year">
				<option value="year">년</option>
			</select> <select name="month" id="month">
				<option value="month">월</option>
			</select> <select name="day" id="day">
				<option value="day">일</option>
				
			</select> <br> <label>성별 : </label> 
			<input type="radio" value="M" name="gender" id="gender"> 남 
			<input type="radio" value="F" name="gender" id="gender"> 여
		</div>

		<div class="ec-base-box typeThinBg gStrong">
			<p>
				<span class="ec-base-chk"><input type="checkbox"
					id="sAgreeAllChecked" ><em class="checkbox"></em></span><label
					for="sAgreeAllChecked"><strong>이용약관 및 개인정보수집 및 이용,
						쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label>
			</p>
		</div>

		<div class="ec-base-box typeThinBg agreeArea">
			<h3>[필수] 이용약관 동의</h3>
			<div class="content">
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제1조(목적)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">이
					약관은 '(주)어나더무드'(전자상거래 사업자)가 운영하는 커먼유니크(이하 “몰”이라 한다)에서 제공하는 인터넷 관련
					서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로
					합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">※「PC통신,
					무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제2조(정의)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①“몰”
					이란 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여
					재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②“이용자”란
					“몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이
					제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제3조
					(약관등의 명시와 설명 및 개정)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를
					포함), 전화번호,모사전송번호,전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알
					수 있도록 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록
					할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을
					이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					“몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법,
					정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수
					있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					“몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터
					적용일자 전일까지 공지합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">다만,
					이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은
					개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">⑤
					“몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된
					계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를
					원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이
					적용됩니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">⑥
					이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률,
					공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제4조(서비스의
					제공 및 변경)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 다음과 같은 업무를 수행합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					구매계약이 체결된 재화 또는 용역의 배송</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					기타 “몰”이 정하는 업무</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②“몰”은
					재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을
					변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을
					게시한 곳에 즉시 공지합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③“몰”이
					제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그
					사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④전항의
					경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는
					그러하지 아니합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제5조(서비스의
					중단)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을
					일시적으로 중단할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②“몰”은
					제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단,
					“몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③사업종목의
					전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로
					이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지
					아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로
					이용자에게 지급합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제6조(회원가입)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을
					신청합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격
					상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					등록 내용에 허위, 기재누락, 오기가 있는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을
					알려야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제7조(회원
					탈퇴 및 자격 상실 등)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					가입 신청시에 허위 내용을 등록한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					“몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					“몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					“몰”이 회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우
					“몰”은 회원자격을 상실시킬 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					“몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한
					30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제8조(회원에
					대한 통지)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다.
					다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제9조(구매신청)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">“몰”이용자는
					“몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각
					내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					재화등의 검색 및 선택</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">6.
					결제방법의 선택</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제10조
					(계약의 성립)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을
					체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을
					고지하여야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					신청 내용에 허위, 기재누락, 오기가 있는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					“몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을
					포함하여야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제11조(지급방법)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">“몰”에서
					구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의
					지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					선불카드, 직불카드, 신용카드 등의 각종 카드 결제</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					온라인무통장입금</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					전자화폐에 의한 결제</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					수령시 대금지급</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">6.
					마일리지 등 “몰”이 지급한 포인트에 의한 결제</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">7.
					“몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">8.
					기타 전자적 지급 방법에 의한 대금 지급 등</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제12조(수신확인통지?구매신청
					변경 및 취소)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를
					요청할 수 있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미
					대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제13조(재화등의
					공급)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을
					배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는
					일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가
					재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②“몰”은
					이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정
					배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의?과실이 없음을 입증한
					경우에는 그러하지 아니합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제14조(환급)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">“몰”은
					이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게
					통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를
					취합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제15조(청약철회
					등)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①“몰”과
					재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한
					경우에는 청약철회를 할 수 있습니다)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에
					명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는
					당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수
					있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제16조(청약철회
					등의 효과)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우
					“몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을
					곱하여 산정한 지연이자를 지급합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는
					지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회등을 이유로
					위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어
					청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 “몰”이 부담합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “몰”은 청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록
					명확하게 표시합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제17조(개인정보보호)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①“몰”은
					이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은
					선택사항으로 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					성명</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					생년월일</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					주소</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					전화번호</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					희망ID(회원의 경우)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">6.
					비밀번호(회원의 경우)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">7.
					전자우편주소(또는 이동전화번호)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">8.
					외국인회원의 경우 외국인등록번호, 여권번호, 국제운전면허증번호 중 1개항목</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③제공된
					개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다.
					다만, 다음의 경우에는 예외로 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					재화등의 거래에 따른 대금정산을 위하여 필요한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					도용방지를 위하여 본인확인에 필요한 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④“몰”이
					제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타
					연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용)
					등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를
					철회할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">⑤이용자는
					언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체없이
					필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해
					개인정보를 이용하지 않습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">⑥
					“몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의
					분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">⑦
					“몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를
					지체없이 파기합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제18조(“몰“의
					의무)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고,
					안정적으로 재화?용역을 제공하는데 최선을 다하여야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을
					갖추어야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					“몰”이 상품이나 용역에 대하여 「표시?광고의공정화에관한법률」 제3조 소정의 부당한 표시?광고행위를 함으로써 이용자가
					손해를 입은 때에는 이를 배상할 책임을 집니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">④
					“몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제19조(회원의
					ID 및 비밀번호에 대한 의무)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의
					안내가 있는 경우에는 그에 따라야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제20조(이용자의
					의무)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">이용자는
					다음 행위를 하여서는 안됩니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					신청 또는 변경시 허위 내용의 등록</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					타인의 정보 도용</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					“몰”에 게시된 정보의 변경</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					“몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					“몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">6.
					“몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">7.
					외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제21조(연결“몰”과
					피연결“몰” 간의 관계)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					상위 “몰”과 하위 “몰”이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로
					연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②연결“몰”은
					피연결“몰”이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을
					연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제22조(저작권의
					귀속 및 이용제한)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙없이 복제, 송신,
					출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③
					“몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제23조(분쟁해결)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①
					“몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를
					설치?운영합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②
					“몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는
					이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">③“몰”과
					이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가
					의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제24조(재판권
					및 준거법)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">①“몰”과
					이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를
					관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의
					경우에는 민사소송법상의 관할법원에 제기합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">②“몰”과
					이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제
					25조 (적립금과 예치금)</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					적립금과 예치금은 "몰"내에서 현금처럼 사용되는 전자화폐이며, 상품 구매시에만 이용할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">&nbsp;
					단, 적립금의 경우 회사는 별도의 공지없이 적립금의 이용가능범위를 제한할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					예치금은 회원에 한하여 제공되는 서비스이며 신용카드,모바일, 현금을 이용하여 지불할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">3.
					적립금은 회원에 한하여 제공되는 서비스입니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">4.
					적립금은 1만원이상 구매시 사용이 가능합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">5.
					적립금과 예치금은 타 결제수단(신용카드,모바일,현금)과 함께 사용될 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">6.
					회사는 각종 할인이벤트 또는 제휴이벤트 등의 특정기간에는 적립금 또는 예치금의 신청 및 이용을 제한할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">7.
					회원이 상품구매나 이벤트 등을 통하여 회사로부터 무상 제공받은 적립금의 경우 회사에서 정한 기한에 한해서만 이용
					가능합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">8.
					적립금은 지급일로 부터 1년이 경과했을경우 자동적으로 소멸이 되며 , 소멸대상자들은 공지사항과, E-mail로 통지하며,
					개인정보 불일치 및 이메일 수신거부시에는 해당내용을 받지 못할수 있습니다</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">9.
					회사는 회원이 적립금과 예치금을 부적절한 방법으로 적립하였음이 명백하다고 판단된 경우 회원에게 지급한 해당 적립금및
					예치금을 취소하고, 회원의 몰 이용을 제한할 수 있습니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">10.
					적립금은 현금으로 환불되지 않으며, 타인에게 양도가 불가합니다</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">
					<br>
				</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">제
					26조 (할인쿠폰)​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">1.
					할인쿠폰의 세부구분, 할인금액(할인율), 사용방법, 사용기한 및 제한에 대한 사항은 할인쿠폰 또는 서비스화면에
					표시됩니다. 할인쿠폰의 종류 및 내용은 회사의 정책에 따라 달라질 수 있습니다.​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">2.
					할인쿠폰은 현금으로 출금될 수 없으며 쿠폰에 표시된 유효기간이 만료되거나 이용계약이 종료되면 소멸합니다.​​​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">
					<br>
				</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">#카카오톡
					알림톡 시행에 관한 내용</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">“몰”은
					회원가입, 주문안내, 배송안내 등 비광고성 정보를 카카오톡 알림톡으로 알려드리며, 만약 알림톡 수신이 불가능하거나 수신
					차단하신 경우에는 일반 문자메시지로 보내드립니다. 카카오톡 알림톡을 통해 안내되는 정보를 와이파이가 아닌 이동통신망으로
					이용할 경우, 알림톡 수신 중 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 발송되는 알림톡 수신을 원치 않으실
					경우 반드시 알림톡을 차단하여 주시기 바랍니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">#카카오톡
					상담톡 시행에 관한 내용</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">“몰”은
					상담업무를 카카오톡 상담톡으로 진행하며, 만약 카카오톡을 통해 안내되는 상담 내용을 Wi-Fi 나 PC가 아닌
					이동통신망으로 이용할 경우, 데이터 요금이 발생할 수 있습니다. 카카오톡을 통해 상담을 원치 않으실 경우 고객센터,
					게시판 문의를 이용해 주시기 바랍니다.​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">부
					칙(시행일) 이 약관은 2013 년 3 월부터 시행합니다.</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">변경이력</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">이
					약관은 2018년 7월 13일 부터 시행하며 종전의 약관은 이 약관으로 대체 합니다.​</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">
					<br>
				</div>
				<div style="font-family: Gulim, 굴림, sans-serif; font-size: 13px;">
					<div>변경이력</div>
					<div>이 약관은 2018년 7월 26일 부터 시행하며 종전의 약관은 이 약관으로 대체 합니다.​</div>

				</div>

			</div>
			<p class="check">
				<span>이용약관에 동의하십니까?</span> <input id="agree_service_check0"
					name="agree_service_check" fw-filter="/1/" fw-label="이용약관 동의"
					fw-msg="이용약관에 동의 하세요" value="1" type="checkbox"><label
					for="agree_service_check0">동의함</label>
			</p>
		</div>
		<div class="ec-base-box typeThinBg agreeArea">
			<h3>[필수] 개인정보 수집 및 이용 동의</h3>
			<div class="content">
				<p>
					■ 수집하는 개인정보 항목 <br> <br>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와
					같은 개인정보를 수집하고 있습니다. <br> <br>ο 수집항목 : 이름 , 생년월일 , 성별 ,
					로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 , 이메일 , 직업 ,
					회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속
					로그 , 접속 IP 정보 , 결제기록<br>ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식 <br>
					<br>■ 개인정보의 수집 및 이용목적 <br> <br>회사는 수집한 개인정보를 다음의 목적을
					위해 활용합니다. <br> <br>ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
					콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송<br>ο 회원 관리<br>회원제
					서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부
					확인 , 고지사항 전달 ο 마케팅 및 광고에 활용<br>접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
				</p>
				<p>
					<br>
				</p>
				<p align="left"
					style="line-height: normal; margin-bottom: 0pt; -ms-word-break: keep-all;">
					<font face="Gulim"><span lang="EN-US">■ 개인정보의 위탁 처리</span></font>
				</p>
				<p align="left"
					style="line-height: normal; margin-bottom: 0pt; -ms-word-break: keep-all;">
					<font face="Gulim"><span lang="EN-US">회사는 서비스 향상을 위해
							관계법령에 따라 회원의 동의를 얻거나 관련 사항을 공개 또는 고지 후 회원의 개인정보를 외부에 위탁하여 처리하고
							있습니다. 회사의 개인정보처리 수탁자와 그 업무의 내용은 다음과 같습니다.</span></font>
				</p>
				<p>
					<br>
				</p>
				<p>- 수탁자 : (주)루나소프트</p>
				<p>- 위탁 업무 내용 : 카카오 알림톡 발송 업무</p>
				<p>
					<br>■ 개인정보의 보유 및 이용기간 <br> <br>회사는 개인정보 수집 및 이용목적이
					달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.
				</p>
			</div>
			<p class="check">
				<span>개인정보 수집 및 이용에 동의하십니까?</span> <input id="agree_privacy_check0"
					name="agree_privacy_check" fw-filter="/1/"
					fw-label="개인정보 수집 및 이용 방침" fw-msg="개인정보 수집 및 이용 방침에 동의하세요"
					value="1" type="checkbox"><label for="agree_privacy_check0">동의함</label>
			</p>
		</div>
		<div id="signup">
			<input type="button" name="signup" value="회원가입" id="signupbtn">
			<input type="reset" value="다시입력" id="resignupbtn">
		</div>
	</form>
	<script>
		function sample4_execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.address1; // 도로명 주소 변수
					var extraRoadAddr = '';
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		}
		//아이디중복검사&유효성검사 영어 소문자 및 숫자 4-12자리
		$("#id").on("focusout", function() {
			var id = $("#id").val();
			$.ajax({
				url : "dupl.sign",
				type : "post",
				data : {
					id : id
				},
				dataType : "json"
			}).done(function(data) {
				if (data.result) {
					$(".id.regex").html("사용중인 아이디 입니다.");
				} else {
					var regex = /^[a-z\d]{4,11}$/;
					var result = regex.exec(id);
					if (result == null) {
						$(".id.regex").html("영어 소문자 및 숫자 4-12자리");
					} else {
						$(".id.regex").html("사용가능한 아이디 입니다");
					}
				}
			});
		})
		//비밀번호유효성검사 영어대소문자 및 숫자 8-12자리
		$("#pw").on("focusout", function() {
			var regex = /^[A-Za-z\d]{8,12}$/;
			var result = regex.exec($("#pw").val())
			if (result == null) {
				$(".pw.regex").html("영어대소문자 및 숫자 8-12자리")

			} else {
				$(".pw.regex").html("사용가능한 비밀번호입니다.")
			}

		})
		//비밀번호 확인
		$("#repw").on("focusout", function() {
			var pw = $("#pw").val();
			var repw = $("#repw").val();
			if (pw == repw) {
				$(".repw.regex").html("비밀번호가 일치합니다")
			} else {
				$(".repw.regex").html("비밀번호가 일치하지않습니다")
			}
		})
		//핸드폰번호 유효성검사 없음
		//이름 유효성검사가 없음
		//이메일 유효성검사 없음

		$(document).ready(function() {
			setDateBox();
		});

		// select box 연도 , 월 표시
		function setDateBox() {
			var dt = new Date();
			var year = "";
			var com_year = dt.getFullYear();
			// 올해 기준으로 -1년부터 +5년을 보여준다.
			for (var y = (com_year - 1); y <= (com_year + 5); y++) {
				$("#year").append(
						"<option value='"+ y +"'>" + y + " 년" + "</option>");
			}
			for (var i = 1; i <= 12; i++) {
				$("#month").append(
						"<option value='"+ i +"'>" + i + " 월" + "</option>");
			}
			for (var i = 1; i <= 31; i++) {
				$("#day").append(
						"<option value='"+ i +"'>" + i + " 일" + "</option>");
			}
		}
		
		$("#sAgreeAllChecked").on("click",function(){
	        if($("#sAgreeAllChecked").is(":checked")){
	            $("#agree_service_check0").prop("checked",true);
	            $("#agree_privacy_check0").prop("checked",true)
	        }else{
	        	$("#agree_service_check0").prop("checked",false);
	            $("#agree_privacy_check0").prop("checked",false)
	        }
	    });
		
		$("#signupbtn").on("click",function(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		var name = $("#name").val();
		var repw = $("#repw").val();
		
		var idregex = /^[a-z\d]{4,11}$/;
		var pwregex = /^[A-Za-z\d]{8,12}$/;
		
		
		if(idregex.exec(id) == null){
			alert("아이디양식을 다시 확인해주세요");
			$("#id").focus();
			return;
		}
	
		if(pwregex.exec(pw) == null){
			alert("비밀번호양식을 다시 확인해주세요");
			$("#pw").focus();
			return;
		}
		
		if(repw == ""){
			alert("비밀번호 확인을 해주세요");
			$("#repw").focus();
		}
		
		if(($("#agree_service_check0").is(":checked")==false)||($("#agree_privacy_check0").is(":checked")==false)) {
			alert('약관에 동의해주세요');
			return false;
			}
		$("#signform").submit();
		
		
		})
		
	
	</script>
</body>
</html>