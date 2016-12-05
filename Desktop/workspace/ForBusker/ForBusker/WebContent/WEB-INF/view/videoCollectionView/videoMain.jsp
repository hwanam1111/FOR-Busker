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
<!-- rightBanner css -->
<link href="<%=projectName %>/resources/css/rightBanner_css/rightBanner.css?<?=filemtime('<%=projectName %>/resources/css/rightBanner_css/trightBanner.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- sponser js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/sponser_js/sponser.js?<?=filemtime('<%=projectName %>/resources/sponser_js/sponser.js')?>" type="text/css"></script>


<body id="top">
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->

<!-- ############   rightBanner include  ###############-->
<jsp:include page="/WEB-INF/view/includeFile/rightBanner.jsp" />
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<h1> Video Collections </h1>
	<div class="container-fluid">
  <p>Resize the browser window to see the Video.</p>
  <div class="row" style="margin-top:40px;">
    <div class="col-xs-4"><a href="videoView.do?imgpath=https://img.youtube.com/vi/ePpPVE-GGJw/hqdefault.jpg"><img class='videothumb' src="https://img.youtube.com/vi/ePpPVE-GGJw/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a>
    </div>
    <div class="col-xs-4"><a href="videoView.do?imgpath=https://img.youtube.com/vi/MmA4TlBiVRs/hqdefault.jpg"><img class='videothumb' src="https://img.youtube.com/vi/MmA4TlBiVRs/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a></div>
    <div class="col-xs-4"><a href="videoView.do?imgpath=https://img.youtube.com/vi/cPruvJFnI48/hqdefault.jpg"><img class='videothumb' src="https://img.youtube.com/vi/cPruvJFnI48/hqdefault.jpg" ><br/>
    	영상제목 팀명 올린날짜</a></div>
   <!--  <div class="col-xs-4" style="background-color:lavender;">4번동영상</div>
    <div class="col-xs-4" style="background-color:lavenderblush;">5번동영상</div>
    <div class="col-xs-4" style="background-color:lavender;">6번동영상</div>
    <div class="col-xs-4" style="background-color:lavender;">7번동영상</div> -->
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
