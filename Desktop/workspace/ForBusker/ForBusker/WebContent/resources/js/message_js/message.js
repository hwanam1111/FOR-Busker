$(function(){

	$("#popup").hide();

	$(".messageView").each(function(){
		$("#inputText").val('');
		$(this).click(function(){
		$('[name="smsContent"]').val("");
		var start = $(this);
		var smsNo = $(this).attr("name");
		var smsType = start.next();			//글타입	smsType
		var loginEmail = smsType.next();		//로그인 아이디 session id 
		var sendEmail = loginEmail.next();		//보내는 사람 smsSendEmail
		var receiveEmail = sendEmail.next();	//받는 사람	  smsReceiveEmail
		
		$("#smsNo").val(smsNo);							// 글번호
		$("#smsType").val(smsType.val());				// 글타입
		$("#smsReceiveEmail").val(sendEmail.val());		// 보내는 사람
		$("#smsSendEmail").val(receiveEmail.val())		// 로그인 아이디
		$("#smsTo").val(receiveEmail.val());			// 보내는 사람 -고정-

		// ajax 
		// smsNo,smsType,smsReceiveEmail,smsSendEmail를 보내서 성공한 값을 화면에 출력
		$.ajax({
			url : 'chatView.do',
			type : 'post',
			data : ({
				smsNo :	smsNo,
				smsType : smsType.val(),
				smsReceiveEmail : receiveEmail.val(),
				smsSendEmail : sendEmail.val()
			}),
			dataType : "text", // html / xml / json / jsonp / text
			success : function(data) {
				$("#chatLog").empty();
				var message = eval("("+data+")");
				var year = ""
				for(var i=0; i<message.length; i++){	
					var time = message[i].smsSendTime.split(" ");
					//날짜 찍기
					if(time[0]!=year){
						$("#chatLog").append("<tr><td align='center'><div class='day'>─────── "+ time[0]+" ───────<div></td></tr>")
						year = time[0];
					}
					//보낸 사람 표시
					if(!(message[i].smsSendEmail==loginEmail.val())){
					$("#chatLog").append(
			"<tr><td><label class='youText'>"+message[i].smsSendEmail +"  " + time[2]+"</label><div class='talk-yoububble tri-right left-in'><div class='talktext'>" + message[i].smsContent +"</div></div></td></tr>");								
					}else{
						//받는 사람 표시
					$("#chatLog").append("<tr><td align='right'><div class='talk-mybubble tri-right right-in'><div class='talktext'>" + message[i].smsContent +"</div></div></td></tr>");	
					}
				
				$("#chatDiv").scrollTop($("#chatDiv")[0].scrollHeight);
				}
			},
			error : function(data) {
				console.log("에러발생");
			}
		});
		
		event.preventDefault();
		$("#popup").bPopup({
			//창이 닫힐때 화면 다시 불러오기
			onClose: function() { 
				 location.href="message.do?email="+$("#loginsess").val();
			 }
		});
		
		});
	});

	
	// 메시지 보내기 눌렀을때 Submit
	$("#chatSubmit").click(function() {
		if(!($("#inputText").val()=="")){			
			MessageInsert();
		}
	});
	
	// 메시지 보낼 때 Enter
	$("#inputText").keypress(function(event){
	      if(event.which == 13 &&!($("#inputText").val()=='')){
	    	  if($("#inputText").val()=="\n"){
	    		  $("#inputText").val('');
	    		  return false;
	    	  }	    	  
	    	  MessageInsert();
	      }
	});
	
	// 글 삭제
	$(".deleteMessage").each(function(){
		$(this).click(function(){
			var start = $(this).parent().children().eq(0);
			var smsNo = start.attr("name");
			var smsType = start.next();			//글타입	smsType
			var loginEmail = smsType.next();		//로그인 아이디 session id 
			var sendEmail = loginEmail.next();		//보내는 사람 smsSendEmail
			var receiveEmail = sendEmail.next();	//받는 사람	  smsReceiveEmail
			
			var result = confirm("대화를 삭제하시겠습니까?");
			
			if(result){
			// smsNo,smsType,smsReceiveEmail,smsSendEmail를 보내서 성공하면 화면 다시 불러오기
				$.ajax({
					url : 'deleteMessage.do',
					type : 'post',
					data : ({
						smsNo :	smsNo,
						smsType : smsType.val(),
						smsReceiveEmail : receiveEmail.val(),
						smsSendEmail : sendEmail.val()
					}),
					dataType : "text", // html / xml / json / jsonp / text
					success : function(data) {
						location.href="message.do?email="+$("#loginsess").val();
					},
					error : function(data) {
						console.log("에러발생");
					}
				});
			}else{
				console.log("실패");
			}
		});
	});

	
	function MessageInsert(){
		
		var loginEmail = $("#loginsess");
		
		$('[name="smsContent"]').empty();
		$.ajax({
			url : 'sponserMessage.do',
			type : 'post',
			data : ({
				smsNo : $("#smsNo").val(),					// 글번호
				smsContent : $('[name="smsContent"]').val(),// 글 내용
				smsType : $("#smsType").val(),				// 글타입
				smsSendEmail : $("#smsSendEmail").val(),	// 받는 사람 
				smsReceiveEmail : $("#smsReceiveEmail").val(),	// 보내는 사람
				smsTo : $("#smsTo").val(),					// 보내는 사람 -고정-
			}),
			dataType : "text", // html / xml / json / jsonp / text
			success : function(data) {
				$("#chatLog").empty();
				var message = eval("("+data+")");
				var year = ""
				for(var i=0; i<message.length; i++){	
					var time = message[i].smsSendTime.split(" ");
					//날짜 찍기
					if(time[0]!=year){
						$("#chatLog").append("<tr><td align='center'><div class='day'>─────── "+ time[0]+" ───────<div></td></tr>")
						year = time[0];
					}
					//보낸 사람 표시
					if(!(message[i].smsSendEmail==loginEmail.val())){
					$("#chatLog").append(
					"<tr><td><label class='youText'>"+message[i].smsSendEmail +"  " + time[2]+"</label><div class='talk-yoububble tri-right left-in'><div class='talktext'>" + message[i].smsContent +"</div></div></td></tr>");								
					}else{
						//받는 사람 표시
					$("#chatLog").append("<tr><td align='right'><div class='talk-mybubble tri-right right-in'><div class='talktext'>" + message[i].smsContent +"</div></div></td></tr>");	
					}
				}
				$("#inputText").val('');
				$("#chatDiv").scrollTop($("#chatDiv")[0].scrollHeight);
				//location.href="message.do?email="+$("#loginsess").val();
			},
			error : function(data) {
				console.log("에러발생");
			}
		});
		}
	

	function popupOpen(){
		var popUrl = "Pop.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}


});

