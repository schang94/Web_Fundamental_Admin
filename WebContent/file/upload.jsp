<%@page import="java.util.Calendar"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<%@ page pageEncoding="UTF-8"%>

<%
	//String name = request.getParameter("name"); => 파일업로드 이렇게 개발 X
	request.setCharacterEncoding("utf-8");
	String path = request.getSession().getServletContext().getRealPath("/upload/files");
	
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH)+1;
	path += "\\"+year+"\\"+month;
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	MultipartRequest multi = null;
	try{
		multi = new MultipartRequest(
				request,
				path, // 업로드 경로
				10*1024*1024, // 업로드 파일 크기
				"utf-8", // 인토딩 타입
				new DefaultFileRenamePolicy() // 파일이름이 중복되었을 때 파일이름 끝에 1,2,3 순으로 변경해주는 클래스
		);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	String name = multi.getParameter("name");
	String fileName = multi.getFilesystemName("file");
	String uploadName = multi.getOriginalFileName("file");
	File f1 = new File(f,fileName);
	long fileSize = f1.length();
%>
name : <%=name %><br>
file system name : <%=fileName %><br>
file system size : <%=fileSize/1024 %>KB<br>
file origin name : <%=uploadName %><br>

