<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			$('#viewbtn').css('display', 'block');
		})
		</script>
		<% } %>
	<!-- ################################################### -->
	<!-- ################################################### -->

<% } %>
<!-- ################################################### -->

<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<ul>
		<li><!-- notice view -->
		<h1><img src="<%=projectName %>/resources/images/notice_img/notepad.png"> NOTICE VIEW</h1>
		</li>
		<li align="right" class="marginBottom" id="viewbtn" style="display: none;"><!-- 수정 삭제 버튼-->
			<a href="noticeFormUpdate.do?noticeNo=${map.noticeNo}"><button type="button" class="btn btn-info" style="height:38px;">수정</button></a>
	        <a href="noticeFormDelete.do?noticeNo=${map.noticeNo}"><button type="button" class="btn btn-secondary"><img src="<%=projectName %>/resources/images/notice_img/trash.png"></button></a>
		</li>
		<li><!-- 제목,글 -->
		<div id="noticeView">
			<ul class="marginRight">
				<li class="marginTop30"><!-- 제목 -->
				<h3>${map.noticeTitle}</h3>
				<hr/>
				</li>
				<li align="right">
				${map.noticeDate}
				</li>
				<li class="marginBottom marginTop30"><!-- 글 -->
				${map.noticeContent}
  </div>
				</li>
			</ul>
		</div>
		</li>
		<li align="center">
			<button type="button" class="btn btn-warning"><a href="noticeList.do" style="color:white">목록보기</a></button>
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
