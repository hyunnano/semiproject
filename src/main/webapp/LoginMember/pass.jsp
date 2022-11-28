<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="mypage.MypageDAO"%>
<%@ page import="member.MemberDTO"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
form {
	margin: 100px
}

ul {
	list-style: none;
}
</style>
</head>

<body>
	<form name="i" method="post" action="passprocess.jsp">
		<fieldset>
			<legend>비밀변호 변경</legend>
			<ul>
				<li><label for="pass">현재 비밀번호</label> <input type="password"
					id="pass" required></li>
				<br>
				<br>
				<li><label for="pass">새 비밀번호</label> <input type="password"
					id="pass" required></li>
				<br>
				<li><label for="pass">비밀번호 확인</label> <input type="password"
					id="pass" required></li>
				<br>
				<li>
					<button type="submit">변경</button>
					<button type="button" onclick="window.close();">취소</button>
				</li>
			</ul>
		</fieldset>
	</form>
</body>
</html>