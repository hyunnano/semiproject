package notice;

import java.util.List;
import java.util.Map;
import java.util.Vector;


import db.DBConnPool;

public class NoticeDAO extends DBConnPool{

	
	
	//검색 조건에 맞는 게시물의 개수를 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0; //결과를 여기에 담아준다.
		
		//게시물 수를 얻어오는 쿼리문을 작성한다.
		String query = "SELECT COUNT(*) FROM notice";
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
		public List<NoticeDTO> selectList(Map<String, Object> map) {
			//게시물 목록의 결과를 담을 변수
			List<NoticeDTO> bls = new Vector<NoticeDTO>();
			String query = "SELECT * FROM notice "; 
			
			if (map.get("searchWord") != null) {	             
				query += " WHERE " + map.get("searchField") + " "
	                    + " LIKE '%" + map.get("searchWord") + "%' ";
	        }
	       query += " ORDER BY n_num DESC ";
		
	        try {
	           stmt = con.createStatement(); // 쿼리문 생성
	           rs = stmt.executeQuery(query); // 쿼리 실행
	           
	            while (rs.next()) {
	                //결과를 순화하면서 한 행의 내용을 DTO에 저장
	                NoticeDTO dto = new NoticeDTO();
	                
	                dto.setN_num(rs.getString("n_num")); // 일련번호
	                dto.setN_title(rs.getString("n_title")); // 제목
	                dto.setN_content(rs.getString("n_content")); // 내용
	                dto.setN_date(rs.getDate("n_date")); // 작성일
	                dto.setId(rs.getString("id")); // 작성자 아이디
	                dto.setN_visitcount(rs.getString("n_visitcount")); // 조회수
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
	public List<NoticeDTO> selectListPage(Map<String, Object> map) {
		//게시물 목록의 결과를 담을 변수
		List<NoticeDTO> bls = new Vector<NoticeDTO>();
       
		String query = " SELECT * FROM ( "
		          + "   SELECT Tb.*, ROWNUM rNum FROM ( "
		          + "      SELECT * FROM notice ";
		
		if (map.get("searchWord") != null) {
             query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }

		query += "       ORDER BY n_num DESC "
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
                NoticeDTO dto = new NoticeDTO();
                dto.setN_num(rs.getString("n_num")); // 일련번호
                dto.setN_title(rs.getString("n_title")); // 제목
                dto.setN_content(rs.getString("n_content")); // 내용
                dto.setN_date(rs.getDate("n_date")); // 작성일
                dto.setId(rs.getString("id")); // 작성자 아이디
                dto.setN_visitcount(rs.getString("n_visitcount")); // 조회수
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
	
	
	
	public int insertWrite(NoticeDTO dto) {
		int result = 0;
		
		try {
			//Insert 쿼리문 작성
			String query = "INSERT INTO notice "
					+ " (n_num, id, n_title, n_content, n_date, n_visitcount, name, grade) "
					+ "	VALUES "
					+ " (SEQ_notice_NUM.nextval, ?, ?, ?, sysdate, 0, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getN_title());
			psmt.setString(3, dto.getN_content());
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
    public NoticeDTO selectView(String num) {
    	NoticeDTO dto = new NoticeDTO();
        
        String query = "SELECT B.*, M.name "
                + " FROM member M INNER JOIN notice B "
                + " ON M.id=B.id "
                + " WHERE n_num=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();
            // 결과 처리
            if (rs.next()) {
                dto.setN_num(rs.getString("n_num"));
                dto.setN_title(rs.getString("n_title"));
                dto.setN_content(rs.getString("n_content"));
                dto.setN_date(rs.getDate("n_date"));
                dto.setId(rs.getString("id"));
                dto.setN_visitcount(rs.getString("n_visitcount"));
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
        String query = "UPDATE notice SET "
                     + " n_visitcount = n_visitcount+1 "
                     + " WHERE n_num=?";
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
    
    
    
    public int updateEdit(NoticeDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "UPDATE notice SET "
                + " n_title=?, n_content=? "
                + " WHERE n_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getN_title()); 
            psmt.setString(2, dto.getN_content()); 
            psmt.setString(3, dto.getN_num());
            // 쿼리문 실행
            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생"); 
            e.printStackTrace();
        }
        return result; // 결과 반환
    }
    
    
    
    public int deletePost(NoticeDTO dto) {
        int result = 0;
        try {
            // 쿼리문 템플릿
            String query = "DELETE FROM notice WHERE n_num=?";
            // 쿼리문 완성
            psmt = con.prepareStatement(query); 
            psmt.setString(1, dto.getN_num());
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
