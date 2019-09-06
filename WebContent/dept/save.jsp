<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
 	String name = request.getParameter("name");
 	String loc = request.getParameter("loc");
 	
 	DeptDao dao = DeptDao.getInstance();
 	DeptDto dto = new DeptDto(num,name,loc);
 	boolean isSuccess = dao.insert(dto);

 	if(isSuccess){
%>
	<script>
	 	alert("성공");
	 	location.href = "list.jsp";
	</script>
	<%}else { %>
	<script>
		alert("실패");
	 	history.back(-1);
	</script>
	<%} %>

