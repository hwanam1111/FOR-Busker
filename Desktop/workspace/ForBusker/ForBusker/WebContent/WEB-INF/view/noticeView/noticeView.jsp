<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>
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
<link href="<%=projectName %>/resources/css/notice_css/noticeList.css?<?=filemtime('<%=projectName %>/resources/css/notice_css/noticeList.css')?>" rel="stylesheet" type="text/css" media="all">
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
	<ul>
		<li><!-- notice view -->
		<h1><img src="<%=projectName %>/resources/images/notice_img/notepad.png"> NOTICE VIEW</h1>
		</li>
		<li align="right" class="marginBottom"><!-- 수정 삭제 버튼-->
			<button type="button" class="btn btn-info">수정</button>
	        <button type="button" class="btn btn-danger">삭제</button>
		</li>
		<li><!-- 제목,글 -->
		<div id="noticeView">
			<ul class="marginRight">
				<li class="marginTop30"><!-- 제목 -->
				<h3>제목을 입력하는 부분입니다.</h3>
				<hr/>
				</li>
				<li align="right">
				2016-12-02 00시00분
				</li>
				<li class="marginBottom marginTop30"><!-- 글 -->
				서버(영어: server)는 클라이언트에게 네트워크를 통해 서비스를 제공하는 컴퓨터(server computer) 또는 프로그램(server program)을 말한다. 특히, 서버에서 동작하는 소프트웨어를 서버 소프트웨어(server software)라 한다. 주로 리눅스 등의 운영 체제를 설치한 대형 컴퓨터를 쓰지만, 그렇지 않은 경우도 있다.
				서버는 프린터 제어나 파일 관리 등 네트워크 전체를 감시·제어하거나, 메인프레임이나 공중망을 통한 다른 네트워크과의 연결, 데이터·프로그램·파일 같은 소프트웨어 자원이나 모뎀·팩스·프린터 공유, 기타 장비 등 하드웨어 자원을 공유할 수 있도록 도와주는 역할을 한다.
				서버는 사용자(클라이언트)의 요청에 의하여 서비스를 하는데 이와 같이 구성된 시스템을 클라이언트-서버 시스템이라고 하며, 이는 하나 이상의 응용 프로그램을 상호 협력적인 환경에서 운용하는 분산처리 형태를 의미한다. 즉, 서비스를 요청하는 클라이언트와 클라이언트의 요청을 처리하는 서버와의 협동작업을 통해서 사용자가 원하는 결과를 얻는 처리방식이 클라이언트-서버 시스템이다.
				클라이언트의 수가 5~20대 정도인 소규모 LAN의 경우에는 한 대의 서버로 충분히 모든 서비스를 소화할 수 있으나, 대규모 LAN의 경우에는 여러 대의 서버를 배치하고, 파일 관리는 파일 서버, 프린터 제어는 프린터 서버, 인터넷 등의 외부와의 교환은 통신 서버가 담당하는 등 각각 역할을 세분하게 된다.
  </div>
				</li>
			</ul>
		</div>
		</li>
		<li align="center">
			<button type="button" class="btn btn-warning"><a href="noticeList.do" style="color:white">목록보기</a></button>
		</li>
	</ul>
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
