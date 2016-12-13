<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="busker.scan.vo.*" %>  
<% String projectName = "/ForBusker"; %>
<%
Object obj = session.getAttribute("login");
TogetherVO sVO = (TogetherVO)request.getAttribute("tovo");
System.out.println("이메일은: " + sVO.getToId());
MemberVO mVO = new MemberVO();
if(obj!=null) mVO = (MemberVO)obj;
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
<!-- bPopup -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/together_css/togetherView.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherView.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName %>/resources/js/together_js/togetherView.js?<?=filemtime('<%=projectName %>/resources/js/together_js/togetherView.js')?>"></script>
<script type="text/javascript">
$(function(){	
<%if(sVO.getToId().equals(mVO.getMemEmail())){%>
$("#togetherJoin").attr("disabled","disabled");
<% } %>
});
</script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>

<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %><!-- ################################################### -->
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<table id="tableTdmargin">
	<!-- 수정 삭제버튼 -->
	<tr>
		<td>
		<div class="MDBtn">
		<a class="ModifyBtn">
			<button type="button" class="btn btn-info mdBtn">
				<input type="hidden" value="${tovo.toNo}">
				수정
			</button>
		</a>
		<a class="deleteBtn">
		<button type="button" class="btn btn-danger dlBtn">
			<input type="hidden" value="${tovo.toNo}">
			삭제
		</button>
		</a>
	</div>
		</td>
	</tr>
	<tr> <!-- 제목 들어가는 부분 -->
	<td>
	
	<div><h1><img src="<%=projectName %>/resources/images/together_img/idea.png">${tovo.toName}</h1></div>
	
	</td>
	</tr>
	
	<tr><!-- 이미지 들어가는 부분 -->
	<td>
	<div>
	<img src="<%=projectName %>/upload/${tovo.toPhoto}" id="viewImg" width="600" height="450">
	</div>
	</td>
	</tr>
	
	<tr><!-- 영상 들어가는 부분 -->
	<td>
	<div>
	<iframe width="600" height="350"
		src="${tovo.toVideo}" >
	</iframe></div>
	</td>
	</tr>
	
	<tr><!-- 구하는 역할이 들어가는 부분 -->
	<td>
	<div>
	
	<h4><img src="<%=projectName %>/resources/images/together_img/star.png">
	
	모집 포지션 : ${tovo.toNeed}</h4>
	</div>
	</td>
	</tr>
	
	<tr><!-- 상세설명 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	${tovo.toDetail}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 모집기간 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	모집기간 : ${tovo.toStartDate} ~ ${tovo.toEndDate}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 담당자명 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	담당자명 : ${tovo.toTeamLeader}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 연락처 -->
	<td>
	<div>
	<img src="<%=projectName %>/resources/images/together_img/star.png">
	연락처: ${tovo.toTel}
	</div>
	</td>
	</tr>
	
	<tr><!-- 문의하기 -->
	<td>
	<div align="center">
	<button type="button" class="btn btn-warning" id="togetherJoin">쪽지 보내기</button>
	</div>
	</td>
	</tr>
	</table>
	
	<div id="popup" class="popup-div popup-style">
		<div class="content">
		<form id="pform" action="sponserMessage.do" method="post">
			<div class="b-ajax-wrapper" style="height: 200px; width: 400px; background: #f1f1f1; border-radius: 15px;">
    			<span class="button b-close" id="close"><span>X</span></span><br/>
				<div class="form-group" align="center" > 
					<div id="insertDiv">
						<label id="receivelabel">받는 이  :  ${tovo.toId }</label>		<!-- 문의 내용  -->
		   				<textarea rows="4" id="inputText" class="form-control" name="smsContent"></textarea>
					</div>
						<button type="button"  class="btn btn-info form-control" id="chatSubmit">전송</button>
				</div>
			</div>	
				<input type="hidden" id="smsType" name="smsType" value="함께해요"/>                  <!-- 함께해요 -->
				<input type="hidden" id="smsNo" name="smsNo" value="${tovo.toNo}" />  		 <!-- 글 번호 -->
				<input type="hidden" id="smsSendEmail" name="smsSendEmail" value="${sessionScope.login.memEmail}" /> <!-- 로그인한 사람  -->
				<input type="hidden" id="smsReceiveEmail" name="smsReceiveEmail" value="${tovo.toId }" />  <!-- 받는 사람의 이메일 즉 글쓴 사람   -->
				<input type="hidden" id="smsTo" name="smsTo" value="${tovo.toId}" />                 <!-- 받는 사람의 이메일 즉 글쓴 사람  -->
				<input type="hidden" id="smsFrom" name="smsFrom" value="${sessionScope.login.memEmail}" />     <!-- 로그인한 사람   -->
				<input type="hidden" style="display: none">
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