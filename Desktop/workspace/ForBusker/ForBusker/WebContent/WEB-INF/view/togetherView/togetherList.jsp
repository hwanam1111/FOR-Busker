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
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
<table>
	<tr> <!-- 어떤 view인지 들어가는 부분 -->
	<h1>TogetherList</h1>
	</tr>
	<tr> <!-- 검색창 들어갈 부분 -->
	<div class="row marginTop50" style="margin-left:1px;">
	<div class="col-xs-4">
		<input class="form-control" type="text" placeholder="검색어를 입력하세요 ex)기타,보컬" 
				id="example-text-input"/>
	</div>
	<div class="col-xs-2">
		<button type="button" class="btn btn-outline-info" style="position: relative; right:20px;">검색</button>
	</div>
	
	<div class="col-xs-6 ">
		<a href="togetherForm.do">
			<button type="button" class="btn btn-outline-secondary marginRight" id="moveToFormBtn">등록하기</button>
		</a>
	</div>
	</div>
	
	</tr>
	

	<%for(int j=0;j<3;j++){ %>
	<tr>
	<%for(int i=0;i<3;i++){ %>
		<div class="col-xs-4 marginTop50">
			<div> <!-- 이미지들어가는부분 -->
			<a href="togetherView.do"> <!-- 해당 이미지 누르면 링크타고 들어가기 -->
				<img src="<%=projectName %>/resources/images/together_img/music.jpg">
			</a>		
			</div>
		
			<div class="detail">
			<div><strong>팀명 들어가는 부분입니다.</strong></div> <!-- 팀명 들어가는 부분 -->
			
			<div><strong>찾는 역할 들어가는 부분입니다.</strong></div><!-- 찾는 역할 들어가는 부분 -->
			</div>
			
		</div>
	<%} %> <!-- end inner forloop -->
	</tr>

	<%} %> <!-- end outer forloop -->
		
	<tr> <!-- 페이징 할 부분(paging master) -->
	<nav aria-label="..."  align="center">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
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

