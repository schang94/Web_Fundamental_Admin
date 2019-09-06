package kr.co.kic.dev1.dto;

public class MemberDto {
	private int seq;
	private String id;
	private String email;
	private String name;
	private String password;
	private String phone;
	private String regdate;
	
	public MemberDto() {
		super();
	}
	public MemberDto(int seq, String id, String email, String name, String password, String phone, String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.regdate = regdate;
	}
	
	public MemberDto(String email, String password) {
		this(0,null,email,null,password,null,null);
	}
	public MemberDto(int seq, String id, String email, String name, String phone) {
		this(seq,id,email,name,null,phone,null);
	}
	public MemberDto(String id, String email, String name, String password, String phone) {
		this(0,id,email,name,password,phone,null);
	}
	public MemberDto(int seq, String id, String email, String name, String phone, String regdate) {
		this(seq,id,email,name,null,phone,regdate);
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
}