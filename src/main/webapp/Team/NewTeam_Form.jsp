<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.TeamDTO"%>
<%@ page import="team.TeamDAO"%>
<%@ page import= "utils.JSFunction" %>
<%@ page import = "javax.swing.JOptionPane" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>새로운 팀 등록하기</title>
<style>
#container {
	width: 600px;
	padding: 0 auto;
	margin: 50px auto;
}

label {
	width: 80px;
	float: left;
	font-weight: bold;
}

ul>li {
	list-style: none;
	margin: 10px;
	line-height: 50px;
}

.buttons {
	width: 100%;
	margin-top: 20px;
	text-align: center;
	justify-content: center;
}
</style>

</head>
<script type="text/javascript" src="js/local.js"></script>   <!-- 지역구 옵션선택 -->
<script type="text/javascript" src="js/check.js" ></script> <!-- 팀 이름 글자수 & 중복 체크 -->
<script type="text/javascript" src="js/disable.js" ></script> <!-- 입력값 받았을때 버튼 활성화 되도록 -->
<body>

	<div id="container">
		<form action="NewTeam_Process.jsp" method="post" name="newTeam">

			<fieldset>


				<ul>
					<li><label for="team_name">팀 이름</label> 
					<input type="text" id="team_name" name="t_name" onkeydown="Disable()" placeholder="문자10자 이내" value='' autofocus required> 
					<input type="button" name="check" onclick="NameCheck()" value="중복확인"> 
					<input type="hidden" name="idDuplication" value="idUncheck" />
					</li>
					
					<li><label for="boundary">활동 지역</label> <select id="loc"
						name="h_area1" onChange="cat1_change(this.value,h_area2)"
						class="h_area1" required>
							<option>-선택-</option>
							<option value='1'>서울</option>
							<option value='2'>부산</option>
							<option value='3'>대구</option>
							<option value='4'>인천</option>
							<option value='5'>광주</option>
							<option value='6'>대전</option>
							<option value='7'>울산</option>
							<option value='8'>강원</option>
							<option value='9'>경기</option>
							<option value='10'>경남</option>
							<option value='11'>경북</option>
							<option value='12'>전남</option>
							<option value='13'>전북</option>
							<option value='14'>제주</option>
							<option value='15'>충남</option>
							<option value='16'>충북</option>
					</select> <select name="h_area2" onChange="cat2_change(this.value)">
							<option>-선택-</option>
					</select></li>
					<li><label for="age">연령대 </label> <select name="t_age"
						id="age" required>
							<option name="t_age" value="">-선택-</option>
							<option name="t_age" value="10">10대</option>
							<option name="t_age" value="20">20대</option>
							<option name="t_age" value="30">30대</option>
							<option name="t_age" value="40">40대</option>
							<option name="t_age" value="50">50대</option>
							<option name="t_age" value="60">60대</option>
							<option name="t_age" value="70">70대</option>
					</select></li>
					<li><label for="type">유형</label> <select name="t_type"
						id="type" required>
							<option name="t_type" value="">-선택-</option>
							<option name="t_type" value="male">남성팀</option>
							<option name="t_type" value="female">여성팀</option>
							<option name="t_type" value="mixed">혼성팀</option>
							<option name="t_type" value="youth">청소년팀</option>
					</select></li>
					<li><label for="level">실력</label> <select name="t_level"
						id="level" required>
							<option name="t_level" value="">-선택-</option>
							<option name="t_level" value="high">상</option>
							<option name="t_level" value="middle">중</option>
							<option name="t_level" value="low">하</option>
					</select></li>
					<li><label for="info">팀 소개글</label> <textarea name="t_info"
							id="info" cols="50" rows="5"
							placeholder="팀에 대한 소개를 간단히 작성해주세요 (문자 200자 내외)"></textarea></li>

				</ul>

			</fieldset>
		
			<div class="buttons" Disable()>
				<button type="submit" onclick="checkValue()">등 록</button>
				<button type="reset" onclick= "window.close()">취 소</button>
			</div>
	</form>
	
	</div>

</body>



</html>
