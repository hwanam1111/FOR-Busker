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
<link href="<%=projectName %>/resources/css/join_css/buskerJoin.css?<?=filemtime('<%=projectName %>/resources/css/join_css/buskerJoin.css)?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/join_js/buskerJoin.js?<?=filemtime('<%=projectName %>/resources/js/join_js/buskerJoin.js')?>"></script>
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
	<h1 id="busker_title">공연자 회원가입</h1>
	<!-- simpleJoin Form -->
	<form id="buskerJoinForm">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="buskerEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="buskerEmail" name="memEmail" placeholder="이메일을 입력하세요" maxlength="50">
	    		<button type="button" id="emailCheckBtn" class="btn btn-info" disabled="disabled">이메일인증</button>
    		</div>
    		<div id="emailCheck" style="display: none;"></div>
    		<div id="emailCheck1" style="display: none;"></div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
    	<div class="form-group" id="confirm" style="display:none">
 		   <label for="buskerConfirm">이메일 인증</label>
    		<input type="text" class="form-control" id="buskerConfirm" name="buskerConfirm" placeholder="입력한 이메일로 인증번호가 전송되었습니다. 인증번호를 입력해주십시오." maxlength="12">
    		<div id="emailmessage" style="display:none"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="buskerPassword">비밀번호</label>
    		<input type="password" class="form-control" id="buskerPassword" name="memPw" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="buskerPasswordOk">비밀번호확인</label>
    		<input type="password" class="form-control" id="buskerPasswordOk" name="buskerPasswordOk" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="buskerTel">전화번호</label>
    		<input type="tel" class="form-control" id="buskerTel"name="memPhone" placeholder="전화번호를 입력하세요" maxlength="13">
  		</div>
  		<div class="form-group">
 		    <label for="buskerTeamName">팀 이름</label>
    		<input type="text" class="form-control" id="buskerTeamName"name="memTeamName" placeholder="팀명을 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
  		<!-- ##################### CheckBox #################### -->
		<!-- ################################################### -->
		<label>공연장르</label>
  		<label class="checkbox-inline">
  			<input type="checkbox" id="check_sing" value="노래" name="memTeamType"> 노래
		</label>
		<label class="checkbox-inline">
  			<input type="checkbox" id="check_dance" value="댄스" name="memTeamType"> 댄스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_band" value="밴드" name="memTeamType"> 밴드
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_guitar" value="기타" name="memTeamType"> 기타
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_piano" value="피아노" name="memTeamType"> 피아노
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_magic" value="마술" name="memTeamType"> 마술
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_other" value="그외" name="memTeamType"> 그외..
		</label>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div class="InputFile">
    		<br><label for="InputFile">팀 프로필 사진</label>
    		<input type="file" id="InputFile" name="file"> 
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
  		<div class="form-group">
 		    <br/><label for="buskerVideo">팀 홍보 영상</label>
    		<input type="text" class="form-control" id="buskerVideo" name="memVideo" placeholder="영상URL을 입력하세요" maxlength="120">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<label>팀 설명</label>
		<textarea class="form-control" rows="5" name="memDetail" id="buskerDetail"></textarea>
		<!-- ################################################### -->
		<!-- ################################################### -->
		<input type="hidden" name="memStatus" value="2">
		<input type="hidden" name="memType" value="1">
		<!-- submit button -->
  			<button type="button" class="btn btn-success" id="submitBtn">회원가입</button>
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