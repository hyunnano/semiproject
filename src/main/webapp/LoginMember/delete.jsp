<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>

<body>
	<form name="i" method="post" action="deleteprocess.jsp" >
		<fieldset>
			<h1>탈퇴안내</h1>
			회원 탈퇴 시 안내 사항을 꼭 확인해주세요. <br>
			<ul>
				<li>탈퇴 완료 후 사용하고 계신 아이디는 재사용 및 복구가 불가합니다.</li>
				<br>
				<li>탈퇴 후 회원정보 및 개인서비스 이용기록은 모두 삭제됩니다.</li>
				<br>
				<li>탈퇴 후 개인정보를 복구할 수 없습니다.</li>
			</ul>
			<label><input id="check" type="checkbox" required><b>위 안내사항을 모두 확인 하였으며, 이에 동의 합니다.</b></label>
			<br><br>
			<button type="submit">확인</button>
			<button type="button" onclick="location.href='mypage.jsp'">취소</button>
		</fieldset>
	</form>
</body>
</html>