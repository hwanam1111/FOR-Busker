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
		
//	 	$("input[name=date_submit]").attr("name",$("input[name=date_submit]").val());
//	 	$("#searchGo").attr("action","showList.do");
//	 	$("#searchGo").submit();
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
		alert(date);
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
	//alert("<%=showVoList.get(1).getShName()%>"); 

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
		var kk="<%=logincheck%>";
		alert(kk);
		if(kk='null') {
			window.location.href="login.do";
		}else{
			window.location.href="showRegist.do"
		}
	});
	
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

