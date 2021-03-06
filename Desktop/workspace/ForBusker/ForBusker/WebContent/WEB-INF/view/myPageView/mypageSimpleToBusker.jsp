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
</head>

<body id="top">

<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>

<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<!-- ################################################### -->
	<!-- ################################################### -->
	<h1 id="update_title" style="margin-left:100px;">정보수정</h1> <br/>
	<!-- simpleJoin Form -->
	<form id="updateSimpleToBuskerForm" action="updateSimpleToBusker.do" method="post" enctype="multipart/form-data" style="width:700px; margin-left:140px;">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="updateEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="updateEmail" name="memEmail" placeholder="${sessionScope.login.memEmail}" value="${sessionScope.login.memEmail}" maxlength="50" readonly="readonly">
    		</div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="updateTeamName">팀 이름</label>
    		<input type="text" class="form-control" id="updateTeamName"name="memTeamName" placeholder="팀명을 입력하세요" maxlength="13">
  		</div>
  		<!-- ################################################### -->
  		<!-- ##################### CheckBox #################### -->
		<!-- ################################################### -->
		<label>공연장르</label>
  		<label class="checkbox-inline">
  			<input type="checkbox" id="check_sing" value="노래" name="memTeamType" > 노래
		</label>
		<label class="checkbox-inline">
  			<input type="checkbox" id="check_dance" value="댄스" name="memTeamType"> 댄스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_band" value="연주" name="memTeamType"> 연주
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_guitar" value="마술" name="memTeamType"> 마술
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_piano" value="퍼포먼스"name="memTeamType"> 퍼포먼스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" id="check_magic" value="기타" name="memTeamType"> 기타
		</label>
  		<!-- #################################################### -->
		<!-- ################################################### -->
		<div class="InputFile">
    		<br><label for="InputFile">팀 프로필 사진</label>
    		<input type="file" id="InputFile" name="file"> 
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <br/><label for="updateVideo">팀 홍보 영상</label>
    		<input type="text" class="	form-control" id="updateVideo"name="memVideo" placeholder="영상URL을 입력하세요">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<label>팀 설명</label>
		<textarea class="form-control" rows="5" name="memDetail"></textarea>
		
  		
		<!-- submit button --><br/>
		<div id="buttonGroup" style="float: right;">
  			<button type="submit" class="btn btn-success" id="submitBtn">등록</button>
  			<button type="reset" class="btn btn-success" id="resetBtn">다시작성</button>
		</div>
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
