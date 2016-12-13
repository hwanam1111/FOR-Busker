<%@page import="busker.scan.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>
<%
Object logincheck=session.getAttribute("login");
Object obj = request.getAttribute("volist");

	List<ShowVO> showVoList = null;
	String loc = "(37.555448809581634, 126.92352876576223)";
	if(obj!=null){
		showVoList=(List)obj;
		if(showVoList.size()==0){
			System.out.println("하하하핳"+showVoList.size());
			
		}else{
			loc=showVoList.get(0).getShMapCoords();
		}
		
	}else{
		System.out.println("에러발생");
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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.date.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/picker.date')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/legacy.js?<?=filemtime('<%=projectName %>/resources/js/performance_js/legacy')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/showList.js?<?=filemtime('<%=projectName %>/resources/js/show_js/showList.js')?>"></script>

<script type="text/javascript">
$(function(){
	$('#exampleSelect2').hide();
	
var $input = $( '.datepicker' ).pickadate({
    formatSubmit: 'yyyy/mm/dd',
    // min: [2015, 7, 14],
    container: '#container',
    // editable: true,
    closeOnSelect: true,
    closeOnClear: true,    
  	
});

$("#searchBtn").click(function(){
	
// 	$("input[name=date_submit]").attr("name",$("input[name=date_submit]").val());
// 	$("#searchGo").attr("action","showList.do");
// 	$("#searchGo").submit();
	var now = new Date();
	  var year  = now.getFullYear();
      var month = now.getMonth() + 1; // 0부터 시작하므로 1더함 더함
      var day   = now.getDate();
      if (("" + month).length == 1) { month = "0" + month; }
      if (("" + day).length   == 1) { day   = "0" + day;   }
	
      
	var date = $("input[name=date_submit]").val(); //날짜값 저장
	if(date==''){
		date=(year+'/'+month+'/'+day); //날짜값을 안넣고 그냥 submit할때 오늘날짜 넣어줌(placeholder에 오늘의 날짜라고 되어있기때문)
	}
	
    var select = $("#exampleSelect1 option:selected").val();
   
    var inputvalue = $("[name=val]").val(); //select값과 value값들을 parameter로 같이 넘김
    window.location.href="showListSearch.do?date="
                            + date
                            + "&select="
                            + select
                            + "&val="
                            + inputvalue;
                   
    
});

/* Set the width of the side navigation to 250px */
$("#clickopen").click(function(){
	document.getElementById("mySidenav").style.width = "250px";
}); 


/* Set the width of the side navigation to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
<%-- alert("<%=showVoList.get(1).getShName()%>"); --%>

var picker = $input.pickadate('picker');
 
$("#exampleSelect1").change(function(){//카테고리로 검색할경우 input을 text->select로 바꿔줌
	if($("#exampleSelect1 option:selected").val() == "1"){
		$("#example-text-input").hide();
		$('#exampleSelect2').show();
		$('#example-text-input').attr("name","");
		$('#exampleSelect2').attr("name","val");
	}else {
		$("#example-text-input").show();
		$('#exampleSelect2').hide();
		$('#exampleSelect2').attr("name","");
		$('#example-text-input').attr("name","val");
	}
});
$("#registBtn").click(function(){
	
	<%if(session.getAttribute("login") == null) { %>
    window.location.href="login.do";
 <%}else{%>
    window.location.href="showRegist.do";
 <%}%>
});
<%if(select != null){%>

	$("#exampleSelect1 option:eq(<%=select%>)").prop("selected", "selected"); //첫번째 option 선택
	<%-- 	$("#exampleSelect1").val(<%=select%>); --%>
	<%if(select.equals("1")){%>
	$("#example-text-input").hide();
	$('#exampleSelect2').show();
	$('#example-text-input').attr("name","");
	$('#exampleSelect2').attr("name","val");
	$("#exampleSelect2").val('<%=value%>'); //두번째 셀렉트 option 선택
	<%}%><%-- 	$("#exampleSelect1").val(<%=select%>); --%>


  
<%}%>

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

<div id="mySidenav" class="sidenav">
<!-- 	 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> -->
	<div class="row-xs-4">
	누구야
    </div>
    <div class="row-xs-4">누구야야야야야</div>
    <div class="row-xs-4">배고파
	</div>
</div>


<!-- Use any element to open the sidenav -->
<span id="clickopen">open</span>

<table style="width:100%;">
<tr>
	<td colspan="2">   	
	<form class="form-inline" id="searchGo" style="margin-left:50px; margin-bottom:20px;"> 
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
		<input class="form-control" type="text" placeholder="" name="val" id="example-text-input" style="width:280px; margin-left:25px;" />
		<select class='form-control' name="cate" id="exampleSelect2" style="width:280px; margin-left:25px;">
			<option value=''>선택하세요</option>
			<option value='노래'>노래</option>
			<option value='댄스'>댄스</option>
			<option value='연주'>연주</option>
			<option value='마술'>마술</option>
			<option value='퍼포먼스'>퍼포먼스</option>
			<option value='기타'>기타</option>
		</select>
		<button type="button" id="searchBtn" class="btn btn-outline-info" style="width:90px; color:white">검색</button>
		<button type="button" id="registBtn" class="btn btn-outline-secondary marginRight" id="moveToFormBtn" style="width:90px; color:white">등록하기</button>
	</div>
	</form>
	</td>
</tr>
<tr>
<td style="padding-top: 10px; padding-left:30px; padding-bottom: 10px; padding-right: 10px;">
<% if(showVoList.size()==0){%>
<div style="width:100%;">
<div>
<!-- 이미지들어가는부분 -->
<form class="form-inline"> 
	 <div class="form-group" align="center" style="margin-left: 130px">
		오늘은 공연이 없습니다. <br/>
		다른 지역을 검색해보세요.						
		
	</div>
</form>
</div>

<% } %>
<% for (int i =0; i<showVoList.size(); i++){ %>
<div style="width:100%;">
<div>
<!-- 이미지들어가는부분 -->
<iframe src="https://www.youtube.com/embed/<%=showVoList.get(i).getShVideo().substring(showVoList.get(i).getShVideo().length()-11,showVoList.get(i).getShVideo().length())%>" frameborder="0" allowfullscreen style="width:95%; height:300px;"></iframe>
<form class="form-inline"> 
	 <div class="form-group" align="center" style="margin-left: 130px">
		<label class="form-control" style="margin-bottom:40px; margin-top:5px;"><a><%=showVoList.get(i).getShTeamName() %></a></label>						
		<label class="form-control" style="margin-bottom:40px; margin-top:5px;"><a>상세보기</a></label>
	</div>
</form>

<% } %>
	<%if(shno == 0 && value==null) {%>
	<nav align="center">
	  <ul class="pagination pagination-lg">
	    <li class="page-item">
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
	</nav>
	<%} else if(shno == 0 && value !=null){%>
	<nav align="center">
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
<td style="width:50%;"><div id="map" style="width:100%; height:770px; z-index: -1; "></div></td>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=74be419bba1e2ea84f96e8fd5d379f5e"></script>
<script>
var showlistsize = <%=showVoList.size()%>;
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
			center: new daum.maps.LatLng<%=loc%>, // 지도의 중심좌표
        	level: 4 // 지도의 확대 레벨
        
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
function setZoomable(zoomable) {
    // 마우스 휠로 지도 확대,축소 가능여부를 설정합니다
    map.setZoomable(zoomable);

}
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
	<% for(int i =0;i<showVoList.size();i++){%>
    {
        title: "<%=showVoList.get(i).getShName()%>" , 
        latlng: new daum.maps.LatLng<%=showVoList.get(i).getShMapCoords()%>
    }
    <%if(i!=showVoList.size()-1){%>
    ,
	<%}%>
	<%}%>
];

// ###############마커 이미지의 이미지 주소넣기입니다#####################
var imageSrc = "<%=projectName %>/resources/images/show_img/pin.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(30, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
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

</script>
</tr>
</table>
	
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