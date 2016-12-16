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
<!-- bPopup -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">

</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->

<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />

<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<table id="tableTdmargin" style="margin:0 auto; width:750px;">
	<!-- 수정 삭제버튼 -->
	<tr>
		<td>
	<div class="MDBtn">
		<a class="ModifyBtn">
			<button type="button" class="btn btn-info mdBtn">
				<input type="hidden" value="${show.shNo}">
				수정
			</button>
		</a>
		<a class="deleteBtn">
		<button type="button" class="btn btn-danger dlBtn">
			<input type="hidden" value="${show.shNo}">
			삭제
		</button>
		</a>
	</div>
		</td>
	</tr>
	<tr> <!-- 제목 들어가는 부분 -->
	<td style="width:650px;">
	
	<div style="width:650px;"><h1><img src="<%=projectName %>/resources/images/together_img/idea.png">TITLE : ${show.shName}</h1></div>
	
	</td>
	</tr>
	
	<tr><!-- 영상 들어가는 부분 -->
	<td>
	<div>
	<iframe width="750" height="450"
		src="${show.shVideo}" >
	</iframe></div>
	</td>
	</tr>
	
	<tr><!-- 팀이름-->
	<td>
	<div>
	
	<h4><img src="<%=projectName %>/resources/images/together_img/star.png">
	
	TeamName : ${show.shTeamName}</h4>
	</div>
	</td>
	</tr>
	
	<tr><!-- 팀타입-->
	<td>
	<div>
	
	<h4><img src="<%=projectName %>/resources/images/together_img/star.png">
	
	TeamType : ${show.shType}</h4>
	</div>
	</td>
	</tr>
	
	<tr> <!-- 주소 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	주소 : ${show.shMapAddr}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 상세주소 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	상세주소 : ${show.shMapDetail}
	</div>
	</td>
	</tr>
	
	
	<tr> <!-- 날짜 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	날짜: ${show.shDate}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 시간 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	시간: ${show.shTime}
	</div>
	</td>
	</tr>

	<tr><!-- 상세설명 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	상세설명 : <br/> <br/><pre>${show.shDetail}</pre>
	</div>
	</td>
	</tr>
	
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