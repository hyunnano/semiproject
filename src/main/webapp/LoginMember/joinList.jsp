        <%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
    <%@ page import="java.util.List"%>
    <%@ page import="java.util.HashMap"%>
    <%@ page import="java.util.Map"%>
    <%@ page import="join.JoinDAO"%>
    <%@ page import="join.JoinDTO"%>
    <%@ page import="utils.BoardPage" %>
    
    <%
    
    //다른 파트와 연결시 로그인을 했는지 확인하는 부분과 로그인시에만 보이는 부분들을 만들어 주어야함.
    
    //DAO를 생성해 DB에 연결
    JoinDAO dao = new JoinDAO();
    
    //사용자가 입력한 검색 조건을 Map에 저장
    Map<String, Object> param = new HashMap<String, Object>();
    
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    if (searchWord != null) {
         param.put("searchField", searchField);
         param.put("searchWord", searchWord);
    }
    int totalCount = dao.selectCount(param); // 게시물 수 확인
    
    
    /*** 페이지 처리 start ***/
    //전체 페이지 수 계산
    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수
    
    //현재 페이지 확인
    int pageNum = 1;  // 기본값
    String pageTemp = request.getParameter("pageNum");
    if (pageTemp != null && !pageTemp.equals(""))
    pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정
    
    //목록에 출력할 게시물 범위 계산
    int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
    int end = pageNum * pageSize; // 마지막 게시물 번호
    param.put("start", start);
    param.put("end", end);
    /*** 페이지 처리 end ***/
    
    //List<JoinDTO> joinLists = dao.selectList(param); // 게시물 목록 받기
    List<JoinDTO> joinLists = dao.selectListPage(param); //페이징 게시물
    dao.close(); // DB 연결 닫기
    %>
    
    <!-- jsp include로 로그인 확인 체크 -->
    <!DOCTYPE html>
    <html>
    <title>모집게시글 리스트</title>
    <!-- include -->
    <jsp:include page="header.jsp"></jsp:include>
    
    

    <!-- 검색부분 -->
   <h2 style="text-align:center;">모집 게시글</h2>
    <form method="get" style="width:1700px; align:center;">
        <span style="float:right;"><select name="searchField">
            <option value="j_title">제목</option>
            <option value="j_content">내용</option>
        </select> <input type="text" name="searchWord" placeholder="제목or내용 입력" rows="1"
            cols="25" /> <input type="submit" value="검색" />
            </span>
    </form>
    <br>
    <table border="1" width="1500px" style="margin: 5px auto; ">
        <tr>
            <th width="10%" style="padding: 15px">번호(NO.)</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <%
    if(joinLists.isEmpty()){
    %>
        <tr>
            <td colspan="5" align="center">모집게시판에 등록된 게시글이 없습니다.</td>
        </tr>
        <%
    }else{
        //게시물이 있을 때
        int virtualNum = 0; //화면상의 게시물 번호
        int countNum = 0;
        for(JoinDTO dto:joinLists){
            //virtualNum = totalCount--; <!-- 전체 게시물 수에서 시작해 1씩 감소 -->
    virtualNum = totalCount - (((pageNum-1)* pageSize)+ countNum++); //페이징
    %>
    
        <tr align="center">
            <td><%=virtualNum %></td>
            <!--게시물 번호-->
            <td align="left">
                <!--제목(+ 하이퍼링크)--> <a href="joinView.jsp?j_num=<%= dto.getJ_num() %>"><%= dto.getJ_title() %>
            </a>
            </td>
            <td align="center"><%=dto.getId()%></td>
            <!--작성자 아이디-->
            <td align="center"><%=dto.getJ_visitcount()%></td>
            <!--조회수-->
            <td align="center"><%=dto.getJ_date()%></td>
            <!--작성일-->
        </tr>
        <%
    }
       }
    %>
    </table>
    <span style = "display : flex; justify-content :center;"><%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %></span>
    <div style="width:1700px; align:center;">
    <span style="float:right;"><button type="button" onclick="location.href='joinWrite.jsp';"
        style="float: right; margin: 5px">글쓰기</button></span>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>
    </html>