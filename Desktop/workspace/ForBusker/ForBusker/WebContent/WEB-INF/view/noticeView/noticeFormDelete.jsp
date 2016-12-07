<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String projectName = "/ForBusker"; %>
<!DOCTYPE html>
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FOR-Busker</title>
</head>

<body>

<script type="text/javascript">
  alert("${message}");
  if("${state}"=="yes"){
	  location.href="noticeList.do";
  }else{
	  history.back();
  }
</script>

</body>
</html>
