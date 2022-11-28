package mypage;

import db.DBConnPool;
import member.MemberDTO;

public class MypageDAO extends DBConnPool {

	public MemberDTO selectView(String id) {

		MemberDTO dto = new MemberDTO();

		String query = " SELECT * " + " FROM member " + " WHERE id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setMail(rs.getString("mail"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setM_loc(rs.getString("m_loc"));
				dto.setGrade(rs.getString("grade"));
				dto.setT_name(rs.getString("t_name"));
			}

		} catch (Exception e) {
			System.out.println("회원정보 확인 중 예외 발생");
			e.printStackTrace();
		}

		return dto;
	}

	public int updatePassEdit(MemberDTO dto) {
		int result = 0;

		try {

			String query = "UPDATE mem SET " + " pass=? " + " WHERE id=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getId());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("비밀번호 변경 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}
	
	public int updatePhoneEdit(MemberDTO dto) {
		
		int result = 0;

		try {

			String query = "UPDATE mem SET " + " phone=? " + " WHERE id=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPhone());
			psmt.setString(2, dto.getId());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("전화번호 변경 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public int deleteUser(MemberDTO dto) {
		
		int result = 0;
		
		try {

			String query = "DELETE FROM mem WHERE id=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("회원탈퇴 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

}
