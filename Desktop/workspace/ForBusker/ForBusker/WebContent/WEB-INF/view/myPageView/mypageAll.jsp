<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="busker.scan.vo.*"%>
<%@page import="java.util.*"%>
<%
	String projectName = "/ForBusker";
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
			<li><a href="#ShowList">Show List</a></li>
			<li><a href="#SponserList">Sponser List</a></li>
			<li><a href="#BackedList">Backed List</a></li>
			<li><a href="#VideoList">Video List</a></li>
			<li><a href="#JoinList">Join List</a></li>
		</ul>

		<div class="tab_container">
			<div id="ShowList" class="tab_content">
			</div>
			<div id="SponserList" class="tab_content">Content</div>
			<div id="BackedList" class="tab_content"></div>
			<div id="VideoList" class="tab_content">
			<c:forEach var="video" items="${videoList}">
					<div class="col-xs-4" style="margin-bottom: 60px;">
						<a href="videoLikeSearch.do?videoNo=${video.videoNo}&memEmail=${video.memEmail}&myId=${sessionScope.login.memEmail}">

							<img class='videothumb' id="videothumb"
							style="width: 296.66px; height: 222.48px;"
							src="https://img.youtube.com/vi/${video.videoSomenale}/hqdefault.jpg"><br />
						<br />

							<p style="height: 40px;">Title : ${video.videoName}</p>
						</a>
						<p>TeamName : ${video.memTeamName}</p>
						<p>Date : ${video.videoDate}</p>
						<input type="hidden" value="${video.memEmail}" name="memEmail">
					</div>
				</c:forEach>
				</div>
			<div id="JoinList" class="tab_content">Content</div>
		</div>
	</div>

	<!-- 코딩 종료 -->


	<!-- ##############  footer 부분 include  ############## -->
	<div id="copyright" class="clear" style="text-align: center; margin-top:70px; background-color: #ffc19e">
	<span>회사명 : (주)FOR_Busker | 주소 : 경기 성남시 분당구 삼평동 유스페이스2 B동 8층 | 대표: Show | 개인정보관리책임자 : Show</span> <br/>
	<span>사업자등록번호 : 000-00-00000 | 통신판매업신고 : 2016-분당판교-00000호 | 이메일 : help@forbusker.com</span><br/><br/>
	<p>(주)FOR_Busker의 사전 서면 동의 없이 FOR_Busker사이트의 일체의 정보, 콘텐츠 및 UI 등을 
	상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</p><br/>
		<!-- ################################################################################################ -->
		<p>
			Copyright &copy; 2016 - All Rights Reserved - FOR Busker
		</p>
		<!-- ################################################################################################ -->
	</div>
	<!-- ################################################## -->
	<!-- #############  반응형 모바일 js  ############# -->
	<script
		src="<%=projectName%>/resources/js/index_js/jquery.mobilemenu.js"></script>
	<!-- ################################################### -->
</body>
</html>