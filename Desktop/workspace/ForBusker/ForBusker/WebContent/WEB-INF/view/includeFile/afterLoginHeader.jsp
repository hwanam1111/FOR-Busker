<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
							<li class="ul_li_List"><a href="showList.do">공연찾기</a></li>
							<li class="ul_li_List"><a href="sponAndBacked.do">후원하기</a></li>
							<li class="ul_li_List"><a href="videoMain.do">영상모음</a></li>
							<li class="ul_li_List"><a href="togetherList.do">함께해요</a></li>
						</ul>
					</li>
					<li><a href="message.do">쪽지함</a></li>
					<li><a href="noticeList.do">Notice</a></li>
					<li id="liMyPage"> 닉네임
						<ul> 
							<li class="ul_li_List"><a href="#">내 정보 수정</a></li>
							<li class="ul_li_List"><a href="showRegist.do">공연 등록하기</a></li>
							<li class="ul_li_List"><a href="#">회원 탈퇴하기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- ################################################# -->
			<!-- ################################################# -->
		</header>
	</div>
</div>