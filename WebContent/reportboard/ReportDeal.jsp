<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Admin | Jo Malone</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<script src="/JoMalone/Resource/lang/summernote-ko-KR.js"></script>


<style>
* {box-sizing: border-box;}
	input[type=text], textarea {margin-top: 3px; margin-bottom: 3px; font-size: 15px;}
	#write-page {margin-top: 80px; height: 900px;}
	#write-title {margin-bottom: 35px; padding: 0px; height: 50px;}
	#write-title>h4 {width: 100%; line-height: 45px; text-align: center;}
	
	input[type=button] {width: 100px; height: 30px; border: 0px; background-color: lightgray; font-size: 13px;}

#noticeMsg{
	color: crimson;
}
.clickEdit{
	display: none;
}
#contentsBox{
	padding-top: 10px;
}
#sidebar{ float:left; width:200px; margin:0px; padding:0px; }
    #sidebar>.menu{ list-style-type: none; text-align: right; margin:auto; color:#1e2d47; text-align:center;
    padding:0px 10px; margin: 10px; width:80%; line-height:30px; background-color : #1e2d47; color:white;}
    .menu{height:30px; width:100%; font-family: 'Alata', sans-serif; border:1px solid black; border-radius:3px;}
    
    .Wrap{height:800px;  width:200px; margin:0px; float:left; }
    h4{margin:0px; padding:20px 20px; text-align: right; font-size: 20px; font-family: 'Alata', sans-serif;
    }
    .menu>a{text-decoration: none; color:white;}
    #wrapper{width:1500px; bolder:1px solid black; overflow:hidden; margin:auto; }
    #container{
       	height:800px;
     	width:1300px;
     	float:left;
     	padding: 20px;
     	overflow-x:scroll;
     	border:1px solid black;
    }
</style>
</head>
<body>

<div id="wrapper">
	<div class=Wrap>
		<h4>게시판관리</h4>
			<ul id="sidebar">
			    <li class="menu"><a href="list.notice">공지</a></li>
			    <li class="menu" id="askNew"><a href="newList.ask">신규 1:1 문의</a></li>
			    <li class="menu" id="askAll"><a href="allList.ask">전체 1:1 문의</a></li>
                <li class="menu"><a href="newList.report">신규 신고글</a></li>
                <li class="menu"><a href="allList.report">전체 신고글</a></li>
                <li class="menu"><a href="allList.review">리뷰</a></li>
			</ul>
      </div>
      
      <c:choose>
		<c:when test="${sessionScope.adminId!=null }">
	<form action="writeConfirm.report" method="post" id="writeFrm">
		<div id="write-page" class=container>
			<div id="write-title" class="row">
				<div class="col-12 p-0"><h4>REPORT ADMIN</h4></div>
			</div>
			<div class="row" id=reportType>
				<div class="col-12 p-0">
				<input type="hidden" name="articleSeq" id="articleSeq" value=${reportSeq }>
				<p id=reportType style="font-weight: bold;">게시물 관리 사유를 선택해주세요.</p>
					<input type="radio" name="reportType" value="r1"> 부적절한 홍보<br> <input
						type="radio" name="reportType" value="r2"> 명예훼손/사생활 침해<br> <input
						type="radio" name="reportType" value="r3"> 저작권 침해<br> <input
						type="radio" name="reportType" value="r4"> 스팸<br> <input
						type="radio" name="reportType" value="r5"> 기타<br>
						<p></p>
				</div>
			</div>
		
		<hr>
		<div class="row checkReportBox">
			<div class="col-12">
					
				<c:choose>
					<c:when test="${preCheckDTO.check_YN!=null && resultDTO.check_YN != 'Y'}">
						<c:if test="${preCheckDTO.check_YN == 'Y'}">					
							<p style="font-weight: bold;"><span style="color: crimson;">*</span> 기존 조치 내역이 있습니다.</p>
							
							<span>조치 방안 : <span style="color: crimson;">${preCheckDTO.checkTypeKor }</span></span><br>
							<span>조치일 : ${preCheckDTO.checkDateFormedFullDate }</span><br>
							<span>추가 기재 메모 : ${preCheckDTO.checkCommentsBlank }</span><br>							
						</c:if>
						<br>
						<c:if test="${preCheckDTO.check_type == 'none' || preCheckDTO.check_type == 'blind'}">
							<p style="font-weight: bold;">해당 리뷰를 어떻게 관리하겠습니까?</p>						
							<input type="radio" name="checkType" value="${preCheckDTO.check_type }"> <span style="color:crimson;">기존 조치 유지</span><br>
							<input type="radio" name="checkType" value="none"> 1. 별도 조치 없음<br>
							<input type="radio" name="checkType" value="blind"> 2. 블라인드 처리<br>
							<input type="radio" name="checkType" value="delete"> 3. 삭제 처리<br>
							<br>
							<span>(선택사항)해당 리뷰에 대해 남길 메모가 있다면 작성해주세요.</span>
							<br>
							<textarea id="checkComments" name="checkComments"></textarea>
							<br>
							<input type="checkbox" id="confirmAll">
							<span style="color: crimson; font-weight: bold;">모든 내용을
								확인했습니다.</span>
							<br>
							<br>
							<input type="button" value="확인" id=reportConfirm>
						</c:if>						
					</c:when>
					
					<c:when test="${preCheckDTO.check_YN==null && resultDTO.check_YN != 'Y'}">
						<p style="font-weight: bold;">해당 리뷰를 어떻게 관리하겠습니까?</p>						
						<input type="radio" name="checkType" value="none"> 1. 별도 조치 없음<br>
						<input type="radio" name="checkType" value="blind"> 2. 블라인드 처리<br>
						<input type="radio" name="checkType" value="delete"> 3. 삭제 처리<br>
						<br>
						<span>(선택사항)해당 리뷰에 대해 남길 메모가 있다면 작성해주세요.</span>
						<br>
						<textarea id="checkComments" name="checkComments"></textarea>
						<br>
						<input type="checkbox" id="confirmAll">
						<span style="color: crimson; font-weight: bold;">모든 내용을
							확인했습니다.</span>
						<br>
						<br>
						<input type="button" value="확인" id=reportConfirm>
					</c:when>
					<c:when test="${resultDTO.check_YN == 'Y' }">
						<p style="font-weight: bold;">조치 방안 : <span style="color: crimson;">${resultDTO.checkTypeKor }</span></p>
						<p style="font-weight: bold;">조치일 : <span>${resultDTO.checkDateFormedFullDate }</span></p>
						<p style="font-weight: bold;">추가 기재 메모 : <span>${resultDTO.checkCommentsBlank }</span></p>								
					</c:when>
				</c:choose>
			</div>
		</div>
		
		
			<hr>
			<div class="row" id=btnBox>
				<div class="col-12 p-0" style="text-align: right;">
					<input type="button" value="취소" id="cancel"> <input
						type="button" value="접수하기" id="toWrite">
				</div>
			</div>
		</div>
	</form>
			</c:when>
		<c:otherwise>
		<div><p>잘못된 접근입니다.</p></div>
		</c:otherwise>
	</c:choose>
