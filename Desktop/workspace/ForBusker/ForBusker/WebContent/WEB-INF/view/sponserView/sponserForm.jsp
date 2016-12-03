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
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<% } %>
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
	<form style="margin-left:140px;">
		<table>
		<!-- 어떤 입력폼인가 -->
		<tr>
			<h1> Sponser Form</h1> 
		
		</tr>
		<tr>
		
		</tr>
		
		<!-- 제목 -->
		<tr>	
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">제목</label>
			  <div class="col-xs-8">
			    <input class="form-control" type="text" placeholder="제목을 입력하세요" id="example-text-input">
			  </div>
		  </div>
		</tr>
		
		<!-- 사진 업로드 -->
		<tr>
		   <div class="form-group row">
		     <label for="example-text-input" class="col-xs-2 col-form-label">사진</label>
		     <div class="col-xs-8">
		       <input type="file" class="form-control-file">
			 </div>
		   </div>
		</tr>
		
		<!-- 후원내용  -->
		<tr>
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">상세설명</label>
			<div class="col-xs-8">
			  <textarea class="form-control" id="exampleTextarea" rows="5" 
			    		placeholder="후원내용에 대해 자세히 적어주세요"></textarea>
			</div>
		  </div>
		</tr>
		
		<!-- 조건 -->
		<tr>
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">조건</label>
			<div class="col-xs-8">
			  <textarea class="form-control" id="exampleTextarea" rows="4" 
			    		placeholder="조건에 대해 입력하세요"></textarea>
			</div>
		  </div>
		</tr>
		
		<!-- 연락처 -->
		<tr>	
		  <div class="form-group row">
			<label for="example-text-input" class="col-xs-2 col-form-label">연락처</label>
			  <div class="col-xs-8">
			    <input class="form-control" type="text" placeholder="-빼고 입력해주세요">
			  </div>
		  </div>
		</tr>
		
		<!-- 등록, 취소 버튼 -->
		<tr>
			<div align="center">
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
