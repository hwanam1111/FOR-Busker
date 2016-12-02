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
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<!-- ################################################### -->


<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
<form>
<table>
<!-- 어떤 입력폼인가 -->
<tr>
<h1>Together Form</h1>
<br/>
<br/>

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
<!-- pr영상 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">PR영상</label>
  <div class="col-xs-8">
    <input class="form-control" type="text" placeholder="홍보 영상을 업로드하세요" id="example-text-input">
  </div>
</div>
</tr>
<!-- 분류 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">공연 분류</label>
  <div class="col-xs-8">
    <select class="form-control" id="exampleSelect1">
      <option value="">선택하세요</option>
      <option value="0">노래</option>
      <option value="1">춤</option>
      <option value="2">연주</option>
      <option value="3">마술</option>
      <option value="4">기타</option>
    </select>
  </div>
</div>
</tr>
<!-- 상세설명 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">상세설명</label>
  <div class="col-xs-8">
    <textarea class="form-control" id="exampleTextarea" rows="5" 
    		placeholder="그룹소개와 필요한 역할에 대해 자세히 적어주세요"></textarea>
  </div>
</div>
</tr>
<!-- 모집기간 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">모집기간</label>
  <div class="col-xs-3">
    <input class="form-control" type="date" value="2016-01-01" id="example-date-input">
  </div>
 <div class="col-xs-1">
   <p align="center">~</p>
  </div>
   <div class="col-xs-3">
    <input class="form-control" type="date" value="2016-12-31" id="example-date-input">
  </div>
</div>
</tr>
<!-- 담당자명 -->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">담당자명</label>
  <div class="col-xs-8">
    <input class="form-control" type="text" placeholder="담당자명을 입력하세요" id="example-text-input">
  </div>
</div>
</tr>
<!-- 연락처-->
<tr>
<div class="form-group row">
  <label for="example-text-input" class="col-xs-2 col-form-label">연락처</label>
  <div class="col-xs-8">
     <input class="form-control" type="tel" placeholder="-를 빼고 입력해주세요" id="example-tel-input">
  </div>
</div>
</tr>
<tr>
	<div align="center">
		<button type="submit" class="btn btn-info">등록하기</button>
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

