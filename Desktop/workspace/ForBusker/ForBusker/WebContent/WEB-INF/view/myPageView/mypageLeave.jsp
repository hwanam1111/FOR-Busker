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
<link href="<%=projectName %>/resources/css/mypage_css/mypageLeave.css?<?=filemtime('<%=projectName %>/resources/css/mypage_css/mypageLeave.css)?>" rel="stylesheet" type="text/css" media="all">
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
	<h1 id="leave_title" style="font-size:30px;">회원탈퇴</h1>
	<!-- simpleJoin Form -->
	<form id="leaveForm" action="myPageLeaveConfig.do" method="post">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="leaveEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="leaveEmail" name="memEmail" value="${memvo}" maxlength="50">
    		</div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
  		<div class="form-group">
    		<label for="leavePassword">비밀번호</label>
    		<input type="password" class="form-control" id="leavePassword" name="memPw" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<!-- submit button -->
  			<button type="submit" class="btn btn-success" id="submitBtn">탈퇴하기</button>
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