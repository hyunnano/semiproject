<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
 
    <title>첫 접속화면</title>
 
</head>

<body>

<jsp:include page ="header.jsp"/>
    

    <div><!--영상 or 개인파트-->
        <figure>
            <video src="img/visual.mp4" autoplay muted loop></video>
        </figure> 
    </div>

<jsp:include page ="footer.jsp"/>


</body>

</html>