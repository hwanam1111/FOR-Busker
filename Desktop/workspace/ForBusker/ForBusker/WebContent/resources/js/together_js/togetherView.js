$(function() {
	// 수정 버튼이 눌렸을때
	$('.mdBtn').click(function() {
		var toNum = $(this).children().val();
		console.log("toNo" + toNum);
		$('.ModifyBtn').attr("href", "togetherMod.do?toNo=" + toNum);
		console.log("컨트롤러 넘어감" + toNo);
	});
	// 삭제 버튼이 눌렸을때
	$('.dlBtn').click(function() {
		var returnValue = confirm("정말 삭제하시겠습니까?");
		if (returnValue) {
			// 삭제 확인
			var toNo = $(this).children().val();
			$('.deleteBtn').attr("href", "togetherDel.do?toNo=" + toNo);
			console.log("컨트롤러 넘어감");

		} else {
			// 삭제 취소
		}
	});

	$("#popup").hide();

	// 엔터 키를 눌렀을때 insert
	$("#inputText").keypress(function(event){
	      if(event.which == 13 &&!($("#inputText").val()=='')){
	    	  if($("#inputText").val()=="\n"){
	    		  $("#inputText").val('');
	    		  return false;
	    	  }	    	  
	    	  MessageInsert();
	  		alert("메세지가 전송되었습니다.");
	  		$("#popup").bPopup().close();
	      }
	});
	
	// 메시지 보내기 눌렀을때 Submit
	$("#chatSubmit").click(function() {
		MessageInsert();
		alert("메세지가 전송되었습니다.");
		$("#popup").bPopup().close();
	});

	$('#togetherJoin').click(function() {
		event.preventDefault();
		$("#popup").bPopup();
	});

	function MessageInsert(){	
		$.ajax({
			url : 'sponserMessage.do',
			type : 'post',
			data : ({
				smsContent : $('[name="smsContent"]').val(), // 글 내용
				smsType : $("#smsType").val(), // 글 타입
				smsNo : $("#smsNo").val(), // 글 번호
				smsSendEmail : $("#smsSendEmail").val(), // 보내는 이메일
				smsReceiveEmail : $("#smsReceiveEmail").val(), // 받는 이메일
				smsTo : $("#smsTo").val(), // 보내는 이메일 -고정-
				smsFrom : $("#smsFrom").val()
			// 받는 이메일 -고정-
			}),
			dataType : "text", // html / xml / json / jsonp / text
			success : function(data) {
				$("#popup").bPopup().close();
			},
			error : function(data) {
				alert("에러발생");
			}
		});
	}
	
});