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
<link href="<%=projectName %>/resources/css/login_css/simpleIdSearch.css?<?=filemtime('<%=projectName %>/resources/css/login_css/simpleIdSearch.css')?>" rel="stylesheet" type="text/css" media="all">
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
	<h1 id="simple_title">일반사용자 아이디찾기</h1>
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- simpleIdSearchForm -->
	<form id="simpleIdSearchForm">
		<p>FOR_Busker를 이용하실 때 사용하시던 닉네임을 입력해주십시오.</p>
		<div class="form-group">
    		<input type="text" class="form-control" id="simpleNickname"name="simpleNickname" placeholder="닉네임을 입력하세요" maxlength="12">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
  		<div class="form-group" id="telForm">
 		    <p>FOR_Busker에 회원가입 하실 때 작성하셨던 전화번호를 입력해주십시오.</p>
    		<input type="tel" class="form-control" id="simpleTel"name="simpleTel" placeholder="전화번호를 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<button type="submit" class="btn btn-success" id="submitBtn">아이디 찾기</button>
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