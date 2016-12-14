<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="width:640px; height: 360px;">
<img src="<%=projectName %>/resources/images/error_img/warning.jpeg" style="width:150px; height: 150px; margin-left:245px; margin-top:60px;">
<p style="text-align: center; margin-top:15px;">요청하신 영상 찾을 수 없습니다.<br/>
<p style="text-align: center; margin-top:15px;">영상 수정을 들어가셔서<br/>
<p style="text-align: center; margin-top:15px;">해당 영상 URL을 확인해주십시오.<br/>
</div>
</body>
</html>