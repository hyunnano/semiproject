package join;

public class JoinDTO {
	
	private String j_num; //가입게시글번호
	private String id; //아이디
	private String j_title; //가입게시글제목
	private String j_content; //가입게시글내용
	private java.sql.Date j_date; //가입게시글날짜
	private String grade; //등급(권한)
	private String j_visitcount; //가입게시글조회수
	private String name; //이름
	
	public String getJ_num() {
		return j_num;
	}
	public void setJ_num(String j_num) {
		this.j_num = j_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJ_title() {
		return j_title;
	}
	public void setJ_title(String j_title) {
		this.j_title = j_title;
	}
	public String getJ_content() {
		return j_content;
	}
	public void setJ_content(String j_content) {
		this.j_content = j_content;
	}
	public java.sql.Date getJ_date() {
		return j_date;
	}
	public void setJ_date(java.sql.Date j_date) {
		this.j_date = j_date;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getJ_visitcount() {
		return j_visitcount;
	}
	public void setJ_visitcount(String j_visitcount) {
		this.j_visitcount = j_visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
