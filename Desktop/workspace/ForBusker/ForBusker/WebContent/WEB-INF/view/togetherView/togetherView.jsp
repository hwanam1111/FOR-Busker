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
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<table id="tableTdmargin">
	<tr> <!-- 제목 들어가는 부분 -->
	<td>
	<div class="col-xs-6"><h1><img src="<%=projectName %>/resources/images/together_img/idea.png">제목 들어가는 부분입니다.</h1></div>
	<div class="col-xs-3 floatRight">
		<button type="button" class="btn btn-info">수정</button>
		<button type="button" class="btn btn-danger">삭제</button>
	</div>
	</td>
	</tr>
	
	<tr><!-- 이미지 들어가는 부분 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/music.jpg" id="viewImg">
	</div>
	</td>
	</tr>
	
	<tr><!-- 영상 들어가는 부분 -->
	<td>
	<div>
	<iframe width="600" height="350"
		src="https://www.youtube.com/embed/XGSy3_Czz8k" >
	</iframe></td></div>
	</tr>
	
	<tr><!-- 구하는 역할이 들어가는 부분 -->
	<td>
	<div>
	
	<h4><img src="<%=projectName %>/resources/images/together_img/star.png">브레이크댄스를 자유자재로 추는 댄싱머신이 필요합니다.</h4>
	</div>
	</td>
	</tr>
	
	<tr><!-- 상세설명 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	상세설명: 저희 '쇼!끝은 없는 거야'팀은 홍대에서 주말에 댄스 공연을 하는 브레이크 댄스 그룹입니다.
	블라블라~~
	</div>
	</td>
	</tr>
	
	<tr> <!-- 모집기간 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	모집기간 : 2016-01-01 ~ 2016-12-31
	</div>
	</td>
	</tr>
	
	<tr> <!-- 담당자명 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	담당자명 : 이준배
	</div>
	</td>
	</tr>
	
	<tr> <!-- 연락처 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	연락처: 010-0000-0000
	</div>
	</td>
	</tr>
	
	<tr><!-- 문의하기 -->
	<td>
	<div align="center">
	<button type="button" class="btn btn-warning">쪽지 보내기</button>
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