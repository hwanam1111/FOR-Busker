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
<link href="<%=projectName %>/resources/css/login_css/buskerIdSearch.css?<?=filemtime('<%=projectName %>/resources/css/login_css/buskerIdSearch.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName %>/resources/js/login_js/buskerIdSearch.js?<?=filemtime('<%=projectName %>/resources/js/login_js/buskerIdSearch.js')?>"></script>
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
	<h1 id="busker_title">공연자 아이디찾기</h1>
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- buskerIdSearchForm -->
	<form id="buskerIdSearchForm">
		<p id="teamTitle">FOR_Busker를 이용하실 때 사용하시던 팀명을 입력해주십시오.</p>
		<div class="form-group">
    		<input type="text" class="form-control" id="buskerTeamName"name="memTeamName" placeholder="팀명을 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
  		<div class="form-group" id="telForm">
 		    <p id="teamTel">FOR_Busker에 회원가입 하실 때 작성하셨던 전화번호를 입력해주십시오.</p>
    		<input type="tel" class="form-control" id="buskerTel"name="memPhone" placeholder="전화번호를 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div  align="center">
		<button type="button" class="btn btn-info" id="BuskersearchIdBtn">아이디 찾기</button>
		<button type="button" class="btn btn-info" id="loginBtn">로그인 하러가기</button>
		<button type="button" class="btn btn-info" id="mainBtn">메인으로</button>
		</div>
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