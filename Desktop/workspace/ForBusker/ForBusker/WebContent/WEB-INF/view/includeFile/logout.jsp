<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String projectName = "/ForBusker"; %>
<!DOCTYPE html>

<%
 request.setCharacterEncoding("UTF-8");
 
 session.removeAttribute("username");
//username 으로 들어온 session을 제거

System.out.println("로그아웃 세션" + session.getAttribute("username"));
 response.sendRedirect("logoutOk.do");
// 페이지의 메인으로 이동
%>