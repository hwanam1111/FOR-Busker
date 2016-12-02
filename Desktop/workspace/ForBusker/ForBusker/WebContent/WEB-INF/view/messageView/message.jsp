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
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- include header -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/message_css/message.css?<?=filemtime('<%=projectName %>/resources/css/message_css/message.css')?>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=projectName %>/resources/js/message_js/message.js?<?=filemtime('<%=projectName %>/resources/js/message_js/message.js')?>"></script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc" align="center">

<!-- ################################################### -->
<!-- ################################################### -->
<!--  테이블 시작  -->
<div id="messageTable" class="table-responsive">
<table class="table">
<tr align="center">
<td>번호</td>
<td>이름</td>
<td>내용</td>
<td>날짜</td>
<td>구분</td>
</tr>

<!-- ################################################### -->
<!-- ################################################### -->
<!--  테이블 반복문 돌릴 위치  -->
<tr align="center">
<td align="center">1</td>
<td></td>
<td></td>
<td></td>
<td>
<button type="button" class="btn btn-info messageView" >보기</button>
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
<!-- ################################################### -->
<!-- ################################################### -->
<!-- ################################################### -->

<!-- 팝업 -->
	<div id="popup" class="popup-div popup-style">
		<div class="content">
			<div class="b-ajax-wrapper" style="height: 550px; width: 400px; background: #f1f1f1; border-radius: 15px;">
    			<span class="button b-close" id="close"><span>X</span></span><br/>
				<div class="form-group" align="center" >
					<div id="chatDiv"></div>
					<div id="insertDiv">
		   				<input type="text" id="inputText" class="form-control" />
						<button type="button"  class="btn btn-info form-control" id="chatSubmit">전송</button>
					</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- ################################################### -->



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