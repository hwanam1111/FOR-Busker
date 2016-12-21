<%@page import="busker.scan.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String projectName = "/ForBusker"; %>
<%
Object logincheck=session.getAttribute("login");
Object obj = request.getAttribute("volist");

	List<ShowVO> showVoList = null;
	String loc = "(37.555448809581634, 126.92352876576223)";
	if(obj!=null){
		showVoList=(List)obj;
		if(showVoList.size()==0){
			
		}else{
			loc=showVoList.get(0).getShMapCoords();
		}
	}else{
		//System.out.println("에러발생");
	}
	//페이징 클래스 받아오기
	PageVO pVO = (PageVO)request.getAttribute("page");
	//마포 받아오기
	String mapo=(String)request.getAttribute("mapo");
	if( (mapo !=null && mapo.equals("null") )|| mapo == null ) mapo="";
	
	//shno값 controller에서 받아와서 저장 
	int shno = 0;
	Object shnoObj = request.getAttribute("shno");
	if(shnoObj != null) shno=(Integer)shnoObj;
	
	//검색어 받아오기
	String value =(String)request.getAttribute("value");
	
	//날짜 받아오기
	String date =(String)request.getAttribute("date");
	
	System.out.println("데이트 : " + date);
	//select 받아오기
	String select =(String)request.getAttribute("select");
%>

<!DOCTYPE html>
<html>
<head>	 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- Bootstrap 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- include header -->
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="<%=projectName %>/resources/css/show_css/default.css?<?=filemtime('<%=projectName %>/resources/css/show_css/default.css')?>">
<link rel="stylesheet" href="<%=projectName %>/resources/css/show_css/performanceList.css?<?=filemtime('<%=projectName %>/resources/css/show_css/performanceList.css')?>">
<link href="<%=projectName %>/resources/css/together_css/togetherList.css?<?=filemtime('<%=projectName %>/resources/css/together_css/togetherList.css')?>" rel="stylesheet" type="text/css" media="all">
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- Bootstrap 자바스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script   src="//apis.daum.net/maps/maps3.js?apikey=4f21221b31649843b25f7a67007038c7&libraries=services"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.date.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker.date')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/legacy.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/legacy')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/showList.js?<?=filemtime('<%=projectName %>/resources/js/show_js/showList.js')?>"></script>
<link rel="stylesheet" href="<%=projectName %>/resources/css/show_css/showList.css?<?=filemtime('<%=projectName %>/resources/css/show_css/showList.css">
<script src="<%=projectName %>/resources/js/show_js/showList.js?<?=filemtime('<%=projectName %>/resources/js/show_js/showList.js')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/map.js?<?=filemtime('<%=projectName %>/resources/js/show_js/map.js')?>"></script>
<link rel="stylesheet" href="<%=projectName %>/resources/css/show_css/showList.css?<?=filemtime('<%=projectName %>/resources/css/show_css/showList.css">


<script type="text/javascript">
$(function(){
 //등록버튼 눌렀을때
$("#registBtn").click(function(){
	
	<%if(session.getAttribute("login") == null) { %>
    window.location.href="login.do";
 <%}else{%>
    window.location.href="showRegist.do";
 <%}%>
});
<%if(select != null){%>

$("#exampleSelect1 option:eq(<%=select%>)").prop("selected", "selected"); //첫번째 option 선택

<%}%>

$("input[name=date_submit]").val('<%=date%>');
});
</script>

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

