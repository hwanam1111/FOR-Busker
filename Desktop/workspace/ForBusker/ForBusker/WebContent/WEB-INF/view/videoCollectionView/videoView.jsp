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
<link href="<%=projectName %>/resources/css/videoCollection_css/imggrid.css?<?=filemtime('<%=projectName %>/resources/css/videoCollection_css/imggrid.css')?>" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript">

function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    document.getElementById("openBtn").style.display="none";
    document.getElementById("closeBtn").style.display="block";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("closeBtn").style.display="none";
    document.getElementById("openBtn").style.display="block";
}
function clickLike(){
	alert("좋아요!");
	
}
</script>
</head>

<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
<div id="mySidenav" class="sidenav">
<!-- 	 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
	<div class="row-xs-4">
	<a href="videoView.do"><img class='videothumb' src="https://img.youtube.com/vi/ePpPVE-GGJw/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a>
    </div>
    <div class="row-xs-4">
    <a href="videoView.do"><img class='videothumb' src="https://img.youtube.com/vi/MmA4TlBiVRs/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a></div>
    <div class="row-xs-4">
    <a href="videoView.do"><img class='videothumb' src="https://img.youtube.com/vi/cPruvJFnI48/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a></div>
</div>
<div class='row'>

<div class='col-xs-12' style="width: 640px; margin: 0px auto;">

<iframe width="640" height="360" src="http://www.youtube.com/embed/ePpPVE-GGJw" frameborder="0" allowfullscreen></iframe>
<div class='videoContent'>
<table class='toptablemenu'>
	<tr>
		<td colspan='2'><h2>공연제목</h2></td>			
	</tr>
	<tr>
		<td>공연자</td>
		<td style="text-align: right;">조회수</td>
	</tr>
</table>
공연내용 :<br/>
아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>아아아<br/>
<img src="<%=projectName %>/resources/images/video_img/thumbs-up32.png" onclick="clickLike()"/>좋아요수
</div>
</div>
<div class='col-xs-2'><span id='openBtn'  style="font-size:30px;cursor:pointer;display:block" onclick="openNav()">&#9776; open</span>
<span id='closeBtn' style="font-size:30px;cursor:pointer;display:none" onclick="closeNav()">&times; close</span></div>
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
