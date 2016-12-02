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
<!-- sponserView css -->
<link href="<%=projectName %>/resources/css/sponser_css/sponserView.css?<?=filemtime('<%=projectName %>/resources/css/sponser_css/sponserView.css')?>" rel="stylesheet" type="text/css" media="all">


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
<div class='hoc'>
	<h1> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Sponser View</h1>
	<!-- 제목,이미지  -->
	<div class="sponimg">
		<p>제목입니다제목이에요</p>
		<img  src="./music.jpg">
		
	</div>
	
	<!-- 내용, 조건, 전화번호 -->
	<div class="sponContent">
		<h2>Content</h2>
		<p> 아침에 약속있었는데 많이 늦었어요 웬만해서 뛰지 않는데 그냥 오늘은 한번 달리고 싶었어요 
		집 앞에 공원이 있는데 거기 비둘기 까치 참새가 많거든요 신호등앞에 비둘기 옹기종기 모여져있는데
		 신호등이 파란불로 변해서 전속력으로 뛰었어요  모르겠다 뛰면 비둘기들이 놀래서 날아가겠지. 
		 그건 오산 제가 비둘기 발로 까서 날라갔어요 진짜 식겁 그 발에 촉감 지금도 생생해요  발로 까고 뒤 돌아보니까 
		 비둘기 쓰러져 있고 옆에 어떤 유치원생은 울고 있고 비둘기 밥주는데 발로 깟다고 엄마가 괜찮다고 달래는데 뻘쭘</p>
		<h2>Condition</h2>
		<p>여긴 조건조건조건조건조건조건조건조건조건조건조건조건 </p>
		<h2>Tel</h2>
		<p>
		010-2058-7155 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
		<button type="button" class="btn btn-primary">문의하기</button>
		</p>
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
