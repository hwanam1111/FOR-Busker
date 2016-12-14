<%@page import="busker.scan.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% String projectName = "/ForBusker";
Object obj = session.getAttribute("login");
MemberVO mvo = (MemberVO)obj;
%>

<!-- ################################################# -->
<!-- ################################################# -->
<!-- 로그아웃 부분 -->
<script type="text/javascript">
function logout(){
	 var con = confirm("로그아웃을 하시겠습니까?");
	 if(con == true){
		location.href="logout.do";
	  //logout을 위해 세션을 제거하는 페이지 호출
	 }else{}
	}
</script>	
<!-- ################################################# -->
<!-- ################################################# -->


<div class="bgded overlay">
<!-- ################################################# -->
<!-- ################################################# -->
	<div class="wrapper row1" style="margin-bottom: 70px;">
		<header id="header" class="hoc clear">
		<!-- ################################################# -->
		<!-- ################################################# -->
		<!-- logo부분 -->
			<div id="logo" class="fl_left">
				<h1>
					<a href="main.do">For Busker-♬</a>
				</h1>
			</div>
			<!-- ################################################# -->
			<!-- ################################################# -->
			<!-- 오른쪽 nav메뉴 -->
			<nav id="mainav" class="fl_right">
				<ul class="clear">
					<li onclick="logout()" id="liLogout">로그아웃</li>
					<li id="liMyPage"> 카테고리메뉴
						<ul> 
							<li class="ul_li_List"><a href="showList.do?loc=마포&shno=0">공연찾기</a></li>
							<li class="ul_li_List"><a href="sponAndBacked.do">후원하기</a></li>
							<li class="ul_li_List"><a href="videoMain.do">영상모음</a></li>
							<li class="ul_li_List"><a href="togetherList.do">함께해요</a></li>
						</ul>
					</li>
					<li id="messageicon"><a href="message.do?email=${sessionScope.login.memEmail}"><img style="width:33.66px; height:14px;" src="<%=projectName %>/resources/images/message_img/message.png"/></a></li>
					<li id="nomeesage"><a  href="message.do?email=${sessionScope.login.memEmail}">쪽지함</a></li>
					<li><a href="noticeList.do">Notice</a></li>
					<li id="liMyPage"> ${sessionScope.login.memEmail}
						<ul> 
							<li class="ul_li_List"><a href="mypageUpdate.do?memType=${sessionScope.login.memType}">내 정보 수정</a></li>							<%if(mvo.getMemType().equals("2")){ %>
							<li class="ul_li_List"><a href="showRegist.do" id="showReg">공연 등록하기</a></li>
							<%}%>
							<li class="ul_li_List"><a href="mypageLike.do?memEmail=${sessionScope.login.memEmail}">좋아요 페이지</a></li>
							<li class="ul_li_List"><a href="mypageLeave.do?mem=${sessionScope.login.memEmail}">회원 탈퇴하기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- ################################################# -->
			<!-- ################################################# -->
		</header>
				<input type= "hidden" id="messageCheckEmail" name="messageCheckEmail" value="${sessionScope.login.memEmail}"/>
		<script type="text/javascript">
		$(function(){
			$("#messageicon").hide();
 		setInterval(function() {
			$.ajax({
				url: "messageCheck.do"	,
				type : "post",
				data: ({
					Email : $("#messageCheckEmail").val()
				}),
		  		dataType: "text",
				success : function(data){
					console.log(data);			
					if(data=="success"){
							$("#nomeesage").hide();
							$("#messageicon").show();
					}else{
						console.log("실패");
					}
				}	
				});
			}, 2000); 
		});	
 		</script>
	</div>
</div>