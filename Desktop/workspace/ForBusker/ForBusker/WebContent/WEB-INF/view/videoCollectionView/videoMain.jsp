<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="busker.scan.vo.*"%>    
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String projectName = "/ForBusker"; %>
<%	
	List<VideoVO>list=(List<VideoVO>)request.getAttribute("list"); 
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
<link href="<%=projectName %>/resources/css/videoCollection_css/imggrid.css?<?=filemtime('<%=projectName %>/resources/css/videoCollection_css/imggrid.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- rightBanner css -->
<link href="<%=projectName %>/resources/css/rightBanner_css/rightBanner.css?<?=filemtime('<%=projectName %>/resources/css/rightBanner_css/trightBanner.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- together css -->
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- sponser js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/sponser_js/sponser.js?<?=filemtime('<%=projectName %>/resources/sponser_js/sponser.js')?>" type="text/css"></script>
<script type="text/javascript">
window.onerror = function() {
		document.getElementById('videothumb').attr.src = "<%=projectName %>/resources/images/error_img/errorImg.jpg";
	
}
</script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<script type="text/javascript">
$(function() {
	$("#movieBtn").css("display", "block");
});
</script>
<% } %>
<!-- ################################################### -->

<!-- ############   rightBanner include  ###############-->

<jsp:include page="/WEB-INF/view/includeFile/rightBanner.jsp" />

<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<h1 style="font-size:30px;">영상모음</h1>
	<div class="container-fluid">
	<div id="movieBtn" style="display:none;width:300px;" >
		<a href="videoUpload.do">영상등록하는방법확인</a> &nbsp;&nbsp;
		<a href="videoForm.do"><button type="button" class="btn btn-info">영상등록</button></a>
	</div>
  <div class="row" style="margin-top:40px;">
  
 <!-- ################################################ --> 
 <!-- 리스트 forEach -->
 <!-- ################################################ -->
  <c:forEach var="video" items="${list}">
  	<div class="col-xs-4" style="margin-bottom:60px;">
  		<a href="videoLikeSearch.do?videoNo=${video.videoNo}&memEmail=${video.memEmail}
  		&myId=${sessionScope.login.memEmail}&imgpath=${video.videoUrl}">
  		
  		<img class='videothumb' id="videothumb" style="width:296.66px; height:222.48px;" 
  		src="https://img.youtube.com/vi/${video.videoSomenale}/hqdefault.jpg"><br/><br/>
    	
    	<p class="videoTitle" style="height: 33px;">Title : ${video.videoName}</p></a>
    	<p>TeamName : ${video.memTeamName}</p>
    	<p>Date : ${video.videoDate}</p>
    	<input type="hidden" value="${video.memEmail}" name="memEmail">
    </div>
  </c:forEach>
	<%if(list.size()%3 == 2){ %>
	 
     <div class="col-xs-4 marginTop50">
   		<div class="col-xs-4 marginTop50" >
			    <div style="height:350px; width:300px;">
				</div>
	    </div>
    </div>
   
    <%} else if(list.size()%3 == 1){%>
    	<%for(int i=0;i<2;i++){ %>
    	
	     <div class="col-xs-4 marginTop50" >
			    <div style="height:350px; width:300px;">
				</div>
	    </div>
	    
    	<%} %>
    <%} %>	
  	 	

  <!-- ################################################ -->
  <!-- ################################################ -->
 
  <nav aria-label="..." style="margin-left:400px;">
   <ul>
   <li> 
	<nav aria-label="..." >
	  <ul class="pagination pagination-lg" >
	    <li class="page-item">
	      <a class="page-link" href=" videoMain.do?page=<%=pVO.getPreviPage()%>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href=" videoMain.do?page=<%=i%>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href=" videoMain.do?page=<%=pVO.getNextPage()%> " aria-label="Next">
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
