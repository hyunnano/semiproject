<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="mypage.MypageDAO"%>
<%@ page import="member.MemberDTO"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>전화번호 변경</title>
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
	<form name="i" method="post" action="phoneprocess.jsp">
		<fieldset>
			<legend>전화번호 변경</legend>
			연락처 변경을 위한<br>전화번호 인증이 필요합니다.
			<ul>
				<br>
				<li><label for="phone">전화번호</label> <input type="tel"
					id="phone" required placeholder="-빼고 입력해주세요"></li>
				<br>
				<button type="submit">인증번호 받기</button>
				<br><br>
				<li><label for="num">인증번호</label> <input type="text" id="num"
					required placeholder="인증번호를 입력해주세요"></li>
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