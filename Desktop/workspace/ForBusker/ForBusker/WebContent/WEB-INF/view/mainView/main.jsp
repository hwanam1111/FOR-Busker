<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<% String projectName = "/ForBusker"; %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- ################################################################ -->
<!-- ################################################################ -->
<!-- Main css -->
<link href="<%=projectName %>/resources/css/index_css/layout.css" rel="stylesheet" type="text/css" media="all">

<!-- ################################################################ -->
<!-- ################################################################ -->
<!-- jQuery lib CDN URL -->
<script src="/ForBusker/resources/js/index_js/mapper.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
<style type="text/css" rel="stylesheet">
@import url(https://fonts.googleapis.com/css?family=Bungee);
@import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
	body, input, textarea, select{font-family: 'Hanna', serif;}
	h1, h2, h3, h4, h5, h6, .heading{font-family: 'Hanna', serif;}

/* 네비게이션 메뉴 */
#mainav #liMyPage:hover{color:#000; background-color:inherit; text-decoration: none; cursor: pointer;}
#mainav .ul_li_List{color:#ff0000; line-height: 30px;}
#mainav .ul_li_List:first-child{margin-top:30px;}
</style>

 
</head>
<body id="top">
	<!-- Top Background Image Wrapper -->
	<div class="bgded overlay" style="background-image: url('<%=projectName %>/resources/images/index_img/headerBg.jpg');">
		<div class="wrapper row1">
<%if(session.getAttribute("login") == null) { %>
			<header id="header" class="hoc clear">
			<div id="logo" class="fl_left">
				<h1>
					<a href="main.do">For Busker-♬</a>
				</h1>
			</div>
			<nav id="mainav" class="fl_right">
			<ul class="clear">
				<li><a href="login.do">로그인</a></li>
				<li><a href="join.do">회원가입</a></li>
				<li><a href="noticeList.do">Notice</a></li>
			</ul>
			</nav> <!-- ################################################################################################ -->
			</header>
<% } else { %>
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
					<li onclick="logout()" id="liLogout" style="cursor: pointer">로그아웃</li>
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
					<li id="liMyPage"> ${sessionScope.login.memEmail}
						<ul> 
							<li class="ul_li_List"><a href="mypageUpdate.do">내 정보 수정</a></li>
							<li class="ul_li_List"><a href="showRegist.do">공연 등록하기</a></li>
							<li class="ul_li_List"><a href="mypageLike.do">좋아요 페이지</a></li>
							<li class="ul_li_List"><a href="mypageLeave.do">회원 탈퇴하기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<!-- ################################################# -->
			<!-- ################################################# -->
		</header>
<% } %>
		</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div id="pageintro" class="hoc clear">
			<article> <!-- ################################################################################################ -->
			<h3 class="heading">Street Performance</h3>
			<p>
				무엇 하나 쉽지 않은 거리공연, 여기저기 흩어져 있는 공연정보,<br> 이제 OOOO을 통해 1년 365일 생생한
				거리공연의 즐거움을 만나보세요.
			</p>
			<p class="font-x1 uppercase bold">For Busker</p>
			<!-- ################################################################################################ -->
			</article>
		</div>
		<!-- ################################################################################################ -->
	</div>
	<!-- End Top Background Image Wrapper -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="hoc container clear"> <!-- main body --> <!-- ################################################################################################ -->
		<div class="sectiontitle">
			<h6 class="heading">CATEGORI</h6>
		</div>
		<ul class="nospace group center">
			<li class="one_quarter first"><article>
				<a href="showList.do"><img src="<%=projectName %>/resources/images/index_img/categori_1.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">Find a show</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="sponAndBacked.do"><img src="<%=projectName %>/resources/images/index_img/categori_2.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">Sponsor</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="videoMain.do"><img src="<%=projectName %>/resources/images/index_img/categori_3.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">Video Collection</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="togetherList.do"><img src="<%=projectName %>/resources/images/index_img/categori_4.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">Join Us</h6>
				</article></li>
		</ul>
		<!-- ################################################################################################ -->
		<!-- / main body -->
		<div class="clear"></div>
		</main>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper bgded"
		style="background-color: rgba(49, 255, 255, .49); border-top: 1px solid rgba(49, 101, 115, .75); border-bottom: 1px solid rgba(49, 101, 115, .75); width: 100%">
		<div class="split clear">
			<img src="/ForBusker/resources/images/index_img/map2.jpg" usemap="#maptag" class="mapper noborder iradius16 iopacity50 icolor00ff00">
			<map name="maptag" id="maptag" >
 			<!-- 강북 -->
 			<area shape="poly"  coords="347,210,493,225,494,294,332,299" href="#" target="_blank" title="광화문">
 			<area shape="poly"  coords="281,43,350,46,330,196,232,186" href="#" target="_blank" title="은평/서대문">
			<area shape="poly" id="blue" rel="green,red" coords="223,204,327,214,315,301,207,261" href="#" target="_blank" title="신촌">
			<area shape="poly" coords="164,256,285,306,232,375,128,293" href="#" target="_blank" title="마포">
			<area shape="poly" coords="297,321,354,326,338,462,247,387" href="#" target="_blank" title="홍대">
			<area shape="poly" coords="365,79,443,84,435,204,350,199" href="#" target="_blank" title="종로">
			<area shape="poly" coords="381,314,490,311,490,380,381,397" href="#" target="_blank" title="명동">
			<area shape="poly" coords="355,423,441,406,458,493,424,505,353,472" href="#" target="_blank" title="이태원">
			<area shape="poly" coords="460,28,551,29,561,130,457,121" href="#" target="_blank" title="대학로">
			<area shape="poly" coords="455,140,553,148,558,219,452,205" href="#" target="_blank" title="삼청동">
			<area shape="poly" coords="508,229,572,233,586,358,502,374" href="#" target="_blank" title="중구">
			<area shape="poly" coords="462,402,576,381,579,434,475,487" href="#" target="_blank" title="용산">
			<area shape="poly" coords="573,60,660,52,672,151,583,163" href="#" target="_blank" title="강북/성북">
			<area shape="poly" coords="580,179,672,170,684,253,593,271" href="#" target="_blank" title="동대문/성동">
			<area shape="poly" coords="596,285,685,273,699,342,604,385" href="#" target="_blank" title="건대">
			<area shape="poly" coords="676,34,724,26,764,56,771,163,694,175" href="#" target="_blank" title="노원/도봉">
			<area shape="poly" coords="695,193,784,180,770,294,710,311" href="#" target="_blank" title="중랑/광진">
			<!-- 강남 -->
			<area shape="poly" coords="101,386,178,407,215,457,190,515,101,535" href="#" target="_blank" title="강서/양천">
<area shape="poly" coords="226,470,339,554,269,593,203,518" href="#" target="_blank" title="영등포">
<area shape="poly" coords="123,543,189,528,252,602,159,653,121,633" href="#" target="_blank" title="구로/금천">
<area shape="poly" coords="238,625,305,589,299,699,250,699" href="#" target="_blank" title="동작">
<area shape="poly" coords="329,581,381,560,398,699,322,699" href="#" target="_blank" title="관악">

<area shape="poly" coords="410,562,464,549,496,685,423,692" href="#" target="_blank" title="서초">
<area shape="poly" coords="477,502,562,494,583,575,492,600" href="#" target="_blank" title="압구정/청담">
<area shape="poly" coords="496,615,587,590,614,680,510,685" href="#" target="_blank" title="서래마을">
<area shape="poly" coords="575,491,652,452,695,526,598,570" href="#" target="_blank" title="가로수길">
<area shape="poly" coords="602,585,702,540,731,598,624,656" href="#" target="_blank" title="강남">

<area shape="poly" coords="723,372,792,354,793,442,697,436" href="#" target="_blank" title="강동">
<area shape="poly" coords="682,454,797,460,796,577,747,580" href="#" target="_blank" title="송파">
			
			<section id="split-right" style="position:absolute; right:-350px"> <!-- ################################################################################################ -->
			<h6 class="heading">리스트 ㅇㅇ</h6>
			<p class="btmspace-30">리스트 ㅇㅇ</p>
			<ul class="fa-ul">
				<li><i class="fa-li fa fa-check-circle"></i> 리스트 1임</li>
				<li><i class="fa-li fa fa-check-circle"></i> 리스트 2임</li>
				<li><i class="fa-li fa fa-check-circle"></i> 리스트 3임</li>
			</ul>
			<!-- ################################################################################################ -->
			</section>
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<section class="hoc container clear"> <!-- ################################################################################################ -->
		<div class="sectiontitle">
			<h6 class="heading">Busker Top3 Ranking</h6>
			<p>이번달 Top3에 Rank된 분들입니다.</p>
		</div>
		<div class="group latest">
			<article class="one_third first"> <figure>
			<a href="#"><img src="images/demo/320x220.png" alt=""></a></figure>
			<div class="txtwrap">
				<h4 class="heading">Ex etiam auctor blandit</h4>
				<ul class="nospace meta">
					<li><i class="fa fa-user"></i> <a href="#">Admin</a></li>
					<li><i class="fa fa-tag"></i> <a href="#">Category Name</a></li>
				</ul>
				<p>Tellus accumsan et egestas eu semper ac odio aenean quis
					dapibus massa sit amet tincidunt dui nulla facilisi&hellip;</p>
				<footer>
				<a href="#">Read More &raquo;</a></footer>
			</div>
			</article>
			<article class="one_third"> <figure>
			<a href="#"><img src="images/demo/320x220.png" alt=""></a></figure>
			<div class="txtwrap">
				<h4 class="heading">Risus in commodo arcu</h4>
				<ul class="nospace meta">
					<li><i class="fa fa-user"></i> <a href="#">Admin</a></li>
					<li><i class="fa fa-tag"></i> <a href="#">Category Name</a></li>
				</ul>
				<p>Aliquam erat volutpat convallis nunc at risus tempor nec
					suscipit erat efficitur et elit lectus vestibulum ante&hellip;</p>
				<footer>
				<a href="#">Read More &raquo;</a></footer>
			</div>
			</article>
			<article class="one_third"> <figure>
			<a href="#"><img src="images/demo/320x220.png" alt=""></a></figure>
			<div class="txtwrap">
				<h4 class="heading">Gravida eu sed elit</h4>
				<ul class="nospace meta">
					<li><i class="fa fa-user"></i> <a href="#">Admin</a></li>
					<li><i class="fa fa-tag"></i> <a href="#">Category Name</a></li>
				</ul>
				<p>Cubilia curae aliquam feugiat laoreet malesuada elementum
					habitant morbi tristique et netus et fames ac&hellip;</p>
				<footer>
				<a href="#">Read More &raquo;</a>
				</footer>
			</div>
			</article>
		</div>
		<!-- ################################################################################################ -->
		</section>
	</div>

	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_right">
				Copyright &copy; 2016 - All Rights Reserved - <a href="#">FOR Busker</a>
			</p>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	<script src="<%=projectName %>/resources/js/index_js/jquery.backtotop.js"></script>
	<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
</body>
</html>