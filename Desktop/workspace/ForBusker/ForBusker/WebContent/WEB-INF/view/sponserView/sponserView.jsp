<!-- 
	@author : 이진욱, 정영재
	@date : 2016. 12. 05, 2016. 12. 13
	@desc : 후원하기 View 부분, 메세지 팝업으로 보내는 부분
 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="busker.scan.vo.*" %>    
<% String projectName = "/ForBusker"; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- bPopup -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- sponserView css -->
<link href="<%=projectName %>/resources/css/sponser_css/sponserView.css?<?=filemtime('<%=projectName %>/resources/css/sponser_css/sponserView.css')?>" rel="stylesheet" type="text/css" media="all">

<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName%>/resources/js/sponser_js/sponser.js"></script>


</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<!-- 세션값의 email값이랑 입력한 놈의 email 값이 같다면 수정,삭제버튼 보여주기 -->
<%
	Object obj = session.getAttribute("login");
	SponserVO sVO = (SponserVO)request.getAttribute("selectSpon");
	MemberVO mVO = new MemberVO();
	if(obj!=null) mVO = (MemberVO)obj;
%>


<%if(mVO.getMemEmail().equals("help@busker.com")|| mVO.getMemEmail().equals(sVO.getMemEmail())) { %>
	<script type="text/javascript">
		$(function() {
			$('#adminBtn').css('display', 'block');
		
			$("#delete").click(function(){	
				var result = confirm("대화를 삭제하시겠습니까?");
					if(result){
						location.href="sponDelete.do?num=${selectSpon.spNo}";
					}
			});
			<%if(mVO.getMemEmail().equals(sVO.getMemEmail())){%>
				$("#modify").css('display','block');
				$("#modify").click(function(){	
					location.href="sponUpdateForm.do?spNo=${selectSpon.spNo}";
				})
			<%}%>
		})
	</script>
<% } %>		


<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class='hoc' >
		<div class="form-group" id="adminBtn" style="width:980px; display:none; float:right;">
			<button id="modify" type="button" class="btn btn-info" style="width:100px; color:white; float: right; margin-left: 10px; display:none; ">게시글 수정</button>
			<button id="delete" type="button" class="btn btn-info" style="width:100px; color:white; float: right;">게시글 삭제</button>
		</div>	
<h1> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Sponser View</h1><br/>
<table class="sponTable" >
	<td class="sponLeft">
	<div>
	
		<!-- 제목,이미지  -->
		<div class="sponimg">
			<p style="position: relative; right:10px;">TITLE : ${selectSpon.spName }</p><br/>
			<!-- 이부분은 다름 -->
			<img src="<%=projectName %>/upload/${selectSpon.spPhoto} " style="width:540px; height: 402px;" onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';">
		</div>
	</div>
	<div style="margin-left:170px; margin-top: 20px;">
		<a href="sponAndBacked.do">
		<button type="button" class="btn btn-info" style="width:200px; color:white;">목록보기</button>
		</a>
	</div>

	</td>
	
	<td class="sponRight" style="word-wrap:break-word" >
	<!-- 내용, 조건, 전화번호 -->
	<br/>
	<div>
		<h2>Content</h2>
		<div id="rightContent">
		<pre style="white-space: pre-wrap;">${selectSpon.spContent}</pre><br/>
		</div>
		<h2>Condition</h2>
		<pre style="white-space: pre-wrap;"> ${selectSpon.spCond} </pre><br/>
		<h2>Tel</h2>
		<p>
		${selectSpon.spTel} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br/><br/>
		<c:choose>
		<c:when test="${sessionScope.login ne null}">
		<button type="button" class="btn btn-info" id="insertMessage">문의하기</button>
		</c:when>
		<c:otherwise>
		<label>로그인 후 문의해주세요.</label>
		</c:otherwise>
		</c:choose>		
		<button type="button" class='btn btn-info delete' style="display: none;">삭제</button>
		</p>
	</div>
	
	</td>
	
	</table>
	
	<div id="popup" class="popup-div popup-style">
		<div class="content">
		<form id="pform" action="sponserMessage.do" method="post">
			<div class="b-ajax-wrapper" style="height: 200px; width: 400px; background: #f1f1f1; border-radius: 15px;">
    			<span class="button b-close" id="close"><span>X</span></span><br/>
				<div class="form-group" align="center" > 
					<div id="insertDiv">
						<label id="receivelabel">받는 이  :  ${selectSpon.memEmail }</label>		<!-- 문의 내용  -->
		   				<textarea rows="4" id="inputText" class="form-control" name="smsContent"></textarea>
					</div>
						<button type="button"  class="btn btn-info form-control" id="chatSubmit">전송</button>
				</div>
			</div>	
				<input type="hidden" id="smsType" name="smsType" value="후원하기"/>                  <!-- 후원하기 -->
				<input type="hidden" id="smsNo" name="smsNo" value="${selectSpon.spNo}" />  		 <!-- 글 번호 -->
				<input type="hidden" id="smsSendEmail" name="smsSendEmail" value="${sessionScope.login.memEmail}" /> <!-- 로그인한 사람  -->
				<input type="hidden" id="smsReceiveEmail" name="smsReceiveEmail" value="${selectSpon.memEmail }" />  <!-- 받는 사람의 이메일 즉 글쓴 사람   -->
				<input type="hidden" id="smsTo" name="smsTo" value="${selectSpon.memEmail}" />                 <!-- 받는 사람의 이메일 즉 글쓴 사람  -->
				<input type="hidden" id="smsFrom" name="smsFrom" value="${sessionScope.login.memEmail}" />     <!-- 로그인한 사람   -->
				<input type="text" style="display: none">
			</form>
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
