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
<!-- include header -->
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/message_css/message.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=projectName %>/resources/js/message_js/message.js"></script>
<</head>

<body id="top">


<!-- 이부분 부터 코딩 시작 -->
			<form class="form-inline"> 
			<div class="form-group" align="center" >
			<table style="width:450px" border="1">
				<tr align="left">
					<td>수신자 </br> 내용</td>
				</tr>
				<tr align="right">
					<td>내용</td>
				</tr>
			</table>
    		<input type="text" id="inputText" class="form-control"/>
			<button type="button"  class="btn btn-info form-control">전송</button>
			</div>
			</form>


<!-- 코딩 종료 -->


<!-- #############  반응형 모바일 js  ############# -->
<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
<!-- ################################################### -->
</body>
</html>