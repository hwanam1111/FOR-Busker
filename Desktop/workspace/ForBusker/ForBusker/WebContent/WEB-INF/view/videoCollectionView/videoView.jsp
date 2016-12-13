<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="busker.scan.vo.*" %>
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
<link href="<%=projectName %>/resources/css/videoCollection_css/imggrid.css?<?=filemtime('<%=projectName %>/resources/css/videoCollection_css/imggrid.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- include js -->
<script type="text/javascript" src="<%=projectName %>/resources/js/video_js/videoView.js?<?=filemtime('<%=projectName %>/resources/js/video_js/videoView.js')?>"></script>

<script type="text/javascript">
//########################################################
//좋아요 버튼
//########################################################
//########################################################
$(function() {
	$('#videoLike').click(function(event) {
		// 로그인 체크
		alert($('#likeImg').attr( 'src'))
		if("${sessionScope.login.memEmail}" == ""){
			alert("로그인 후 이용해 주세요");
			location.href="login.do";
			event.preventDefault();
			event.stopPropagation();
			event.stopImmediatePropagation();
			
		// 좋아요 insert
		}else if($('#likeImg').attr('src') == '/ForBusker/resources/images/video_img/thumbs-up32.png'){
			$.ajax({
				url : 'videoLikeInsert.do',
				type : 'get',
				data : ({ memLoginEmail : "${sessionScope.login.memEmail}",
						  videoNo : "${map.videoNo}"
					    }), 
				success : function (data) {
					// 이미지를 바꿔주고 카운트 +1
						$('#likeImg').attr( 'src', '/ForBusker/resources/images/video_img/thumbs-up32-rollover.png' )
						var sum = parseInt($('#videoCount').val()) + parseInt($('#hiddenCount').val());
						$('#videoCount').val(sum);
				},
				error : function(request,status,error) {
					// 에러 확인
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				} // error end
			}); // ajax	
		} // ajax if
		// 좋아요 delete
		else if($('#likeImg').attr( 'src', '/ForBusker/resources/images/video_img/thumbs-up32-rollover.png' )){
			$.ajax({
				url : 'videoLikeDelete.do',
				type : 'get',
				data : ({ memLoginEmail : "${sessionScope.login.memEmail}",
						  videoNo : "${map.videoNo}"
					    }), 
				success : function (data) {
					// 이미지를 바꿔주고 카운트 -1
						$('#likeImg').attr( 'src', '/ForBusker/resources/images/video_img/thumbs-up32.png' );
						var sum = parseInt($('#videoCount').val()) - parseInt($('#hiddenCount').val());
						$('#videoCount').val(sum);
						
				},
				// 에러확인
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				} // error end
			}); // ajax	
		} // ajax if 
		
	});
});
//########################################################
//########################################################
//########################################################
//########################################################
// 뷰 들어왔을 때 좋아요 확인
window.onload = function() {
	if("${result}" == "OK"){ 
		$('#likeImg').attr( 'src', '/ForBusker/resources/images/video_img/thumbs-up32-rollover.png' );
	}
	
	if("${resultDel}" == "OK"){ 
		$('#likeImg').attr( 'src', '/ForBusker/resources/images/video_img/thumbs-up32.png' );
	}
}

//########################################################
//########################################################

</script>
</head>





<!-- #############  header nav부분 include  ############# -->
<%if(session.getAttribute("login") == null) { %>
<jsp:include page="/WEB-INF/view/includeFile/header.jsp" />
<% } else { %>
<jsp:include page="/WEB-INF/view/includeFile/afterLoginHeader.jsp" />
<%
	Object obj = session.getAttribute("login");
	VideoVO vvo = (VideoVO)request.getAttribute("map");
		MemberVO nvo = new MemberVO();
		if(obj!=null)nvo = (MemberVO)obj;
		%>
		<%System.out.println("세션 이메일 : " + nvo.getMemEmail()); /* 세션에 들어온 이메일 */ %>
		<%System.out.println("VideoVO 이메일 : " + vvo.getMemEmail()); /* VideoVO 안에 있는 이메일 */%>
		<%if(nvo.getMemEmail().equals(vvo.getMemEmail())) { %>
		<script type="text/javascript">
		$(function() {
			$('#footBtn').css('display', 'block');
		})
		</script>
		<% } %>
<% } %>
<!-- ################################################### -->




