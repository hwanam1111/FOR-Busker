<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="busker.scan.vo.TogetherVO"%>
<%@page import="java.util.*"%>
<% String projectName = "/ForBusker"; %>
<%
	List<TogetherVO>list=(List<TogetherVO>)request.getAttribute("voList"); 

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
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- rightBanner css -->
<link href="<%=projectName %>/resources/css/rightBanner_css/rightBanner.css?<?=filemtime('<%=projectName %>/resources/css/rightBanner_css/trightBanner.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName %>/resources/js/together_js/togetherList.js?<?=filemtime('<%=projectName %>/resources/js/together_js/togetherList.js')?>"></script>
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
<table>
	<tr> <!-- 어떤 view인지 들어가는 부분 -->
	<h1>TogetherList</h1>
	</tr>
	<tr> <!-- 검색창 들어갈 부분 -->
	<div class="row marginTop50" style="margin-left:1px;">
	<div class="col-xs-4">
		<input class="form-control" type="text" value="${searchVal}"
				id="toSearch"/>
	</div>
	<div class="col-xs-2">
	 <a id="nextPage"><button type="button" class="btn btn-outline-info" style="position: relative; right:20px;"id="searchBtn">검색</button></a>
	</div>
	
	<div class="col-xs-6 ">
		<a href="togetherForm.do">
			<button type="button" class="btn btn-outline-secondary marginRight" id="moveToFormBtn">등록하기</button>
		</a>
	</div>
	</div>
	
	</tr>
	
	<!-- ##############함께하기 리스트 반복문으로 뽑아주는 부분입니다.################## -->
	 <%
	int su=0;
	if(list.size()>=3){
		if(list.size()%3==0){
			su=0;	
		}else{
			su=1;
		}
	}else{
		su=1;
	}%>
	
	<%for(int j=0;j<(list.size()/3)+su;j++){%>
	<tr>
	<%
	if(j>0){
		j+=2;
	}
	for(int i=j;i<j+3&&i<list.size();i++){%>
		<div class="col-xs-4 marginTop50">
			<div> <!-- 이미지들어가는부분 -->
			<a href="togetherView.do?toNo=<%=list.get(i).getToNo()%>"> <!-- 해당 이미지 누르면 링크타고 들어가기 -->
				<img src="<%=projectName %>/upload/<%=list.get(i).getToPhoto()%>" style="height:300px; width:300px;">
			</a>		
			</div>
		
			<div class="detail">
			<div><strong><%=list.get(i).getToName()%></strong></div>  <!-- 팀명 들어가는 부분 -->
			<div><strong><%=list.get(i).getToNeed()%></strong></div><!-- 찾는 역할 들어가는 부분 -->
			</div>
			
		</div>
	<%} %> <!-- end inner forloop -->
	</tr>

	<%} %> <!-- end outer forloop -->
		
	 <%if(list.size()%3 == 2){ %>
	 <tr>
     <div class="col-xs-4 marginTop50">
   		<div class="col-xs-4 marginTop50" >
			    <div style="height:350px; width:300px;">
				</div>
	    </div>
    </div>
    </tr>
    <%} else if(list.size()%3 == 1){%>
    	<%for(int i=0;i<2;i++){ %>
    	<tr>
	     <div class="col-xs-4 marginTop50" >
			    <div style="height:350px; width:300px;">
				</div>
	    </div>
	    </tr>
    	<%} %>
    <%} %>	

		
<!-- ########################################################################## -->		
	<tr> <!-- 페이징 할 부분(paging master) -->
	<nav aria-label="..."  align="center">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    <li class="page-item"><a class="page-link" href="#">1</a></li>
	    <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li>
	    <li class="page-item"><a class="page-link" href="#">4</a></li>
	    <li class="page-item"><a class="page-link" href="#">5</a></li>
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</tr>	
</table>
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

