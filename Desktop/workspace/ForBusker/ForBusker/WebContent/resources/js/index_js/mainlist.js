/**
 * 
 */

$(function(){
	$(".areaname").css("border","1px solid blue");

	
/*	var img = new Image(); 
	img.src='http://192.168.1.70:8080/?action=stream'; 
	 
	img.onload=function(){
		$("#streamingBtn").text("Online");
	}
	img.onerror=function(){
		$("#streamingBtn").attr("disabled","disabled");
		$("#streamingBtn").text("Offline");
	}	 
	*/
	
	$("area").click(function(e){ //main화면 내의 지도area를 클릭했을때
		$("#kk").hide(); //소제목 지움

		$.ajax({ //지도 옆 리스트 화면 바꾸기 위한 ajax
			url:"showlistcheck.do",
			type:'get',
			data : ({ loc : $(this).attr('id'), val:$(this).attr('name') }), //data값으로 id로 저장해놓은 구명칭과 name으로 저장해놓은 해당 area에 포함된 구의 개수를 넘겨줌 
			dataType : "json", // html / xml / json / jsonp / text
			success : function (data) {
				//데이터가 있을때
			if(data.toString()==""){
					$("#mainlist").empty();
					$("#mainlist").append("해당 지역의 공연정보가 없습니다.");
					
				
			}else{
				$("#mainlist").empty();//click할때마다 li 리셋
				for(var i=0;i<data.length;i++){	 //li의 값에 받아온 data(jsonArray)값 내의 각 namevalue에 접근하여 값 추출
					 $("#mainlist").append("<a href='showList.do?shno="+data[i].shno+"'><li> ⊙"+data[i].name+"</li></a>");
					 $("#mainlist").append("<li>"+data[i].date+" / "+data[i].time+"</li>");
			    }

			  }
			}, // success end
			error : function() {
				alert("에러발생");
			} // error end
		}); // ajax end
	});
});
function streamingFunc(){
	 window.open("streamingWindow.do",'streamingWindow','height=580px, width=1000px');

}