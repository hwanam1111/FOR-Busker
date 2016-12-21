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
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/myPage_js/simpleUpdate.js?<?=filemtime('<%=projectName %>/resources/js/myPage_js/simpleUpdate.js')?>"></script>


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
	<h1 id="update_title" style="font-size:30px;">정보수정</h1>
	<!-- simpleJoin Form -->
	<form id="updateForm" action="updateSimple.do">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="updateEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="updateEmail" name="updateEmail" placeholder="${sessionScope.login.memEmail}" value="${sessionScope.login.memEmail}" maxlength="50" readonly="readonly">
    		</div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePassword">새 비밀번호</label>
    		<input type="password" class="form-control" id="updateSimplePassword" name="updateSimplePassword" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePasswordOk">새 비밀번호확인</label>
    		<input type="password" class="form-control" id="updateSimplePasswordOk" name="updateSimplePasswordOk" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="updateTel">전화번호</label>
    		<input type="tel" class="form-control" id="updateTel"name="updateTel" placeholder="전화번호를 입력하세요"  value="${sessionScope.login.memPhone}" maxlength="13">
  		</div>
  		
		<!-- submit button -->
		<div id="buttonGroup">
			<button type="button" class="btn btn-success" id="buskerRegistBtn">공연자회원등록</button>
  			<button type="submit" class="btn btn-success" id="submitBtn">정보수정</button>
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