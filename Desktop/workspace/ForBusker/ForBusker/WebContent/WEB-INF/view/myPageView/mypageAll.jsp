<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="busker.scan.vo.*"%>
<%@page import="java.util.*"%>
<%
	String projectName = "/ForBusker";
	String cate = request.getParameter("cate");
	if( cate == null) cate = "show";

	List<ShowVO> showList =null;
	List<SponserVO> sponList =null;
	List<BackedVO> backedList =null;
	List<VideoVO> videoList =null;
	List<TogetherVO> toList =null;
	
	if( cate.equals("show")){ showList = (List<ShowVO>)request.getAttribute("showList"); System.out.println("jsp위에 show에 옴");}
	else if ( cate.equals("sponser")){ sponList = (List<SponserVO>)request.getAttribute("sponserList"); System.out.println("jsp위에  sponser옴");}
	else if ( cate.equals("backed")){ backedList =  (List<BackedVO>)request.getAttribute("backedList"); System.out.println("jsp위에 backed옴");}
	else if ( cate.equals("video")){ videoList =  (List<VideoVO>)request.getAttribute("videoList"); System.out.println("jsp위에 video옴");}
	else if ( cate.equals("toList")){ toList = (List<TogetherVO>)request.getAttribute("toList"); System.out.println("jsp위에 join옴");}



	//페이징 클래스 받아오기
	PageVO pVO = (PageVO) request.getAttribute("page");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- Bootstrap 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery lib CDN URL -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- include css -->
<link
	href="<%=projectName%>/resources/css/index_css/include.css?<?=filemtime('<%=projectName%>/resources/css/index_css/include.css')?>"
	rel="stylesheet" type="text/css" media="all">
<link
	href="<%=projectName%>/resources/css/mypage_css/mypageAll.css?<?=filemtime('<%=projectName%>/resources/css/mypage_css/mypageAll.css')?>"
	rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript"
	src="<%=projectName%>/resources/js/myPage_js/mypageAll.js?<?=filemtime('<%=projectName%>/resources/js/myPage_js/mypageAll.js')?>"></script>

<script type="text/javascript">

$(function(){
	if( '<%=cate%>' == 'show'  ){
    	$(".tabs li").children().eq(0).addClass("changeColor")
    }else if('<%=cate%>' == 'sponser' ){
    	$(".tabs li").children().eq(1).addClass("changeColor")
    }else if('<%=cate%>' == 'backed' ){
    	$(".tabs li").children().eq(2).addClass("changeColor")
    }else if('<%=cate%>' == 'video' ){
    	$(".tabs li").children().eq(3).addClass("changeColor")
    }else if('<%=cate%>' == 'toList' ){
    	$(".tabs li a").eq(4).addClass("changeColor")
    }
});

</script>
<style type="text/css" rel="stylesheet">
nav{
position:relative;

}
</style>
</head>

