<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>

<body id="top">

<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<img src="<%=projectName %>/resources/images/error_img/warning.jpeg" style="width:240px; height: 240px; margin-left:370px; margin-top:60px;">
	<p style="text-align: center; font-weight: bold; font-size:17px; color:#000; margin-top:15px;">페이지를 찾을 수 없습니다.</p>
	<p style="text-align: center; margin-top:15px;">요청하신 페이지를 찾을 수 없습니다.<br/>
		<b style="color:#ffc19e;">잘못된 경로로 접근</b>하셨거나, <b style="color:#ffc19e;">사용할 수 없는 웹사이트 주소</b>입니다.<br/>
		이용에 불편을 드려 대단히 죄송합니다.</p>
	<hr style="width:400px;"/>
	<a href="main.do">
		<button type="button" style="width:200px; height: 35px; margin-left:390px; margin-top:10px;
		border-radius: 10px;  background-color:#ffc19e; border:none; color:#333;
		font-weight: 700">FOR Busker 홈으로 돌아가기</button>
	</a>
	
</div>




<!-- 코딩 종료 -->


<!-- #############  반응형 모바일 js  ############# -->
<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
<!-- ################################################### -->
</body>
</html>
