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
<link href="<%=projectName %>/resources/css/mypage_css/mypageUpdate.css?<?=filemtime('<%=projectName %>/resources/css/mypage_css/mypageUpdate.css)?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/myPage_js/buskerUpdate.js?<?=filemtime('<%=projectName %>/resources/js/myPage_js/buskerUpdate.js')?>"></script>
<script type="text/javascript">
$(function(){
	//체크박스에 teamType 체크
	var type='${sessionScope.login.memTeamType}'
	var typeArray = type.split(',');
	$('.checkbox-inline input:checkbox[name="memTeamType"]').each(function(){
		
		for(var i=0;i<typeArray.length;i++){
			if(this.value==typeArray[i]){
				
				this.checked=true;
			}
		}
	});
	
	 //사진등록시 미리보기
     $("#InputFile").on('change', function(){
          readURL(this);
     });
   
	
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#jImg').attr('src', e.target.result);
        }

      reader.readAsDataURL(input.files[0]);
    }
}


</script>
<style>
@font-face {
  font-family: 'kiwi';
  src:url('fonts/kiwibananaB.ttf') format('truetype');
}
</style>
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
	<!-- ################################################### -->
	<!-- ################################################### -->
	<h1 style="font-size:30px;">정보 수정</h1>
	<!-- simpleJoin Form -->
	<form id="updateForm" action="updateBusker.do">
		<!-- #################################################### -->
		<!-- #################################################### -->
		<div class="form-group">
   			<label for="updateEmail">이메일 주소</label>
    		<div>
	    		<input type="email" class="form-control" id="updateEmail" name="memEmail" placeholder="${sessionScope.login.memEmail}" value="${sessionScope.login.memEmail}" maxlength="50" readonly="readonly">
    		</div>
    	</div>
    	<!-- #################################################### -->
    	<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePassword">비밀번호</label>
    		<input style=" font-family: kiwi; font-size:13px; font-weight:bold" type="password" class="form-control" id="updatePassword" name="memPw" placeholder="암호를 입력하세요" maxlength="20">
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
    		<label for="updatePasswordOk">비밀번호확인</label>
    		<input style=" font-family: kiwi; font-size:13px; font-weight:bold" type="password" class="form-control" id="updatePasswordOk" name="updatePasswordOk" placeholder="암호를 입력하세요" maxlength="20">
    		<div id="pwCheck" style="display: none;"></div>
  		</div>
  		<!-- #################################################### -->
  		<!-- #################################################### -->
  		<div class="form-group">
 		    <label for="updateTel">전화번호</label>
    		<input type="tel" class="form-control" id="updateTel"name="memPhone" placeholder="전화번호를 입력하세요" maxlength="13" value="${sessionScope.login.memPhone}">
  		</div>
  		<div class="form-group">
 		    <label for="updateTeamName">팀 이름</label>
    		<input type="text" class="form-control" id="updateTeamName"name="memTeamName" placeholder="팀명을 입력하세요" maxlength="13" value="${sessionScope.login.memTeamName}">
  		</div>
  		<!-- ################################################### -->
  		<!-- ##################### CheckBox #################### -->
		<!-- ################################################### -->
		<label>공연장르</label>
  		<label class="checkbox-inline">
  			<input type="checkbox" class="check" id="check_sing" value="노래" name="memTeamType" > 노래
		</label>
		<label class="checkbox-inline">
  			<input type="checkbox" class="check" id="check_dance" value="댄스" name="memTeamType"> 댄스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" class="check" id="check_band" value="연주" name="memTeamType"> 연주
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" class="check" id="check_guitar" value="마술" name="memTeamType"> 마술
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" class="check" id="check_piano" value="퍼포먼스"name="memTeamType"> 퍼포먼스
		</label>
		<label class="checkbox-inline">
 			<input type="checkbox" class="check" id="check_magic" value="기타" name="memTeamType"> 기타
		</label>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div class="InputFile">
    		<br><label for="InputFile">팀 프로필 사진</label>
    		<input type="file" id="InputFile" name="file"> 
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<div style="margin-top: 10px; margin-left: 20px;">
			<img id="jImg"src="<%=projectName%>/upload/${sessionScope.login.memTeamPhoto}">
		</div>
		<!-- ################################################### -->
		<!-- ################################################### -->
  		<div class="form-group">
 		    <br/><label for="updateVideo">팀 홍보 영상</label>
    		<input type="text" class="	form-control" id="updateVideo"name="memVideo" placeholder="영상URL을 입력하세요" value="${sessionScope.login.memVideo}">
  		</div>
  		<!-- ################################################### -->
		<!-- ################################################### -->
		<label>팀 설명</label>
		<textarea class="form-control" rows="5" name="memDetail">${sessionScope.login.memDetail}</textarea>
		<!-- ################################################### -->
		<!-- ################################################### -->
		<!-- submit button -->
		<div id="buttonGroup">
		
  			<button type="submit" class="btn btn-info" id="submitBtn">정보수정</button>
  			<button type="reset" class="btn btn-info" id="resetBtn">다시작성</button>
		</div>
	</form>
	
	<!-- ################################################### -->
	<!-- ################################################### -->
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