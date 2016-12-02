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
<link href="<%=projectName %>/resources/css/join_css/simpleJoin.css?<?=filemtime('<%=projectName %>/resources/css/join_css/simpleJoin.css)?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/join_js/simpleJoin.js?<?=filemtime('<%=projectName %>/resources/js/join_js/simpleJoin.js')?>"></script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->

<div class="hoc">
	<!-- ################################################### -->
	<!-- ################################################### -->
	<h1 id="simple_title">일반 회원가입</h1>
	<!-- simpleJoin Form -->
	<form id="simpleJoinForm">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="simpleEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="simpleEmail" name="simpleEmail" placeholder="이메일을 입력하세요" maxlength="50">
	    		<button type="button" id="emailCheckBtn" class="btn btn-info">이메일인증</button>
    		</div>
    		<div id="emailCheck" style="display: none;"></div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
    	<div class="form-group" id="confirm" style="display:none">
 		   <label for="simpleConfirm">이메일 인증</label>
    		<input type="text" class="form-control" id="simpleConfirm" name="simpleConfirm" placeholder="입력한 이메일로 인증번호가 전송되었습니다. 인증번호를 입력해주십시오." maxlength="12">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="simplePassword">비밀번호</label>
    		<input type="password" class="form-control" id="simplePassword" name="simplePassword" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="simplePasswordOk">비밀번호확인</label>
    		<input type="password" class="form-control" id="simplePasswordOk" name="simplePasswordOk" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		   <label for="simpleNickname">닉네임</label>
    		<input type="text" class="form-control" id="simpleNickname"name="simpleNickname" placeholder="닉네임을 입력하세요" maxlength="12">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="simpleTel">전화번호</label>
    		<input type="tel" class="form-control" id="simpleTel"name="simpleTel" placeholder="전화번호를 입력하세요" maxlength="13">
  		</div>
		<!-- submit button -->
  			<button type="submit" class="btn btn-success" id="submitBtn">회원가입</button>
  			<button type="reset" class="btn btn-success" id="resetBtn">다시작성</button>
	</form>
	
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