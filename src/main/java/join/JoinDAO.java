package join;

import java.util.List;
import java.util.Map;
import java.util.Vector;


import db.DBConnPool;

public class JoinDAO extends DBConnPool{
	
	
	//db연결해주는 작업
	
	
	
	
	//검색 조건에 맞는 게시물의 개수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; //결과를 여기에 담아준다.
		
		//게시물 수를 얻어오는 쿼리문을 작성한다.
		String query = "SELECT COUNT(*) FROM Join";
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
		public List<JoinDTO> selectList(Map<String, Object> map) {
			//게시물 목록의 결과를 담을 변수
			List<JoinDTO> bls = new Vector<JoinDTO>();
			String query = "SELECT * FROM Join "; 
			
			if (map.get("searchWord") != null) {	             
				query += " WHERE " + map.get("searchField") + " "
	                    + " LIKE '%" + map.get("searchWord") + "%' ";
	        }
	       query += " ORDER BY j_num DESC ";
		
	        try {
	           stmt = con.createStatement(); // 쿼리문 생성
	           rs = stmt.executeQuery(query); // 쿼리 실행
	           
	            while (rs.next()) {
	                //결과를 순화하면서 한 행의 내용을 DTO에 저장
	                JoinDTO dto = new JoinDTO();
	                
	                dto.setJ_num(rs.getString("j_num")); // 일련번호
	                dto.setJ_title(rs.getString("j_title")); // 제목
	                dto.setJ_content(rs.getString("j_content")); // 내용
	                dto.setJ_date(rs.getDate("j_date")); // 작성일
	                dto.setId(rs.getString("id")); // 작성자 아이디
	                dto.setJ_visitcount(rs.getString("j_visitcount")); // 조회수
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
	public List<JoinDTO> selectListPage(Map<String, Object> map) {
		//게시물 목록의 결과를 담을 변수
		List<JoinDTO> bls = new Vector<JoinDTO>();
       
		String query = " SELECT * FROM ( "
		          + "   SELECT Tb.*, ROWNUM rNum FROM ( "
		          + "      SELECT * FROM join ";
		
		if (map.get("searchWord") != null) {
             query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }

		query += "       ORDER BY j_num DESC "
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
                JoinDTO dto = new JoinDTO();
                dto.setJ_num(rs.getString("j_num")); // 일련번호
                dto.setJ_title(rs.getString("j_title")); // 제목
                dto.setJ_content(rs.getString("j_content")); // 내용
                dto.setJ_date(rs.getDate("j_date")); // 작성일
                dto.setId(rs.getString("id")); // 작성자 아이디
                dto.setJ_visitcount(rs.getString("j_visitcount")); // 조회수
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
	
	
	
	public int insertWrite(JoinDTO dto) {
		int result = 0;
		
		try {
			//Insert 쿼리문 작성
			String query = "INSERT INTO JOIN "
					+ " (j_num, id, j_title, j_content, j_date, j_visitcount, name, grade) "
					+ "	VALUES "
					+ " (SEQ_JOIN_NUM.nextval, ?, ?, ?, sysdate, 0, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getJ_title());
			psmt.setString(3, dto.getJ_content());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getGrade());
			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시글 입력중 오류 발생");
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return result;
	}
	
	
	
	// 지정한 게시물을 찾아 내용을 반환합니다.
    public JoinDTO selectView(String num) {
    	JoinDTO dto = new JoinDTO();
        
        String query = "SELECT B.*, M.name "
                + " FROM member M INNER JOIN join B "
                + " ON M.id=B.id "
                + " WHERE j_num=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();
            // 결과 처리
            if (rs.next()) {
                dto.setJ_num(rs.getString("j_num"));
                dto.setJ_title(rs.getString("j_title"));
                dto.setJ_content(rs.getString("j_content"));
                dto.setJ_date(rs.getDate("j_date"));
                dto.setId(rs.getString("id"));
                dto.setJ_visitcount(rs.getString("j_visitcount"));
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
        String query = "UPDATE join SET "
                     + " j_visitcount = j_visitcount+1 "
                     + " WHERE j_num=?";
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
    
    
    
    public int updateEdit(JoinDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "UPDATE join SET "
                + " j_title=?, j_content=? "
                + " WHERE j_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getJ_title()); 
            psmt.setString(2, dto.getJ_content()); 
            psmt.setString(3, dto.getJ_num());
            // 쿼리문 실행
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생"); 
            e.printStackTrace();
        }
        return result; // 결과 반환
    }
    
    
    
    public int deletePost(JoinDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM join WHERE j_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getJ_num());
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
