/**
 * 
 */
$(function(){

 	var img = new Image(); 
	img.src='http://192.168.1.70:8080/?action=stream'; 
	 
	img.onload=function(){
		alert('파일있음');
		var x = document.createElement("IMG");
		x.setAttribute("src", "http://192.168.1.70:8080/?action=stream");
		document.getElementById("StreamingDiv").appendChild(x);			 
	} 
	
	img.onerror=function(){alert('파일없음');}	 

	setInterval(setting, 1000);
	function setting(){
		img.src='http://192.168.1.70:8080/?action=stream';
		img.onload=function(){
			console.log("gggg")
		}
		img.onerror=function(){
			alert("스트리밍종료");
			opener.location.href="main.do";
			window.close();
		}
	}
});
