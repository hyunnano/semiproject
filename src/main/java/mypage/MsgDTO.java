package mypage;

public class MsgDTO {
	
	private String id; //아이디
	private String msg_num; //쪽지번호
	private String msg_date; //쪽지날짜
	private String msg_content; //쪽지내용
	private String name; //이름
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(String msg_num) {
		this.msg_num = msg_num;
	}
	public String getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
