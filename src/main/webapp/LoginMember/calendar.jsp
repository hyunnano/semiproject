<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
request.setCharacterEncoding("utf-8");

Calendar cal = Calendar.getInstance();

// 시스템 오늘날짜
int ty = cal.get(Calendar.YEAR);
int tm = cal.get(Calendar.MONTH) + 1;
int td = cal.get(Calendar.DATE);

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;

// 파라미터 받기
String sy = request.getParameter("year");
String sm = request.getParameter("month");

if (sy != null) { // 넘어온 파라미터가 있으면
	year = Integer.parseInt(sy);
}
if (sm != null) {
	month = Integer.parseInt(sm);
}

cal.set(year, month - 1, 1);
year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;

int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="ko">
<head>

<title>팀페이지</title>
<link rel="stylesheet" href="css/calendar.css">
</head>

<body>

	


	<div id="maingrid">
		<!--/*메인친구*/-->
		<div id="menu">
			<!--메뉴친구-->
			<ul>
				<li><a href="#"> 팀원 명단 </a></li>
				<!-- 팀리스크 기본 페이지 이동 -->
				<li><a href="Schedule.jsp"> 경기 일정 </a></li>
				<!-- 일정 메인페이지 이동 -->
				<li><a href="#"> 자유 게시판 </a></li>
				<!-- 팀 자유게시판 기본 목록페이지 이동 -->
			</ul>
		</div>

		<div>
			<div class="title">
				<a href="calendar.jsp?year=<%=year%>&month=<%=month - 1%>">&lt;</a>
				<label><%=year%>. <%=month%></label> <a
					href="calendar.jsp?year=<%=year%>&month=<%=month + 1%>">&gt;</a>
			</div>

			<div class="calendar">

				<table>
					<thead>
						<tr>
							<th>일</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th>토</th>
						</tr>
					</thead>
					<tbody>
	<%
			// 1일 앞 달
			Calendar preCal = (Calendar) cal.clone();
			preCal.add(Calendar.DATE, -(week - 1));
			int preDate = preCal.get(Calendar.DATE);

			out.print("<tr>");
			// 1일 앞 부분
			for (int i = 1; i < week; i++) {
				//out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>" + (preDate++) + "</td>");
			}

			// 1일부터 말일까지 출력
			int lastDay = cal.getActualMaximum(Calendar.DATE);
			String cls;
			for (int i = 1; i <= lastDay; i++) {
				cls = year == ty && month == tm && i == td ? "today" : "";

				out.print("<td class='" + cls + "'>" + i + "</td>");
				if (lastDay != i && (++week) % 7 == 1) {
					out.print("</tr><tr>");
				}
			}

			// 마지막 주 마지막 일자 다음 처리
			int n = 1;
			for (int i = (week - 1) % 7; i < 6; i++) {
				// out.print("<td>&nbsp;</td>");
				out.print("<td class='gray'>" + (n++) + "</td>");
			}
			out.print("</tr>");
			%>
					</tbody>
				</table>

			</div>
			
		
		</div>

	</div>

	<div class="footer">
		<a href="calendar.jsp">오늘날짜로</a>
	</div>


	<jsp:include page="footer.jsp" />




</body>

</html>
