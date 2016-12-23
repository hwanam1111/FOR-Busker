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
<!-- bPopup -->
<script type="text/javascript" src="<%=projectName %>/resources/js/popup_js/jquery.bpopup.js"></script>
<!-- include css -->
<link href="<%=projectName %>/resources/css/index_css/include.css?<?=filemtime('<%=projectName %>/resources/css/index_css/include.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- include css -->
<link href="<%=projectName %>/resources/css/show_css/showView.css?<?=filemtime('<%=projectName %>/resources/css/show_css/showView.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- showView js -->
<%-- <script src="<%=projectName %>/resources/js/show_js/showView.js?<?=filemtime('<%=projectName %>/resources/js/show_js/showView.js')?>"></script> --%>
<script type="text/javascript">
$(function(){
	
	$('#mdBtn').click(function(){
		
		location.href="showUpdate.do?shNo=${show.shNo}";
	})
	
	$('#deBtn').click(function(){
		var result = confirm('정말 삭제하시겠습니까??');
		if (result){    //확인
			location.href="showDelete.do?shNo=${show.shNo}";
		}else{   //취소
		    return;
		}
		
		
	})
})
</script>
</head>

<body id="top">
<!-- #############  header nav부분 include  ############# -->

<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />

<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">
<div id="adminBtn" style="margin-left:760px; display:none;">
   <button class="dlBtn" type="button" class="btn btn-info" style="width:100px; color:white;">게시글 삭제</button>
</div>
	<table id="tableTdmargin" style="margin:0 auto; width:750px;">
	<!-- 수정 삭제버튼 -->
	<tr>
		<td>
	<div class="MDBtn">
		<a class="ModifyBtn">
			<button type="button" class="btn btn-info mdBtn" id="mdBtn"><input type="hidden" value="${show.shNo}">게시글 수정</button>
		</a>
		<a class="deleteBtn">
		<button type="button" class="btn btn-info dlBtn" id="deBtn"><input type="hidden" value="${show.shNo}">게시글 삭제</button>
		</a>
	</div>
		</td>
	</tr>
	<tr> <!-- 제목 들어가는 부분 -->
	<td style="width:650px;">
	
	<div style="width:650px;"><h1>TITLE : ${show.shName}</h1></div>
	
	</td>
	</tr>
	
	<tr><!-- 영상 들어가는 부분 -->
	<td>
	<div>
	<iframe width="750" height="450"
		src="${show.shVideo}" >
	</iframe></div>
	</td>
	</tr>
	
	<tr><!-- 팀이름-->
	<td>
	<div>
	
	<h4>
	
	TeamName : ${show.shTeamName}</h4>
	</div>
	</td>
	</tr>
	
	<tr><!-- 팀타입-->
	<td>
	<div>
	
	<h4>
	
	TeamType : ${show.shType}</h4>
	</div>
	</td>
	</tr>
	
	<tr> <!-- 주소 -->
	<td>
	<div>
	
	주소 : ${show.shMapAddr}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 상세주소 -->
	<td>
	<div>
	
	상세주소 : ${show.shMapDetail}
	</div>
	</td>
	</tr>
	
	
	<tr> <!-- 날짜 -->
	<td>
	<div>
	
	날짜: ${show.shDate}
	</div>
	</td>
	</tr>
	
	<tr> <!-- 시간 -->
	<td>
	<div>
	
	시간: ${show.shTime}
	</div>
	</td>
	</tr>

	<tr><!-- 상세설명 -->
	<td>
	<div>

	상세설명 : <br/> <br/><pre>${show.shDetail}</pre>
	</div>
	</td>
	</tr>
	
	</table>

	
	
	
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