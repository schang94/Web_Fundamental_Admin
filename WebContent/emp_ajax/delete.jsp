<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	
	EmpDao dao = EmpDao.getInstance();
 	boolean isSuccess = dao.delete(num);

 	if(isSuccess){
%>
	<script>
	 	alert("성공");
	 	location.href = "list.jsp?page=<%=cPage%>";
	</script>
	<%}else { %>
	<script>
		alert("실패");
	 	history.back(-1);
	</script>
	<%} %>

