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
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/login_css/login.css?<?=filemtime('<%=projectName %>/resources/css/login_css/login.css')?>" rel="stylesheet" type="text/css" media="all">
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%-- <jsp:include page="/WEB-INF/view/includeFile/header.jsp" /> --%>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->

<div class="hoc">
	<h1 id="log_title"> 로그인 </h1>
		<!-- loginForm -->
		<!-- ################################################### -->
		<!-- ################################################### -->
		<form role="form" id="log_form">
			<div class="form-group">
				<label for="exampleInputEmail1" class="log_label">Email address</label>
				<input type="email" class="form-control" id="exampleInputEmail1" name="mEmail" placeholder="이메일을 입력하세요">
			</div>
			<!-- ################################################### -->
			<!-- ################################################### -->
			<div class="form-group">
				<label for="exampleInputPassword1" class="log_label">Password</label>
				<input type="password" class="form-control" id="exampleInputPassword1" name="mPassword" placeholder="비밀번호를 입력하세요">
			</div>
			<!-- ################################################### -->
			<!-- ################################################### -->
			<button type="submit" id="log_btn">로그인</button>
			<!-- ################################################### -->
			<!-- ################################################### -->
			<!-- logFoot -->
			<br>
			<div id="log_foot">
			<a href="loginSearch.do"><label id="search_idpw">아이디 / 비밀번호 찾기</label></a>
			<a href="join.do"><label id="sign_up">FOR_Busker 회원가입</label></a>
			</div><br><br>
			<!-- ################################################### -->
			<!-- ################################################### -->
			<!-- copyright -->
			<label id="copyrightC">Copyright © 2016 FOR_Busker. All rights reserved.</label><br>
		</form>
	
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