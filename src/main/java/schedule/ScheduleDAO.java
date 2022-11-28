package schedule;
import team.TeamDTO;
import member.MemberDTO;
import schedule.ScheduleDTO;
import db.DBConnPool;
import java.util.Calendar;

public class ScheduleDAO extends DBConnPool {
	
	MemberDTO mdto= new MemberDTO();
	TeamDTO tdto= new TeamDTO();
	ScheduleDTO dto= new ScheduleDTO();
	
// 일정 뷰 (ad,tl,ts) 달력 형식 
	public ScheduleDTO CalendarView(String t_num) {
				
		String query = "select s_date, ground from schedule "
						+" where  t_num= ?"; 
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1,dto.getT_num());			  
			rs= psmt.executeQuery();
			
			//결과 처리 
			
			if(rs.next()) {
				
				dto.setS_date(rs.getString("s_date"));
				dto.setGround(rs.getString("Ground"));
				//댓글보여주기는 나중에 추가
			}
		} catch (Exception e) {
			System.out.println("캘린더 보기 오류 ");
			e.printStackTrace();
		}
		
		return dto;
		
	}
// 일정 월별로 검색 (ad,tl, ts)
	
// 일정 자세히 보기 (ad,tl, ts)
	public ScheduleDTO selectView(String s_num) {		
		
		String query = "select * from schedule "
						+" where  t_num= ? and s_num= ?";  //댓글 추가할때 쿼리 수정.
		try {
			psmt= con.prepareStatement(query);
			psmt.setString(1,dto.getT_num());
			psmt.setString(2, s_num);
			rs= psmt.executeQuery();
			
			//결과 처리 
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setS_num(rs.getString("s_num"));
				dto.setT_num(rs.getString("t_num"));
				dto.setGrade(rs.getString("grade"));
				dto.setS_date(rs.getString("s_date"));
				dto.setGround(rs.getString("Ground"));
				dto.setP_type(rs.getString("p_type"));
				dto.setVote(rs.getString("vote"));
				dto.setName(rs.getString("name"));
				//댓글보여주기는 나중에 추가
			}
		} catch (Exception e) {
			System.out.println("상세보기 오류 ");
			e.printStackTrace();
		}
		
		return dto;
		
	}
// 투표결과 보기(ad,tl, ts)
	
// 일정 등록 (tl)
	public int insertSchedule(ScheduleDTO dto) {
		int result= 0;
		try {
			String query = "insert into Schedule ( " + " s_num, s_date, ground, p_type, grade, vote, id, name, t_num)"
					+ " VALUES ( " + "seq_schedule_num.nextval, ?, ?, ?, ?, ?, ?,?,?)";
		
		psmt= con.prepareStatement(query);
		psmt.setString(1, dto.getS_date());
		psmt.setString(2, dto.getGround());
		psmt.setString(3, dto.getP_type());
		psmt.setString(4, mdto.getGrade());
		psmt.setString(5, dto.getVote());
		psmt.setString(6, mdto.getId());
		psmt.setString(7, mdto.getName());
		psmt.setString(8, tdto.getT_num());
		
		result= psmt.executeUpdate();
		
		} catch (Exception e) {
			System.out.println("일정 등록 실패");
			e.printStackTrace();
		}
		
		return result;
		
	}
// 일정 수정 (tl)
	public int EditSchedule(ScheduleDTO dto) {
		int result= 0;
		try {
			String query = " update Schedule set "
					+"s_date=?, ground=?, p_type=? "
					+"where s_num?";
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getS_date());
			psmt.setString(2, dto.getGround());
			psmt.setString(3, dto.getP_type());
			psmt.setString(4, dto.getS_num());
			result= psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("일정 수정 등록 오류");
			e.printStackTrace();
		}
				
		return result;
		
	}
// 일정 삭제 (tl)
	public int deleteSchedule(ScheduleDTO dto) {
		int result=0;
		
		try {
			String query = "delete from Schedule where s_num=?";
			psmt= con.prepareStatement(query);
			psmt.setString(1, dto.getS_num());
			result= psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("일정 삭제 실패");
			e.printStackTrace();
		}		
		return result;	
	}
	
// 일정 댓글 등록 (ad,tl, ts)
	
// 일정 댓글 삭제 (ad,tl, ts)
}
