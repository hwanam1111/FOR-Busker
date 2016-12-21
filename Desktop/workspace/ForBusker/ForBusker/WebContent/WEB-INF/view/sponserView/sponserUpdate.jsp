<!-- 
	@author : 이진욱
	@date : 2016. 12. 06
	@desc : 후원하기 수정 부분
 -->

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
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->
<!-- 세션값에 login이 없으면 loginView로 보내버리기 -->
<%if(session.getAttribute("login") == null) { %>
<% response.sendRedirect("login.do");%>
<%-- <jsp:include page="/WEB-INF/view/includeFile/header.jsp" /> --%>
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<form style="margin-left:140px;" action="sponUpdate.do" enctype="multipart/form-data" method="post">
		<table>
		<!-- 어떤 입력폼인가 -->
		<tr>
			<h1> Sponser UpdateForm</h1> 
		
		</tr>
		<tr>
		
		</tr>
		
		<!-- 제목 -->
		<tr>	
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label" >제목</label>
			  <div class="col-xs-8">
			    <input class="form-control" type="text" value="${sponserVO.spName }" id="example-text-input" name="spName">
			  </div>
		  </div>
		</tr>
		
		<!-- 사진 업로드 -->
		<tr>
		   <div class="form-group row">
		     <label for="example-text-input" class="col-xs-2 col-form-label">사진</label>
		     <div class="col-xs-8">
		       <input type="file" class="form-control-file" name="file">
			 </div>
		   </div>
		</tr>
		
		<!-- 후원내용  -->
		<tr>
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">상세설명</label>
			<div class="col-xs-8">
			  <textarea class="form-control" id="exampleTextarea" name="spContent" rows="5">${sponserVO.spContent }</textarea>
			</div>
		  </div>
		</tr>
		
		<!-- 조건 -->
		<tr>
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">조건</label>
			<div class="col-xs-8">
			  <textarea class="form-control" id="exampleTextarea" rows="4" name="spCond">${sponserVO.spCond }</textarea>
			</div>
		  </div>
		</tr>
		
		<!-- 연락처 -->
		<tr>	
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">연락처</label>
			  <div class="col-xs-8">
			    <input class="form-control" type="text" name="spTel" value="${sponserVO.spTel }">
			  </div>
		  </div>
		</tr>
		
		<!-- 등록, 취소 버튼 -->
		<tr>
			<div align="center">
				<input type='hidden' name="spNo" value='${sponserVO.spNo }'>
			    <input type='hidden' name="memEmail" value='${sessionScope.login.memEmail }'>
				<button type="submit" class="btn btn-info">등록하기</button>
				<button type="button" class="btn btn-info">취소</button>
			</div>
		</tr>
		</table>
		
	</form>
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
