<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="busker.scan.vo.*" %>

<%Object obj = request.getAttribute("vo"); 
MemberVO mvo = null;
String result= "NO";
System.out.println("1");
if(obj != null) {
	mvo = (MemberVO) obj;
	mvo.getMemEmail();
	result = "YES";
	
}

	out.write(result);
%>