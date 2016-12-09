function openNav(e) {
    document.getElementById("mySidenav").style.width = "350px";
    document.getElementById("openBtn").style.display="none";
    document.getElementById("closeBtn").style.display="block";
    e.preventDefault();
    e.stopPropagation();
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("closeBtn").style.display="none";
    document.getElementById("openBtn").style.display="block";
}
function clickLike(){
	alert("좋아요!");
	 $('#videoLike').attr( 'src', '<%=projectName %>/resources/images/video_img/thumbs-up32-rollover.png' );
	
}