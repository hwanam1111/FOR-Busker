<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="busker.scan.vo.*" %>
    
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

	<!-- ################################################### -->
	<!-- 관리자 계정으로 로그인 했는지 확인 -->
	
	<%Object obj = session.getAttribute("login"); 
		MemberVO vo = null;
		if(obj!=null)vo = (MemberVO)obj;
		%>
		<%if(vo.getMemEmail().equals("help@busker.com")) { %>
		<script type="text/javascript">
		$(function() {
			$('#noticebtn').css('display', 'block');
		})
		</script>
		<% } %>
	<!-- ################################################### -->
	<!-- ################################################### -->
	<% } %>
<!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">  <!-- NoticeList -->
	<ul>
	<li><h1><img src="<%=projectName %>/resources/images/notice_img/notepad.png">NOTICE</h1></li>
	<li>
	<div class="floatRight marginBottom">
	<a href="noticeForm.do" style="color:white; display: none;" id="noticebtn"><button type="button" class="btn btn-info" style="height:38px;">글쓰기</button></a>
	</div>
	<hr/>
	<div class="row">
	<div class="col-xs-1">No.</div>
	<div class="col-xs-9">글 제목</div>
	<div class="col-xs-2" style="text-align: center">작성 시간</div>
	</div>
	<hr/>
	</li>
	
	<c:forEach var="notice" items="${list}">
	<li>
	<div class="row">
	<div class="col-xs-1">${notice.noticeNo}</div>
	<div class="col-xs-9"><a href="noticeView.do?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></div>
	<div class="col-xs-2">${notice.noticeDate}</div>
	</div>
	<hr/>
	</li>
	</c:forEach>
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
