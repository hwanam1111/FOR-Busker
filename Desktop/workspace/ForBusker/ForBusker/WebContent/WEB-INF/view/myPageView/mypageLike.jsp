<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="busker.scan.vo.*"%> 
<%@ page import="java.util.*"%>    
<% String projectName = "/ForBusker"; %>
<%	
	List<VideoVO>list=(List<VideoVO>)request.getAttribute("likeList"); 
	//페이징 클래스 받아오기
	
	PageVO pVO = (PageVO)request.getAttribute("page"); 
%>
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
<link href="<%=projectName %>/resources/css/mypage_css/mypageLike.css?<?=filemtime('<%=projectName %>/resources/css/mypage_css/mypageLike.css')?>" rel="stylesheet" type="text/css" media="all">
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">

<h1 style="font-size:30px;">좋아요 목록</h1>
<div class="row" style="margin-top:50px;">
<c:forEach var='list' items="${likeList}">
	<div style="margin-bottom:60px; " class="col-xs-4">
		<div>
  	 	<a href="videoLikeSearch.do?videoNo=${list.videoNo}&myId=${sessionScope.login.memEmail}&imgpath=${list.videoUrl}">
  			<img class='videothumb' src="https://img.youtube.com/vi/${list.videoSomenale}/hqdefault.jpg" style="width:306.66px; height:229.98px;"><br/><br/>
    		<p style="height: 40px;">Title : ${list.videoName}</p></a>
    		<p>TeamName : ${list.memTeamName}</p>
    		<p>Date : ${list.videoDate}</p>
    		<input type="hidden" value="${list.memEmail}" name="memEmail"> 
    	</div>
	</div>
	</c:forEach>
</div>
<nav aria-label="..." style="margin-left:400px;">
   <ul>
   <li> 
	<nav aria-label="...">
	  <ul class="pagination pagination-lg" >
	    <li class="page-item">
	      <a class="page-link" href="mypageLike.do?page=<%=pVO.getPreviPage()%>&memEmail=${sessionScope.login.memEmail}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href="mypageLike.do?page=<%=i%>&memEmail=${sessionScope.login.memEmail}"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href="mypageLike.do?page=<%=pVO.getNextPage()%>&memEmail=${sessionScope.login.memEmail}" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
   </li> 
  </ul>
  </nav> 
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