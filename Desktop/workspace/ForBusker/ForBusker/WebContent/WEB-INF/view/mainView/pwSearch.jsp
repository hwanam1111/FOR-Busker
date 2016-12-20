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
<link href="<%=projectName %>/resources/css/login_css/pwSearch.css?<?=filemtime('<%=projectName %>/resources/css/login_css/pwSearch.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/login_js/pwSearch.js?<?=filemtime('<%=projectName %>/resources/js/login_js/pwSearch')?>"></script>
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
	<h1 id="pwSearch_title">비밀번호 찾기</h1>
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- buskerIdSearchForm -->
	<form id="pwSearchForm">
		<p>FOR_Busker를 이용하실 때 사용하시던 이메일을 입력해주십시오.</p>
		<div>
	    	<input type="email" class="form-control" id="buskerEmail" name="memEmail" placeholder="이메일을 입력하세요" maxlength="50">
	    	<button type="button" id="emailCheckBtn" class="btn btn-info">이메일인증</button>
    	</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
    	<div class="form-group" id="confirm1" style="display:none">
 		   <p>이메일 인증번호를 입력해주세요.</p>
    		<input type="text" class="form-control" id="emailConfirm" name="emailConfirm" placeholder="입력한 이메일로 인증번호가 전송되었습니다. 인증번호를 입력해주십시오." maxlength="12">
  			<div id="emailmessage" style="display:none"></div>
  		</div>
  		<div class="form-group" id="telForm">
 		    <p id="telTitle">FOR_Busker에 회원가입 하실 때 작성하셨던 전화번호를 입력해주십시오.</p>
    		<input type="tel" class="form-control" id="buskerTel"name="memPhone" placeholder="전화번호를 입력하세요" maxlength="13">
			<div id="telMessage" style="display:none"></div>
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div align="center">
		<button type="button" class="btn btn-info" id="searchPwBtn">비밀번호 찾기</button>
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