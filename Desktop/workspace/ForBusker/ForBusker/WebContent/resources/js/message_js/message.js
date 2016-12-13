$(function(){

	$("#popup").hide();

	$(".messageView").each(function(){
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
						$("#chatLog").append("<tr><td align='center'> "+ time[0]+"</td></tr>")
						year = time[0];
					}
					//보낸 사람 표시
					if(!(message[i].smsSendEmail==loginEmail.val())){
					$("#chatLog").append("<tr><td>" + message[i].smsSendEmail +"  " 
							+ time[2] + "<br/>" + 
							message[i].smsContent +"</td></tr>");								
					}else{
						//받는 사람 표시
						$("#chatLog").append("<tr><td align='right'>" + message[i].smsContent +"</td></tr>");	
					}
				//	$("#chatDiv").append(message[i].smsNo +"<br>");
				}
			},
			error : function(data) {
				alert("에러발생");
			}
		});
		
		event.preventDefault();
		$("#popup").bPopup();
		});
	});

	// 메시지 보내기 눌렀을때 Submit
	$("#chatSubmit").click(function() {
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
				location.href="message.do?email="+$("#loginsess").val();
			},
			error : function(data) {
				alert("에러발생");
			}
		});
	});
	
	
	$(".deleteMessage").each(function(){
		$(this).click(function(){
//			var smsNo= $(this).attr("name");		//글번호	smsNo
			var start = $(this).parent().children().eq(0);
			var smsNo = start.attr("name");
			var smsType = start.next();			//글타입	smsType
			var loginEmail = smsType.next();		//로그인 아이디 session id 
			var sendEmail = loginEmail.next();		//보내는 사람 smsSendEmail
			var receiveEmail = sendEmail.next();	//받는 사람	  smsReceiveEmail
			
			var result = confirm("대화를 삭제하시겠습니까?");
			
			if(result){
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
						alert("에러발생");
					}
				});
			
			}else{
				alert("실패");
			}
		});

	
	});

	

	function popupOpen(){
		var popUrl = "Pop.jsp";	//팝업창에 출력될 페이지 URL
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}


});

