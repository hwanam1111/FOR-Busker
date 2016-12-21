<!-- 
	@author : 이진욱
	@date : 2016. 12. 05
	@desc : 후원하기,후원해주세요 리스트 부분 
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import= "java.util.*" %>
 <%@ page import ="busker.scan.vo.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String projectName = "/ForBusker"; %>

<% 
	//cate 값 받아오기 -> 값이 없으면 spon으로
 	String cate = request.getParameter("cate");
	if( cate == null) cate = "spon";
   //후원하기, 후원해주세요 리스트 받기
   List<SponserVO> sponList = null;
   List<BackedVO> backedList = null;

   //search값 받아오기
   String search = (String)request.getAttribute("search");
   if( (search !=null && search.equals("null") )|| search == null ) search="";
  
   if( cate.equals("spon")) sponList = (List)request.getAttribute("sponList");
   else if ( cate.equals("backed")){
	   backedList = (List)request.getAttribute("backedList");
	   System.out.println(backedList.get(0).getBackVideo());
	   
   }
   //페이징 클래스 받아오기
   PageVO pVO = (PageVO)request.getAttribute("page");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Bootstrap 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/sponser_css/sponserTab.css?<?=filemtime('<%=projectName %>/resources/css/sponser_css/sponserTab.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- rightBanner css -->
<link href="<%=projectName %>/resources/css/rightBanner_css/rightBanner.css?<?=filemtime('<%=projectName %>/resources/css/rightBanner_css/trightBanner.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName %>/resources/js/sponser_js/sponser.js?<?=filemtime('<%=projectName %>/resources/sponser_js/sponser.js')?>" type="text/css"></script>
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript">

//탭 클릭시 css 변경
$(function(){
	if( '<%=cate%>' == 'spon'  ){
    
    	$("ul.tabs li:first").addClass("kkk").css("color", "darkred");
        $("ul.tabs li:last").removeClass("kkk").css("color", "#333");
    }else if('<%=cate%>' == 'backed' ){
    	
    	$("ul.tabs li:last").addClass("kkk").css("color", "darkred");
        $("ul.tabs li:first").removeClass("kkk").css("color", "#333");
    }
});
</script>
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
<div id="container">
    <ul class="tabs" style="border:none; margin-left:15px;">
        <li class="kkk" rel="tab1" >후원하기</li>
        <li rel="tab2">후원해주세요</li>
    </ul>
    <div class="tab_container">
      
     <% if( cate != null && cate.equals("spon")) { %>       
<table> <!-- 후원합니다 TAB-->
	
   	<tr> <!-- 검색창 들어갈 부분 -->
	<div class="row marginTop50" id="searchForm">
	<div class="col-xs-4">
		<%if(search !=null){ %>
		<input class="form-control" type="text" id="example-text-input1" value=<%=search %> >
				
		<%} else{%>		
		<input class="form-control" type="text" id="example-text-input1" placeholder="제목으로 검색어를 입력하세요" >
		<%} %>				
	</div>
	<div class="col-xs-2" style="position: relative; right:20px">
		
		<button type="button" class="btn btn-info" id="sponSearchBtn">검색</button>
		
	</div>
	
	<c:if test="${null ne sessionScope.login}">
	<div class="col-xs-6 ">
		<button type="button" class="btn btn-info marginRight" id="moveToSponBtn" style="float: right;">후원하기</button>
	</div>
	</c:if>
	</div>
	
	</tr>
	
    <% for(SponserVO svo:sponList){ %>	
    <div class="col-xs-4 marginTop50">
			<div> <!-- 이미지들어가는부분 -->
			<a href="sponserView.do?num=<%=svo.getSpNo()%>"> <!-- 해당 이미지 누르면 링크타고 들어가기 -->
				<!-- 임시경로 -->
<!-- 				<img src="C:\\upload\\Image\\${list.spPhoto }"> -->
				<img src="<%=projectName %>/upload/<%=svo.getSpPhoto()%>" style="width:300px; height:200px;" onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';">
			</a>
			</div>
		
			<div class="detail">
			<div><strong><%=svo.getSpName() %></strong></div> <!-- 제목 들어가는 부분 -->
			<div><strong><%=svo.getSpCond() %></strong></div> <!-- 조건 들어가는 부분 -->
			</div>
			
		</div>
    <%} %>
    <!-- 틀 맞춰주는 부분 -->
    <!-- 마지막이 두개인 경우 -->
    <%if(sponList.size()%3 == 2){ %>
    <div class="col-xs-4 marginTop50">
   		<div style="height:250px; width:300px;"></div>
	</div>
	<!-- 마지막이 한개인 경우 -->  
    </div>
    <%} else if(sponList.size()%3 == 1){%>
    	<%for(int i=0;i<2;i++){ %>
		    <div class="col-xs-4 marginTop50">
	   			<div style="height:250px; width:300px;"></div>
			</div>
		    
    	<%} %>
    <%} %>	

		
	<tr> <!-- 페이징 할 부분(paging master) -->
	<nav align="center">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="sponAndBacked.do?cate=spon&page=<%=pVO.getPreviPage()%>&search=<%=search%>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href="sponAndBacked.do?cate=spon&page=<%=i%>&search=<%=search%>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href="sponAndBacked.do?cate=spon&page=<%=pVO.getNextPage()%>&search=<%=search%>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</tr>
	
</table> 
<%} %>	     
       
        
       
   <% if( cate != null && cate.equals("backed")) {%>
        
<table> 
    <tr> <!-- 검색창 들어갈 부분 -->
	<div class="row marginTop50" id="searchForm1">
	<div class="col-xs-4" >
		<%if(search !=null){ %>
		<input class="form-control" type="text" id="example-text-input2" value=<%=search %>>
		<%} else{%>		
		<input class="form-control" type="text" id="example-text-input2" placeholder="제목으로 검색어를 입력하세요" />
		<%} %>
	</div>
	<div class="col-xs-2" style="position: relative; right:20px">
		<button type="button" class="btn btn-info" id="backedSearchBtn">검색</button>
	</div>
	<c:if test="${null ne sessionScope.login}">
	<div class="col-xs-6">
		<button type="button" class="btn btn-info marginRight" id="moveToBackedBtn" style="float: right;">후원받기</button>
	</div>
	</c:if>
	</div>
	</tr> 
	
	
    <% for(BackedVO bvo:backedList){ %>	
    <div class="col-xs-4 marginTop50" style="height:245px;">
			<div> <!-- 이미지들어가는부분 -->
			<a href="backedView.do?num=<%=bvo.getBackNo()%>"> <!-- 해당 이미지 누르면 링크타고 들어가기 -->
				<!-- 일단 걍 사진으로 -->
			<img src="https://img.youtube.com/vi/<%=bvo.getBackVideo() %>/hqdefault.jpg" style="width:300px; height:200px;">
			</a>
			</div>
		 
			<div class="detail">
			<div style="margin-top:10px; margin-bottom:5px;"><strong>TITLE : <%=bvo.getBackName() %></strong></div> <!-- 제목 들어가는 부분 -->
			<div class="backCon">CONTENT : <%=bvo.getBackContent() %></div> <!-- 조건 들어가는 부분 -->
			</div>
			
		</div>
    <%} %>
    <!-- 틀 맞춰주는 부분 -->
    <%if(backedList.size()%3 == 2){ %>
    <div class="col-xs-4 marginTop50" >
   		 <div style="height:250px; width:300px;">
		 </div>
	   
    </div>
    <%} else if(backedList.size()%3 == 1){%>
    	<%for(int i=0;i<2;i++){ %>
	     <div class="col-xs-4 marginTop50">
			    <div style="height:250px; width:300px;" >
				</div>
	    </div>
    	<%} %>
    <%} %>	
	
	
	
	<nav align="center">
	  <ul class="pagination pagination-lg" style="margin-top: 60px;">
	    <li class="page-item">
	      <a class="page-link" href="backedList.do?cate=backed&page=<%=pVO.getPreviPage()%>&search=<%=search %>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href="backedList.do?cate=backed&page=<%=i%>&search=<%=search %>"><%=i %></a></li>
	    <%} %>
	    <li class="page-item">
	      <a class="page-link" href="backedList.do?cate=backed&page=<%=pVO.getNextPage()%>&search=<%=search %>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	
</table>      
<% } %> <!-- end if -->	   
       
       
    </div>
    <!-- .tab_container -->
</div><!-- #container -->

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

