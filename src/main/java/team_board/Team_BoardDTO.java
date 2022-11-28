package team_board;

public class Team_BoardDTO {
	
	private String tb_num; //가입게시글번호
	private String id; //아이디
	private String tb_title; //가입게시글제목
	private String tb_content; //가입게시글내용
	private java.sql.Date tb_date; //가입게시글날짜
	private String grade; //등급(권한)
	private String tb_visitcount; //가입게시글조회수
	private String name; //이름
	private String t_num;
	public String getT_num() {
		return t_num;
	}
	public void setT_num(String t_num) {
		this.t_num = t_num;
	}
	public String getTb_num() {
		return tb_num;
	}
	public void setTb_num(String tb_num) {
		this.tb_num = tb_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getTb_content() {
		return tb_content;
	}
	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}
	public java.sql.Date getTb_date() {
		return tb_date;
	}
	public void setTb_date(java.sql.Date tb_date) {
		this.tb_date = tb_date;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTb_visitcount() {
		return tb_visitcount;
	}
	public void setTb_visitcount(String tb_visitcount) {
		this.tb_visitcount = tb_visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	

}
