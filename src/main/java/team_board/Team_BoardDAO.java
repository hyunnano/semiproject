package team_board;

import java.util.List;
import java.util.Map;
import java.util.Vector;


import db.DBConnPool;

public class Team_BoardDAO extends DBConnPool{
	
	
	
	
	
	
	//검색 조건에 맞는 게시물의 개수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; //결과를 여기에 담아준다.
		
		//게시물 수를 얻어오는 쿼리문을 작성한다.
		String query = "SELECT COUNT(*) FROM team_board";
		if(map.get("searchWord") !=null) {
			query += "WHERE" + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();//쿼리문을 생성
			rs = stmt.executeQuery(query);//쿼리를 실행
			rs.next();//커서를 첫 번째 행으로 이동한다.
			totalCount = rs.getInt(1);//첫번째 컬럼 값을 가져온다.
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외가 발생");
			// TODO: handle exception
		}
		return totalCount;
	}
	
	
	
	//검색조건에 맞는 게시물 목록을 반환
		public List<Team_BoardDTO> selectList(Map<String, Object> map) {
			//게시물 목록의 결과를 담을 변수
			List<Team_BoardDTO> bls = new Vector<Team_BoardDTO>();
			String query = "SELECT * FROM team_board "; 
			
			if (map.get("searchWord") != null) {	             
				query += " WHERE " + map.get("searchField") + " "
	                    + " LIKE '%" + map.get("searchWord") + "%' ";
	        }
	       query += " ORDER BY tb_num DESC ";
		
	        try {
	           stmt = con.createStatement(); // 쿼리문 생성
	           rs = stmt.executeQuery(query); // 쿼리 실행
	           
	            while (rs.next()) {
	                //결과를 순화하면서 한 행의 내용을 DTO에 저장
	                Team_BoardDTO dto = new Team_BoardDTO();
	                
	                dto.setTb_num(rs.getString("tb_num")); // 일련번호
	                dto.setTb_title(rs.getString("tb_title")); // 제목
	                dto.setTb_content(rs.getString("tb_content")); // 내용
	                dto.setTb_date(rs.getDate("tb_date")); // 작성일
	                dto.setId(rs.getString("id")); // 작성자 아이디
	                dto.setTb_visitcount(rs.getString("tb_visitcount")); // 조회수
	                dto.setName(rs.getString("name"));
	                bls.add(dto); // 결과 목록에 저장
	            }
	        }
	        catch (Exception e) {
	            System.out.println("게시물 조회 중 예외 발생");
	            e.printStackTrace();
	        }
			
			return bls;
		}
	
	
	
	//검색조건에 맞는 게시물 목록을 반환
	public List<Team_BoardDTO> selectListPage(Map<String, Object> map) {
		//게시물 목록의 결과를 담을 변수
		List<Team_BoardDTO> bls = new Vector<Team_BoardDTO>();
       
		String query = " SELECT * FROM ( "
		          + "   SELECT Tb.*, ROWNUM rNum FROM ( "
		          + "      SELECT * FROM team_board ";
		
		if (map.get("searchWord") != null) {
             query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }

		query += "       ORDER BY tb_num DESC "
	    		+"       ) Tb "
	    		+" ) "
	    		+" WHERE rNum BETWEEN ? AND ?";
        
        try {
           
        	psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
			 psmt.setString(2, map.get("end").toString());
			   
			 rs = psmt.executeQuery();
            while (rs.next()) {
                //결과를 순화하면서 한 행의 내용을 DTO에 저장
                Team_BoardDTO dto = new Team_BoardDTO();
                dto.setTb_num(rs.getString("tb_num")); // 일련번호
                dto.setTb_title(rs.getString("tb_title")); // 제목
                dto.setTb_content(rs.getString("tb_content")); // 내용
                dto.setTb_date(rs.getDate("tb_date")); // 작성일
                dto.setId(rs.getString("id")); // 작성자 아이디
                dto.setTb_visitcount(rs.getString("tb_visitcount")); // 조회수
                dto.setName(rs.getString("name"));
                bls.add(dto); // 결과 목록에 저장
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
		
		return bls;
	}
	
	
	
	public int insertWrite(Team_BoardDTO dto) {
		int result = 0;
		
		try {
			//Insert 쿼리문 작성
			String query = "INSERT INTO team_board "
					+ " (tb_num, id, tb_title, tb_content, tb_date, tb_visitcount, name, grade, t_num) " //grade, t_num도  수정해 줘야함
					+ "	VALUES "
					+ " (SEQ_teamboard_NUM.nextval, ?, ?, ?, sysdate, 0, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTb_title());
			psmt.setString(3, dto.getTb_content());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getGrade());//제거 고정값
			psmt.setString(6, dto.getT_num());//제거 고정값
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 입력중 오류 발생");
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return result;
	}
	
	
	
	// 지정한 게시물을 찾아 내용을 반환합니다.
    public Team_BoardDTO selectView(String num) {
    	Team_BoardDTO dto = new Team_BoardDTO();
        
        String query = "SELECT B.*, M.name "
                + " FROM member M INNER JOIN team_board B "
                + " ON M.id=B.id "
                + " WHERE tb_num=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();
            // 결과 처리
            if (rs.next()) {
                dto.setTb_num(rs.getString("tb_num"));
                dto.setTb_title(rs.getString("tb_title"));
                dto.setTb_content(rs.getString("tb_content"));
                dto.setTb_date(rs.getDate("tb_date"));
                dto.setId(rs.getString("id"));
                dto.setTb_visitcount(rs.getString("tb_visitcount"));
                dto.setName(rs.getString("name"));
            }
        }
        catch (Exception e) {
            System.out.println("게시물 보기 오류");
            e.printStackTrace();
        }
        return dto;
    }

    
    // 지정한 게시물의 조회수 증가
    public void updateVisitCount(String num) { 
        // 쿼리문 준비
        String query = "UPDATE team_board SET "
                     + " tb_visitcount = tb_visitcount+1 "
                     + " WHERE tb_num=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num); 
            psmt.executeQuery();
        }
        catch (Exception e) {
            System.out.println("게시물 조회수 오류");
            e.printStackTrace();
        }
    }
    
    
    
    public int updateEdit(Team_BoardDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "UPDATE team_board SET "
                + " tb_title=?, tb_content=? "
                + " WHERE tb_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getTb_title()); 
            psmt.setString(2, dto.getTb_content()); 
            psmt.setString(3, dto.getTb_num());//수정해야함
            // 쿼리문 실행
            result = psmt.executeUpdate();
            System.out.println(dto.toString());
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생"); 
            e.printStackTrace();
        }
        return result; // 결과 반환
    }
    
    
    
    public int deletePost(Team_BoardDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM team_board WHERE tb_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getTb_num());
            // 쿼리문 실행
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생"); 
            e.printStackTrace();
        }
        return result; // 결과 반환 
    }
    
    
    
}
