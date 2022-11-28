<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function id_search() { 
	 	var frm = document.idfindscreen;

	 	if (frm.uname.value.length < 1) {
		  alert("이름을 입력해주세요");
		  return;
		 }

		 if (frm.uphone.value.length != 13) {
			  alert("핸드폰번호를 정확하게 입력해주세요");
			  return;
		 }
		 <form class="form" action="LogForm.jsp" method="post" name="findinfo">
	 </script>
</body>
</html>