<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="busker.scan.vo.*" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- bPopup -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- backed css -->
<link href="<%=projectName %>/resources/css/sponser_css/sponserView.css?<?=filemtime('<%=projectName %>/resources/css/sponser_css/sponserView.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName%>/resources/js/sponser_js/sponser.js"></script>

</head>

<body id="top">
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<!-- 세션값의 email값이랑 입력한 놈의 email 값이 같다면 수정,삭제버튼 보여주기 -->
<%
	Object obj = session.getAttribute("login");
	BackedVO bVO = (BackedVO)request.getAttribute("selectBacked");
	System.out.println("후원해주세요 이메일은?"+bVO.getMemEmail());
	MemberVO mVO = new MemberVO();
	if(obj!=null) mVO = (MemberVO)obj;
%>

<%if(mVO.getMemEmail().equals(bVO.getMemEmail())) { %>
<script type="text/javascript">
	$(function() {
		$('#footBtn').css('display', 'block');
		
	<%if(bVO.getMemEmail().equals(mVO.getMemEmail())){%>
		$("#insertMessage").attr("disabled","disabled");
	<% } %>
	
	})
</script>
		<% } %>

<%if(mVO.getMemEmail().equals("help@busker.com")) { %>
	<script type="text/javascript">
		$(function() {
			$('#adminBtn').css('display', 'block');
			
			$("#delete").click(function(){
				var result = confirm("게시글을 삭제하시겠습니까?");
				if(result){
					location.href="backedDelete.do?num=${selectBacked.backNo}";
				}
			});
		
		});
	</script>
<% } %>		

<% } %>
<!-- ################################################### -->

<!-- 이부분 부터 코딩 시작 -->
<div class='hoc' >
	<div id="adminBtn" style="margin-left:880px; display:none;">
		<button id="delete" type="button" class="btn btn-info" style="width:100px; color:white;">게시글 삭제</button>
	</div>
<h1> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> Backed View</h1><br/>
<table class="sponTable">
	<td class="backedLeft">
	<div>
	
		<!-- 제목,이미지  -->
		<div class="backedimg">
			<p style="position: relative; right:10px;">TITLE : ${selectBacked.backName }</p><br/>
			<!-- 이부분은 다름 -->
			<iframe width="600" height="430" src="${ selectBacked.backVideo}" frameborder="0" allowfullscreen></iframe>
		</div>
	</div>
	<div style="margin-left:190px; margin-top: 20px;">
		<a href="backedList.do?cate=backed&page=1">
		<button type="button" class="btn btn-info" style="width:200px; color:white;">목록보기</button>
		</a>
	</div>
	<div id="footBtn" style="margin-top:40px; margin-left:120px; display:none;">
		<a href="backedUpdateForm.do?backNo=${selectBacked.backNo}"><button class="btn btn-info" style="width:200px; color:white;">게시글 수정</button></a>
		<a href="backedDelete.do?num=${selectBacked.backNo}"><button class="btn btn-info" style="width:200px; color:white;">게시글 삭제</button></a>
	</div>
	</td>
	
	<td class="sponRight" style="word-wrap:break-word" >
	<!-- 내용, 조건, 전화번호 -->
	<div><br/>
		<h2>Content</h2>
		<div id="rightContent">
		<pre style="white-space: pre-wrap;">${selectBacked.backContent}</pre>
		</div>
		<br/>
		<h2>Tel</h2>
		<p>
		${selectBacked.backTel} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <br/><br/>
		<c:choose>
		<c:when test="${sessionScope.login ne null}">
		<button type="button" class="btn btn-info" id="insertMessage">문의하기</button>
		</c:when>
		<c:otherwise>
		<label>로그인 후 문의해주세요.</label>
		</c:otherwise>
		</c:choose>
		
			<button type="button" class='btn btn-primary delete' style="display: none;" >삭제</button>
	
		
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
						<label id="receivelabel">받는 이  :  ${selectBacked.memEmail }</label>		<!-- 문의 내용  -->
		   				<textarea rows="4" id="inputText" class="form-control" name="smsContent"></textarea>
					</div>
						<button type="button"  class="btn btn-info form-control" id="chatSubmit">전송</button>
				</div>
			</div>	
				<input type="hidden" id="smsType" name="smsType" value="후원받기"/>                  <!-- 후원받기 -->
				<input type="hidden" id="smsNo" name="smsNo" value="${selectBacked.backNo}" />  		 <!-- 글 번호 -->
				<input type="hidden" id="smsSendEmail" name="smsSendEmail" value="${sessionScope.login.memEmail}" /> <!-- 로그인한 사람  -->
				<input type="hidden" id="smsReceiveEmail" name="smsReceiveEmail" value="${selectBacked.memEmail }" />  <!-- 받는 사람의 이메일 즉 글쓴 사람   -->
				<input type="hidden" id="smsTo" name="smsTo" value="${selectBacked.memEmail}" />                 <!-- 받는 사람의 이메일 즉 글쓴 사람  -->
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
