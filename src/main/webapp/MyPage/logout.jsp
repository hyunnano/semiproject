<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>๋ก๊ทธ์์</title>
</head>

<body>
<%
	session.invalidate();
	response.sendRedirect("First.html");
%>
</body>
</html>