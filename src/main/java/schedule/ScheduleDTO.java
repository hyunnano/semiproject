package schedule;

public class ScheduleDTO {
	
	private String id; //아이디
	private String s_num; //일정번호
	private String t_num; //팀번호
	private String grade; //등급(권한)
	private String s_date; //일정날짜
	private String ground; //일정지역
	private String p_type; //일정경기유형
	private String vote; //일정참가여부
	private String name; //이름
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getT_num() {
		return t_num;
	}
	public void setT_num(String t_num) {
		this.t_num = t_num;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getGround() {
		return ground;
	}
	public void setGround(String ground) {
		this.ground = ground;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getVote() {
		return vote;
	}
	public void setVote(String vote) {
		this.vote = vote;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