<div class="hoc" align="center">
<h1 style="text-align: left; margin-left:30px; font-size:30px;">공연 찾기 <span style="font-size:20px;">(날짜를 선택하시고 검색해주세요.)</span></h1>
<table style="width:100%;">
<tr>
	<td colspan="2">   	
	<form class="form-inline" id="searchGo" style="margin-left:50px; height: 90px;"> 
	 <div class="form-group">
	 <%if(date!=null && !date.equals("null")) {%>
			<input id="input_01" type="text" class="datepicker form-control" name="date" style=" position: relative; right:20px;" value=<%=date %>>
	 <%}else{ %>	
			<input id="input_01" type="text" class="datepicker form-control" name="date"  placeholder="오늘의 공연" style=" position: relative; right:20px;">
	 <%} %>		
		<select class="form-control" id="exampleSelect1" style="width:200px;  position: relative; right:5px;">
			<option value="0">팀명</option>
			<option value="1">카테고리</option>
			<option value="2">지역</option>
		</select>
		<%if(value != null){ %>
		<input class="form-control" type="text" placeholder="" name="val" id="example-text-input" style="width:280px; margin-left:25px;" value=<%=value %> >
		<%} else{%>
		<input class="form-control" type="text" placeholder="" name="val" id="example-text-input" style="width:280px; margin-left:25px;" />
		<%} %>
		<select class='form-control' name="cate" id="exampleSelect2" style="width:280px; margin-left:25px;">
			<option value=''>선택하세요</option>
			<option value='노래'>노래</option>
			<option value='댄스'>댄스</option>
			<option value='연주'>연주</option>
			<option value='마술'>마술</option>
			<option value='퍼포먼스'>퍼포먼스</option>
			<option value='기타'>기타</option>
		</select>
		<button type="button" id="searchBtn" class="btn btn-info" style="width:90px; color:white; margin-left:12px; margin-right:10px;">검색</button>
	<c:if test="${null ne sessionScope.login}">
		<button type="button" id="registBtn" class="btn btn-info marginRight" id="moveToFormBtn" style="width:90px; color:white;margin-right:0;">등록하기</button>
	</c:if>
	</div>
	</form>
	</td>
</tr>
<tr>
<td style="padding-top: 10px; padding-left:30px; padding-bottom: 10px; padding-right: 10px;">
<!-- show list 없을때 -->
<% if(showVoList.size()==0){%>
<div style="width:100%;">
<div>
	 <div style="font-size:40px; line-height: 70px; position: relative; bottom:300px;">
		오늘은 공연이 없습니다. <br/>
		다른 지역을 검색해보세요.						
		
	</div>
</div>

<% } %>
<!-- show list 나오는 부분 -->
<% for (int i =0; i<showVoList.size(); i++){ %>
<div style="width:100%;">
<div>
<!-- 이미지들어가는부분 -->
<iframe src="https://www.youtube.com/embed/<%=showVoList.get(i).getShVideo().substring(showVoList.get(i).getShVideo().length()-11,showVoList.get(i).getShVideo().length())%>" frameborder="0" allowfullscreen style="width:95%; height:300px;"></iframe>
<form class="form-inline"> 
	 <div class="form-group" align="center" style="margin-left: 50px">
		<label class="form-control" style="margin-bottom:40px; margin-top:5px; width:160px;">
		<a><%=showVoList.get(i).getShTeamName() %></a></label>						
		<label class="form-control" style="margin-bottom:40px; margin-top:5px; width:160px;">
		<a class="detail">
		<input type="hidden" value="<%=showVoList.get(i).getShNo()%>">
		상세보기
		</a>
		<input type="hidden" value="new daum.maps.LatLng<%=showVoList.get(i).getShMapCoords()%>">
		</label>
	</div>
</form>
<% } %>
<input type="hidden" value="" id="loc">
<!-- 페이징 부분 -->
	<%if(shno == 0 && value==null) {%>
	<%-- <nav>
	  <ul class="pagination pagination-lg">
	    <li class="page-item" >
	      <a class="page-link" href="showList.do?page=<%=pVO.getPreviPage()%>&loc=<%=mapo %>&shno=0" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
  		<%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href="showList.do?page=<%=i %>&loc=<%=mapo %>&shno=0"><%=i %></a></li>
	   	 	
	 	<%} %>
	    <li class="page-item">
	      <a class="page-link" href="showList.do?page=<%=pVO.getNextPage()%>&loc=<%=mapo %>&select=<%=select %>&date=<%=date %>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav> --%>
	<%} else if(shno == 0 && value !=null){%>
	<nav style="position: relative; left:120px; bottom:30px;">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
	      <a class="page-link" href="showListSearch.do?page=<%=pVO.getPreviPage()%>&val=<%=value %>&select=<%=select %>&date=<%=date %>" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
  		<%for(int i=pVO.getStartPage(); i <= pVO.getEndPage() ; i++) {%>
	   	 	<li class="page-item"><a class="page-link" href="showListSearch.do?page=<%=i %>&val=<%=value %>&select=<%=select %>&date=<%=date %>"><%=i %></a></li>
	   	 	
	 	<%} %>
	    <li class="page-item">
	      <a class="page-link" href="showListSearch.do?page=<%=pVO.getNextPage()%>&val=<%=value %>&select=<%=select %>&date=<%=date %>" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	<%} %>
