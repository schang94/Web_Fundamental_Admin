<%@page import="kr.co.kic.dev1.dto.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<%
	/*
		page = 1 => 1 ~ 10 limit 0,10
		page = 2 => 11 ~ 20 limit 10,10
		page = 3 => 21 ~ 30 limit 20,10
		등차수열 공식 => An = a1 + (n-1)*d
	*/

	String tempPage = request.getParameter("page");
	int cPage =0;
	if(tempPage == null || tempPage.length()==0){
		cPage = 1;
	}

	try{
		cPage = Integer.parseInt(tempPage);
	} catch(NumberFormatException e){
		cPage = 1;
	}
	int length = 3;
	int blockLength = 5;
	int totalPage = 0;
	int startPage = 0;
	int endPage = 0;
	int start = (cPage-1)*length;


	MemberDao dao = MemberDao.getInstance();
	ArrayList<MemberDto> list = dao.select(start,length);
	
	int totalRows = dao.getRows();
	
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
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Member</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">회원</h5>

					<div class="table-responsive-md" id="page_table">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">#</th>
									<th scope="col">이름</th>
									<th scope="col">아이디</th>
									<th scope="col">이메일</th>
									<th scope="col">핸드폰번호</th>
									<th scope="col">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											MemberDto dto = list.get(i);
											int seq = dto.getSeq();
											String name = dto.getName();
											String email = dto.getEmail();
											String id = dto.getId();
											String phone = dto.getPhone();
											String regdate = dto.getRegdate();
								%>
								<tr>
									<th scope="row"><%=seq %></th>
									<td><%=name %></td>
									<td><a href="view.jsp?seq=<%=seq%>&page=<%=cPage %>"><%=id %></a></td>
									<td><%=email %></td>
									<td><%=phone %></td>
									<td><%=regdate %></td>
								</tr>
								<%
									}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="6">회원정보가 없습니다.</td>
								</tr>
									<%
										}
									%>
								
							</tbody>
						</table>
						<%
							/*
								totalRows => 258개
								cPage = 1 : startPage = 1, endPage = 10;
								cPage = 2 : startPage = 1, endPage = 10;
								..
								cPage = 10 : startPage = 1, endPage = 10;
								
								currentBlock = 1 => startPage = 1, endPage = 10;
								
								cPage = 11 : startPage = 11, endPage = 20;
								cPage = 12 : startPage = 11, endPage = 20;
								..
								cPage = 20 : startPage = 11, endPage = 20;
								
								currentBlock = 2 => startPage = 11, endPage = 20;
								
								cPage = 21 : startPage = 21, endPage = 26;
								cPage = 22 : startPage = 21, endPage = 26;
								..
								cPage = 26 : startPage = 21, endPage = 26;
								
								currentBlock = 3 => startPage = 21, endPage = 26;
							*/
							
						%>
						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								<%if(currentBlock != 1) {%>
									<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=startPage-1%>','<%=length%>');" tabindex="-1">&laquo;</a></li>
								<%} else { %>
									<li class="page-item disabled"><a class="page-link"href="#" tabindex="-1">&laquo;</a></li>
								<%} %>
								<% for(int i = startPage ; i <= endPage ; i++) {%>
									<%if(cPage == i) { %>
										<li class="page-item active"><a class="page-link" href="javascript:void(0);"><%=i%></a></li>
									<%} else { %>
										<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=i%>','<%=length%>');"><%=i%></a></li>
									<%} %>
									
								<%} %>
								<%if(currentBlock != totalBlock) {%>
									<li class="page-item"><a class="page-link" href="javascript:util.pageLoading('<%=endPage+1%>','<%=length%>');">&raquo;</a>
								<%} else { %>
									<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
								<%} %>
								
							</ul>
						</nav>

						<div class="text-right">
							<a href="register.jsp?page=<%=cPage %>" class="btn btn-outline-primary">등록</a>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<script>
	const util = { "pageLoading" : function(p,len){
		console.log(p);
		let url = 'http://localhost<%=conPath%>/member/list.jsp?page='+p+'&length='+len;
		history.pushState(null,null,url);
		$.ajax({
			type : 'GET',
			url : 'list_ajax.jsp?page='+p+'&length='+len,
			dataType : 'html',
			error : function(){
				elert("error");
			},
			success : function(html){
				$("#page_table").children().remove();
				$("#page_table").html(html);
			}
		});
	}};
</script>
<%@ include file="../inc/footer.jsp"%>