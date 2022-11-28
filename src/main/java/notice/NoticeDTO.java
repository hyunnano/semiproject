package notice;

public class NoticeDTO {
	
	private String n_num; //가입게시글번호
	private String id; //아이디
	private String n_title; //가입게시글제목
	private String n_content; //가입게시글내용
	private java.sql.Date n_date; //가입게시글날짜
	private String grade; //등급(권한)
	private String n_visitcount; //가입게시글조회수
	private String name; //이름
	public String getN_num() {
		return n_num;
	}
	public void setN_num(String n_num) {
		this.n_num = n_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public java.sql.Date getN_date() {
		return n_date;
	}
	public void setN_date(java.sql.Date n_date) {
		this.n_date = n_date;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getN_visitcount() {
		return n_visitcount;
	}
	public void setN_visitcount(String n_visitcount) {
		this.n_visitcount = n_visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	

}
