<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	
 	String name = request.getParameter("name");
 	String job = request.getParameter("job");
 	int mgr = Integer.parseInt(request.getParameter("mgr"));
 	int sal = Integer.parseInt(request.getParameter("sal"));
	int comm = 0;
 	
 	if(!request.getParameter("comm").equals("")){
 		comm = Integer.parseInt(request.getParameter("comm"));
 	}
 	int d_num = Integer.parseInt(request.getParameter("d_num"));
 	
 	EmpDao dao = EmpDao.getInstance();
 	EmpDto dto = new EmpDto(num,name,job,mgr,sal,comm,d_num);

 	boolean isSuccess = dao.update(dto);

 	if(isSuccess){
%>
	<script>
	 	alert("성공");
	 	location.href = "view.jsp?num=<%=num%>&page=<%=cPage %>";
	</script>
	<%}else { %>
	<script>
		alert("실패");
	 	history.back(-1);
	</script>
	<%} %>

