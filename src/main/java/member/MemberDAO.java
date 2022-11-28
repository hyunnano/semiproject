package member;

import java.sql.SQLException;

import member.*;
import db.DBConnPool;


public class MemberDAO extends DBConnPool {
	public MemberDAO() {} 
	
	public int JoinMember( MemberDTO member) {
		
		 int result = 0;	
		
		 try {
      	   
      	   String query = "INSERT INTO member ( "
      			          + " id , pass , name , mail , phone , gender , m_loc , grade , t_name ) "
      			          + " VALUES ( "
      			          + " ?, ?, ?, ?, ?, ?, ?, ?, ? )";
      	   
      	   psmt = con.prepareStatement(query);
      	   psmt.setString(1, member.getId());
      	   psmt.setString(2, member.getPass());
      	   psmt.setString(3, member.getName());
      	   psmt.setString(4, member.getMail());
      	   psmt.setString(5, member.getPhone());
      	   psmt.setString(6, member.getGender());
      	   psmt.setString(7, member.getM_loc());
      	   psmt.setString(8, member.getGrade());
      	   psmt.setString(9, member.getT_name());
      	 
      	   
      	   result = psmt.executeUpdate(); //동적쿼리 실행 
			
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		} 
		return result;
	}
	
	//아이디 중복체크
	public boolean checkId(String uid) {
		String query = "select * from member where id=? ";
		
		System.out.println(uid);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			rs  = psmt.executeQuery();
			
			if(rs.next()) {
				
				return true;
			}
			
		} catch (Exception e) {
		  e.printStackTrace();
		}
		
		
		
		return false;
	}
	
     public MemberDTO findIdByName(String uname,String uphone) {
		
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where name=? and phone=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, uname);
			psmt.setString(2, uphone);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				
			}
		
			
		}catch (Exception e) {
		e.printStackTrace();	
		}
		return dto;
	}
	public MemberDTO getMemberDTO(String uid,String upass) {
		
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";
		
		try {
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				
			}
		
			
		}catch (Exception e) {
		e.printStackTrace();	
		}
		return dto;
	}
	public String findId(String uname,String uphone) {
		String uid = null;
		
		try {
			String query = "select id from member where name=? and phone=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, uname);
			psmt.setString(2, uphone);
			rs = psmt.executeQuery();
			
			
			if(rs.next()) {
				
				uid = rs.getString("id");
				
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return uid;
	}
	
	 public MemberDTO findPassById(String uid,String uname) {
			
			MemberDTO dto = new MemberDTO();
			String query = "select * from member where id=? and name=?";
			
			try {
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, uid);
				psmt.setString(2, uname);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setName(rs.getString(3));
					
				}
			
				
			}catch (Exception e) {
			e.printStackTrace();	
			}
			return dto;
		}
	
	
	
	
	
	}