</div>


	<script>
       $("#cancel").on("click", function() {
           location.href = "read.review?no=${reportSeq }";//원래 리뷰페이지
       });
       $("#toWrite").on("click", function() {
       	var check = $('input:radio[name=reportType]').is(':checked');
       	if(!check){
       		alert("신고 사유를 선택해주세요.");
       		return false;
       	}
       	alert("처리가 완료되었습니다.");
       	document.getElementById("writeFrm").submit();
       });
       
       (function($) {
		$(".summernote").summernote({
   			lang : 'ko-KR',
   			minHeight: 300,
   			maxHeight: 300,    
   			focus: true,
   			placeholder : "추가로 기재할 내용이 있다면 작성해주세요. (사진 업로드 크기는 10MB까지만 가능합니다.)",
   			callbacks : {
   				onImageUpload : function(files) {
   					console.log(files);
   					var data = new FormData();
   					for (var i = 0; i < files.length; i++) {
   						data.append("img" + i, files[i]);
   					}
   					$.ajax({
   						url : "summernote.report",
   						enctype : "multipart/form-data",
   						type : "post",
   						data : data,
   						contentType : false,
   						processData : false,
   						cache : false,
   						dataType : "json"
   					}).done(function(resp) {
   						console.log(resp);
   						console.log(resp.length);
   						for (var i = 0; i < resp.length; i++) {
   							var imgBox = document.createElement("p");
   							var imgTag = document.createElement("img");
   							$(imgTag).attr("src", resp[i].url);
   							$(imgTag).attr("style", "max-width: 80%; height: auto;");
   							imgBox.append(imgTag);
   							$(".summernote").summernote('insertNode', imgBox);
   						}
   						var pTag = "<p><br></p>";
   						$(".summernote").summernote('pasteHTML', pTag);
   						$('.summernote').summernote('focus');
   					}).fail(function(resp) {

   					})
   				}
   			}	
       });
       })(jQuery);
       
 	</script>
</body>
</html>