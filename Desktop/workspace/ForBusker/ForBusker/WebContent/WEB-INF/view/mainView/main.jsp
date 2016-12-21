<!-- 
	@author : 이강문, 김경림, 정영재, 이진욱, 김이준
	@date : 2016. 12. 20
	@desc : 메인 페이지 
 -->
<%@page import="busker.scan.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% String projectName = "/ForBusker"; 
Object obj = session.getAttribute("login");
	MemberVO mvo = (MemberVO)obj;
%>

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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<%=projectName %>/resources/js/index_js/mapper.js"></script>
<script src="<%=projectName %>/resources/js/index_js/mainlist.js"></script>
<!-- <script src="/ForBusker/resources/js/index_js/maputil.js"></script> -->
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
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	body, input, textarea, select{font-family: 'Jeju Gothic', serif;}
	h1, h2, h3, h4, h5, h6, .heading{font-family: 'Jeju Gothic', serif;}

/* 네비게이션 메뉴 */
#mainav #liMyPage:hover{color:#000; background-color:inherit; text-decoration: none; cursor: pointer;}
#mainav .ul_li_List{color:#ff0000; line-height: 30px;}
#mainav .ul_li_List:first-child{margin-top:30px;}

#messageimg{
	position: relative;
 	left: 580px; 
	top:-80px;
	width: 25px;
	heght: 25px;
}
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
				<li id="liMyPage"> 카테고리메뉴
					<ul> 
						<li class="ul_li_List"><a href="showList.do?loc=마포&shno=0">공연찾기</a></li>
						<li class="ul_li_List"><a href="sponAndBacked.do">후원하기/후원받기</a></li>
						<li class="ul_li_List"><a href="videoMain.do">영상모음</a></li>
						<li class="ul_li_List"><a href="togetherList.do">함께해요</a></li>
					</ul>
				</li>
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
			<img id="messageimg" src="<%=projectName %>/resources/images/message_img/messageimg.png"/>
			<nav id="mainav" class="fl_right">
				<ul class="clear">
					<li onclick="logout()" id="liLogout" style="cursor: pointer">로그아웃</li>
					<li id="liMyPage"> 카테고리메뉴
						<ul> 
							<li class="ul_li_List"><a href="showList.do?loc=마포&shno=0">공연찾기</a></li>
							<li class="ul_li_List"><a href="sponAndBacked.do?cate=spon">후원하기/후원받기</a></li>
							<li class="ul_li_List"><a href="videoMain.do">영상모음</a></li>
							<li class="ul_li_List"><a href="togetherList.do">함께해요</a></li>
						</ul>
					</li>
					<li id="nomeesage"><a  href="message.do?email=${sessionScope.login.memEmail}">쪽지함</a></li>	
					<li><a href="noticeList.do">Notice</a></li>
					<li id="liMyPage"> ${sessionScope.login.memEmail}
						<ul> 
							<li class="ul_li_List"><a href="mypageUpdate.do?memType=${sessionScope.login.memType}">내 정보 수정</a></li>							<%if(mvo.getMemType().equals("2")){ %>
							<li class="ul_li_List"><a  href="mypageAll.do?email=${sessionScope.login.memEmail}">내가 쓴 글</a></li>	
							<li class="ul_li_List"><a href="showRegist.do">공연 등록하기</a></li>
							<%}%>
							<li class="ul_li_List"><a href="mypageLike.do?memEmail=${sessionScope.login.memEmail}">좋아요 페이지</a></li>
							<li class="ul_li_List"><a href="mypageLeave.do?mem=${sessionScope.login.memEmail}">회원 탈퇴하기</a></li>
						</ul>
					</li>
				</ul>
			</nav>
			<input type="hidden" name="memEmail" value="${sessionScope.login.memEmail}">
			<!-- ################################################# -->
			<!-- ################################################# -->
		</header>
		<input type= "hidden" id="messageCheckEmail" name="messageCheckEmail" value="${sessionScope.login.memEmail}"/>
		<script type="text/javascript">
		$(function(){
 		setInterval(function() {
			$.ajax({
				url: "messageCheck.do"	,
				type : "post",
				data: ({
					Email : $("#messageCheckEmail").val()
				}),
		  		dataType: "text",
				success : function(data){
					if(data=="success"){
						$("#messageimg").css("top","8px");
					}
				}	
				});
			}, 2000); 
		});	
 		</script>
