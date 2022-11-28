package team;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBConnPool;
import member.MemberDTO;

public class TeamDAO extends DBConnPool{
	
	
	public int createTeam(TeamDTO dto) { // 팀 생성 메소드
		int result = 0;
		try {
			String query = "insert into team ( " + " t_num, t_name, t_age, t_type, t_local, t_level, t_info, id)"
					+ " VALUES ( " + " seq_team_num.nextval, ?, ?, ?, ?, ?, ?,?)";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getT_name());
			psmt.setString(2, dto.getT_age());
			psmt.setString(3, dto.getT_type());
			psmt.setString(4, dto.getT_local());
			psmt.setString(5, dto.getT_level());
			psmt.setString(6, dto.getT_info());
			psmt.setString(7, dto.getId());

			result = psmt.executeUpdate();         // 완료 되면 1

		} catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public int Check(String t_name) {
	 String name;
	 int result=0;
	 try {
		String query= "select t_name from team where t_name=?";
		psmt= con.prepareStatement(query);
		psmt.setString(1, t_name);
		
		rs = psmt.executeQuery();
		
		while(rs.next()) {
			name= rs.getString("t_name");
			if (name.equals(t_name)) {
				result=1;
			 
		}else {
			  result =0;
		}
		break;
		}
	} catch (Exception e) {
		System.out.println("아이디 중복 체크 오류");
		e.printStackTrace();
	}
	 
	 return result;

	 }
	
	public void directTeam(String t_name) {
// 팀개인페이지 생성되고 열리게 
	}
	
	
	public List<TeamDTO> selectTeamList(Map<String,Object> map){
		List<TeamDTO> bbs = new ArrayList<TeamDTO>(); //결과(게시물 목록)을 담을 변수
		
		
		String query = "SELECT * FROM team ";
		if(map.get("searchWord")!=null) {
			query += "WHERE " + map.get("searchField")+ " " + " LIKE '%"
					+ map.get("searchWord") + "%' ";
		}
		query += "ORDER BY t_num DESC ";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			while(rs.next()) {
				TeamDTO dto = new TeamDTO();
				
				dto.setT_num(rs.getString("t_num"));	//일련번호
				dto.setT_name(rs.getString("t_name")); //팀명
				dto.setT_local(rs.getString("t_local"));//팀활동지역
				dto.setT_age(rs.getString("t_age"));//연령대
				dto.setT_type(rs.getString("t_type"));//팀유형
				dto.setT_level(rs.getString("t_level"));//팀레벨
				dto.setT_info(rs.getString("t_info"));//팀레벨
				bbs.add(dto);	//결과 목록에 저장
			}
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return bbs;
	}
	
	public MemberDTO teamMemberList(String t_name){
		MemberDTO dto = new MemberDTO(); 
		
		
		String query = "SELECT M.* "
				+ " FROM member M INNER JOIN team T "
				+ " ON M.t_name=T.t_name "
				+ " WHERE t_name=?";		
		
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, t_name);
			rs = psmt.executeQuery();
			while(rs.next()) {
								
				dto.setId(rs.getString("id"));	//
				dto.setName(rs.getString("name")); //
				dto.setM_loc(rs.getString("m_loc"));
				dto.setPhone(rs.getString("phone"));//
				dto.setGender(rs.getString("gender"));
				dto.setMail(rs.getString("mail"));
				dto.setGrade(rs.getString("grade"));
				
			}
			
		} catch (Exception e) {
			System.out.println("회원 조회 중 예외 발생");
			e.printStackTrace();
		}
		
		return dto;
	}
	//팀멤버 추가하기(개인 아이디에 팀이름과 등급 부여)
	public int addTeamMember(MemberDTO dto) {
		int result=0;
		try {
			String query = "update member set "
					+ " t_name=?, grade='ts' where id = ? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getT_name());
			psmt.setString(2, dto.getId());			
			
			result = psmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
		
		
	}
	
	public int deleteTeamMember(MemberDTO dto) {
		int result = 0;
		try {
			String query = "update member set "
					+" t_name=?, grade='s' where id = ? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getT_name());
			psmt.setString(2, dto.getId());
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
		


}
