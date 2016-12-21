//########################################################
//오른쪽 메뉴 오픈
function openNav() {
    document.getElementById("mySidenav").style.width = "350px";
    document.getElementById("openBtn").style.display="none";
    document.getElementById("closeBtn").style.display="block";
}

//########################################################
//오른쪽 메뉴 클로우즈
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("closeBtn").style.display="none";
    document.getElementById("openBtn").style.display="block";
}
//#########################################################
$(function(){
	var range=3;
	var result=[];
	//댓글 입력 버튼 눌렀을때
	$('#replyRegBtn').click(function(){
		 if(!($("textarea").val()=="")&&!($('#memEmail').val()=="")){         
			 showReply();
	      }else if($('#memEmail').val()==""){
	    	  alert("로그인 후 사용가능 합니다!");
	      }
	});
	//해당 비디오 댓글 달기 댓글 가져오기
	function showReply(){
		var memEmail=$('#memEmail').val();
		var videoNo=$('#videoNo').val();
		var reContent=$('textarea').val();
		$('textarea').val("");
		$.ajax({
			url:"replyReg.do",
			type:"post",
			data:({
				memEmail:memEmail,
				videoNo:videoNo,
				reContent:reContent
			}),
			dataType:"text",
			success:function(param){
				//답변글찍어주기
				var data=eval("("+param+")");
				result=data;
				$('.comments-list').empty();
				for(var i=0;i<range && i<data.length;i++){
					$('.comments-list').append("<div class='media'><p class='pull-right'><small>"+data[i].replDate+"</small></p><div class='media-body'>"                
		                 +"<h6 class='media-heading user_name' style='font-size:13px;'>"+data[i].memEmail+"</h6><h6 style='font-size:20px;'>"+data[i].reContent+"<h6></div><hr/></div>");      
				}
			},
			error:function(param){
				console.log("답변 찍기 에러발생 "+eval("("+param+")"));
			}
				
		});//ajax 끝
	}//showReply()끝
	//더보기 눌렀을때
	$('#more').click(function(){
		console.log("더보기 클릭 :"+range+"/ 결과값 길이"+result.length)
		if(range>=result.length && result.length!=0){
			$(this).empty();
		}else{
		range+=3;
		showReply();
		}
	});
	
});


