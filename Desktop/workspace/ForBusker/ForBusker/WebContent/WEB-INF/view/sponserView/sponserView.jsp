<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- sponserView css -->
<link href="<%=projectName %>/resources/css/sponser_css/sponserView.css?<?=filemtime('<%=projectName %>/resources/css/sponser_css/sponserView.css')?>" rel="stylesheet" type="text/css" media="all">

<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">


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
<div class='hoc' >
<h1> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Sponser View</h1>
<table class="sponTable" >
	<td class="sponLeft">
	<div>
	
		<!-- 제목,이미지  -->
		<div class="sponimg">
			<h2>${selectSpon.spName }</h2>
			<!-- 이부분은 다름 -->
			<img  src="<%=projectName %>/upload/${selectSpon.spPhoto }">
		</div>
	</div>
	</td>
	
	<td class="sponRight" style="word-wrap:break-word" >
	<!-- 내용, 조건, 전화번호 -->
	<div>
		<h2>Content</h2>
		<div id="rightContent">
		${selectSpon.spContent}
		</div>
		<h2>Condition</h2>
		<p>	${selectSpon.spCond} </p>
		<h2>Tel</h2>
		<p>
		${selectSpon.spTel} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<button type="button" class="btn btn-primary">문의하기</button>
		</p>
	</div>
	</td>
	</table>
	
	
	
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
