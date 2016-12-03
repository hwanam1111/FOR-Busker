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
<link href="<%=projectName %>/resources/css/notice_css/noticeList.css?<?=filemtime('<%=projectName %>/resources/css/notice_css/noticeList.css')?>" rel="stylesheet" type="text/css" media="all">
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
<div class="hoc">  <!-- NoticeList -->
	<ul>
	<li><h1><img src="<%=projectName %>/resources/images/notice_img/notepad.png">NOTICE</h1></li>
	<li>
	<div class="floatRight marginBottom">
	<button type="button" class="btn btn-info" style="height:38px;"><a href="noticeForm.do" style="color:white">글쓰기</a></button>
		<button type="button" class="btn btn-secondary"><img src="<%=projectName %>/resources/images/notice_img/trash.png"></button>
	</div>
	<hr/>
	</li>
	<%for(int i=0;i<8;i++){ %> <!-- 이부분 db에서 공지사항 가져와서 반복문으로 넣을 꺼임 -->
	<li> 
	<div class="row">
	<div class="col-xs-1"><input type="checkbox" name="chk_info" value="HTML"></div>
	<div class="col-xs-9"><a href="noticeView.do">제목이 들어가는 부분입니다 제목을 넣으세요.빨리 넣으세요.당장이요</a></div>
	<div class="col-xs-2">2016-12-02</div>
	</div>
	<hr/>
	</li>
	<%} %>
	<li> <!-- 페이징 할 부분 -->
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
	</li>
	</ul>
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
