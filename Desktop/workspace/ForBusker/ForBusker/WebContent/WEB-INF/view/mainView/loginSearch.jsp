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
<link href="<%=projectName %>/resources/css/login_css/loginSearch.css?<?=filemtime('<%=projectName %>/resources/css/login_css/loginSearch.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js?<?=filemtime('<%=projectName %>/resources/js/popup_js/jquery.bpopup.js')?>"></script>
<script src="http:////cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=projectName %>/resources/js/login_js/loginSearch.js?<?=filemtime('<%=projectName %>/resources/js/login_js/loginSearch')?>"></script>
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
	<!-- id password 찾기 text -->
	<div id="searchForm">
		FOR_Busker 페이지에 오신것을 환영합니다. <br/>
		ID와 Password를 찾는 페이지 입니다. <br/>
		원하시는 찾기 메뉴를 선택하여 주십시오. <br/>
		<hr/>
		<!-- ################################################### -->
		<!-- ################################################### -->
		<!-- id password 찾기 img -->
		<img src="<%=projectName %>/resources/images/login_img/idSearch.png" class="login_img" id="popupImg">
		<a href="pwSearch.do"><img src="<%=projectName %>/resources/images/login_img/pwSearch.png" class="login_img"></a>
		<p>
			<span id="temp_span">ID 찾기</span>
			<span>PW 찾기</span>
		</p>
	</div>
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- popup -->
	<div id="popup" class="popup-div popup-style">
		<div class="content">
			<div class="b-ajax-wrapper" style="height: auto; width: auto;">
    		<span class="button b-close" id="close"><span>X</span></span><br/>
    		<a href="simpleIdSearch.do"><img src="<%=projectName %>/resources/images/join_img/join_people2.png" class="join_img"></a>
			<a href="buskerIdSearch.do"><img src="<%=projectName %>/resources/images/join_img/join_people1.png" class="join_img"></a><br><br>
			<span id="temp_spanPop">일반 아이디찾기</span>
			<span>공연자 아이디찾기</span>
			</div>
		</div>
	</div>
	
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