</div>
</td>
<td style="width:50%;">
<div class="map_wrap" style="width:100%; height:905px;">

    <div id="map" style="width:100%; height:870px;"></div>
<!-- ################################확대 축소 컨트롤러 들어가는 부분############################### -->
    <div class="custom_zoomcontrol radius_border"> 
        <div id="plus" class="marginTop"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png"></div>  
        <div id="minus" class="marginTop"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png"></div>
    </div>
</div>    
</td>
<!-- #####################숨겨진 슬라이드 창(상세보기 버튼을 눌렀을때 상세정보 나옴)###################### -->
<!-- #################################################################################### -->
<!-- #################################################################################### -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <ul>
  <li id="shName" style="font-size: 25px; margin-bottom:20px; text-align: left; margin-left:15px; color:#000"></li>
<!--   <iframe width="560" height="315" src="" frameborder="0" allowfullscreen id="shVideo"></iframe><br/><br/> 맥-->
<iframe width="625" height="315" src="" frameborder="0" allowfullscreen id="shVideo" style="position: relative; right:10px;"></iframe><br/><br/>  <!-- 윈도우 -->
  <div style="text-align: left; margin-left:15px;">
  <button type="button" class="surInfo btn btn-success li_btn" value="FD6">주변 음식점</button><!-- FD6  -->
  <button type="button" class="surInfo btn btn-info li_btn" value="CE7">주변 카페</button><!-- CE7  -->
  <button type="button" class="surInfo btn btn-warning li_btn" value="CS2">주변 편의점</button><!-- CS2  -->
  <button type="button" class="surInfo btn btn-danger li_btn" value="SW8" id="li_btn_right">주변 지하철역</button><!-- SW8  --><br/><br/>
  </div>
  <div style="text-align: left; margin-left:15px; color:#000;" id="li_detail">
  <li id="teamName"></li>
  <li id="shMapAddr"></li>
  <li id="shMapDetail"></li>
  <li id="shTime"></li>
  <li id="shDate"></li>
  <li id="shType"></li>
  <li id="shDetail" style="color:#555"></li>
  </div>
 <!-- 주변 정보가 나올 부분 -->
 <!-- #################################################################################### -->
 <!-- #################################################################################### -->
 
  </ul>
</div>
<!-- #################################################################################### -->
<!-- #################################################################################### -->
<!-- #################################################################################### -->
<!-- 메인 -->
<div id="main"></div>

</tr>
</table>
<!-- #####################################상세보기 끝#######################################-->

<script>
var showlistsize = <%=showVoList.size()%>;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
			center: new daum.maps.LatLng<%=loc%>, // 지도의 중심좌표
        	level:7                              // 지도의 확대 레벨
        
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 
var src="";

// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
	<% for(int i =0;i<showVoList.size();i++){%>
    {
        title: "<%=showVoList.get(i).getShName()%>", 
        latlng: new daum.maps.LatLng<%=showVoList.get(i).getShMapCoords()%>
    }
    <%if(i!=showVoList.size()-1){%>
     ,
	<%}%>
	<%}%>
];

