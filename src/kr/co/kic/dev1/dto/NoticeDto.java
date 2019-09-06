package kr.co.kic.dev1.dto;

public class NoticeDto {
	private int num;
	private String writer;
	private String title;
	private String content;
	private String regdate;
	public NoticeDto() {
		super();
	}
	public NoticeDto(int num, String writer, String title, String content, String regdate) {
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public NoticeDto(int num, String writer, String title, String regdate) {
		this(num,writer,title,null,regdate);
	}
	public NoticeDto(String writer, String title, String content) {
		this(0,writer,title,content,null);
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
