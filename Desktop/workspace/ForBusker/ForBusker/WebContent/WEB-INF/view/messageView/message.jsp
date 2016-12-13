<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="busker.scan.vo.*" %>
<%@ page import="java.util.List" %>
<% String projectName = "/ForBusker"; %>
<% Object obj = request.getAttribute("mlist"); 
List<SmsVO> list = null;

Object sess = session.getAttribute("login");
MemberVO mem = null;
if(sess !=null){
	mem = (MemberVO)sess;
}

if(obj!=null) list = (List<SmsVO>)obj;
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
<!-- include header -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=projectName %>/resources/css/message_css/message.css?<?=filemtime('<%=projectName %>/resources/css/message_css/message.css')?>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=projectName %>/resources/js/message_js/message.js?<?=filemtime('<%=projectName %>/resources/js/message_js/message.js')?>"></script>
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
<div class="hoc" align="center">

<!-- ################################################### -->
<!-- ################################################### -->
<!--  테이블 시작  -->
<div id="messageTable" class="table-responsive">
<table class="table">
<tr align="center">
<td>구분</td>
<td>이름</td>
<td>내용</td>
<td>날짜</td>
<td>구분</td>
</tr>

<!-- ################################################### -->
<!-- ################################################### -->
<!--  테이블 반복문 돌릴 위치  -->
<% if(list.size()==0){ %>
	<tr> <td colspan="5"> 쪽지함이 비어있습니다.</td><tr>
<% }else{ %>
<%for (SmsVO s : list){ 
if((!(s.getSmsSendEmail().equals(""))&&s.getSmsDeleteStatus().equals("1"))){ %>
<tr align="center">
<td align="center"><%=s.getSmsType() %></td>

<td><% if(s.getSmsReceiveEmail().equals(mem.getMemEmail())){	//받는 사람이 나일때 
		out.write(s.getSmsSendEmail());
}else{  													//아니면
		out.write(s.getSmsReceiveEmail());
}%></td>

<td><%= s.getSmsContent() %></td>

<td><%= s.getSmsSendTime() %><%if(s.getSmsStatus().equals("1")){ 
		out.write("   읽지 않음");
}else{
		out.write("   읽음");
} %>
</td>
<td class="tdname">	
<a href="#">
<button type="button" class="btn btn-info messageView" name="<%= s.getSmsNo() %>" >보기</button>		<!-- 글번호  -->
<input type="hidden" name="<%= s.getSmsType() %>" value="<%= s.getSmsType() %>" />		<!-- 글 타입  -->
<input type="hidden" value="${sessionScope.login.memEmail}"/>							<!-- 로그인 아이디 -->
<input type="hidden" value="<%= s.getSmsSendEmail() %>" />								<!-- 보내는 사람  -->
<input type="hidden" value="<%=s.getSmsReceiveEmail() %>" />							<!-- 받는 사람 -->
<button type="button" class="btn btn-info deleteMessage" value="del">삭제</button>
</a>
</td>
</tr>
<%		}
	}
} %>
</table>
</div>
<!-- ################################################### -->
<!-- ################################################### -->
<!-- ################################################### -->

<!-- 팝업 -->
	<div id="popup" class="popup-div popup-style">
		<div class="content">
			<div class="b-ajax-wrapper" style="height: 550px; width: 400px; background: #f1f1f1; border-radius: 15px;">
    			<span class="button b-close" id="close"><span>X</span></span><br/>
				<form id="pform" action="sponserMessage.do" method="post">
				<div class="form-group" align="center" >
					<div id="chatDiv"   style="overflow:scroll; overflow-y:scroll;overflow-x:hidden;">
					<table style="width:300px;">
					<tbody id="chatLog">
					</tbody>
					</table>
					</div>
					<div id="insertDiv">
		   				<textarea rows="2" id="inputText" class="form-control" name="smsContent"></textarea>
						<button type="button"  class="btn btn-info form-control" id="chatSubmit">전송</button>
					</div>
				</div>
			</div>	
				<input type="hidden" id="smsType" name="smsType" value=""/>
				<input type="hidden" id="smsNo" name="smsNo" value="" />  
				<input type="hidden" id="smsSendEmail" name="smsSendEmail" value="" />
				<input type="hidden" id="smsReceiveEmail" name="smsReceiveEmail" value="" />
				<input type="hidden" id="smsTo" name="smsTo" value="" />
				<input type="hidden" style="display: none">
			</form>
		</div>
	</div> 
	<!-- ################################################### -->
	<!-- ################################################### -->
	<!-- ################################################### -->

<input type="hidden" id="loginsess" value="<%=mem.getMemEmail()%>"/>

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