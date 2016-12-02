<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Bootstrap 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery lib CDN URL -->`
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- include header -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/message_css/message.css?<?=filemtime('<%=projectName %>/resources/css/message_css/message')?>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=projectName %>/resources/js/message_js/message.js?<?=filemtime('<%=projectName %>/resources/js/message_js/message')?>"></script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc" align="center">


<!--  테이블 시작  -->
<div  style="width:100%; border: 2px solid #92858C;  border-radius: 15px"  class="table-responsive">
<table class="table">
<tr align="center">
<td>번호</td>
<td>이름</td>
<td>내용</td>
<td>날짜</td>
<td>구분</td>
</tr>

<!--  테이블 반복문 돌릴 위치  -->
<tr align="center">
<td align="center">1</td>
<td></td>
<td></td>
<td></td>
<td>
<a href="javascript:popupOpen();">열려라 팝업창!</a>

<script type="text/javascript">
function popupOpen(){
	var popUrl = "Pop.jsp";	//팝업창에 출력될 페이지 URL
	var popOption = "width=500, height=400, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	window.open(popUrl,"",popOption);
	}
</script>

<a href="javascript:popupOpen();"><button type="button" class="btn btn-info messageView" >보기</button></a>
<button type="button" class="btn btn-info" href="#">삭제</button>
</td>
</tr>


<tr align="center">
<td align="center">2</td>
<td>김이준</td>
<td>디자인이 맘에 안드는데요?</td>
<td>2016-12-02[11:39]</td>
<td>
<button type="button"  class="btn btn-info messageView" href="#">보기</button>
<button type="button" class="btn btn-info" href="#" >삭제</button>
</td>
</tr>

<tr align="center">
<td align="center">3</td>
<td>이강문</td>
<td>뭐라구요??</td>
<td>2016-12-02[11:36]</td>
<td>
<button type="button"  class="btn btn-info messageView" href="#">보기</button>
<button type="button" class="btn btn-info" href="#">삭제</button>
</td>
</tr>

<tr align="center">
<td align="center">4</td>
<td>김경림</td>
<td>누구야!? 누구야!?</td>
<td>2016-12-02[11:52]</td>
<td> 
<button type="button"   class="btn btn-info messageView" href="#">보기</button>
<button type="button" class="btn btn-info" href="#">삭제</button>
</td>
</tr>

<tr align="center">
<td align="center">5</td>
<td>이진욱</td>
<td>아니~왜 안되는거야아~ㅠㅠ</td>
<td>2016-12-02[11:58]</td>
<td>
<button type="button"  class="btn btn-info messageView" href="#">보기</button>
<button type="button" class="btn btn-info" href="#">삭제</button>
</td>
</tr>


</table>
</div>

<!--  popup -->
	<div id="popup" class="popup-div popup-style">
		<div class="content">
			<div class="b-ajax-wrapper" style="height: 600px; width: 800px;">
    		<span class="button b-close" id="close"><span>X</span></span><br/>
			<img src="messageView.png" id="background"/>
			<form class="form-inline"> 
			<div class="form-group" align="center" >
			<table style="width:600px" border="1">
				<tr align="left">
					<td>수신자 </br> 내용</td>
				</tr>
				<tr align="right">
					<td>내용</td>
				</tr>
			</table>
    		<input type="text" id="inputText" class="form-control"/>
			<button type="button"  class="btn btn-info form-control">전송</button>
			</div>
			</form>
			</div>
		</div>
	</div> 
	



</div>

<!-- 코딩 종료 -->
<!-- ##############  footer 부분 include  ############## -->
<jsp:include page="/WEB-INF/view/includeFile/footer.jsp" />
<!-- ################################################## -->
<!-- #############  반응형 모바일 js  ############# -->
<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
<!-- ################################################### -->
</body>
</html>