<!-- 
	@author : 김경림
	@date : 2016. 12. 10
	@desc : 함께해요 View 부분
 -->
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
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/together_css/togetherView.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherView.css')?>" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="<%=projectName %>/resources/js/together_js/togetherView.js?<?=filemtime('<%=projectName %>/resources/js/together_js/togetherView.js')?>"></script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<!-- ################################################### -->
<!-- 세션값의 email값이랑 입력한 놈의 email 값이 같다면 수정,삭제버튼 보여주기 -->
<%
	Object obj = session.getAttribute("login");
	TogetherVO tVO = (TogetherVO)request.getAttribute("tovo");
	System.out.println("후원해주세요 이메일은?"+tVO.getToId());
	MemberVO mVO = new MemberVO();
	if(obj!=null) mVO = (MemberVO)obj;
%>


<%if(mVO.getMemEmail().equals("help@busker.com")) { %>
   <script type="text/javascript">
      $(function() {
         $('#adminBtn').css('display', 'block');
      
         $(".dlBtn").click(function(){   
            var result = confirm("게시글을 삭제하시겠습니까?");
               if(result){
                  location.href="togetherDel.do?toNo=<%=tVO.getToNo()%>";
               }
            });
      })
   </script>
<% } %>      

<%if(mVO.getMemEmail().equals(tVO.getToId())) { %>
<script type="text/javascript">
	$(function() {
		$('.MDBtn').css('display', 'block');
		
	<%if(tVO.getToId().equals(mVO.getMemEmail())){%>
		$("#togetherJoin").attr("disabled","disabled");
	<% } %>
	
	})
	<%}%>
</script>
<% } %>
<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
<div id="adminBtn" style="margin-left:760px; display:none;">
   <button type="button" class="btn btn-info dlBtn" style="width:100px; color:white;">게시글 삭제</button>
</div>
	<table id="tableTdmargin" style="margin:0 auto; width:750px;">
	<!-- 수정 삭제버튼 -->
	<tr>
		<td>
	<div class="MDBtn" style="display:none;">
		<a class="ModifyBtn">
			<button type="button" class="btn btn-info mdBtn"><input type="hidden" value="${tovo.toNo}">게시글 수정</button>
		</a>
		<a class="deleteBtn">
		<button type="button" class="btn btn-info dlBtn"><input type="hidden" value="${tovo.toNo}">게시글 삭제</button>
		</a>
	</div>
		</td>
	</tr>
	<tr> <!-- 제목 들어가는 부분 -->
	<td style="width:650px;">
	
	<div style="width:650px;"><h1>TITLE : ${tovo.toName}</h1></div>
	
	</td>
	</tr>
	
	<tr><!-- 이미지 들어가는 부분 -->
	<td>
	<div>
	<img src="<%=projectName %>/upload/${tovo.toPhoto}" id="viewImg" style="width:750px; height:450px;" onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';">
	</div>
	</td>
	</tr>
	
	<tr><!-- 영상 들어가는 부분 -->
	<td>
	<div>
	<iframe width="750" height="450"
		src="${tovo.toVideo}" >
	</iframe></div>
	</td>
	</tr>
	
	<tr><!-- 구하는 역할이 들어가는 부분 -->
	<td>
	<div>
	
	<h4>
	모집 포지션 : ${tovo.toNeed}</h4>
	</div>
	</td>
	</tr>
	
	<tr> <!-- 모집기간 -->
	<td>
	<div>
	모집기간 : ${tovo.toStartDate} ~ ${tovo.toEndDate}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 담당자명 -->
	<td>
	<div>
	담당자명 : ${tovo.toTeamLeader}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 연락처 -->
	<td>
	<div>
	연락처: ${tovo.toTel}
	</div>
	</td>
	</tr>
	
	<tr><!-- 상세설명 -->
	<td>
	<div>
	상세설명 : <br/> <br/><pre>${tovo.toDetail}</pre>
	</div>
	</td>
	</tr>
	
	<tr style="height:100px;"><!-- 문의하기 -->
	<td>
	<div align="center">
	<c:choose>
	<c:when test="${sessionScope.login ne null}">
	<button type="button" class="btn btn-info" id="togetherJoin">쪽지 보내기</button>
	</c:when>
	<c:otherwise>
	<label>로그인 후 문의해주세요.</label>
	</c:otherwise>
	</c:choose>
	<a href="togetherList.do"><button type="button" class="btn btn-info">목록보기</button></a>
	</div>
	</td>
	</tr>
	</table>
	<input type="hidden" value="${param.param}" id="param"/>
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
				<input type="hidden" id="smsType" name="smsType" value="함께해요"/>                  <!-- 후원하기 -->
				<input type="hidden" id="smsNo" name="smsNo" value="${tovo.toNo}" />  		 <!-- 글 번호 -->
				<input type="hidden" id="smsSendEmail" name="smsSendEmail" value="${sessionScope.login.memEmail}" /> <!-- 로그인한 사람  -->
				<input type="hidden" id="smsReceiveEmail" name="smsReceiveEmail" value="${tovo.toId }" />  <!-- 받는 사람의 이메일 즉 글쓴 사람   -->
				<input type="hidden" id="smsTo" name="smsTo" value="${tovo.toId}" />                 <!-- 받는 사람의 이메일 즉 글쓴 사람  -->
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