<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="team.TeamDAO"%>
<%@ page import="team.TeamDTO"%>
<%@ page import= "schedule.ScheduleDTO" %>
<%@ page import= "schedule.ScheduleDAO" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>일정 등록</title>
<style>
#container {
	width: 600px;
	padding: 0 auto;
	margin: 50px auto;
}

h2 {
	margin: 0 auto;
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
	display: inline-block;
}
</style>
</head>
<body>
	<form action="AddScheduleProcess.jsp" method="post">
		<div id="container">
			<fieldset>
				<legend>
					<h2>일정 등록</h2>
				</legend>
				<ul>
					<li><label for="s_date">날 짜</label> <input type="date" name="s_date1"
						id="day" required></li>
					<li><label for="p_time">시 간</label> <input type="time" name="s_date2"
						id="time" required></li>
					<li><label for="ground">장 소</label> <input type="text"
						name="" id="ground" placeholder="구장 검색" required>
						<button>검색</button></li>
					<li><label for="type" name="p_type">경기종류</label> 
					<input type="radio" name="p_type" id="type" value="self" checked><span>자체전</span> 
					<input type="radio" name="p_type" id="type"	value="matching"><span>매칭</span>
					</li>
					<li><label for="vote" name="vote">투표</label> 
					<input type="radio"	name="vote" id="vote" value="1" checked><span>등록</span> 
					<input type="radio" name="vote" id="vote" value="0"> <span>미등록</span>
					</li>
				</ul>
			</fieldset>
			<div class="buttons">
				<button type="submit">등 록</button>
				<button type="reset">취 소</button>
			</div>
		</div>
	</form>
</body>
</html>