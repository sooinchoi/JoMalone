<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goods Detail | Jo Malone</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="/Resource/key/top.jsp" flush="false"/>
	
	<div class="container" style="margin: 70px auto 70px auto; height: 600px; background-color: #F0BDAA;">
		<div class="row" style="margin: auto;">
			<img src="/JoMalone/Resource/img/DCi001.jpg" style="margin: 30px auto auto auto; border-radius: 30px;">
			<div style="padding: 10px 30px 10px 30px; position: relative; left: 600px; bottom: 520px; width: 400px; height: 500px; border: 1px solid darkgray; border-radius: 10px; text-align: center;">
				<h4 style="margin: 30px 0px 30px 0px;">라임 바질 앤 만다린 코롱</h4>
				<h6 style="margin: 30px 0px 30px 0px; font-size: 13px;">조 말론 런던의 시그니처 향. 열정적인 허브의 독특한 조합으로 이루어져 있습니다. 카리브해의 산들바람에서 실려온 듯한 라임향에 톡 쏘는 바질과 향기로운 백리향이 더해져서 독특한 조합을 만들어 냅니다. 현대적인 감각의 클래식한 향입니다.</h6>
				<a href="#"><h6 style="margin: 50px 0px 0px 0px;">전성분</h6></a>
				<div style="margin: 30px auto 10px auto; padding: 0px 5px 0px 5px; width: 300px; height: 25px; border: 1px solid lightgray; text-align: left;"><h6 style="float: left; padding: 5px 0px 5px 0px;">₩ 94,000</h6><h6 style="float: left; margin: 0px 10px 0px 10px; padding: 5px 0px 5px 0px;">100ML</h6></div>
				<h6 style="float: left; margin: 20px 0px 0px 20px;">관련 키워드 : </h6><a href="#" style="float: left; margin: 20px 5px 0px 10px;"><h6>봄</h6></a><a href="#" style="float: left; margin: 20px 10px 0px 5px;"><h6>가을</h6></a>
				<div style="margin: 80px 0px 10px 0px; width: 100%;">
					<input type="button" value="장바구니" style="margin: 0px 10px 0px 0px; width: 130px; height: 25px; font-size: 14px; border: 0px; background-color: lightgray;">
					<input type="button" value="구매하기" style="margin: 0px 0px 0px 10px; width: 130px; height: 25px; font-size: 14px; border: 0px; background-color: lightgray;">
				</div>
				<a href="#" style="color: darkgray; margin: 30px 0px 0px 0px;"><h6 style="margin: 30px 0px 0px 0px;">리뷰쓰러가기</h6></a>
			</div>
		</div>
	</div>
	
	<jsp:include page="/Resource/key/bottom.jsp" flush="false"/>
</body>
</html>	