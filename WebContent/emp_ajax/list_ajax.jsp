<%@page import="kr.co.kic.dev1.dto.EmpDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.EmpDao"%>
<%@ page language="java" contentType="applicating/json; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	EmpDao dao = EmpDao.getInstance();
	int cPage = Integer.parseInt(request.getParameter("page"));
	int length = Integer.parseInt(request.getParameter("length"));

	int blockLength = 10;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage-1)*length;

	ArrayList<EmpDto> list = dao.select(start,length);
	
	int totalRows = dao.db_count();
	
	totalPage = totalRows%length == 0 ? totalRows/length : totalRows/length +1;
	
	if(totalPage == 0){
		totalPage = 1;
	}
	
	
	int currentBlock = cPage % blockLength == 0 ? cPage/blockLength : cPage/blockLength + 1;
	int totalBlock = totalPage% blockLength == 0 ? totalPage/blockLength : totalPage/blockLength + 1;
	// 1 11 21 .......
	startPage = 1 + (currentBlock - 1)* blockLength;
	// 10 20 30 ......
	endPage = blockLength + (currentBlock - 1) * blockLength;
	
	if(currentBlock == totalBlock){
		endPage = totalPage;
	}
%>
<div class="table-responsive-md">
	<table class="table table-hover">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead>
			<tr class="text-center">
				<th scope="col">직원 번호</th>
				<th scope="col">직원 이름</th>
				<th scope="col">직책</th>
				<th scope="col">사수 번호</th>
				<th scope="col">고용일</th>
				<th scope="col">급여</th>
				<th scope="col">상여금</th>
				<th scope="col">부서 번호</th>
			</tr>
		</thead>
		<tbody id="table_body">
			<%
				if (list.size() != 0) {
					for (int i = 0; i < list.size(); i++) {
						EmpDto dto = list.get(i);
						int num = dto.getNum();
						String name = dto.getName();
						String job = dto.getJob();
						int mgr = dto.getMgr();
						String hiredate = dto.getHiredate();
						int sal = dto.getSal();
						int comm = dto.getComm();
						int d_num = dto.getD_num();
			%>
			<tr>
				<th class="text-center" scope="row"><a
					href="view.jsp?num=<%=num%>&page=<%=cPage %>" id="viewEmp"><%=num%></a></th>
				<td><%=name%></td>
				<td><%=job%></td>
				<td class="text-center"><%=mgr%></td>
				<td><%=hiredate%></td>
				<td class="text-center"><%=sal%></td>
				<td class="text-center"><%=comm%></td>
				<td class="text-center"><%=d_num%></td>
			</tr>

			<%
				}
				} else {
			%>
			<tr>
				<td class="text-center" colspan="4" scope="row">등록된 직원이 없습니다.</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-lg justify-content-center">
			<%
				if (currentBlock != 1) {
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:util.pageLoading('<%=startPage - 1%>','<%=length%>');"
				tabindex="-1">&laquo;</a></li>
			<%
				} else {
			%>
			<li class="page-item disabled"><a class="page-link" href="#"
				tabindex="-1">&laquo;</a></li>
			<%
				}
			%>

			<%
				for (int i = startPage; i <= endPage; i++) {
			%>
			<%
				if (cPage == i) {
			%>
			<li class="page-item active"><a class="page-link"
				href="javascript:void(0);"><%=i%></a></li>
			<%
				} else {
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:util.pageLoading('<%=i%>','<%=length%>');"><%=i%></a></li>
			<%
				}
			%>

			<%
				}
			%>
			<%
				if (currentBlock != totalBlock) {
			%>
			<li class="page-item"><a class="page-link"
				href="javascript:util.pageLoading('<%=endPage + 1%>','<%=length%>');">&raquo;</a>
				<%
					} else {
				%>
			<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
			<%
				}
			%>

		</ul>
	</nav>
	<div class="text-right">
		<a href="write.jsp?page=<%=cPage%>" id="saveEmp" class="btn btn-outline-primary">직원등록</a>
		<a href="" class="btn btn-outline-success">리스트</a>
	</div>
</div>