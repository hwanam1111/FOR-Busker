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
<!-- include header -->
<link href="<%=projectName %>/resources/css/index_css/include.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="<%=projectName %>/resources/css/show_css/default.css?<?=filemtime('<%=projectName %>/resources/css/show_css/default')?>">

<!-- Bootstrap 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- jQuery lib CDN URL -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.js?<?=filemtime('<%=projectName %>/resources/js/show_js/picker')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/picker.date.js?<?=filemtime('<%=projectName %>/resources/js/show_js/picker.date')?>"></script>
<script src="<%=projectName %>/resources/js/show_js/legacy.js?<?=filemtime('<%=projectName %>/resources/js/show_js/legacy')?>"></script>


<script type="text/javascript">
$(function(){
	
var $input = $( '.datepicker' ).pickadate({
    formatSubmit: 'yyyy/mm/dd',
    // min: [2015, 7, 14],
    container: '#container',
    // editable: true,
    closeOnSelect: true,
    closeOnClear: true,    
})


var picker = $input.pickadate('picker')

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

<table style="width:100%;">
<tr>
	<td colspan="2">   	
	<form class="form-inline" style="margin-left:50px; margin-bottom:20px;"> 
	 <div class="form-group">
		<input id="input_01" type="text" class="datepicker form-control" name="date"  placeholder="오늘의 공연" style=" position: relative; right:20px;"/>
		<select class="form-control" id="exampleSelect1" style="width:200px;  position: relative; right:5px;">
			<option>팀명</option>
			<option>카테고리</option>
		</select>
		<input class="form-control" type="text" placeholder="" id="example-text-input" style="width:280px; margin-left:25px;" />
		<button type="button" class="btn btn-outline-info " style="width:100px; color:white">검색</button>
		<button type="button" class="btn btn-outline-secondary marginRight" id="moveToFormBtn" style="width:100px; color:white">등록하기</button>
	</div>
	</form>
	</td>
</tr>
<tr>
<td style="padding-top: 10px; padding-left:30px; padding-bottom: 10px; padding-right: 10px;">
<% for (int i =0; i<2; i++){ %>
<div style="width:100%;">
<div>
<!-- 이미지들어가는부분 -->
<iframe src="https://www.youtube.com/embed/ePpPVE-GGJw" frameborder="0" allowfullscreen style="width:95%; height:300px;"></iframe>
<form class="form-inline"> 
	 <div class="form-group" align="center" style="margin-left: 130px">
		<label class="form-control" style="margin-bottom:40px; margin-top:5px;"><a>팀명</a></label>						
		<label class="form-control" style="margin-bottom:40px; margin-top:5px;"><a>상세보기</a></label>
	</div>
</form>
</div>
<% } %>
</td>
<td style="width:50%;"><div id="map" style="width:100%; height:770px; z-index: -1; "></div></td>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=74be419bba1e2ea84f96e8fd5d379f5e"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '카카오', 
        latlng: new daum.maps.LatLng(33.450705, 126.570677)
    },
    {
        title: '생태연못', 
        latlng: new daum.maps.LatLng(33.450936, 126.569477)
    }
];

// ###############마커 이미지의 이미지 주소넣기입니다#####################
var imageSrc = "../pin.png"; 
    
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