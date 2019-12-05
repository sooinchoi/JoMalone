<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 Enquiry | Jo Malone</title>
<link rel="stylesheet" href="/JoMalone/Resource/css/enquiry.css">
<style>
	#headDiv {padding: 0px;	margin: 0px; padding-top: 20px;	padding-bottom: 20px;}
	#headDiv>div {padding: 0px; margin: 0px; font-weight: bold; font-size: 20px; line-height: 30px;}
	.article {padding-bottom: 10px;}
	.article:hover {background-color: #cbe7ff90;}	
	a:link {color: black;}
	a:visited {color: #887f7f;}
	a:hover {text-decoration: none;}
.naviBar {
	font-size: 20px;
	word-spacing: 5px;
	font-weight: bold;
}

.naviPage:visited {
	color: black;
}
input[type="button"] {width: 100px; height: 30px; border: 0px; background-color: lightgray; font-size: 13px;}
</style>
</head>

<body>
	<jsp:include page="/Resource/key/top.jsp" flush="true" />
	
	<div id="enquiry-page" class="container">
		<div id="enquiry-title" class="row">
			<h4>1:1 ENQUIRY</h4>
		</div>
		<div class="row" style="margin-top: 60px; text-align: center;">
			<div class="col-3 d-none d-sm-block">문의종류</div>
			<div class="col-7 d-none d-sm-block">제목</div>
			<div class="col-2 d-none d-sm-block">날짜</div>
		</div>
		<hr>
		<c:choose>
			<c:when test="${selectResult.size()==0 }">
				<div class="row">
					<div class="col-12"
						style="text-align: center; height: 500px; line-height: 500px;">문의내역이
						없습니다.</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${selectResult }" var="dto">
					<div class="row article p-1" style="text-align: center;">
						<div class="col-3">${dto.askCodeKor }</div>
						<div class="col-7" style="text-align: left;">
						<c:if test="${dto.answer_yn eq 'Y' }">
							<span>[답변완료]</span>
						</c:if>
							<a href="read.ask?no=${dto.ask_seq }">${dto.title }</a>
						</div>						
						<div class="col-2">${dto.formedOnlyDate }</div>
					</div>

				</c:forEach>
			</c:otherwise>
		</c:choose>
		<hr>
		<div class="row" style="text-align: center;">
			<div class="col-12 naviBar">${pageNavi }</div>
		</div>
		<div class="row">
			<div class="col-12" style="text-align: right;">
				<div style="float:left; margin: 0px 5px 0px 0px;"><input type="button" value="메인으로" id="toIndex"></div> 
				<div style="float:left; margin: 0px 5px 0px 0px;"><input type="button" value="마이페이지로" id="toMyPage"></div>
				<div style="float:right;"><input type="button" value="문의하기" id="toWrite"></div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12"></div>
	</div>
	<jsp:include page="/Resource/key/bottom.jsp" flush="true" />

	<script>
		$("#toIndex").on("click", function() {
			location.href = "/JoMalone/home.jsp";
		});
		
		// 마이 페이지
		$("#toMyPage").on("click", function() {
			location.href = "/JoMalone/Member/mypage.jsp";
		});
		$("#toWrite").on("click", function() {
			location.href = "/JoMalone/askboard/AskWriteCall.jsp";//일대일문의글쓰기 페이지
		});
	</script>
	
</body>
</html>