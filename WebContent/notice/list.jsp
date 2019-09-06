<%@page import="kr.co.kic.dev1.dto.NoticeDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.kic.dev1.dao.NoticeDao"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<%

	NoticeDao dao = NoticeDao.getInstance();
	ArrayList<NoticeDto> list = dao.select(0, 100);

%>
<nav aria-label="breadcrumb">
	<ol class="breadcrumb justify-content-end">
		<li class="breadcrumb-item"><a href="<%=conPath%>">Home</a></li>
		<li class="breadcrumb-item active" aria-current="page">Notice</li>
	</ol>
</nav>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h5 class="card-title">게시판</h5>
					<div class="table-responsive-md">
						<table class="table table-hover">
							<colgroup>
								<col width="10%" />
								<col width="12%" />
								<col width="63%" />
								<col width="15%" />
							</colgroup>
							<thead>
								<tr class="text-center">
									<th scope="col">#</th>
									<th scope="col">작성자</th>
									<th scope="col">제목</th>
									<th scope="col">등록날짜</th>
								</tr>
							</thead>
							<tbody>
								<%
									if (list.size() != 0) {
										for (int i = 0; i < list.size(); i++) {
											NoticeDto dto = list.get(i);
											int num = dto.getNum();
											String writer = dto.getWriter();
											String title = dto.getTitle();
											String regdate = dto.getRegdate();
								%>
								<tr>
									<th scope="row"><%=num%></th>
									<td><%=writer%></td>
									<td><a href="view.jsp?num=<%=num%>"><%=title%></a></td>
									<td><%=regdate%></td>
								</tr>
								<%
									}
									} else {
								%>
								<tr>
									<td class="text-center" colspan="4" scope="row">공지된 게시물이
										없습니다.</td>
								</tr>
								<%
									}
								%>

							</tbody>
						</table>

						<nav aria-label="Page navigation example">
							<ul class="pagination pagination-lg justify-content-center">
								<li class="page-item disabled"><a class="page-link"
									href="#" tabindex="-1">&laquo;</a></li>
								<li class="page-item"><a class="page-link" href="#">1</a></li>
								<li class="page-item"><a class="page-link" href="#">2</a></li>
								<li class="page-item"><a class="page-link" href="#">3</a></li>
								<li class="page-item"><a class="page-link" href="#">4</a></li>
								<li class="page-item"><a class="page-link" href="#">5</a></li>
								<li class="page-item"><a class="page-link" href="#">6</a></li>
								<li class="page-item"><a class="page-link" href="#">7</a></li>
								<li class="page-item"><a class="page-link" href="#">8</a></li>
								<li class="page-item"><a class="page-link" href="#">9</a></li>
								<li class="page-item"><a class="page-link" href="#">10</a></li>
								<li class="page-item"><a class="page-link" href="#">&raquo;</a>
								</li>
							</ul>
						</nav>

						<div class="text-right">
							<a href="write.jsp" class="btn btn-outline-primary">글쓰기</a> <a
								href="#" class="btn btn-outline-success">리스트</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>
<%@ include file="../inc/footer.jsp"%>