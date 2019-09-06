<%@page import="kr.co.kic.dev1.dto.DeptDto"%>
<%@page import="kr.co.kic.dev1.dao.DeptDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="UTF-8"%>
<%@ include file = "../inc/header.jsp" %>
<%
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
%>
<%
	String tempNum = request.getParameter("num");
	int num = 0;
	try {
		num = Integer.parseInt(tempNum);
	} catch(NumberFormatException e) {
		num = 0;
	} 
	DeptDao dao = DeptDao.getInstance();
	DeptDto dto = dao.select(num);
	
	if(dto != null){
		String name = dto.getName();
		String loc = dto.getLoc();
%>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb justify-content-end">
			<li class="breadcrumb-item"><a href="/">Home</a></li>
			<li class="breadcrumb-item active" aria-current="page">Department</li>
		</ol>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">부서</h5>

						<form class="form-horizontal" role="form" name="f" method="post" action="">
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="num">부서 번호</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="num" value="<%=num%>"id="num" placeholder="부서 번호를 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="name">부서 이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" value="<%=name%>" id="name" placeholder="부서 이름을 입력해 주세요">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-form-label col-sm-2" for="loc">부서 지역</label>
								<div class="col-sm-10">
									<input class="form-control" name="loc" value="<%=loc%>" id="loc" placeholder="부서 지역을 입력해 주세요"></input>
								</div>
							</div>
							<input type="hidden" name="page" value="<%=cPage%>"/>
						</form>

						<div class="text-right">
							<a href="" id="modifyDept" class="btn btn-outline-primary">수정</a>
							<a href="" id="deleteDept" class="btn btn-outline-danger">삭제</a>
							<a href="list.jsp?page=<%=cPage %>" class="btn btn-outline-success">리스트</a>
						</div>
						<script>
							$(function(){
								$("#modifyDept").on('click',function(){
									event.preventDefault();
									// 유효성 검사
									let num = $("#num").val();
									let name = $("#name").val();
									let loc = $("#loc").val();
									
									if(!num){
										alert("부서 번호를 입력해세주요.");
										$("#num").focus();
										return;
									} else if(!name){
										alert("부서 이름을 입력해세주요.");
										$("#name").focus();
										return;
									} else if(!loc){
										alert("부서 지역을 입력해세주요.");
										$("#loc").focus();
										return;
									}
									
									f.action="modify.jsp";
									f.submit();
								});
								$("#deleteDept").on('click',function(){
									event.preventDefault();	
									
									f.action="delete.jsp";
									f.submit();
								});
							});
						</script>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file = "../inc/footer.jsp" %>
	
	<%} else{%>
	<script>
		alert("없는 글입니다.");
		history.back(-1);
	</script>
	<% } %>