<% } %>
		</div>
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		<div id="pageintro" class="hoc clear">
			<article> <!-- ################################################################################################ -->
			<h3 class="heading">Street Performance</h3>
			<p>
				무엇 하나 쉽지 않은 거리공연, 여기저기 흩어져 있는 공연정보,<br> 이제 FOR_BUSKER를 통해 1년 365일 생생한
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
				<a href="showList.do?loc=마포&shno=0"><img src="<%=projectName %>/resources/images/index_img/categori_1.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">공연찾기</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="sponAndBacked.do"><img src="<%=projectName %>/resources/images/index_img/categori_2.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">후원하기/후원받기</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="videoMain.do"><img src="<%=projectName %>/resources/images/index_img/categori_3.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">영상모음</h6>
				</article></li>
			<li class="one_quarter"><article>
				<a href="togetherList.do"><img src="<%=projectName %>/resources/images/index_img/categori_4.jpg" class="cate_img"></a>
				<h6 class="heading font-x1">함께하기</h6>
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
    <!-- 메인하단 지도이미지 -->
	<div class="wrapper bgded"
		style="background-color:#3CC2FF; border-top: 1px solid rgba(49, 101, 115, .75); border-bottom: 1px solid rgba(49, 101, 115, .75); width: 100%">
		<div class="split clear">
			<img src="/ForBusker/resources/images/index_img/map2.jpg" usemap="#maptag" class="mapper noborder iradius16 iopacity50 icolor28E7FF">
			<map name="maptag" id="maptag" >
 			<!-- 강북 -->
 			
 			<area shape="poly"  coords="281,45,351,46,316,305,208,259" id="은평_서대문" name="2" target="_blank" title="은평/서대문/신촌">
			
			<area shape="poly" coords="165,255,282,305,355,318,368,354,340,464,122,294" id="마포" name="1"  target="_blank" title="마포/홍대">
			<area shape="poly" coords="371,25,557,27,563,129,557,223,495,217,492,295,331,297,346,177" id="종로" name="1" target="_blank" title="종로">
			<area shape="poly" coords="379,312,505,306,508,226,571,233,581,360,369,403" id="중" name="1" target="_blank" title="중구/명동">
			<area shape="poly" coords="355,423,572,378,584,438,476,488,459,494,425,507,353,477" id="용산" name="1" target="_blank" title="용산/이태원">
			<area shape="poly" coords="573,60,660,52,672,151,583,163" id="강북_성북" name="2" target="_blank" title="강북/성북">
			<area shape="poly" coords="580,179,672,170,684,253,593,271" id="동대문_성동" name="2" target="_blank" title="동대문/성동">
			
			<area shape="poly" coords="676,34,724,26,764,56,771,163,694,175" id="노원_도봉" name="2" target="_blank" title="노원/도봉">
			
			<area shape="poly" coords="595,284,702,261,692,192,788,174,769,292,695,320,699,343,606,383" id="중랑_광진" name="2" target="_blank" title="중랑/광진/건대">
			<area shape="poly" coords="101,386,178,407,215,457,190,515,101,535" id="강서_양천" name="2" target="_blank" title="강서/양천">
			<area shape="poly" coords="226,470,339,554,269,593,203,518" id="영등포" name="1" target="_blank" title="영등포">
			<area shape="poly" coords="123,543,189,528,252,602,159,653,121,633" id="구로_금천" name="1" target="_blank" title="구로/금천">
			<area shape="poly" coords="238,625,305,589,299,699,250,699" id="동작" name="1" target="_blank" title="동작">
			<area shape="poly" coords="329,581,381,560,398,699,322,699" id="관악" name="1" target="_blank" title="관악">

			<area shape="poly" coords="401,561,464,549,484,616,587,588,615,682,422,692" id="서초" name="1" target="_blank" title="서초/서래마을">
			
			<area shape="poly" coords="486,496,563,501,656,435,732,592,623,658,595,569,492,602" id="강남" name="1" target="_blank" title="강남/신사/압구정">
			
			<area shape="poly" coords="723,372,792,354,793,442,697,436" id="강동" name="1" target="_blank" title="강동">
			<area shape="poly" coords="682,454,797,460,796,577,747,580" id="송파" name="1" target="_blank" title="송파">
			
			
		</map>
			<section id="split-right" style="position:absolute; right:-350px"> <!-- ################################################################################################ -->
	
			<h3 class="heading" style="font-size:30px">오늘의 공연</h3>
			<p class="btmspace-30" id="kk">지역을 선택해주세요</p>
			<ul class="fa-ul" id="mainlist" style="font-size:25px">
				<li><i class="fa-li fa fa-check-circle"></i></li>
				<li><i class="fa-li fa fa-check-circle"></i></li>
				<li><i class="fa-li fa fa-check-circle"></i></li>
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
<!-- Top3 Rank -->
		<div class="sectiontitle">	
			<h6 class="heading">이달의 TOP3</h6>
			
			<p>이번달 Top3에 Rank된 분들입니다.</p>
		</div>
		<div class="group latest" align="center">	
		<c:forEach var="best" items="${vlist}" varStatus="status"  >
			<c:choose>
		    <c:when test="${status.index=='0'}">
					<article class="one_third first"> <figure>
		    </c:when>
		    <c:otherwise>
					<article class="one_third"> <figure>
		    </c:otherwise>
			</c:choose>
			<a href="#"><img src="<%=projectName %>/upload/${best.memTeamPhoto}" style="width:250px; height:180px" onerror="this.onerror=null;this.src='<%=projectName %>/resources/images/error_img/errorImg2.jpg';"></a></figure> 	<!-- 팀사진 -->
			<div class="txtwrap" align="center">
				<h4 class="heading"> ${best.memTeamName} </h4>					<!-- 팀명  -->
				<ul class="nospace meta">
					<li><i class="fa fa-user"></i> 좋아요 : ${best.videoLike} </li>
					<li><i class="fa fa-tag"></i> ${best.memTeamType}</li> <!-- 팀 카테고리 -->
				</ul>
				<footer>
			</div>
			</article>
		</c:forEach>
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