<!-- input type hidden 부분 -->

<!-- 글등록 -->
<!-- ################################################### -->
<input type="hidden" value="${map.memEmail}" name="memEmail">

<!-- 좋아요 -->
<!-- ################################################### -->
<input type="hidden" value="${sessionScope.login.memEmail}" name="memLoginEmail">
<input type="hidden" value="${map.videoNo}" name="videoNo">



<!-- 이부분 부터 코딩 시작 -->
<div class="hoc">

<!-- ################################################### -->
<!-- 오른쪽 메뉴 -->
<div id="mySidenav" class="sidenav">
<c:forEach var="newList" items="${list}">
	<div class="row-xs-4">
	<a href="videoLikeSearch.do?videoNo=${newList.videoNo}&memEmail=${newList.memEmail}&myId=${sessionScope.login.memEmail}"><img class='videothumb' src="https://img.youtube.com/vi/${newList.videoSomenale}/hqdefault.jpg"  id="newImg"><br/></a>
    	<label class="newlabel">Title : ${newList.videoName} </label>
    	<label class="newlabel">TeamName : ${newList.memTeamName}</label> 
    	<label class="newlabel">Date : ${newList.videoDate}</label>
    </div>
</c:forEach>
</div>
<!-- ################################################### -->
<!-- ################################################### -->

<!-- 뷰 시작 -->
<!-- ################################################### -->
<div class='row'>

<div class='col-xs-12' style="width: 640px; margin: 0px auto;">

<iframe width="640" height="360" src="${map.videoUrl}" frameborder="0" allowfullscreen></iframe>
<div class='videoContent'>

<!-- ################################################### -->
<!-- 컨텐트 메뉴 테이블 -->
<table class='toptablemenu'>
	<tr>
		<td colspan='2' style="width:640px;"><h2>${map.videoName}</h2></td>			
	</tr>
	<tr>
		<td>TeamName : ${map.memTeamName }</td>
		<td style="text-align: right; float: right;">조회수 : ${map.videoCount }</td>
	</tr>
</table>
<div style="float: right; position:relative; left:5px;">
<button id ="videoLike" style="background: none; border:none; float: left; margin-bottom:20px;">
<img src="<%=projectName %>/resources/images/video_img/thumbs-up32.png" id="likeImg" name="videoLike"/>
</button>
<div  style="float: right; margin-top:10px;">
	좋아요수 : &nbsp; <input type="text"  id="videoCount" value="${map.videoLike }" style="width:20px; float: right; margin-bottom:20px; border:none;">
	<input type="hidden" value="1" id="hiddenCount">
</div>
</div>
<input type="hidden" value="${map.memEmail}" name="memEmail">
<pre style="position: relative; right:5px;">-------------------------------------------------------------------------------------------------------------------------------------------
동영상 설명 부분입니다.
-------------------------------------------------------------------------------------------------------------------------------------------

불법 사이트 홍보시 글이 삭제될 수 있습니다.
Copyright &copy; 2016 - All Rights Reserved - ForBusker
-------------------------------------------------------------------------------------------------------------------------------------------
${map.videoDetail} </pre><br/><br/>
<!-- ################################################### -->
<!-- ################################################### -->

<!-- 수정 삭제 버튼 -->
<!-- ################################################### -->
</div>
</div>
<div class='col-xs-2'><span id='openBtn' style="font-size:23px;cursor:pointer;display:block" onclick="openNav()">&#9776; NewVideo</span>
<span id='closeBtn' style="font-size:23px;cursor:pointer;display:none" onclick="closeNav()">&times; NewVideo</span></div>
</div>
<div id="footBtn" style="margin-top:40px; margin-left:120px; display:none;">
	<a href="videoFormUpdate.do?videoNo=${map.videoNo}"><button class="btn default" style="width:200px; color:white;">게시글 수정</button></a>
	<a href="videoFormDelete.do?videoNo=${map.videoNo}"><button class="btn default" style="width:200px; color:white;">게시글 삭제</button></a>
</div>
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
