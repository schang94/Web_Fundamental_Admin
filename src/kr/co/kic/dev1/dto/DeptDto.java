package kr.co.kic.dev1.dto;

public class DeptDto {
	private int num;
	private String name;
	private String loc;
	
	public DeptDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DeptDto(int num, String name, String loc) {
		super();
		this.num = num;
		this.name = name;
		this.loc = loc;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
}