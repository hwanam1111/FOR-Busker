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
<!-- include header -->
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="<%=projectName %>/resources/css/performance_css/default.css?<?=filemtime('<%=projectName %>/resources/css/performance_css/default')?>">
<!--지도 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bf714e7c229c1628818ddd8ed8bc7533"></script>

<!-- Bootstrap 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<%=projectName %>/resources/js/performance_js/picker.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker')?>"></script>
<script src="<%=projectName %>/resources/js/performance_js/picker.date.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker.date')?>"></script>
<script src="<%=projectName %>/resources/js/performance_js/legacy.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/legacy')?>"></script>
<script src="<%=projectName %>/resources/js/performance_js/performanceList.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/performanceList.js')?>"></script>
<!-- css -->

<link rel="stylesheet" href="<%=projectName %>/resources/css/performance_css/performanceList.css?<?=filemtime('<%=projectName %>/resources/css/performance_css/performanceList.css')?>">
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->

<div class="mapHoc" align="center">

<table style="width:100%;">
<!-- ****************************************    달력과 검색기능   ***************************************************-->
<tr> 
	<td colspan="2">   	
	<form class="form-inline"> 
	 <div class="form-group marginLeft"> <!-- 바깥 div -->
		<input id="input_01" type="text" class="datepicker form-control" name="date"  placeholder="오늘의 공연" style="width:100px;"/>
		<select class="form-control" id="exampleSelect1" style="width:70px;">
			<option>팀명</option>
			<option>카테고리</option>
		</select>
		<input class="form-control" type="text" placeholder="" id="example-text-input" style="width:300px;" />
		<button type="button" class="btn btn-outline-info form-control" style="width:50px;">검색</button>
		<button type="button" class="btn btn-outline-secondary marginRight form-control" id="moveToFormBtn" style="width:70px;">등록하기</button>
	</div>
	</form>
	</td>
</tr>
<!-- ****************************************    영상과 지도   ***************************************************-->

<tr>
<td class="col-xs-6">
<ul>
<% for (int i =0; i<2; i++){ %>
<!-- 동영상 -->
<li>
<iframe src="https://www.youtube.com/embed/ePpPVE-GGJw" frameborder="0" class="performVieo"></iframe>
</li>
<!-- 상세보기 -->
<li>
<form class="form-inline"> 
	 <div class="form-group" align="center" style="margin-left:130px">
		<label class="form-control"><a>팀명</a></label>						
		<label class="form-control"><a>상세보기</a></label>
	</div>
</form>
</li>
<% } %>
</ul>
</td>

<!-- *************************************** 지도 ************************************************ -->
<td class="col-xs-6">
<div id="map" class="mapSize"></div>
</td>
</tr>
</table>
	
</div> <!-- hoc 끝 -->

<!-- 달력 보여주는 div -->
<div id="container"></div>


<!-- 코딩 종료 -->
<!-- ##############  footer 부분 include  ############## -->
<jsp:include page="/WEB-INF/view/includeFile/footer.jsp" />
<!-- ################################################## -->
<!-- #############  반응형 모바일 js  ############# -->
<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
<!-- ################################################### -->
</body>
</html>