// ###############마커 이미지의 이미지 주소넣기입니다#####################
//마커 이미지 사이즈와 이미지소스
var imageSrc = "/ForBusker/resources/images/show_img/pin.png"; 
var imageSize = new daum.maps.Size(30, 35);   // 마커 이미지의 이미지 크기 입니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);// 마커 이미지를 생성합니다   

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        image : markerImage // 마커 이미지 
    });
    
    var infowindow = new daum.maps.InfoWindow({
        content: positions[i].title //############ 인포윈도우에 표시할 내용#########
    });

    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
}
    
  //인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        //console.log("마우스 오버 불림");
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
        return function() {
            infowindow.close();
        };
    }
//////////////////////////////////////////////////////////////////////////////////////////////////

 $('.surInfo').click(function(){
	
		   var loc=$('#loc').val();
	    	console.log("주변정보 버튼 눌렸음"+loc);
	    	 mapOption = { 
	    			   image : markerImage,
	    				center:eval("("+loc+")"), // 지도의 중심좌표
	    	        	level:3// 지도의 확대 레벨
	    	        
	    	 };
	    	$('#map').empty();
	    	 map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	    		console.log("지도 생성 성공");
	    	 
	    		//장소 검색 객체를 생성합니다
	    		var ps = new daum.maps.services.Places(map); 
	    		var infBtn=$(this).val();
	    		if(infBtn=="FD6"){ //음식점 핀으로 바꾸기
	    			src="/ForBusker/resources/images/show_img/restuarant.png";
	    		}
	    		else if(infBtn=="CE7"){//카페 핀으로 바꾸기
	    			src="/ForBusker/resources/images/show_img/cafe.png";
	    		}
	    		else if(infBtn=="CS2"){//편의점 핀으로 바꾸기
	    			src="/ForBusker/resources/images/show_img/store.png";
	    		}
	    		else if(infBtn=="SW8"){//지하철 핀으로 바꾸기
	    			src="/ForBusker/resources/images/show_img/subway.png";
	    		}
	    		
	    		
	    		console.log("눌린버튼은 :"+infBtn);
	    		ps.categorySearch(infBtn, placesSearchCB, {useMapBounds:true});  
	    		//중심 마커 찍기
	    		var centerMarker = new daum.maps.Marker({
					 	map: map, // 마커를 표시할 지도
				        position:eval("("+loc+")"), // 마커를 표시할 위치
				        image : markerImage // 마커 이미지 
				 });
	    		console.log("centerMarker ; "+centerMarker);
});


//키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
	console.log("data : "+data.toString());
   if (status === daum.maps.services.Status.OK) {
       for (var i=0; i<data.places.length; i++) {
           displayMarker(data.places[i]);    
       }       
   }
}

//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
   // 마커를 생성하고 지도에 표시합니다
   var marker2 = new daum.maps.Marker({
       map: map,
       position: new daum.maps.LatLng(place.latitude, place.longitude) ,
       image: new daum.maps.MarkerImage(src, imageSize)
   });
   //배열에 마커 저장
 // markerArr.push(marker2);
   
   // 마커에 클릭이벤트를 등록합니다
   daum.maps.event.addListener(marker2, 'click', function(){
       // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
       infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
       infowindow.open(map, marker2);
   });
}
	
 

</script>
	
</div>

<!-- 달력 보여주는 div -->
<div id="container"></div>
<!-- 코딩 종료 -->


<!-- ##############  footer 부분 include  ############## -->
<jsp:include page="/WEB-INF/view/includeFile/footer.jsp" />
<!-- ################################################## -->
<!-- #############  반응형 모바일 js  ############# -->
<script src="<%=projectName %>/resources/js/index_js/jquery.mobilemenu.js"></script>
<!-- ################################################### -->
</body>
</html>