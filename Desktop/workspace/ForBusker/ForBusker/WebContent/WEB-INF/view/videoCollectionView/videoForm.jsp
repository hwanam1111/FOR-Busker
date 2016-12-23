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
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/video_js/videoForm.js?<?=filemtime('<%=projectName %>/resources/js/video_js/videoForm.js')?>"></script>
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
<!-- ################################################### -->
<!-- 공연자인지 일반인인지 확인 --> 
<input type="hidden" value="${sessionScope.login.memTeamName}" id="hiddenTeamName">
<!-- ################################################### -->
<div class="hoc">
<form style="margin-left:140px; " id="videoForm">
<table style="margin-bottom: 80px;">
<!-- 어떤 입력폼인가 -->
<tr>
<h1>Video Regist</h1>
<br/>
<br/>

</tr>
<!-- ################################################### -->
<!-- 제목 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">제목</label>
  <div class="col-xs-8">
    <input class="form-control" type="text" placeholder="제목을 입력하세요" id="videoName" name="videoName">
  </div>
</div>
</tr>
<!-- ################################################### -->
<!-- 영상 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">업로드 영상</label>
  <div class="col-xs-8">
    <input class="form-control" type="text" placeholder="동영상을 업로드하세요" id="videoUrl" name="videoUrl">
  </div>
</div>
</tr>
<!-- ################################################### -->
<!-- 상세설명 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">상세설명</label>
  <div class="col-xs-8">
    <textarea class="form-control" id="videoDetail" rows="5" 
    		placeholder="그룹소개와 필요한 역할에 대해 자세히 적어주세요" name="videoDetail"></textarea>
  </div>
</div>
</tr>
<!-- ################################################### -->
<!-- 세션으로 이메일과 팀명을 가져옴 -->
<!-- ################################################### -->
<input type="hidden" value="${sessionScope.login.memEmail}" name="memEmail"/>
<input type="hidden" value="${sessionScope.login.memTeamName}" name="memTeamName"/>
<tr>
	<div align="center">
		<button type="button" class="btn btn-info" id="videoBtn">등록하기</button>
	</div>
</tr>

</table>
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

