package member;

public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String mail;
	private String phone;
	private String gender;
	private String m_loc;
	private String grade="st";
	private String t_name="a";
	public MemberDTO() {
		
	}
    
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getM_loc() {
		return m_loc;
	}

	public void setM_loc(String m_loc) {
		this.m_loc = m_loc;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getT_name() {
		return t_name;
	}



	public void setT_name(String t_name) {
		this.t_name = t_name;
	}




	
}