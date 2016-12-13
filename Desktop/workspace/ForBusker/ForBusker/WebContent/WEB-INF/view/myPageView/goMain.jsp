<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>

<% session.invalidate(); %>
<% response.sendRedirect("main.do");%>	
