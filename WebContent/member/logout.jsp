<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		HttpSession 객체를 종료하는 3가지 방법
		1. 브라우저를 종료했을 경우
		2. 해당 페이지의 시간이 30분 경과되어 자동으로 세션객체가 삭제되는 경우
		3. invalidate() 메서드를 호출하여 세션객체를 삭제하는 경우
	*/
	session.invalidate();
	response.sendRedirect("/");
%>