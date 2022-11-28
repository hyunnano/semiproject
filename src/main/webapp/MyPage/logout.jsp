<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>로그아웃</title>
</head>

<body>
<%
	session.invalidate();
	response.sendRedirect("First.html");
%>
</body>
</html>