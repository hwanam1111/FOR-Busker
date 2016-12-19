<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:if test="${not empty sessionScope.list }">  
	<div class="float">
		<div id="floatTop">
		<div id="floatdiv">
			<ul>
				<li>최근 본 동영상</li>
				<!--세션에 저장된 리스트 값 가져오기 -->
				<c:forEach items="${sessionScope.list}" var='video' >
					<li><a href="videoLikeSearch.do?videoNo=${video.videoNo}&myId=${sessionScope.login.memEmail}&imgpath=${video.img}">
  						<img src="https://img.youtube.com/vi/${video.img}/hqdefault.jpg"></a>
  				</li>		
				</c:forEach>	
			</ul>
		</div>
		</div>	
	</div>
</c:if>


