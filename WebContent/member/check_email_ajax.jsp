<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	MemberDao dao = MemberDao.getInstance();
	boolean isExisted = dao.isCheck(id);
	
	if(isExisted){%>
		{"result" : "ok"}
	<%} else {%>
		{"result" : "fail"}
	<%}%>