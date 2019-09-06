<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email,pwd);
	
	dto = dao.isMember(dto);
	if(dto != null){
		// 세션 기본 시간은 30분 (web.xml에서 확인가능)
		// 프로그램에서 세션 시간을 변경할 수 있음.
		session.setMaxInactiveInterval(30);
		session.setAttribute("member", dto);
%>
	<script>
		alert('성공');
		location.href="login.jsp";
	</script>
<% } else {%>
	<script>
		alert('로그인 정보가 잘못되었습니다.');
		history.back(-1);
	</script>
<% }%>