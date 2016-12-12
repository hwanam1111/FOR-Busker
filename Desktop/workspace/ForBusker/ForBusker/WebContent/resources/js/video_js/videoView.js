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


