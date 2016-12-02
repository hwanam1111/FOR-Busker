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
<link href="<%=projectName %>/resources/css/join_css/join.css?<?=filemtime('<%=projectName %>/resources/css/join_css/join.css)?>" rel="stylesheet" type="text/css" media="all">
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

<div class="hoc">
	<!-- ################################################### -->
	<!-- ################################################### -->
	<div id="join_temp">
		<!-- Join Template text-->
		<b>FOR_Busker</b> 페이지에 오신것을 환영합니다. <br/>
		원하시는 회원 유형에 선택하여 회원가입 하시길 바랍니다. <br/>
		회원유형(일반 회원가입, 공연자 회원가입)에 따라 가입절차가 차이가 있으니, <br/>
		이점 확인하여 주시길 바랍니다. <br/>
	 	공연자 회원가입시에 일반 회원가입도 동시에 진행됩니다. <br/>
		<hr/><br/>
		<!-- ################################################### -->
		<!-- ################################################### -->
		<!-- Join Template image-->
		<a href="simpleJoin.do"><img src="<%=projectName %>/resources/images/join_img/join_people2.png" class="join_img"></a>
		<a href="buskerJoin.do"><img src="<%=projectName %>/resources/images/join_img/join_people1.png" class="join_img"></a>
		<p>
			<span id="temp_span">일반 회원가입</span>
			<span>공연자 회원가입</span>
		</p>
	</div>
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