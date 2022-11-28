<%@ page import="team.TeamDAO"%>
<%@ page import="team.TeamDTO"%>
<%@ page import="schedule.ScheduleDAO"%>
<%@ page import="schedule.ScheduleDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//String id= session.getAttribute("id").toString();   //세션정보 가져오기 
//String grade = session.getAttribute("grade").toString();
//String t_name = session.getAttribute("t_num").toString(); 

ScheduleDAO dao = new ScheduleDAO();
ScheduleDTO dto = new ScheduleDTO();

dao.CalendarView(dto.getT_num()); //  달력형식에 넣어줄 날짜와 구장 위치 받아오기 

String s_date = dto.getS_date();
//만약 DB에 저장된 스케줄 날짜와 현재 달이 같다면 스케줄 다 보여주기.
dao.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>경기 일정 메인</title>

<link rel="stylesheet" href="css/schedule.css">
<script type="text/javascript" src="js/window.js"></script>
<body>
<jsp:include page ="header.jsp"/>
<jsp:include page ="menubar.jsp"/>

	
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


		<div id="container">
			<div class="title">
				<a href="Schedule.jsp?year=<%=year%>&month=<%=month - 1%>"><i class="bi bi-caret-left"></i></a> 
					<label> <%=year%>. <%=month%></label> 
				<a href="Schedule.jsp?year=<%=year%>&month=<%=month + 1%>"><i class="bi bi-caret-right"></i></a>
				<button onclick="open()">등 록</button>
			</div>

			<div class="calendar">
				<table>
					<thead>
						<tr>
							<th>SUN</th>
							<th>MON</th>
							<th>TUE</th>
							<th>WED</th>
							<th>THU</th>
							<th>FRI</th>
							<th>SAT</th>
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

				out.print("<td valign=top class='" + cls + "'>" + i +"</td>");
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

	  <div class="focus">
       <a href="Schedule.jsp"> 오늘 날짜로</a>

      </div> 

			</div>

		</div>

	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