<body id="top">
	<!-- #############  header nav부분 include  ############# -->
	<%
		if (session.getAttribute("login") == null) {
	%>
	<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
	<%
		} else {
	%>
	<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
	<%
		}
	%>
	<!-- ################################################### -->


	<!-- 이부분 부터 코딩 시작 -->
	<div class="hoc">
		<ul class="tabs">
			<li><a href="#ShowList">나의 공연</a></li>
			<li><a href="#SponserList">후원하기</a></li>
			<li><a href="#BackedList">후원받기</a></li>
			<li><a href="#VideoList">비디오</a></li>
			<li><a href="#JoinList">함께해요</a></li>
		</ul>


		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<!--###########################################  공연 리스트     ######################################################## -->
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<% if(cate.equals("show")) {  %>
	
			<div id="ShowList" class="tab_content" >
				<% for(ShowVO shvo:showList){ %>	
				
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a href="selectShowByNum2.do?shNo=<%=shvo.getShNo()%>">

							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="https://img.youtube.com/vi/<%=shvo.getShVideo()%>/hqdefault.jpg"><br />
						<br/>

							<p style="height: 40px;">Title : <%=shvo.getShName()%></p>
						</a>
						<p>Date : <%=shvo.getShDate() %></p>
						<input type="hidden" value="<%=shvo.getMemEmail() %>" name="memEmail">	
						</div>
						<%} %>
						<%if(showList.size()%3 == 2){ %>
   							 <div class="col-xs-4 marginTop50">
   								<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							 </div>
						<!-- 마지막이 한개인 경우 -->  
    					</div>
    					<%} else if(showList.size()%3 == 1){%>
    						<%for(int i=0;i<2;i++){ %>
		   					 <div class="col-xs-4 marginTop50">
	   							<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							</div>
		    
    					<%} %>
    			<%} %>	
		<!-- #####################################  페 이 징  ########################################################### -->
				<div align="center">
				  <ul class="pagination pagination-lg">
				    <li class="page-item">
				      <a class="page-link" href="mypageAll.do?cate=show&page=<%=pVO.getPreviPage()%>" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
				   	 	<li class="page-item"><a class="page-link" href="mypageAll.do?cate=show&page=<%=i %>"><%=i %></a></li>
				    <%} %>
				    <li class="page-item">
				      <a class="page-link" href="mypageAll.do?cate=show&page=<%=pVO.getNextPage()%>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
				</div>
			</div>

		<% } %>
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<!--########################################  후원해주세요 리스트      ######################################################## -->
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<% if(cate.equals("sponser")) {  %>
		 
			<div id="SponserList" class="tab_content">

				<% for(SponserVO spvo:sponList){ %>
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a
							href="sponserView.do?num=<%=spvo.getSpNo() %>&param=fromMypageAll">
							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="<%=projectName%>/upload/<%=spvo.getSpPhoto()%>"
							onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';"><br />
							<br />
							<p style="height: 40px;">Title : <%=spvo.getSpName()%></p>
						</a>
							<p>Date : <%=spvo.getSponDate() %></p>
						<input type="hidden" value="<%=spvo.getMemEmail()%>" name="memEmail">
					</div>
				<%} %>
						<%if(sponList.size()%3 == 2){ %>
   							 <div class="col-xs-4 marginTop50">
   								<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							 </div>
						<!-- 마지막이 한개인 경우 -->  
    					</div>
    					<%} else if(sponList.size()%3 == 1){%>
    						<%for(int i=0;i<2;i++){ %>
		   					 <div class="col-xs-4 marginTop50">
	   							<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							</div>
		    
    					<%} %>
    			<%} %>	
		<!-- #####################################  페 이 징  ########################################################### -->
			<div align="center">
					<ul class="pagination pagination-lg">
						<li class="page-item"><a class="page-link"
							href="mypageSponserList.do?cate=sponser&page=<%=pVO.getPreviPage()%>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<%
							for (int i = pVO.getStartPage(); i <= pVO.getEndPage(); i++) {
						%>
						<li class="page-item"><a class="page-link"
							href="mypageSponserList.do?cate=sponser&page=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<li class="page-item"><a class="page-link"
							href="mypageSponserList.do?cate=sponser&page=<%=pVO.getNextPage()%>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
</div>
			</div>

		<% } %>
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<!--###########################################  후원하기 리스트     ######################################################## -->
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		 <% if(cate.equals("backed")) {  %>
			<div id="BackedList" class="tab_content">

				<% for(BackedVO bkvo:backedList){ %>
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a href="backedView.do?num=<%=bkvo.getBackNo()%>&param=fromMypageAll">

							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="https://img.youtube.com/vi/<%=bkvo.getBackVideo()%>/hqdefault.jpg"><br />
							<br />
						<p style="height: 40px;">Title : <%=bkvo.getBackName()%></p>
						</a>
						<p>Date : <%=bkvo.getBackDate() %></p>
						<input type="hidden" value="<%=bkvo.getMemEmail()%>" name="memEmail">
					</div>
				<%} %>
						<%if(backedList.size()%3 == 2){ %>
   							 <div class="col-xs-4 marginTop50">
   								<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							 </div>
						<!-- 마지막이 한개인 경우 -->  
    					</div>
    					<%} else if(backedList.size()%3 == 1){%>
    						<%for(int i=0;i<2;i++){ %>
		   					 <div class="col-xs-4 marginTop50">
	   							<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							</div>
		    
    					<%} %>
    			<%} %>	
				
		<!-- #####################################  페 이 징  ########################################################### -->
			<div align="center">
					<ul class="pagination pagination-lg">
						<li class="page-item"><a class="page-link"
							href="mypageBackedList.do?cate=backed&page=<%=pVO.getPreviPage()%>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<%
							for (int i = pVO.getStartPage(); i <= pVO.getEndPage(); i++) {
						%>
						<li class="page-item"><a class="page-link"
							href="mypageBackedList.do?cate=backed&page=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<li class="page-item"><a class="page-link"
							href="mypageBackedList.do?cate=backed&page=<%=pVO.getNextPage()%>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</div>
			</div>
		<% } %>
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<!--###########################################     리스트            ######################################################## -->
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<% if(cate.equals("video")) {  %>
		   <div id="VideoList" class="tab_content">
		   
		   	<% for(VideoVO vvo:videoList){ %>
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a href="videoLikeSearch.do?videoNo=<%=vvo.getVideoNo()%>&memEmail=<%=vvo.getMemEmail() %>
						&myId=${sessionScope.login.memEmail}&imgpath=<%=vvo.getVideoUrl()%>&param=fromMypageAll">

							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="https://img.youtube.com/vi/<%=vvo.getVideoSomenale()%>/hqdefault.jpg"><br />
						<br />
						<p style="height: 40px;">Title : <%=vvo.getVideoName() %></p>
						</a>
						<p>Date : <%=vvo.getVideoDate() %></p>
						<input type="hidden" value="<%=vvo.getMemEmail() %>" name="memEmail">
					</div>
				<%} %>
						<%if(videoList.size()%3 == 2){ %>
   							 <div class="col-xs-4 marginTop50">
   								<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							 </div>
						<!-- 마지막이 한개인 경우 -->  
    					</div>
    					<%} else if(videoList.size()%3 == 1){%>
    						<%for(int i=0;i<2;i++){ %>
		   					 <div class="col-xs-4 marginTop50">
	   							<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							</div>
		    
    					<%} %>
    			<%} %>	
		
		<!-- #####################################  페 이 징  ########################################################### -->
					<div align="center">
					<ul class="pagination pagination-lg">
						<li class="page-item"><a class="page-link"
							href="mypageVideoList.do?cate=video&page=<%=pVO.getPreviPage()%>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<%
							for (int i = pVO.getStartPage(); i <= pVO.getEndPage(); i++) {
						%>
						<li class="page-item"><a class="page-link"
							href="mypageVideoList.do?cate=video&page=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<li class="page-item"><a class="page-link"
							href="mypageVideoList.do?cate=video&page=<%=pVO.getNextPage()%>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
		   </div>
		   </div>
		 
		<% } %>
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<!--###########################################   리스트     ######################################################## -->
		<!--################################################################################################################# -->
		<!--################################################################################################################# -->
		<% if(cate.equals("toList")) {  %>
		 
			<div id="JoinList" class="tab_content">
			<% for(TogetherVO tvo:toList){ %>
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a href="togetherView.do?toNo=<%=tvo.getToNo()%>&param=fromMypageAll">
							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="/ForBusker/upload/<%=tvo.getToPhoto()%>"
							onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';"><br />
						<br />
							<p style="height: 40px;">Title : <%=tvo.getToName() %></p>
						</a>
						<p>Date : <%=tvo.getToStartDate() %> ~ <%=tvo.getToEndDate() %></p>
						<input type="hidden" value="<%=tvo.getToId() %>" name="memEmail">
					</div>
				<%} %>
						<%if(toList.size()%3 == 2){ %>
   							 <div class="col-xs-4 marginTop50">
   								<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							 </div>
						<!-- 마지막이 한개인 경우 -->  
    					
    					<%} else if(toList.size()%3 == 1){%>
    						<%for(int i=0;i<2;i++){ %>
		   					 <div class="col-xs-4 marginTop50">
	   							<div style="height:358px; width:300px; margin-bottom: 60px;"></div>
							</div>
		    
    					<%} %>
    			<%} %>	
			</div>
		<!-- #######################################################################################################  -->
		<!-- #####################################  페 이 징  ########################################################### -->
		<!-- #######################################################################################################  -->	
				  <div align="center">
				  <ul class="pagination pagination-lg">
				    <li class="page-item">
				      <a class="page-link" href="mypageTogetherList.do?cate=toList&page=<%=pVO.getPreviPage()%>" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				        <span class="sr-only">Previous</span>
				      </a>
				    </li>
				    <%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
				   	 	<li class="page-item"><a class="page-link" href="mypageTogetherList.do?cate=toList&page=<%=i %>"><%=i %></a></li>
				    <%} %>
				    <li class="page-item">
				      <a class="page-link" href="mypageTogetherList.do?cate=toList&page=<%=pVO.getNextPage()%>" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				        <span class="sr-only">Next</span>
				      </a>
				    </li>
				  </ul>
			</div>
			</div>
		<% } %>
		</div>

	<!-- 코딩 종료 -->


	<!-- ##############  footer 부분 include  ############## -->
	<div id="copyright" class="clear"
		style="text-align: center; margin-top: 70px; background-color: #ffc19e; color:white">
		<span>회사명 : (주)FOR_Busker | 주소 : 경기 성남시 분당구 삼평동 유스페이스2 B동 8층 |
			대표: Show | 개인정보관리책임자 : Show</span> <br /> <span>사업자등록번호 :
			000-00-00000 | 통신판매업신고 : 2016-분당판교-00000호 | 이메일 : help@forbusker.com</span><br />
		<br />
		<p>(주)FOR_Busker의 사전 서면 동의 없이 FOR_Busker사이트의 일체의 정보, 콘텐츠 및 UI 등을
			상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p>
		<br />
		<!-- ################################################################################################ -->
		<p>Copyright &copy; 2016 - All Rights Reserved - FOR Busker</p>
		<!-- ################################################################################################ -->
	</div>
	<!-- ################################################## -->
	<!-- #############  반응형 모바일 js  ############# -->
	<script
		src="<%=projectName%>/resources/js/index_js/jquery.mobilemenu.js"></script>
	<!-- ################################################### -->
</body>
</html>