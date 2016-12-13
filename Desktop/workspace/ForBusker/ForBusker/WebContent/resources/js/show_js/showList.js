$(function(){

	
//#############확대 축소###############
    
// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(daum.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

//확대 축소 컨트롤
$('#plus').click(function(){
	console.log("zoomin");
    map.setLevel(map.getLevel() - 1);
});

$('#minus').click(function(){
	 map.setLevel(map.getLevel() + 1);
});

	
	
});

