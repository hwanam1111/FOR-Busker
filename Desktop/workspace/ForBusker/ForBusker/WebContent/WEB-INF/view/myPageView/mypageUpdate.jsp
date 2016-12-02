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
<link href="<%=projectName %>/resources/css/mypage_css/mypageUpdate.css?<?=filemtime('<%=projectName %>/resources/css/mypage_css/mypageUpdate.css)?>" rel="stylesheet" type="text/css" media="all">
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
	<h1 id="update_title">정보수정</h1>
	<!-- simpleJoin Form -->
	<form id="updateForm">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="updateEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="updateEmail" name="updateEmail" placeholder="이메일을 입력하세요" maxlength="50" readonly="readonly">
    		</div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePassword">비밀번호</label>
    		<input type="password" class="form-control" id="updatePassword" name="updatePassword" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePasswordOk">비밀번호확인</label>
    		<input type="password" class="form-control" id="updatePasswordOk" name="updatePasswordOk" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePasswordOk2">비밀번호확인</label>
    		<input type="password" class="form-control" id="updatePasswordOk2" name="updatePasswordOk2" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="updateTel">전화번호</label>
    		<input type="tel" class="form-control" id="updateTel"name="updateTel" placeholder="전화번호를 입력하세요" maxlength="13">
  		</div>
  		<div class="form-group">
 		    <label for="updateTeamName">팀 이름</label>
    		<input type="text" class="form-control" id="updateTeamName"name="updateTeamName" placeholder="팀명을 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
  		<!-- ##################### CheckBox #################### -->
		<!-- ################################################### -->
		<label>공연장르</label>
  		<label class="checkbox-inline">
  			<input type="checkbox" id="check_sing" value="check_sing"> 노래
		</label>
		<label class="checkbox-inline">
  			<input type="checkbox" id="check_dance" value="check_dance"> 댄스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_band" value="check_band"> 밴드
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_guitar" value="check_guitar"> 기타
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_piano" value="check_piano"> 피아노
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_magic" value="check_magic"> 마술
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_other" value="check_other"> 그외..
		</label>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div class="InputFile">
    		<br><label for="InputFile">팀 프로필 사진</label>
    		<input type="file" id="InputFile"> 
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
  		<div class="form-group">
 		    <br/><label for="updateVideo">팀 홍보 영상</label>
    		<input type="text" class="form-control" id="updateVideo"name="updateVideo" placeholder="영상URL을 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<label>팀 설명</label>
		<textarea class="form-control" rows="5"></textarea>
		<!-- ################################################### -->
		<!-- ################################################### -->
		<!-- submit button -->
  			<button type="submit" class="btn btn-success" id="submitBtn">정보수정</button>
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